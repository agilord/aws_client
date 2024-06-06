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

/// Amazon Managed Service for Prometheus is a serverless, Prometheus-compatible
/// monitoring service for container metrics that makes it easier to securely
/// monitor container environments at scale. With Amazon Managed Service for
/// Prometheus, you can use the same open-source Prometheus data model and query
/// language that you use today to monitor the performance of your containerized
/// workloads, and also enjoy improved scalability, availability, and security
/// without having to manage the underlying infrastructure.
///
/// For more information about Amazon Managed Service for Prometheus, see the <a
/// href="https://docs.aws.amazon.com/prometheus/latest/userguide/what-is-Amazon-Managed-Service-Prometheus.html">Amazon
/// Managed Service for Prometheus</a> User Guide.
///
/// Amazon Managed Service for Prometheus includes two APIs.
///
/// <ul>
/// <li>
/// Use the Amazon Web Services API described in this guide to manage Amazon
/// Managed Service for Prometheus resources, such as workspaces, rule groups,
/// and alert managers.
/// </li>
/// <li>
/// Use the <a
/// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-APIReference.html#AMP-APIReference-Prometheus-Compatible-Apis">Prometheus-compatible
/// API</a> to work within your Prometheus workspace.
/// </li>
/// </ul>
class Prometheus {
  final _s.RestJsonProtocol _protocol;
  Prometheus({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'aps',
            signingName: 'aps',
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

  /// The <code>CreateAlertManagerDefinition</code> operation creates the alert
  /// manager definition in a workspace. If a workspace already has an alert
  /// manager definition, don't use this operation to update it. Instead, use
  /// <code>PutAlertManagerDefinition</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [data] :
  /// The alert manager definition to add. A base64-encoded version of the YAML
  /// alert manager definition file.
  ///
  /// For details about the alert manager definition, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/APIReference/yaml-AlertManagerDefinitionData.html">AlertManagedDefinitionData</a>.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to add the alert manager definition to.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<CreateAlertManagerDefinitionResponse> createAlertManagerDefinition({
    required Uint8List data,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'data': base64Encode(data),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/alertmanager/definition',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAlertManagerDefinitionResponse.fromJson(response);
  }

  /// The <code>CreateLoggingConfiguration</code> operation creates a logging
  /// configuration for the workspace. Use this operation to set the CloudWatch
  /// log group to which the logs will be published to.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [logGroupArn] :
  /// The ARN of the CloudWatch log group to which the vended log data will be
  /// published. This log group must exist prior to calling this API.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to create the logging configuration for.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<CreateLoggingConfigurationResponse> createLoggingConfiguration({
    required String logGroupArn,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'logGroupArn': logGroupArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/logging',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLoggingConfigurationResponse.fromJson(response);
  }

  /// The <code>CreateRuleGroupsNamespace</code> operation creates a rule groups
  /// namespace within a workspace. A rule groups namespace is associated with
  /// exactly one rules file. A workspace can have multiple rule groups
  /// namespaces.
  ///
  /// Use this operation only to create new rule groups namespaces. To update an
  /// existing rule groups namespace, use <code>PutRuleGroupsNamespace</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [data] :
  /// The rules file to use in the new namespace.
  ///
  /// Contains the base64-encoded version of the YAML rules file.
  ///
  /// For details about the rule groups namespace structure, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/APIReference/yaml-RuleGroupsNamespaceData.html">RuleGroupsNamespaceData</a>.
  ///
  /// Parameter [name] :
  /// The name for the new rule groups namespace.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to add the rule groups namespace.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  ///
  /// Parameter [tags] :
  /// The list of tag keys and values to associate with the rule groups
  /// namespace.
  Future<CreateRuleGroupsNamespaceResponse> createRuleGroupsNamespace({
    required Uint8List data,
    required String name,
    required String workspaceId,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'data': base64Encode(data),
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRuleGroupsNamespaceResponse.fromJson(response);
  }

  /// The <code>CreateScraper</code> operation creates a scraper to collect
  /// metrics. A scraper pulls metrics from Prometheus-compatible sources within
  /// an Amazon EKS cluster, and sends them to your Amazon Managed Service for
  /// Prometheus workspace. You can configure the scraper to control what
  /// metrics are collected, and what transformations are applied prior to
  /// sending them to your workspace.
  ///
  /// If needed, an IAM role will be created for you that gives Amazon Managed
  /// Service for Prometheus access to the metrics in your cluster. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/using-service-linked-roles.html#using-service-linked-roles-prom-scraper">Using
  /// roles for scraping metrics from EKS</a> in the <i>Amazon Managed Service
  /// for Prometheus User Guide</i>.
  ///
  /// You cannot update a scraper. If you want to change the configuration of
  /// the scraper, create a new scraper and delete the old one.
  ///
  /// The <code>scrapeConfiguration</code> parameter contains the base64-encoded
  /// version of the YAML configuration file.
  /// <note>
  /// For more information about collectors, including what metrics are
  /// collected, and how to configure the scraper, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector.html">Amazon
  /// Web Services managed collectors</a> in the <i>Amazon Managed Service for
  /// Prometheus User Guide</i>.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [destination] :
  /// The Amazon Managed Service for Prometheus workspace to send metrics to.
  ///
  /// Parameter [scrapeConfiguration] :
  /// The configuration file to use in the new scraper. For more information,
  /// see <a
  /// href="prometheus/latest/userguide/AMP-collector-how-to.html#AMP-collector-configuration">Scraper
  /// configuration</a> in the <i>Amazon Managed Service for Prometheus User
  /// Guide</i>.
  ///
  /// Parameter [source] :
  /// The Amazon EKS cluster from which the scraper will collect metrics.
  ///
  /// Parameter [alias] :
  /// (optional) a name to associate with the scraper. This is for your use, and
  /// does not need to be unique.
  ///
  /// Parameter [clientToken] :
  /// (Optional) A unique, case-sensitive identifier that you can provide to
  /// ensure the idempotency of the request.
  ///
  /// Parameter [tags] :
  /// (Optional) The list of tag keys and values to associate with the scraper.
  Future<CreateScraperResponse> createScraper({
    required Destination destination,
    required ScrapeConfiguration scrapeConfiguration,
    required Source source,
    String? alias,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destination': destination,
      'scrapeConfiguration': scrapeConfiguration,
      'source': source,
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/scrapers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateScraperResponse.fromJson(response);
  }

  /// Creates a Prometheus workspace. A workspace is a logical space dedicated
  /// to the storage and querying of Prometheus metrics. You can have one or
  /// more workspaces in each Region in your account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [alias] :
  /// An alias that you assign to this workspace to help you identify it. It
  /// does not need to be unique.
  ///
  /// Blank spaces at the beginning or end of the alias that you specify will be
  /// trimmed from the value used.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  ///
  /// Parameter [kmsKeyArn] :
  /// (optional) The ARN for a customer managed KMS key to use for encrypting
  /// data within your workspace. For more information about using your own key
  /// in your workspace, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/encryption-at-rest-Amazon-Service-Prometheus.html">Encryption
  /// at rest</a> in the <i>Amazon Managed Service for Prometheus User
  /// Guide</i>.
  ///
  /// Parameter [tags] :
  /// The list of tag keys and values to associate with the workspace.
  Future<CreateWorkspaceResponse> createWorkspace({
    String? alias,
    String? clientToken,
    String? kmsKeyArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkspaceResponse.fromJson(response);
  }

  /// Deletes the alert manager definition from a workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to delete the alert manager definition from.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<void> deleteAlertManagerDefinition({
    required String workspaceId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/alertmanager/definition',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the logging configuration for a workspace.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace containing the logging configuration to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<void> deleteLoggingConfiguration({
    required String workspaceId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/logging',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes one rule groups namespace and its associated rule groups
  /// definition.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the rule groups namespace to delete.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace containing the rule groups namespace and
  /// definition to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<void> deleteRuleGroupsNamespace({
    required String name,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The <code>DeleteScraper</code> operation deletes one scraper, and stops
  /// any metrics collection that the scraper performs.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [scraperId] :
  /// The ID of the scraper to delete.
  ///
  /// Parameter [clientToken] :
  /// (Optional) A unique, case-sensitive identifier that you can provide to
  /// ensure the idempotency of the request.
  Future<DeleteScraperResponse> deleteScraper({
    required String scraperId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/scrapers/${Uri.encodeComponent(scraperId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteScraperResponse.fromJson(response);
  }

  /// Deletes an existing workspace.
  /// <note>
  /// When you delete a workspace, the data that has been ingested into it is
  /// not immediately deleted. It will be permanently deleted within one month.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<void> deleteWorkspace({
    required String workspaceId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the full information about the alert manager definition for a
  /// workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to retrieve the alert manager definition from.
  Future<DescribeAlertManagerDefinitionResponse>
      describeAlertManagerDefinition({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/alertmanager/definition',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAlertManagerDefinitionResponse.fromJson(response);
  }

  /// Returns complete information about the current logging configuration of
  /// the workspace.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to describe the logging configuration for.
  Future<DescribeLoggingConfigurationResponse> describeLoggingConfiguration({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/logging',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLoggingConfigurationResponse.fromJson(response);
  }

  /// Returns complete information about one rule groups namespace. To retrieve
  /// a list of rule groups namespaces, use
  /// <code>ListRuleGroupsNamespaces</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the rule groups namespace that you want information for.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace containing the rule groups namespace.
  Future<DescribeRuleGroupsNamespaceResponse> describeRuleGroupsNamespace({
    required String name,
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRuleGroupsNamespaceResponse.fromJson(response);
  }

  /// The <code>DescribeScraper</code> operation displays information about an
  /// existing scraper.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [scraperId] :
  /// The ID of the scraper to describe.
  Future<DescribeScraperResponse> describeScraper({
    required String scraperId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/scrapers/${Uri.encodeComponent(scraperId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeScraperResponse.fromJson(response);
  }

  /// Returns information about an existing workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to describe.
  Future<DescribeWorkspaceResponse> describeWorkspace({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorkspaceResponse.fromJson(response);
  }

  /// The <code>GetDefaultScraperConfiguration</code> operation returns the
  /// default scraper configuration used when Amazon EKS creates a scraper for
  /// you.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<GetDefaultScraperConfigurationResponse>
      getDefaultScraperConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/scraperconfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetDefaultScraperConfigurationResponse.fromJson(response);
  }

  /// Returns a list of rule groups namespaces in a workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace containing the rule groups namespaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. The default is 100.
  ///
  /// Parameter [name] :
  /// Use this parameter to filter the rule groups namespaces that are returned.
  /// Only the namespaces with names that begin with the value that you specify
  /// are returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. You receive this token from
  /// a previous call, and use it to get the next page of results. The other
  /// parameters must be the same as the initial call.
  ///
  /// For example, if your initial request has <code>maxResults</code> of 10,
  /// and there are 12 rule groups namespaces to return, then your initial
  /// request will return 10 and a <code>nextToken</code>. Using the next token
  /// in a subsequent call will return the remaining 2 namespaces.
  Future<ListRuleGroupsNamespacesResponse> listRuleGroupsNamespaces({
    required String workspaceId,
    int? maxResults,
    String? name,
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
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRuleGroupsNamespacesResponse.fromJson(response);
  }

  /// The <code>ListScrapers</code> operation lists all of the scrapers in your
  /// account. This includes scrapers being created or deleted. You can
  /// optionally filter the returned list.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// (Optional) A list of key-value pairs to filter the list of scrapers
  /// returned. Keys include <code>status</code>, <code>sourceArn</code>,
  /// <code>destinationArn</code>, and <code>alias</code>.
  ///
  /// Filters on the same key are <code>OR</code>'d together, and filters on
  /// different keys are <code>AND</code>'d together. For example,
  /// <code>status=ACTIVE&amp;status=CREATING&amp;alias=Test</code>, will return
  /// all scrapers that have the alias Test, and are either in status ACTIVE or
  /// CREATING.
  ///
  /// To find all active scrapers that are sending metrics to a specific Amazon
  /// Managed Service for Prometheus workspace, you would use the ARN of the
  /// workspace in a query:
  ///
  /// <code>status=ACTIVE&amp;destinationArn=arn:aws:aps:us-east-1:123456789012:workspace/ws-example1-1234-abcd-56ef-123456789012</code>
  ///
  /// If this is included, it filters the results to only the scrapers that
  /// match the filter.
  ///
  /// Parameter [maxResults] :
  /// Optional) The maximum number of scrapers to return in one
  /// <code>ListScrapers</code> operation. The range is 1-1000.
  ///
  /// If you omit this parameter, the default of 100 is used.
  ///
  /// Parameter [nextToken] :
  /// (Optional) The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListScrapersResponse> listScrapers({
    Map<String, List<String>>? filters,
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
      if (filters != null)
        for (var e in filters.entries) e.key: e.value,
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/scrapers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScrapersResponse.fromJson(response);
  }

  /// The <code>ListTagsForResource</code> operation returns the tags that are
  /// associated with an Amazon Managed Service for Prometheus resource.
  /// Currently, the only resources that can be tagged are workspaces and rule
  /// groups namespaces.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to list tages for. Must be a workspace or rule
  /// groups namespace resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists all of the Amazon Managed Service for Prometheus workspaces in your
  /// account. This includes workspaces being created or deleted.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [alias] :
  /// If this is included, it filters the results to only the workspaces with
  /// names that start with the value that you specify here.
  ///
  /// Amazon Managed Service for Prometheus will automatically strip any blank
  /// spaces from the beginning and end of the alias that you specify.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workspaces to return per request. The default is
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. You receive this token from
  /// a previous call, and use it to get the next page of results. The other
  /// parameters must be the same as the initial call.
  ///
  /// For example, if your initial request has <code>maxResults</code> of 10,
  /// and there are 12 workspaces to return, then your initial request will
  /// return 10 and a <code>nextToken</code>. Using the next token in a
  /// subsequent call will return the remaining 2 workspaces.
  Future<ListWorkspacesResponse> listWorkspaces({
    String? alias,
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
      if (alias != null) 'alias': [alias],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkspacesResponse.fromJson(response);
  }

  /// Updates an existing alert manager definition in a workspace. If the
  /// workspace does not already have an alert manager definition, don't use
  /// this operation to create it. Instead, use
  /// <code>CreateAlertManagerDefinition</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [data] :
  /// The alert manager definition to use. A base64-encoded version of the YAML
  /// alert manager definition file.
  ///
  /// For details about the alert manager definition, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/APIReference/yaml-AlertManagerDefinitionData.html">AlertManagedDefinitionData</a>.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to update the alert manager definition in.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<PutAlertManagerDefinitionResponse> putAlertManagerDefinition({
    required Uint8List data,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'data': base64Encode(data),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/alertmanager/definition',
      exceptionFnMap: _exceptionFns,
    );
    return PutAlertManagerDefinitionResponse.fromJson(response);
  }

  /// Updates an existing rule groups namespace within a workspace. A rule
  /// groups namespace is associated with exactly one rules file. A workspace
  /// can have multiple rule groups namespaces.
  ///
  /// Use this operation only to update existing rule groups namespaces. To
  /// create a new rule groups namespace, use
  /// <code>CreateRuleGroupsNamespace</code>.
  ///
  /// You can't use this operation to add tags to an existing rule groups
  /// namespace. Instead, use <code>TagResource</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [data] :
  /// The new rules file to use in the namespace. A base64-encoded version of
  /// the YAML rule groups file.
  ///
  /// For details about the rule groups namespace structure, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/APIReference/yaml-RuleGroupsNamespaceData.html">RuleGroupsNamespaceData</a>.
  ///
  /// Parameter [name] :
  /// The name of the rule groups namespace that you are updating.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace where you are updating the rule groups namespace.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<PutRuleGroupsNamespaceResponse> putRuleGroupsNamespace({
    required Uint8List data,
    required String name,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'data': base64Encode(data),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutRuleGroupsNamespaceResponse.fromJson(response);
  }

  /// The <code>TagResource</code> operation associates tags with an Amazon
  /// Managed Service for Prometheus resource. The only resources that can be
  /// tagged are workspaces and rule groups namespaces.
  ///
  /// If you specify a new tag key for the resource, this tag is appended to the
  /// list of tags associated with the resource. If you specify a tag key that
  /// is already associated with the resource, the new tag value that you
  /// specify replaces the previous value for that tag.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the workspace or rule groups namespace to apply tags to.
  ///
  /// Parameter [tags] :
  /// The list of tag keys and values to associate with the resource.
  ///
  /// Keys may not begin with <code>aws:</code>.
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

  /// Removes the specified tags from an Amazon Managed Service for Prometheus
  /// resource. The only resources that can be tagged are workspaces and rule
  /// groups namespaces.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the workspace or rule groups namespace.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the log group ARN or the workspace ID of the current logging
  /// configuration.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [logGroupArn] :
  /// The ARN of the CloudWatch log group to which the vended log data will be
  /// published.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to update the logging configuration for.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<UpdateLoggingConfigurationResponse> updateLoggingConfiguration({
    required String logGroupArn,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'logGroupArn': logGroupArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/logging',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLoggingConfigurationResponse.fromJson(response);
  }

  /// Updates the alias of an existing workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to update.
  ///
  /// Parameter [alias] :
  /// The new alias for the workspace. It does not need to be unique.
  ///
  /// Amazon Managed Service for Prometheus will automatically strip any blank
  /// spaces from the beginning and end of the alias that you specify.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  Future<void> updateWorkspaceAlias({
    required String workspaceId,
    String? alias,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/alias',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The details of an alert manager definition.
class AlertManagerDefinitionDescription {
  /// The date and time that the alert manager definition was created.
  final DateTime createdAt;

  /// The actual alert manager definition.
  ///
  /// For details about the alert manager definition, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/APIReference/yaml-AlertManagerDefinitionData.html">AlertManagedDefinitionData</a>.
  final Uint8List data;

  /// The date and time that the alert manager definition was most recently
  /// changed.
  final DateTime modifiedAt;

  /// A structure that displays the current status of the alert manager
  /// definition..
  final AlertManagerDefinitionStatus status;

  AlertManagerDefinitionDescription({
    required this.createdAt,
    required this.data,
    required this.modifiedAt,
    required this.status,
  });

  factory AlertManagerDefinitionDescription.fromJson(
      Map<String, dynamic> json) {
    return AlertManagerDefinitionDescription(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      data: _s.decodeUint8List(json['data']! as String),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      status: AlertManagerDefinitionStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final data = this.data;
    final modifiedAt = this.modifiedAt;
    final status = this.status;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'data': base64Encode(data),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'status': status,
    };
  }
}

/// The status of the alert manager.
class AlertManagerDefinitionStatus {
  /// The current status of the alert manager.
  final AlertManagerDefinitionStatusCode statusCode;

  /// If there is a failure, the reason for the failure.
  final String? statusReason;

  AlertManagerDefinitionStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory AlertManagerDefinitionStatus.fromJson(Map<String, dynamic> json) {
    return AlertManagerDefinitionStatus(
      statusCode:
          (json['statusCode'] as String).toAlertManagerDefinitionStatusCode(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of an <code>AlertManagerDefinition</code>.
enum AlertManagerDefinitionStatusCode {
  creating,
  active,
  updating,
  deleting,
  creationFailed,
  updateFailed,
}

extension AlertManagerDefinitionStatusCodeValueExtension
    on AlertManagerDefinitionStatusCode {
  String toValue() {
    switch (this) {
      case AlertManagerDefinitionStatusCode.creating:
        return 'CREATING';
      case AlertManagerDefinitionStatusCode.active:
        return 'ACTIVE';
      case AlertManagerDefinitionStatusCode.updating:
        return 'UPDATING';
      case AlertManagerDefinitionStatusCode.deleting:
        return 'DELETING';
      case AlertManagerDefinitionStatusCode.creationFailed:
        return 'CREATION_FAILED';
      case AlertManagerDefinitionStatusCode.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension AlertManagerDefinitionStatusCodeFromString on String {
  AlertManagerDefinitionStatusCode toAlertManagerDefinitionStatusCode() {
    switch (this) {
      case 'CREATING':
        return AlertManagerDefinitionStatusCode.creating;
      case 'ACTIVE':
        return AlertManagerDefinitionStatusCode.active;
      case 'UPDATING':
        return AlertManagerDefinitionStatusCode.updating;
      case 'DELETING':
        return AlertManagerDefinitionStatusCode.deleting;
      case 'CREATION_FAILED':
        return AlertManagerDefinitionStatusCode.creationFailed;
      case 'UPDATE_FAILED':
        return AlertManagerDefinitionStatusCode.updateFailed;
    }
    throw Exception(
        '$this is not known in enum AlertManagerDefinitionStatusCode');
  }
}

/// The <code>AmpConfiguration</code> structure defines the Amazon Managed
/// Service for Prometheus instance a scraper should send metrics to.
class AmpConfiguration {
  /// ARN of the Amazon Managed Service for Prometheus workspace.
  final String workspaceArn;

  AmpConfiguration({
    required this.workspaceArn,
  });

  factory AmpConfiguration.fromJson(Map<String, dynamic> json) {
    return AmpConfiguration(
      workspaceArn: json['workspaceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final workspaceArn = this.workspaceArn;
    return {
      'workspaceArn': workspaceArn,
    };
  }
}

/// Represents the output of a <code>CreateAlertManagerDefinition</code>
/// operation.
class CreateAlertManagerDefinitionResponse {
  /// A structure that displays the current status of the alert manager
  /// definition.
  final AlertManagerDefinitionStatus status;

  CreateAlertManagerDefinitionResponse({
    required this.status,
  });

  factory CreateAlertManagerDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAlertManagerDefinitionResponse(
      status: AlertManagerDefinitionStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// Represents the output of a <code>CreateLoggingConfiguration</code>
/// operation.
class CreateLoggingConfigurationResponse {
  /// A structure that displays the current status of the logging configuration.
  final LoggingConfigurationStatus status;

  CreateLoggingConfigurationResponse({
    required this.status,
  });

  factory CreateLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLoggingConfigurationResponse(
      status: LoggingConfigurationStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// Represents the output of a <code>CreateRuleGroupsNamespace</code> operation.
class CreateRuleGroupsNamespaceResponse {
  /// The Amazon Resource Name (ARN) of the new rule groups namespace.
  final String arn;

  /// The name of the new rule groups namespace.
  final String name;

  /// A structure that returns the current status of the rule groups namespace.
  final RuleGroupsNamespaceStatus status;

  /// The list of tag keys and values that are associated with the namespace.
  final Map<String, String>? tags;

  CreateRuleGroupsNamespaceResponse({
    required this.arn,
    required this.name,
    required this.status,
    this.tags,
  });

  factory CreateRuleGroupsNamespaceResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRuleGroupsNamespaceResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
      status: RuleGroupsNamespaceStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'name': name,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the output of a <code>CreateScraper</code> operation.
class CreateScraperResponse {
  /// The Amazon Resource Name (ARN) of the new scraper.
  final String arn;

  /// The ID of the new scraper.
  final String scraperId;

  /// A structure that displays the current status of the scraper.
  final ScraperStatus status;

  /// The list of tag keys and values that are associated with the scraper.
  final Map<String, String>? tags;

  CreateScraperResponse({
    required this.arn,
    required this.scraperId,
    required this.status,
    this.tags,
  });

  factory CreateScraperResponse.fromJson(Map<String, dynamic> json) {
    return CreateScraperResponse(
      arn: json['arn'] as String,
      scraperId: json['scraperId'] as String,
      status: ScraperStatus.fromJson(json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final scraperId = this.scraperId;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'scraperId': scraperId,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the output of a <code>CreateWorkspace</code> operation.
class CreateWorkspaceResponse {
  /// The ARN for the new workspace.
  final String arn;

  /// The current status of the new workspace. Immediately after you create the
  /// workspace, the status is usually <code>CREATING</code>.
  final WorkspaceStatus status;

  /// The unique ID for the new workspace.
  final String workspaceId;

  /// (optional) If the workspace was created with a customer managed KMS key, the
  /// ARN for the key used.
  final String? kmsKeyArn;

  /// The list of tag keys and values that are associated with the workspace.
  final Map<String, String>? tags;

  CreateWorkspaceResponse({
    required this.arn,
    required this.status,
    required this.workspaceId,
    this.kmsKeyArn,
    this.tags,
  });

  factory CreateWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceResponse(
      arn: json['arn'] as String,
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final status = this.status;
    final workspaceId = this.workspaceId;
    final kmsKeyArn = this.kmsKeyArn;
    final tags = this.tags;
    return {
      'arn': arn,
      'status': status,
      'workspaceId': workspaceId,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the output of a <code>DeleteScraper</code> operation.
class DeleteScraperResponse {
  /// The ID of the scraper to delete.
  final String scraperId;

  /// The current status of the scraper.
  final ScraperStatus status;

  DeleteScraperResponse({
    required this.scraperId,
    required this.status,
  });

  factory DeleteScraperResponse.fromJson(Map<String, dynamic> json) {
    return DeleteScraperResponse(
      scraperId: json['scraperId'] as String,
      status: ScraperStatus.fromJson(json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final scraperId = this.scraperId;
    final status = this.status;
    return {
      'scraperId': scraperId,
      'status': status,
    };
  }
}

/// Represents the output of a <code>DescribeAlertManagerDefinition</code>
/// operation.
class DescribeAlertManagerDefinitionResponse {
  /// The alert manager definition.
  final AlertManagerDefinitionDescription alertManagerDefinition;

  DescribeAlertManagerDefinitionResponse({
    required this.alertManagerDefinition,
  });

  factory DescribeAlertManagerDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAlertManagerDefinitionResponse(
      alertManagerDefinition: AlertManagerDefinitionDescription.fromJson(
          json['alertManagerDefinition'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final alertManagerDefinition = this.alertManagerDefinition;
    return {
      'alertManagerDefinition': alertManagerDefinition,
    };
  }
}

/// Represents the output of a <code>DescribeLoggingConfiguration</code>
/// operation.
class DescribeLoggingConfigurationResponse {
  /// A structure that displays the information about the logging configuration.
  final LoggingConfigurationMetadata loggingConfiguration;

  DescribeLoggingConfigurationResponse({
    required this.loggingConfiguration,
  });

  factory DescribeLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLoggingConfigurationResponse(
      loggingConfiguration: LoggingConfigurationMetadata.fromJson(
          json['loggingConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      'loggingConfiguration': loggingConfiguration,
    };
  }
}

/// Represents the output of a <code>DescribeRuleGroupsNamespace</code>
/// operation.
class DescribeRuleGroupsNamespaceResponse {
  /// The information about the rule groups namespace.
  final RuleGroupsNamespaceDescription ruleGroupsNamespace;

  DescribeRuleGroupsNamespaceResponse({
    required this.ruleGroupsNamespace,
  });

  factory DescribeRuleGroupsNamespaceResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRuleGroupsNamespaceResponse(
      ruleGroupsNamespace: RuleGroupsNamespaceDescription.fromJson(
          json['ruleGroupsNamespace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupsNamespace = this.ruleGroupsNamespace;
    return {
      'ruleGroupsNamespace': ruleGroupsNamespace,
    };
  }
}

/// Represents the output of a <code>DescribeScraper</code> operation.
class DescribeScraperResponse {
  /// Contains details about the scraper.
  final ScraperDescription scraper;

  DescribeScraperResponse({
    required this.scraper,
  });

  factory DescribeScraperResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScraperResponse(
      scraper:
          ScraperDescription.fromJson(json['scraper'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final scraper = this.scraper;
    return {
      'scraper': scraper,
    };
  }
}

/// Represents the output of a <code>DescribeWorkspace</code> operation.
class DescribeWorkspaceResponse {
  /// A structure that contains details about the workspace.
  final WorkspaceDescription workspace;

  DescribeWorkspaceResponse({
    required this.workspace,
  });

  factory DescribeWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorkspaceResponse(
      workspace: WorkspaceDescription.fromJson(
          json['workspace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

/// Where to send the metrics from a scraper.
class Destination {
  /// The Amazon Managed Service for Prometheusworkspace to send metrics to.
  final AmpConfiguration? ampConfiguration;

  Destination({
    this.ampConfiguration,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      ampConfiguration: json['ampConfiguration'] != null
          ? AmpConfiguration.fromJson(
              json['ampConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ampConfiguration = this.ampConfiguration;
    return {
      if (ampConfiguration != null) 'ampConfiguration': ampConfiguration,
    };
  }
}

/// The <code>EksConfiguration</code> structure describes the connection to the
/// Amazon EKS cluster from which a scraper collects metrics.
class EksConfiguration {
  /// ARN of the Amazon EKS cluster.
  final String clusterArn;

  /// A list of subnet IDs for the Amazon EKS cluster VPC configuration.
  final List<String> subnetIds;

  /// A list of the security group IDs for the Amazon EKS cluster VPC
  /// configuration.
  final List<String>? securityGroupIds;

  EksConfiguration({
    required this.clusterArn,
    required this.subnetIds,
    this.securityGroupIds,
  });

  factory EksConfiguration.fromJson(Map<String, dynamic> json) {
    return EksConfiguration(
      clusterArn: json['clusterArn'] as String,
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final subnetIds = this.subnetIds;
    final securityGroupIds = this.securityGroupIds;
    return {
      'clusterArn': clusterArn,
      'subnetIds': subnetIds,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
    };
  }
}

/// Represents the output of a <code>GetDefaultScraperConfiguration</code>
/// operation.
class GetDefaultScraperConfigurationResponse {
  /// The configuration file. Base 64 encoded. For more information, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html#AMP-collector-configuration">Scraper
  /// configuration</a>in the <i>Amazon Managed Service for Prometheus User
  /// Guide</i>.
  final Uint8List configuration;

  GetDefaultScraperConfigurationResponse({
    required this.configuration,
  });

  factory GetDefaultScraperConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDefaultScraperConfigurationResponse(
      configuration: _s.decodeUint8List(json['configuration']! as String),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      'configuration': base64Encode(configuration),
    };
  }
}

/// Represents the output of a <code>ListRuleGroupsNamespaces</code> operation.
class ListRuleGroupsNamespacesResponse {
  /// The returned list of rule groups namespaces.
  final List<RuleGroupsNamespaceSummary> ruleGroupsNamespaces;

  /// A token indicating that there are more results to retrieve. You can use this
  /// token as part of your next <code>ListRuleGroupsNamespaces</code> request to
  /// retrieve those results.
  final String? nextToken;

  ListRuleGroupsNamespacesResponse({
    required this.ruleGroupsNamespaces,
    this.nextToken,
  });

  factory ListRuleGroupsNamespacesResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleGroupsNamespacesResponse(
      ruleGroupsNamespaces: (json['ruleGroupsNamespaces'] as List)
          .whereNotNull()
          .map((e) =>
              RuleGroupsNamespaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupsNamespaces = this.ruleGroupsNamespaces;
    final nextToken = this.nextToken;
    return {
      'ruleGroupsNamespaces': ruleGroupsNamespaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>ListScrapers</code> operation.
class ListScrapersResponse {
  /// A list of <code>ScraperSummary</code> structures giving information about
  /// scrapers in the account that match the filters provided.
  final List<ScraperSummary> scrapers;

  /// A token indicating that there are more results to retrieve. You can use this
  /// token as part of your next <code>ListScrapers</code> operation to retrieve
  /// those results.
  final String? nextToken;

  ListScrapersResponse({
    required this.scrapers,
    this.nextToken,
  });

  factory ListScrapersResponse.fromJson(Map<String, dynamic> json) {
    return ListScrapersResponse(
      scrapers: (json['scrapers'] as List)
          .whereNotNull()
          .map((e) => ScraperSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scrapers = this.scrapers;
    final nextToken = this.nextToken;
    return {
      'scrapers': scrapers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
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

/// Represents the output of a <code>ListWorkspaces</code> operation.
class ListWorkspacesResponse {
  /// An array of <code>WorkspaceSummary</code> structures containing information
  /// about the workspaces requested.
  final List<WorkspaceSummary> workspaces;

  /// A token indicating that there are more results to retrieve. You can use this
  /// token as part of your next <code>ListWorkspaces</code> request to retrieve
  /// those results.
  final String? nextToken;

  ListWorkspacesResponse({
    required this.workspaces,
    this.nextToken,
  });

  factory ListWorkspacesResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkspacesResponse(
      workspaces: (json['workspaces'] as List)
          .whereNotNull()
          .map((e) => WorkspaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workspaces = this.workspaces;
    final nextToken = this.nextToken;
    return {
      'workspaces': workspaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains information about the logging configuration.
class LoggingConfigurationMetadata {
  /// The date and time that the logging configuration was created.
  final DateTime createdAt;

  /// The ARN of the CloudWatch log group to which the vended log data will be
  /// published.
  final String logGroupArn;

  /// The date and time that the logging configuration was most recently changed.
  final DateTime modifiedAt;

  /// The current status of the logging configuration.
  final LoggingConfigurationStatus status;

  /// The ID of the workspace the logging configuration is for.
  final String workspace;

  LoggingConfigurationMetadata({
    required this.createdAt,
    required this.logGroupArn,
    required this.modifiedAt,
    required this.status,
    required this.workspace,
  });

  factory LoggingConfigurationMetadata.fromJson(Map<String, dynamic> json) {
    return LoggingConfigurationMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      logGroupArn: json['logGroupArn'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      status: LoggingConfigurationStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      workspace: json['workspace'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final logGroupArn = this.logGroupArn;
    final modifiedAt = this.modifiedAt;
    final status = this.status;
    final workspace = this.workspace;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'logGroupArn': logGroupArn,
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'status': status,
      'workspace': workspace,
    };
  }
}

/// The status of the logging configuration.
class LoggingConfigurationStatus {
  /// The current status of the logging configuration.
  final LoggingConfigurationStatusCode statusCode;

  /// If failed, the reason for the failure.
  final String? statusReason;

  LoggingConfigurationStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory LoggingConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return LoggingConfigurationStatus(
      statusCode:
          (json['statusCode'] as String).toLoggingConfigurationStatusCode(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of a logging configuration.
enum LoggingConfigurationStatusCode {
  creating,
  active,
  updating,
  deleting,
  creationFailed,
  updateFailed,
}

extension LoggingConfigurationStatusCodeValueExtension
    on LoggingConfigurationStatusCode {
  String toValue() {
    switch (this) {
      case LoggingConfigurationStatusCode.creating:
        return 'CREATING';
      case LoggingConfigurationStatusCode.active:
        return 'ACTIVE';
      case LoggingConfigurationStatusCode.updating:
        return 'UPDATING';
      case LoggingConfigurationStatusCode.deleting:
        return 'DELETING';
      case LoggingConfigurationStatusCode.creationFailed:
        return 'CREATION_FAILED';
      case LoggingConfigurationStatusCode.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension LoggingConfigurationStatusCodeFromString on String {
  LoggingConfigurationStatusCode toLoggingConfigurationStatusCode() {
    switch (this) {
      case 'CREATING':
        return LoggingConfigurationStatusCode.creating;
      case 'ACTIVE':
        return LoggingConfigurationStatusCode.active;
      case 'UPDATING':
        return LoggingConfigurationStatusCode.updating;
      case 'DELETING':
        return LoggingConfigurationStatusCode.deleting;
      case 'CREATION_FAILED':
        return LoggingConfigurationStatusCode.creationFailed;
      case 'UPDATE_FAILED':
        return LoggingConfigurationStatusCode.updateFailed;
    }
    throw Exception(
        '$this is not known in enum LoggingConfigurationStatusCode');
  }
}

/// Represents the output of a <code>PutAlertManagerDefinition</code> operation.
class PutAlertManagerDefinitionResponse {
  /// A structure that returns the current status of the alert manager definition.
  final AlertManagerDefinitionStatus status;

  PutAlertManagerDefinitionResponse({
    required this.status,
  });

  factory PutAlertManagerDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return PutAlertManagerDefinitionResponse(
      status: AlertManagerDefinitionStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// Represents the output of a <code>PutRuleGroupsNamespace</code> operation.
class PutRuleGroupsNamespaceResponse {
  /// The ARN of the rule groups namespace.
  final String arn;

  /// The name of the rule groups namespace that was updated.
  final String name;

  /// A structure that includes the current status of the rule groups namespace.
  final RuleGroupsNamespaceStatus status;

  /// The list of tag keys and values that are associated with the namespace.
  final Map<String, String>? tags;

  PutRuleGroupsNamespaceResponse({
    required this.arn,
    required this.name,
    required this.status,
    this.tags,
  });

  factory PutRuleGroupsNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return PutRuleGroupsNamespaceResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
      status: RuleGroupsNamespaceStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'name': name,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The details about one rule groups namespace.
class RuleGroupsNamespaceDescription {
  /// The ARN of the rule groups namespace.
  final String arn;

  /// The date and time that the rule groups namespace was created.
  final DateTime createdAt;

  /// The rule groups file used in the namespace.
  ///
  /// For details about the rule groups namespace structure, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/APIReference/yaml-RuleGroupsNamespaceData.html">RuleGroupsNamespaceData</a>.
  final Uint8List data;

  /// The date and time that the rule groups namespace was most recently changed.
  final DateTime modifiedAt;

  /// The name of the rule groups namespace.
  final String name;

  /// The current status of the rule groups namespace.
  final RuleGroupsNamespaceStatus status;

  /// The list of tag keys and values that are associated with the rule groups
  /// namespace.
  final Map<String, String>? tags;

  RuleGroupsNamespaceDescription({
    required this.arn,
    required this.createdAt,
    required this.data,
    required this.modifiedAt,
    required this.name,
    required this.status,
    this.tags,
  });

  factory RuleGroupsNamespaceDescription.fromJson(Map<String, dynamic> json) {
    return RuleGroupsNamespaceDescription(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      data: _s.decodeUint8List(json['data']! as String),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: RuleGroupsNamespaceStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final data = this.data;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'data': base64Encode(data),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'name': name,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The status information about a rule groups namespace.
class RuleGroupsNamespaceStatus {
  /// The current status of the namespace.
  final RuleGroupsNamespaceStatusCode statusCode;

  /// The reason for the failure, if any.
  final String? statusReason;

  RuleGroupsNamespaceStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory RuleGroupsNamespaceStatus.fromJson(Map<String, dynamic> json) {
    return RuleGroupsNamespaceStatus(
      statusCode:
          (json['statusCode'] as String).toRuleGroupsNamespaceStatusCode(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of a namespace.
enum RuleGroupsNamespaceStatusCode {
  creating,
  active,
  updating,
  deleting,
  creationFailed,
  updateFailed,
}

extension RuleGroupsNamespaceStatusCodeValueExtension
    on RuleGroupsNamespaceStatusCode {
  String toValue() {
    switch (this) {
      case RuleGroupsNamespaceStatusCode.creating:
        return 'CREATING';
      case RuleGroupsNamespaceStatusCode.active:
        return 'ACTIVE';
      case RuleGroupsNamespaceStatusCode.updating:
        return 'UPDATING';
      case RuleGroupsNamespaceStatusCode.deleting:
        return 'DELETING';
      case RuleGroupsNamespaceStatusCode.creationFailed:
        return 'CREATION_FAILED';
      case RuleGroupsNamespaceStatusCode.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension RuleGroupsNamespaceStatusCodeFromString on String {
  RuleGroupsNamespaceStatusCode toRuleGroupsNamespaceStatusCode() {
    switch (this) {
      case 'CREATING':
        return RuleGroupsNamespaceStatusCode.creating;
      case 'ACTIVE':
        return RuleGroupsNamespaceStatusCode.active;
      case 'UPDATING':
        return RuleGroupsNamespaceStatusCode.updating;
      case 'DELETING':
        return RuleGroupsNamespaceStatusCode.deleting;
      case 'CREATION_FAILED':
        return RuleGroupsNamespaceStatusCode.creationFailed;
      case 'UPDATE_FAILED':
        return RuleGroupsNamespaceStatusCode.updateFailed;
    }
    throw Exception('$this is not known in enum RuleGroupsNamespaceStatusCode');
  }
}

/// The high-level information about a rule groups namespace. To retrieve more
/// information, use <code>DescribeRuleGroupsNamespace</code>.
class RuleGroupsNamespaceSummary {
  /// The ARN of the rule groups namespace.
  final String arn;

  /// The date and time that the rule groups namespace was created.
  final DateTime createdAt;

  /// The date and time that the rule groups namespace was most recently changed.
  final DateTime modifiedAt;

  /// The name of the rule groups namespace.
  final String name;

  /// A structure that displays the current status of the rule groups namespace.
  final RuleGroupsNamespaceStatus status;

  /// The list of tag keys and values that are associated with the rule groups
  /// namespace.
  final Map<String, String>? tags;

  RuleGroupsNamespaceSummary({
    required this.arn,
    required this.createdAt,
    required this.modifiedAt,
    required this.name,
    required this.status,
    this.tags,
  });

  factory RuleGroupsNamespaceSummary.fromJson(Map<String, dynamic> json) {
    return RuleGroupsNamespaceSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: RuleGroupsNamespaceStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'name': name,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A scrape configuration for a scraper, base 64 encoded. For more information,
/// see <a
/// href="prometheus/latest/userguide/AMP-collector-how-to.html#AMP-collector-configuration">Scraper
/// configuration</a> in the <i>Amazon Managed Service for Prometheus User
/// Guide</i>.
class ScrapeConfiguration {
  /// The base 64 encoded scrape configuration file.
  final Uint8List? configurationBlob;

  ScrapeConfiguration({
    this.configurationBlob,
  });

  factory ScrapeConfiguration.fromJson(Map<String, dynamic> json) {
    return ScrapeConfiguration(
      configurationBlob:
          _s.decodeNullableUint8List(json['configurationBlob'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationBlob = this.configurationBlob;
    return {
      if (configurationBlob != null)
        'configurationBlob': base64Encode(configurationBlob),
    };
  }
}

/// The <code>ScraperDescription</code> structure contains the full details
/// about one scraper in your account.
class ScraperDescription {
  /// The Amazon Resource Name (ARN) of the scraper.
  final String arn;

  /// The date and time that the scraper was created.
  final DateTime createdAt;

  /// The Amazon Managed Service for Prometheus workspace the scraper sends
  /// metrics to.
  final Destination destination;

  /// The date and time that the scraper was last modified.
  final DateTime lastModifiedAt;

  /// The Amazon Resource Name (ARN) of the IAM role that provides permissions for
  /// the scraper to discover and collect metrics on your behalf.
  final String roleArn;

  /// The configuration file in use by the scraper.
  final ScrapeConfiguration scrapeConfiguration;

  /// The ID of the scraper.
  final String scraperId;

  /// The Amazon EKS cluster from which the scraper collects metrics.
  final Source source;

  /// A structure that contains the current status of the scraper.
  final ScraperStatus status;

  /// (Optional) A name associated with the scraper.
  final String? alias;

  /// If there is a failure, the reason for the failure.
  final String? statusReason;

  /// (Optional) The list of tag keys and values associated with the scraper.
  final Map<String, String>? tags;

  ScraperDescription({
    required this.arn,
    required this.createdAt,
    required this.destination,
    required this.lastModifiedAt,
    required this.roleArn,
    required this.scrapeConfiguration,
    required this.scraperId,
    required this.source,
    required this.status,
    this.alias,
    this.statusReason,
    this.tags,
  });

  factory ScraperDescription.fromJson(Map<String, dynamic> json) {
    return ScraperDescription(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      destination:
          Destination.fromJson(json['destination'] as Map<String, dynamic>),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      roleArn: json['roleArn'] as String,
      scrapeConfiguration: ScrapeConfiguration.fromJson(
          json['scrapeConfiguration'] as Map<String, dynamic>),
      scraperId: json['scraperId'] as String,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      status: ScraperStatus.fromJson(json['status'] as Map<String, dynamic>),
      alias: json['alias'] as String?,
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final destination = this.destination;
    final lastModifiedAt = this.lastModifiedAt;
    final roleArn = this.roleArn;
    final scrapeConfiguration = this.scrapeConfiguration;
    final scraperId = this.scraperId;
    final source = this.source;
    final status = this.status;
    final alias = this.alias;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'destination': destination,
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'roleArn': roleArn,
      'scrapeConfiguration': scrapeConfiguration,
      'scraperId': scraperId,
      'source': source,
      'status': status,
      if (alias != null) 'alias': alias,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The <code>ScraperStatus</code> structure contains status information about
/// the scraper.
class ScraperStatus {
  /// The current status of the scraper.
  final ScraperStatusCode statusCode;

  ScraperStatus({
    required this.statusCode,
  });

  factory ScraperStatus.fromJson(Map<String, dynamic> json) {
    return ScraperStatus(
      statusCode: (json['statusCode'] as String).toScraperStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      'statusCode': statusCode.toValue(),
    };
  }
}

/// State of a scraper.
enum ScraperStatusCode {
  creating,
  active,
  deleting,
  creationFailed,
  deletionFailed,
}

extension ScraperStatusCodeValueExtension on ScraperStatusCode {
  String toValue() {
    switch (this) {
      case ScraperStatusCode.creating:
        return 'CREATING';
      case ScraperStatusCode.active:
        return 'ACTIVE';
      case ScraperStatusCode.deleting:
        return 'DELETING';
      case ScraperStatusCode.creationFailed:
        return 'CREATION_FAILED';
      case ScraperStatusCode.deletionFailed:
        return 'DELETION_FAILED';
    }
  }
}

extension ScraperStatusCodeFromString on String {
  ScraperStatusCode toScraperStatusCode() {
    switch (this) {
      case 'CREATING':
        return ScraperStatusCode.creating;
      case 'ACTIVE':
        return ScraperStatusCode.active;
      case 'DELETING':
        return ScraperStatusCode.deleting;
      case 'CREATION_FAILED':
        return ScraperStatusCode.creationFailed;
      case 'DELETION_FAILED':
        return ScraperStatusCode.deletionFailed;
    }
    throw Exception('$this is not known in enum ScraperStatusCode');
  }
}

/// The <code>ScraperSummary</code> structure contains a summary of the details
/// about one scraper in your account.
class ScraperSummary {
  /// The Amazon Resource Name (ARN) of the scraper.
  final String arn;

  /// The date and time that the scraper was created.
  final DateTime createdAt;

  /// The Amazon Managed Service for Prometheus workspace the scraper sends
  /// metrics to.
  final Destination destination;

  /// The date and time that the scraper was last modified.
  final DateTime lastModifiedAt;

  /// The Amazon Resource Name (ARN) of the IAM role that provides permissions for
  /// the scraper to discover and collect metrics on your behalf.
  final String roleArn;

  /// The ID of the scraper.
  final String scraperId;

  /// The Amazon EKS cluster from which the scraper collects metrics.
  final Source source;

  /// A structure that contains the current status of the scraper.
  final ScraperStatus status;

  /// (Optional) A name associated with the scraper.
  final String? alias;

  /// If there is a failure, the reason for the failure.
  final String? statusReason;

  /// (Optional) The list of tag keys and values associated with the scraper.
  final Map<String, String>? tags;

  ScraperSummary({
    required this.arn,
    required this.createdAt,
    required this.destination,
    required this.lastModifiedAt,
    required this.roleArn,
    required this.scraperId,
    required this.source,
    required this.status,
    this.alias,
    this.statusReason,
    this.tags,
  });

  factory ScraperSummary.fromJson(Map<String, dynamic> json) {
    return ScraperSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      destination:
          Destination.fromJson(json['destination'] as Map<String, dynamic>),
      lastModifiedAt:
          nonNullableTimeStampFromJson(json['lastModifiedAt'] as Object),
      roleArn: json['roleArn'] as String,
      scraperId: json['scraperId'] as String,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      status: ScraperStatus.fromJson(json['status'] as Map<String, dynamic>),
      alias: json['alias'] as String?,
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final destination = this.destination;
    final lastModifiedAt = this.lastModifiedAt;
    final roleArn = this.roleArn;
    final scraperId = this.scraperId;
    final source = this.source;
    final status = this.status;
    final alias = this.alias;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'destination': destination,
      'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      'roleArn': roleArn,
      'scraperId': scraperId,
      'source': source,
      'status': status,
      if (alias != null) 'alias': alias,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The source of collected metrics for a scraper.
class Source {
  /// The Amazon EKS cluster from which a scraper collects metrics.
  final EksConfiguration? eksConfiguration;

  Source({
    this.eksConfiguration,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      eksConfiguration: json['eksConfiguration'] != null
          ? EksConfiguration.fromJson(
              json['eksConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eksConfiguration = this.eksConfiguration;
    return {
      if (eksConfiguration != null) 'eksConfiguration': eksConfiguration,
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

/// Represents the output of an <code>UpdateLoggingConfiguration</code>
/// operation.
class UpdateLoggingConfigurationResponse {
  /// A structure that contains the current status of the logging configuration.
  final LoggingConfigurationStatus status;

  UpdateLoggingConfigurationResponse({
    required this.status,
  });

  factory UpdateLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateLoggingConfigurationResponse(
      status: LoggingConfigurationStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// The full details about one Amazon Managed Service for Prometheus workspace
/// in your account.
class WorkspaceDescription {
  /// The ARN of the workspace.
  final String arn;

  /// The date and time that the workspace was created.
  final DateTime createdAt;

  /// The current status of the workspace.
  final WorkspaceStatus status;

  /// The unique ID for the workspace.
  final String workspaceId;

  /// The alias that is assigned to this workspace to help identify it. It may not
  /// be unique.
  final String? alias;

  /// (optional) If the workspace was created with a customer managed KMS key, the
  /// ARN for the key used.
  final String? kmsKeyArn;

  /// The Prometheus endpoint available for this workspace.
  final String? prometheusEndpoint;

  /// The list of tag keys and values that are associated with the workspace.
  final Map<String, String>? tags;

  WorkspaceDescription({
    required this.arn,
    required this.createdAt,
    required this.status,
    required this.workspaceId,
    this.alias,
    this.kmsKeyArn,
    this.prometheusEndpoint,
    this.tags,
  });

  factory WorkspaceDescription.fromJson(Map<String, dynamic> json) {
    return WorkspaceDescription(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
      alias: json['alias'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      prometheusEndpoint: json['prometheusEndpoint'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final status = this.status;
    final workspaceId = this.workspaceId;
    final alias = this.alias;
    final kmsKeyArn = this.kmsKeyArn;
    final prometheusEndpoint = this.prometheusEndpoint;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'status': status,
      'workspaceId': workspaceId,
      if (alias != null) 'alias': alias,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (prometheusEndpoint != null) 'prometheusEndpoint': prometheusEndpoint,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The status of the workspace.
class WorkspaceStatus {
  /// The current status of the workspace.
  final WorkspaceStatusCode statusCode;

  WorkspaceStatus({
    required this.statusCode,
  });

  factory WorkspaceStatus.fromJson(Map<String, dynamic> json) {
    return WorkspaceStatus(
      statusCode: (json['statusCode'] as String).toWorkspaceStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      'statusCode': statusCode.toValue(),
    };
  }
}

/// State of a workspace.
enum WorkspaceStatusCode {
  creating,
  active,
  updating,
  deleting,
  creationFailed,
}

extension WorkspaceStatusCodeValueExtension on WorkspaceStatusCode {
  String toValue() {
    switch (this) {
      case WorkspaceStatusCode.creating:
        return 'CREATING';
      case WorkspaceStatusCode.active:
        return 'ACTIVE';
      case WorkspaceStatusCode.updating:
        return 'UPDATING';
      case WorkspaceStatusCode.deleting:
        return 'DELETING';
      case WorkspaceStatusCode.creationFailed:
        return 'CREATION_FAILED';
    }
  }
}

extension WorkspaceStatusCodeFromString on String {
  WorkspaceStatusCode toWorkspaceStatusCode() {
    switch (this) {
      case 'CREATING':
        return WorkspaceStatusCode.creating;
      case 'ACTIVE':
        return WorkspaceStatusCode.active;
      case 'UPDATING':
        return WorkspaceStatusCode.updating;
      case 'DELETING':
        return WorkspaceStatusCode.deleting;
      case 'CREATION_FAILED':
        return WorkspaceStatusCode.creationFailed;
    }
    throw Exception('$this is not known in enum WorkspaceStatusCode');
  }
}

/// The information about one Amazon Managed Service for Prometheus workspace in
/// your account.
class WorkspaceSummary {
  /// The ARN of the workspace.
  final String arn;

  /// The date and time that the workspace was created.
  final DateTime createdAt;

  /// The current status of the workspace.
  final WorkspaceStatus status;

  /// The unique ID for the workspace.
  final String workspaceId;

  /// The alias that is assigned to this workspace to help identify it. It may not
  /// be unique.
  final String? alias;

  /// (optional) If the workspace was created with a customer managed KMS key, the
  /// ARN for the key used.
  final String? kmsKeyArn;

  /// The list of tag keys and values that are associated with the workspace.
  final Map<String, String>? tags;

  WorkspaceSummary({
    required this.arn,
    required this.createdAt,
    required this.status,
    required this.workspaceId,
    this.alias,
    this.kmsKeyArn,
    this.tags,
  });

  factory WorkspaceSummary.fromJson(Map<String, dynamic> json) {
    return WorkspaceSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
      alias: json['alias'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final status = this.status;
    final workspaceId = this.workspaceId;
    final alias = this.alias;
    final kmsKeyArn = this.kmsKeyArn;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'status': status,
      'workspaceId': workspaceId,
      if (alias != null) 'alias': alias,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
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

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
