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
class Amp {
  final _s.RestJsonProtocol _protocol;
  Amp({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'aps',
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

  /// The <code>GetDefaultScraperConfiguration</code> operation returns the
  /// default scraper configuration used when Amazon EKS creates a scraper for
  /// you.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// The <code>ListTagsForResource</code> operation returns the tags that are
  /// associated with an Amazon Managed Service for Prometheus resource.
  /// Currently, the only resources that can be tagged are scrapers, workspaces,
  /// and rule groups namespaces.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to list tages for. Must be a workspace, scraper,
  /// or rule groups namespace resource.
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

  /// The <code>TagResource</code> operation associates tags with an Amazon
  /// Managed Service for Prometheus resource. The only resources that can be
  /// tagged are rule groups namespaces, scrapers, and workspaces.
  ///
  /// If you specify a new tag key for the resource, this tag is appended to the
  /// list of tags associated with the resource. If you specify a tag key that
  /// is already associated with the resource, the new tag value that you
  /// specify replaces the previous value for that tag. To remove a tag, use
  /// <code>UntagResource</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to apply tags to.
  ///
  /// Parameter [tags] :
  /// The list of tag keys and values to associate with the resource.
  ///
  /// Keys must not begin with <code>aws:</code>.
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
  /// resource. The only resources that can be tagged are rule groups
  /// namespaces, scrapers, and workspaces.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource from which to remove a tag.
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

  /// The <code>CreateScraper</code> operation creates a scraper to collect
  /// metrics. A scraper pulls metrics from Prometheus-compatible sources and
  /// sends them to your Amazon Managed Service for Prometheus workspace. You
  /// can configure scrapers to collect metrics from Amazon EKS clusters, Amazon
  /// MSK clusters, or from VPC-based sources that support DNS-based service
  /// discovery. Scrapers are flexible, and can be configured to control what
  /// metrics are collected, the frequency of collection, what transformations
  /// are applied to the metrics, and more.
  ///
  /// An IAM role will be created for you that Amazon Managed Service for
  /// Prometheus uses to access the metrics in your source. You must configure
  /// this role with a policy that allows it to scrape metrics from your source.
  /// For Amazon EKS sources, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html#AMP-collector-eks-setup">Configuring
  /// your Amazon EKS cluster</a> in the <i>Amazon Managed Service for
  /// Prometheus User Guide</i>.
  ///
  /// The <code>scrapeConfiguration</code> parameter contains the base-64
  /// encoded YAML configuration for the scraper.
  ///
  /// When creating a scraper, the service creates a <code>Network
  /// Interface</code> in each <b>Availability Zone</b> that are passed into
  /// <code>CreateScraper</code> through subnets. These network interfaces are
  /// used to connect to your source within the VPC for scraping metrics.
  /// <note>
  /// For more information about collectors, including what metrics are
  /// collected, and how to configure the scraper, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html">Using
  /// an Amazon Web Services managed collector</a> in the <i>Amazon Managed
  /// Service for Prometheus User Guide</i>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destination] :
  /// The Amazon Managed Service for Prometheus workspace to send metrics to.
  ///
  /// Parameter [scrapeConfiguration] :
  /// The configuration file to use in the new scraper. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html#AMP-collector-configuration">Scraper
  /// configuration</a> in the <i>Amazon Managed Service for Prometheus User
  /// Guide</i>.
  ///
  /// Parameter [source] :
  /// The Amazon EKS or Amazon Web Services cluster from which the scraper will
  /// collect metrics.
  ///
  /// Parameter [alias] :
  /// (optional) An alias to associate with the scraper. This is for your use,
  /// and does not need to be unique.
  ///
  /// Parameter [clientToken] :
  /// (Optional) A unique, case-sensitive identifier that you can provide to
  /// ensure the idempotency of the request.
  ///
  /// Parameter [roleConfiguration] :
  /// Use this structure to enable cross-account access, so that you can use a
  /// target account to access Prometheus metrics from source accounts.
  ///
  /// Parameter [tags] :
  /// (Optional) The list of tag keys and values to associate with the scraper.
  Future<CreateScraperResponse> createScraper({
    required Destination destination,
    required ScrapeConfiguration scrapeConfiguration,
    required Source source,
    String? alias,
    String? clientToken,
    RoleConfiguration? roleConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destination': destination,
      'scrapeConfiguration': scrapeConfiguration,
      'source': source,
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (roleConfiguration != null) 'roleConfiguration': roleConfiguration,
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

  /// The <code>DescribeScraper</code> operation displays information about an
  /// existing scraper.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates an existing scraper.
  ///
  /// You can't use this function to update the source from which the scraper is
  /// collecting metrics. To change the source, delete the scraper and create a
  /// new one.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scraperId] :
  /// The ID of the scraper to update.
  ///
  /// Parameter [alias] :
  /// The new alias of the scraper.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier that you can provide to ensure the idempotency of the
  /// request. Case-sensitive.
  ///
  /// Parameter [destination] :
  /// The new Amazon Managed Service for Prometheus workspace to send metrics
  /// to.
  ///
  /// Parameter [roleConfiguration] :
  /// Use this structure to enable cross-account access, so that you can use a
  /// target account to access Prometheus metrics from source accounts.
  ///
  /// Parameter [scrapeConfiguration] :
  /// Contains the base-64 encoded YAML configuration for the scraper.
  /// <note>
  /// For more information about configuring a scraper, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html">Using
  /// an Amazon Web Services managed collector</a> in the <i>Amazon Managed
  /// Service for Prometheus User Guide</i>.
  /// </note>
  Future<UpdateScraperResponse> updateScraper({
    required String scraperId,
    String? alias,
    String? clientToken,
    Destination? destination,
    RoleConfiguration? roleConfiguration,
    ScrapeConfiguration? scrapeConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (destination != null) 'destination': destination,
      if (roleConfiguration != null) 'roleConfiguration': roleConfiguration,
      if (scrapeConfiguration != null)
        'scrapeConfiguration': scrapeConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/scrapers/${Uri.encodeComponent(scraperId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateScraperResponse.fromJson(response);
  }

  /// The <code>DeleteScraper</code> operation deletes one scraper, and stops
  /// any metrics collection that the scraper performs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// The <code>ListScrapers</code> operation lists all of the scrapers in your
  /// account. This includes scrapers being created or deleted. You can
  /// optionally filter the returned list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final $query = <String, List<String>>{
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

  /// Updates the logging configuration for a Amazon Managed Service for
  /// Prometheus scraper.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [loggingDestination] :
  /// The destination where scraper logs will be sent.
  ///
  /// Parameter [scraperId] :
  /// The ID of the scraper whose logging configuration will be updated.
  ///
  /// Parameter [scraperComponents] :
  /// The list of scraper components to configure for logging.
  Future<UpdateScraperLoggingConfigurationResponse>
      updateScraperLoggingConfiguration({
    required ScraperLoggingDestination loggingDestination,
    required String scraperId,
    List<ScraperComponent>? scraperComponents,
  }) async {
    final $payload = <String, dynamic>{
      'loggingDestination': loggingDestination,
      if (scraperComponents != null) 'scraperComponents': scraperComponents,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/scrapers/${Uri.encodeComponent(scraperId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateScraperLoggingConfigurationResponse.fromJson(response);
  }

  /// Describes the logging configuration for a Amazon Managed Service for
  /// Prometheus scraper.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scraperId] :
  /// The ID of the scraper whose logging configuration will be described.
  Future<DescribeScraperLoggingConfigurationResponse>
      describeScraperLoggingConfiguration({
    required String scraperId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/scrapers/${Uri.encodeComponent(scraperId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeScraperLoggingConfigurationResponse.fromJson(response);
  }

  /// Deletes the logging configuration for a Amazon Managed Service for
  /// Prometheus scraper.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scraperId] :
  /// The ID of the scraper whose logging configuration will be deleted.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is processed exactly once.
  Future<void> deleteScraperLoggingConfiguration({
    required String scraperId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/scrapers/${Uri.encodeComponent(scraperId)}/logging-configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a Prometheus workspace. A workspace is a logical space dedicated
  /// to the storage and querying of Prometheus metrics. You can have one or
  /// more workspaces in each Region in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns information about an existing workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates the alias of an existing workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes an existing workspace.
  /// <note>
  /// When you delete a workspace, the data that has been ingested into it is
  /// not immediately deleted. It will be permanently deleted within one month.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists all of the Amazon Managed Service for Prometheus workspaces in your
  /// account. This includes workspaces being created or deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// The <code>CreateAlertManagerDefinition</code> operation creates the alert
  /// manager definition in a workspace. If a workspace already has an alert
  /// manager definition, don't use this operation to update it. Instead, use
  /// <code>PutAlertManagerDefinition</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves the full information about the alert manager definition for a
  /// workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates an existing alert manager definition in a workspace. If the
  /// workspace does not already have an alert manager definition, don't use
  /// this operation to create it. Instead, use
  /// <code>CreateAlertManagerDefinition</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes the alert manager definition from a workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates an anomaly detector within a workspace using the Random Cut Forest
  /// algorithm for time-series analysis. The anomaly detector analyzes Amazon
  /// Managed Service for Prometheus metrics to identify unusual patterns and
  /// behaviors.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [alias] :
  /// A user-friendly name for the anomaly detector.
  ///
  /// Parameter [configuration] :
  /// The algorithm configuration for the anomaly detector.
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the workspace where the anomaly detector will be
  /// created.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [evaluationIntervalInSeconds] :
  /// The frequency, in seconds, at which the anomaly detector evaluates
  /// metrics. The default value is 60 seconds.
  ///
  /// Parameter [labels] :
  /// The Amazon Managed Service for Prometheus metric labels to associate with
  /// the anomaly detector.
  ///
  /// Parameter [missingDataAction] :
  /// Specifies the action to take when data is missing during evaluation.
  ///
  /// Parameter [tags] :
  /// The metadata to apply to the anomaly detector to assist with
  /// categorization and organization.
  Future<CreateAnomalyDetectorResponse> createAnomalyDetector({
    required String alias,
    required AnomalyDetectorConfiguration configuration,
    required String workspaceId,
    String? clientToken,
    int? evaluationIntervalInSeconds,
    Map<String, String>? labels,
    AnomalyDetectorMissingDataAction? missingDataAction,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'evaluationIntervalInSeconds',
      evaluationIntervalInSeconds,
      30,
      86400,
    );
    final $payload = <String, dynamic>{
      'alias': alias,
      'configuration': configuration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (evaluationIntervalInSeconds != null)
        'evaluationIntervalInSeconds': evaluationIntervalInSeconds,
      if (labels != null) 'labels': labels,
      if (missingDataAction != null) 'missingDataAction': missingDataAction,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/anomalydetectors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAnomalyDetectorResponse.fromJson(response);
  }

  /// When you call <code>PutAnomalyDetector</code>, the operation creates a new
  /// anomaly detector if one doesn't exist, or updates an existing one. Each
  /// call to this operation triggers a complete retraining of the detector,
  /// which includes querying the minimum required samples and backfilling the
  /// detector with historical data. This process occurs regardless of whether
  /// you're making a minor change like updating the evaluation interval or
  /// making more substantial modifications. The operation serves as the single
  /// method for creating, updating, and retraining anomaly detectors.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [anomalyDetectorId] :
  /// The identifier of the anomaly detector to update.
  ///
  /// Parameter [configuration] :
  /// The algorithm configuration for the anomaly detector.
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the workspace containing the anomaly detector to update.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [evaluationIntervalInSeconds] :
  /// The frequency, in seconds, at which the anomaly detector evaluates
  /// metrics.
  ///
  /// Parameter [labels] :
  /// The Amazon Managed Service for Prometheus metric labels to associate with
  /// the anomaly detector.
  ///
  /// Parameter [missingDataAction] :
  /// Specifies the action to take when data is missing during evaluation.
  Future<PutAnomalyDetectorResponse> putAnomalyDetector({
    required String anomalyDetectorId,
    required AnomalyDetectorConfiguration configuration,
    required String workspaceId,
    String? clientToken,
    int? evaluationIntervalInSeconds,
    Map<String, String>? labels,
    AnomalyDetectorMissingDataAction? missingDataAction,
  }) async {
    _s.validateNumRange(
      'evaluationIntervalInSeconds',
      evaluationIntervalInSeconds,
      30,
      86400,
    );
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (evaluationIntervalInSeconds != null)
        'evaluationIntervalInSeconds': evaluationIntervalInSeconds,
      if (labels != null) 'labels': labels,
      if (missingDataAction != null) 'missingDataAction': missingDataAction,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/anomalydetectors/${Uri.encodeComponent(anomalyDetectorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutAnomalyDetectorResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific anomaly detector,
  /// including its status and configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [anomalyDetectorId] :
  /// The identifier of the anomaly detector to describe.
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the workspace containing the anomaly detector.
  Future<DescribeAnomalyDetectorResponse> describeAnomalyDetector({
    required String anomalyDetectorId,
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/anomalydetectors/${Uri.encodeComponent(anomalyDetectorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAnomalyDetectorResponse.fromJson(response);
  }

  /// Removes an anomaly detector from a workspace. This operation is
  /// idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [anomalyDetectorId] :
  /// The identifier of the anomaly detector to delete.
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the workspace containing the anomaly detector to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<void> deleteAnomalyDetector({
    required String anomalyDetectorId,
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
          '/workspaces/${Uri.encodeComponent(workspaceId)}/anomalydetectors/${Uri.encodeComponent(anomalyDetectorId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a paginated list of anomaly detectors for a workspace with
  /// optional filtering by alias.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The identifier of the workspace containing the anomaly detectors to list.
  ///
  /// Parameter [alias] :
  /// Filters the results to anomaly detectors with the specified alias.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid range is 1
  /// to 1000.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to continue retrieving results.
  Future<ListAnomalyDetectorsResponse> listAnomalyDetectors({
    required String workspaceId,
    String? alias,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (alias != null) 'alias': [alias],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/anomalydetectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnomalyDetectorsResponse.fromJson(response);
  }

  /// The <code>CreateLoggingConfiguration</code> operation creates rules and
  /// alerting logging configuration for the workspace. Use this operation to
  /// set the CloudWatch log group to which the logs will be published to.
  /// <note>
  /// These logging configurations are only for rules and alerting logs.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [logGroupArn] :
  /// The ARN of the CloudWatch log group to which the vended log data will be
  /// published. This log group must exist prior to calling this operation.
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

  /// Returns complete information about the current rules and alerting logging
  /// configuration of the workspace.
  /// <note>
  /// These logging configurations are only for rules and alerting logs.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Updates the log group ARN or the workspace ID of the current rules and
  /// alerting logging configuration.
  /// <note>
  /// These logging configurations are only for rules and alerting logs.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Deletes the rules and alerting logging configuration for a workspace.
  /// <note>
  /// These logging configurations are only for rules and alerting logs.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Creates a query logging configuration for the specified workspace. This
  /// operation enables logging of queries that exceed the specified QSP
  /// threshold.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinations] :
  /// The destinations where query logs will be sent. Only CloudWatch Logs
  /// destination is supported. The list must contain exactly one element.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace for which to create the query logging
  /// configuration.
  ///
  /// Parameter [clientToken] :
  /// (Optional) A unique, case-sensitive identifier that you can provide to
  /// ensure the idempotency of the request.
  Future<CreateQueryLoggingConfigurationResponse>
      createQueryLoggingConfiguration({
    required List<LoggingDestination> destinations,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'destinations': destinations,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/logging/query',
      exceptionFnMap: _exceptionFns,
    );
    return CreateQueryLoggingConfigurationResponse.fromJson(response);
  }

  /// Retrieves the details of the query logging configuration for the specified
  /// workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace for which to retrieve the query logging
  /// configuration.
  Future<DescribeQueryLoggingConfigurationResponse>
      describeQueryLoggingConfiguration({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/logging/query',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeQueryLoggingConfigurationResponse.fromJson(response);
  }

  /// Updates the query logging configuration for the specified workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinations] :
  /// The destinations where query logs will be sent. Only CloudWatch Logs
  /// destination is supported. The list must contain exactly one element.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace for which to update the query logging
  /// configuration.
  ///
  /// Parameter [clientToken] :
  /// (Optional) A unique, case-sensitive identifier that you can provide to
  /// ensure the idempotency of the request.
  Future<UpdateQueryLoggingConfigurationResponse>
      updateQueryLoggingConfiguration({
    required List<LoggingDestination> destinations,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'destinations': destinations,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/logging/query',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateQueryLoggingConfigurationResponse.fromJson(response);
  }

  /// Deletes the query logging configuration for the specified workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace from which to delete the query logging
  /// configuration.
  ///
  /// Parameter [clientToken] :
  /// (Optional) A unique, case-sensitive identifier that you can provide to
  /// ensure the idempotency of the request.
  Future<void> deleteQueryLoggingConfiguration({
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
          '/workspaces/${Uri.encodeComponent(workspaceId)}/logging/query',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The <code>CreateRuleGroupsNamespace</code> operation creates a rule groups
  /// namespace within a workspace. A rule groups namespace is associated with
  /// exactly one rules file. A workspace can have multiple rule groups
  /// namespaces.
  /// <important>
  /// The combined length of a rule group namespace and a rule group name cannot
  /// exceed 721 UTF-8 bytes.
  /// </important>
  /// Use this operation only to create new rule groups namespaces. To update an
  /// existing rule groups namespace, use <code>PutRuleGroupsNamespace</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns complete information about one rule groups namespace. To retrieve
  /// a list of rule groups namespaces, use
  /// <code>ListRuleGroupsNamespaces</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates an existing rule groups namespace within a workspace. A rule
  /// groups namespace is associated with exactly one rules file. A workspace
  /// can have multiple rule groups namespaces.
  /// <important>
  /// The combined length of a rule group namespace and a rule group name cannot
  /// exceed 721 UTF-8 bytes.
  /// </important>
  /// Use this operation only to update existing rule groups namespaces. To
  /// create a new rule groups namespace, use
  /// <code>CreateRuleGroupsNamespace</code>.
  ///
  /// You can't use this operation to add tags to an existing rule groups
  /// namespace. Instead, use <code>TagResource</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes one rule groups namespace and its associated rule groups
  /// definition.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a list of rule groups namespaces in a workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Use this operation to return information about the configuration of a
  /// workspace. The configuration details returned include workspace
  /// configuration status, label set limits, and retention period.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that you want to retrieve information for. To find
  /// the IDs of your workspaces, use the <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/APIReference/API_ListWorkspaces.htm">ListWorkspaces</a>
  /// operation.
  Future<DescribeWorkspaceConfigurationResponse>
      describeWorkspaceConfiguration({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorkspaceConfigurationResponse.fromJson(response);
  }

  /// Use this operation to create or update the label sets, label set limits,
  /// and retention period of a workspace.
  ///
  /// You must specify at least one of <code>limitsPerLabelSet</code> or
  /// <code>retentionPeriodInDays</code> for the request to be valid.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace that you want to update. To find the IDs of your
  /// workspaces, use the <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/APIReference/API_ListWorkspaces.htm">ListWorkspaces</a>
  /// operation.
  ///
  /// Parameter [clientToken] :
  /// You can include a token in your operation to make it an idempotent
  /// opeartion.
  ///
  /// Parameter [limitsPerLabelSet] :
  /// This is an array of structures, where each structure defines a label set
  /// for the workspace, and defines the active time series limit for each of
  /// those label sets. Each label name in a label set must be unique.
  ///
  /// Parameter [retentionPeriodInDays] :
  /// Specifies how many days that metrics will be retained in the workspace.
  Future<UpdateWorkspaceConfigurationResponse> updateWorkspaceConfiguration({
    required String workspaceId,
    String? clientToken,
    List<LimitsPerLabelSet>? limitsPerLabelSet,
    int? retentionPeriodInDays,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (limitsPerLabelSet != null) 'limitsPerLabelSet': limitsPerLabelSet,
      if (retentionPeriodInDays != null)
        'retentionPeriodInDays': retentionPeriodInDays,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkspaceConfigurationResponse.fromJson(response);
  }

  /// Creates or updates a resource-based policy for an Amazon Managed Service
  /// for Prometheus workspace. Use resource-based policies to grant permissions
  /// to other AWS accounts or services to access your workspace.
  ///
  /// Only Prometheus-compatible APIs can be used for workspace sharing. You can
  /// add non-Prometheus-compatible APIs to the policy, but they will be
  /// ignored. For more information, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-APIReference-Prometheus-Compatible-Apis.html">Prometheus-compatible
  /// APIs</a> in the <i>Amazon Managed Service for Prometheus User Guide</i>.
  ///
  /// If your workspace uses customer-managed KMS keys for encryption, you must
  /// grant the principals in your resource-based policy access to those KMS
  /// keys. You can do this by creating KMS grants. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateGrant.html">CreateGrant</a>
  /// in the <i>AWS Key Management Service API Reference</i> and <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/encryption-at-rest-Amazon-Service-Prometheus.html">Encryption
  /// at rest</a> in the <i>Amazon Managed Service for Prometheus User
  /// Guide</i>.
  ///
  /// For more information about working with IAM, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/security_iam_service-with-iam.html">Using
  /// Amazon Managed Service for Prometheus with IAM</a> in the <i>Amazon
  /// Managed Service for Prometheus User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON policy document to use as the resource-based policy. This policy
  /// defines the permissions that other AWS accounts or services have to access
  /// your workspace.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to attach the resource-based policy to.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is safe to retry (idempotent).
  ///
  /// Parameter [revisionId] :
  /// The revision ID of the policy to update. Use this parameter to ensure that
  /// you are updating the correct version of the policy. If you don't specify a
  /// revision ID, the policy is updated regardless of its current revision.
  ///
  /// For the first <b>PUT</b> request on a workspace that doesn't have an
  /// existing resource policy, you can specify <code>NO_POLICY</code> as the
  /// revision ID.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String policyDocument,
    required String workspaceId,
    String? clientToken,
    String? revisionId,
  }) async {
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (revisionId != null) 'revisionId': revisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePolicyResponse.fromJson(response);
  }

  /// Returns information about the resource-based policy attached to an Amazon
  /// Managed Service for Prometheus workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to describe the resource-based policy for.
  Future<DescribeResourcePolicyResponse> describeResourcePolicy({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeResourcePolicyResponse.fromJson(response);
  }

  /// Deletes the resource-based policy attached to an Amazon Managed Service
  /// for Prometheus workspace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace from which to delete the resource-based policy.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is safe to retry (idempotent).
  ///
  /// Parameter [revisionId] :
  /// The revision ID of the policy to delete. Use this parameter to ensure that
  /// you are deleting the correct version of the policy.
  Future<void> deleteResourcePolicy({
    required String workspaceId,
    String? clientToken,
    String? revisionId,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
      if (revisionId != null) 'revisionId': [revisionId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Represents the output of a <code>GetDefaultScraperConfiguration</code>
/// operation.
///
/// @nodoc
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
      configuration:
          _s.decodeUint8List((json['configuration'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      'configuration': base64Encode(configuration),
    };
  }
}

/// @nodoc
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

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the output of a <code>CreateScraper</code> operation.
///
/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      scraperId: (json['scraperId'] as String?) ?? '',
      status: ScraperStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// Represents the output of a <code>DescribeScraper</code> operation.
///
/// @nodoc
class DescribeScraperResponse {
  /// Contains details about the scraper.
  final ScraperDescription scraper;

  DescribeScraperResponse({
    required this.scraper,
  });

  factory DescribeScraperResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScraperResponse(
      scraper: ScraperDescription.fromJson(
          (json['scraper'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final scraper = this.scraper;
    return {
      'scraper': scraper,
    };
  }
}

/// @nodoc
class UpdateScraperResponse {
  /// The Amazon Resource Name (ARN) of the updated scraper.
  final String arn;

  /// The ID of the updated scraper.
  final String scraperId;

  /// A structure that displays the current status of the scraper.
  final ScraperStatus status;

  /// The list of tag keys and values that are associated with the scraper.
  final Map<String, String>? tags;

  UpdateScraperResponse({
    required this.arn,
    required this.scraperId,
    required this.status,
    this.tags,
  });

  factory UpdateScraperResponse.fromJson(Map<String, dynamic> json) {
    return UpdateScraperResponse(
      arn: (json['arn'] as String?) ?? '',
      scraperId: (json['scraperId'] as String?) ?? '',
      status: ScraperStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// Represents the output of a <code>DeleteScraper</code> operation.
///
/// @nodoc
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
      scraperId: (json['scraperId'] as String?) ?? '',
      status: ScraperStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// Represents the output of a <code>ListScrapers</code> operation.
///
/// @nodoc
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
      scrapers: ((json['scrapers'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
class UpdateScraperLoggingConfigurationResponse {
  /// The status of the updated scraper logging configuration.
  final ScraperLoggingConfigurationStatus status;

  UpdateScraperLoggingConfigurationResponse({
    required this.status,
  });

  factory UpdateScraperLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateScraperLoggingConfigurationResponse(
      status: ScraperLoggingConfigurationStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// @nodoc
class DescribeScraperLoggingConfigurationResponse {
  /// The destination where scraper logs are sent.
  final ScraperLoggingDestination loggingDestination;

  /// The date and time when the logging configuration was last modified.
  final DateTime modifiedAt;

  /// The list of scraper components configured for logging.
  final List<ScraperComponent> scraperComponents;

  /// The ID of the scraper.
  final String scraperId;

  /// The status of the scraper logging configuration.
  final ScraperLoggingConfigurationStatus status;

  DescribeScraperLoggingConfigurationResponse({
    required this.loggingDestination,
    required this.modifiedAt,
    required this.scraperComponents,
    required this.scraperId,
    required this.status,
  });

  factory DescribeScraperLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeScraperLoggingConfigurationResponse(
      loggingDestination: ScraperLoggingDestination.fromJson(
          (json['loggingDestination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      scraperComponents: ((json['scraperComponents'] as List?) ?? const [])
          .nonNulls
          .map((e) => ScraperComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      scraperId: (json['scraperId'] as String?) ?? '',
      status: ScraperLoggingConfigurationStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final loggingDestination = this.loggingDestination;
    final modifiedAt = this.modifiedAt;
    final scraperComponents = this.scraperComponents;
    final scraperId = this.scraperId;
    final status = this.status;
    return {
      'loggingDestination': loggingDestination,
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'scraperComponents': scraperComponents,
      'scraperId': scraperId,
      'status': status,
    };
  }
}

/// Represents the output of a <code>CreateWorkspace</code> operation.
///
/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      status: WorkspaceStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      workspaceId: (json['workspaceId'] as String?) ?? '',
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

/// Represents the output of a <code>DescribeWorkspace</code> operation.
///
/// @nodoc
class DescribeWorkspaceResponse {
  /// A structure that contains details about the workspace.
  final WorkspaceDescription workspace;

  DescribeWorkspaceResponse({
    required this.workspace,
  });

  factory DescribeWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorkspaceResponse(
      workspace: WorkspaceDescription.fromJson(
          (json['workspace'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

/// Represents the output of a <code>ListWorkspaces</code> operation.
///
/// @nodoc
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
      workspaces: ((json['workspaces'] as List?) ?? const [])
          .nonNulls
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

/// Represents the output of a <code>CreateAlertManagerDefinition</code>
/// operation.
///
/// @nodoc
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
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// Represents the output of a <code>DescribeAlertManagerDefinition</code>
/// operation.
///
/// @nodoc
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
          (json['alertManagerDefinition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final alertManagerDefinition = this.alertManagerDefinition;
    return {
      'alertManagerDefinition': alertManagerDefinition,
    };
  }
}

/// Represents the output of a <code>PutAlertManagerDefinition</code> operation.
///
/// @nodoc
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
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// @nodoc
class CreateAnomalyDetectorResponse {
  /// The unique identifier of the created anomaly detector.
  final String anomalyDetectorId;

  /// The Amazon Resource Name (ARN) of the created anomaly detector.
  final String arn;

  /// The status information of the created anomaly detector.
  final AnomalyDetectorStatus status;

  /// The tags applied to the created anomaly detector.
  final Map<String, String>? tags;

  CreateAnomalyDetectorResponse({
    required this.anomalyDetectorId,
    required this.arn,
    required this.status,
    this.tags,
  });

  factory CreateAnomalyDetectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateAnomalyDetectorResponse(
      anomalyDetectorId: (json['anomalyDetectorId'] as String?) ?? '',
      arn: (json['arn'] as String?) ?? '',
      status: AnomalyDetectorStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorId = this.anomalyDetectorId;
    final arn = this.arn;
    final status = this.status;
    final tags = this.tags;
    return {
      'anomalyDetectorId': anomalyDetectorId,
      'arn': arn,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class PutAnomalyDetectorResponse {
  /// The unique identifier of the updated anomaly detector.
  final String anomalyDetectorId;

  /// The Amazon Resource Name (ARN) of the updated anomaly detector.
  final String arn;

  /// The status information of the updated anomaly detector.
  final AnomalyDetectorStatus status;

  /// The tags applied to the updated anomaly detector.
  final Map<String, String>? tags;

  PutAnomalyDetectorResponse({
    required this.anomalyDetectorId,
    required this.arn,
    required this.status,
    this.tags,
  });

  factory PutAnomalyDetectorResponse.fromJson(Map<String, dynamic> json) {
    return PutAnomalyDetectorResponse(
      anomalyDetectorId: (json['anomalyDetectorId'] as String?) ?? '',
      arn: (json['arn'] as String?) ?? '',
      status: AnomalyDetectorStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorId = this.anomalyDetectorId;
    final arn = this.arn;
    final status = this.status;
    final tags = this.tags;
    return {
      'anomalyDetectorId': anomalyDetectorId,
      'arn': arn,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DescribeAnomalyDetectorResponse {
  /// The detailed information about the anomaly detector.
  final AnomalyDetectorDescription anomalyDetector;

  DescribeAnomalyDetectorResponse({
    required this.anomalyDetector,
  });

  factory DescribeAnomalyDetectorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAnomalyDetectorResponse(
      anomalyDetector: AnomalyDetectorDescription.fromJson(
          (json['anomalyDetector'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetector = this.anomalyDetector;
    return {
      'anomalyDetector': anomalyDetector,
    };
  }
}

/// @nodoc
class ListAnomalyDetectorsResponse {
  /// The list of anomaly detectors in the workspace.
  final List<AnomalyDetectorSummary> anomalyDetectors;

  /// The pagination token to retrieve the next set of results.
  final String? nextToken;

  ListAnomalyDetectorsResponse({
    required this.anomalyDetectors,
    this.nextToken,
  });

  factory ListAnomalyDetectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListAnomalyDetectorsResponse(
      anomalyDetectors: ((json['anomalyDetectors'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => AnomalyDetectorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectors = this.anomalyDetectors;
    final nextToken = this.nextToken;
    return {
      'anomalyDetectors': anomalyDetectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>CreateLoggingConfiguration</code>
/// operation.
///
/// @nodoc
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
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// Represents the output of a <code>DescribeLoggingConfiguration</code>
/// operation.
///
/// @nodoc
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
          (json['loggingConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      'loggingConfiguration': loggingConfiguration,
    };
  }
}

/// Represents the output of an <code>UpdateLoggingConfiguration</code>
/// operation.
///
/// @nodoc
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
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// @nodoc
class CreateQueryLoggingConfigurationResponse {
  /// The current status of the query logging configuration.
  final QueryLoggingConfigurationStatus status;

  CreateQueryLoggingConfigurationResponse({
    required this.status,
  });

  factory CreateQueryLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateQueryLoggingConfigurationResponse(
      status: QueryLoggingConfigurationStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// @nodoc
class DescribeQueryLoggingConfigurationResponse {
  /// The detailed information about the query logging configuration for the
  /// specified workspace.
  final QueryLoggingConfigurationMetadata queryLoggingConfiguration;

  DescribeQueryLoggingConfigurationResponse({
    required this.queryLoggingConfiguration,
  });

  factory DescribeQueryLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeQueryLoggingConfigurationResponse(
      queryLoggingConfiguration: QueryLoggingConfigurationMetadata.fromJson(
          (json['queryLoggingConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final queryLoggingConfiguration = this.queryLoggingConfiguration;
    return {
      'queryLoggingConfiguration': queryLoggingConfiguration,
    };
  }
}

/// @nodoc
class UpdateQueryLoggingConfigurationResponse {
  /// The current status of the query logging configuration.
  final QueryLoggingConfigurationStatus status;

  UpdateQueryLoggingConfigurationResponse({
    required this.status,
  });

  factory UpdateQueryLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateQueryLoggingConfigurationResponse(
      status: QueryLoggingConfigurationStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
///
/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: RuleGroupsNamespaceStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// Represents the output of a <code>DescribeRuleGroupsNamespace</code>
/// operation.
///
/// @nodoc
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
          (json['ruleGroupsNamespace'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupsNamespace = this.ruleGroupsNamespace;
    return {
      'ruleGroupsNamespace': ruleGroupsNamespace,
    };
  }
}

/// Represents the output of a <code>PutRuleGroupsNamespace</code> operation.
///
/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: RuleGroupsNamespaceStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// Represents the output of a <code>ListRuleGroupsNamespaces</code> operation.
///
/// @nodoc
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
      ruleGroupsNamespaces: ((json['ruleGroupsNamespaces'] as List?) ??
              const [])
          .nonNulls
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

/// @nodoc
class DescribeWorkspaceConfigurationResponse {
  /// This structure contains the information about the workspace configuration.
  final WorkspaceConfigurationDescription workspaceConfiguration;

  DescribeWorkspaceConfigurationResponse({
    required this.workspaceConfiguration,
  });

  factory DescribeWorkspaceConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorkspaceConfigurationResponse(
      workspaceConfiguration: WorkspaceConfigurationDescription.fromJson(
          (json['workspaceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final workspaceConfiguration = this.workspaceConfiguration;
    return {
      'workspaceConfiguration': workspaceConfiguration,
    };
  }
}

/// @nodoc
class UpdateWorkspaceConfigurationResponse {
  /// The status of the workspace configuration.
  final WorkspaceConfigurationStatus status;

  UpdateWorkspaceConfigurationResponse({
    required this.status,
  });

  factory UpdateWorkspaceConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateWorkspaceConfigurationResponse(
      status: WorkspaceConfigurationStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// @nodoc
class PutResourcePolicyResponse {
  /// The current status of the resource-based policy.
  final WorkspacePolicyStatusCode policyStatus;

  /// The revision ID of the newly created or updated resource-based policy.
  final String revisionId;

  PutResourcePolicyResponse({
    required this.policyStatus,
    required this.revisionId,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      policyStatus: WorkspacePolicyStatusCode.fromString(
          (json['policyStatus'] as String?) ?? ''),
      revisionId: (json['revisionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyStatus = this.policyStatus;
    final revisionId = this.revisionId;
    return {
      'policyStatus': policyStatus.value,
      'revisionId': revisionId,
    };
  }
}

/// @nodoc
class DescribeResourcePolicyResponse {
  /// The JSON policy document for the resource-based policy attached to the
  /// workspace.
  final String policyDocument;

  /// The current status of the resource-based policy.
  final WorkspacePolicyStatusCode policyStatus;

  /// The revision ID of the current resource-based policy.
  final String revisionId;

  DescribeResourcePolicyResponse({
    required this.policyDocument,
    required this.policyStatus,
    required this.revisionId,
  });

  factory DescribeResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResourcePolicyResponse(
      policyDocument: (json['policyDocument'] as String?) ?? '',
      policyStatus: WorkspacePolicyStatusCode.fromString(
          (json['policyStatus'] as String?) ?? ''),
      revisionId: (json['revisionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final policyStatus = this.policyStatus;
    final revisionId = this.revisionId;
    return {
      'policyDocument': policyDocument,
      'policyStatus': policyStatus.value,
      'revisionId': revisionId,
    };
  }
}

/// @nodoc
class WorkspacePolicyStatusCode {
  static const creating = WorkspacePolicyStatusCode._('CREATING');
  static const active = WorkspacePolicyStatusCode._('ACTIVE');
  static const updating = WorkspacePolicyStatusCode._('UPDATING');
  static const deleting = WorkspacePolicyStatusCode._('DELETING');

  final String value;

  const WorkspacePolicyStatusCode._(this.value);

  static const values = [creating, active, updating, deleting];

  static WorkspacePolicyStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkspacePolicyStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is WorkspacePolicyStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure displays the current status of the workspace configuration,
/// and might also contain a reason for that status.
///
/// @nodoc
class WorkspaceConfigurationStatus {
  /// The current status of the workspace configuration.
  final WorkspaceConfigurationStatusCode statusCode;

  /// The reason for the current status, if a reason is available.
  final String? statusReason;

  WorkspaceConfigurationStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory WorkspaceConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return WorkspaceConfigurationStatus(
      statusCode: WorkspaceConfigurationStatusCode.fromString(
          (json['statusCode'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// @nodoc
class WorkspaceConfigurationStatusCode {
  static const active = WorkspaceConfigurationStatusCode._('ACTIVE');
  static const updating = WorkspaceConfigurationStatusCode._('UPDATING');
  static const updateFailed =
      WorkspaceConfigurationStatusCode._('UPDATE_FAILED');

  final String value;

  const WorkspaceConfigurationStatusCode._(this.value);

  static const values = [active, updating, updateFailed];

  static WorkspaceConfigurationStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkspaceConfigurationStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is WorkspaceConfigurationStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure defines one label set used to enforce active time series
/// limits for the workspace, and defines the limit for that label set.
///
/// A label set is a unique combination of label-value pairs. Use them to
/// control time series limits and to monitor usage by specific label groups.
/// Example label sets might be <code>team:finance</code> or
/// <code>env:prod</code>
///
/// @nodoc
class LimitsPerLabelSet {
  /// This defines one label set that will have an enforced active time series
  /// limit.
  ///
  /// Label values accept ASCII characters and must contain at least one character
  /// that isn't whitespace. ASCII control characters are not accepted. If the
  /// label name is metric name label <code>__<i>name</i>__</code>, then the
  /// <i>metric</i> part of the name must conform to the following pattern:
  /// <code>\[a-zA-Z_:\]\[a-zA-Z0-9_:\]*</code>
  final Map<String, String> labelSet;

  /// This structure contains the information about the limits that apply to time
  /// series that match this label set.
  final LimitsPerLabelSetEntry limits;

  LimitsPerLabelSet({
    required this.labelSet,
    required this.limits,
  });

  factory LimitsPerLabelSet.fromJson(Map<String, dynamic> json) {
    return LimitsPerLabelSet(
      labelSet: ((json['labelSet'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      limits: LimitsPerLabelSetEntry.fromJson(
          (json['limits'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final labelSet = this.labelSet;
    final limits = this.limits;
    return {
      'labelSet': labelSet,
      'limits': limits,
    };
  }
}

/// This structure contains the information about the limits that apply to time
/// series that match one label set.
///
/// @nodoc
class LimitsPerLabelSetEntry {
  /// The maximum number of active series that can be ingested that match this
  /// label set.
  ///
  /// Setting this to 0 causes no label set limit to be enforced, but it does
  /// cause Amazon Managed Service for Prometheus to vend label set metrics to
  /// CloudWatch
  final int? maxSeries;

  LimitsPerLabelSetEntry({
    this.maxSeries,
  });

  factory LimitsPerLabelSetEntry.fromJson(Map<String, dynamic> json) {
    return LimitsPerLabelSetEntry(
      maxSeries: json['maxSeries'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxSeries = this.maxSeries;
    return {
      if (maxSeries != null) 'maxSeries': maxSeries,
    };
  }
}

/// This structure contains the description of the workspace configuration.
///
/// @nodoc
class WorkspaceConfigurationDescription {
  /// This structure displays the current status of the workspace configuration,
  /// and might also contain a reason for that status.
  final WorkspaceConfigurationStatus status;

  /// This is an array of structures, where each structure displays one label sets
  /// for the workspace and the limits for that label set.
  final List<LimitsPerLabelSet>? limitsPerLabelSet;

  /// This field displays how many days that metrics are retained in the
  /// workspace.
  final int? retentionPeriodInDays;

  WorkspaceConfigurationDescription({
    required this.status,
    this.limitsPerLabelSet,
    this.retentionPeriodInDays,
  });

  factory WorkspaceConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return WorkspaceConfigurationDescription(
      status: WorkspaceConfigurationStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      limitsPerLabelSet: (json['limitsPerLabelSet'] as List?)
          ?.nonNulls
          .map((e) => LimitsPerLabelSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      retentionPeriodInDays: json['retentionPeriodInDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final limitsPerLabelSet = this.limitsPerLabelSet;
    final retentionPeriodInDays = this.retentionPeriodInDays;
    return {
      'status': status,
      if (limitsPerLabelSet != null) 'limitsPerLabelSet': limitsPerLabelSet,
      if (retentionPeriodInDays != null)
        'retentionPeriodInDays': retentionPeriodInDays,
    };
  }
}

/// The high-level information about a rule groups namespace. To retrieve more
/// information, use <code>DescribeRuleGroupsNamespace</code>.
///
/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: RuleGroupsNamespaceStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// The status information about a rule groups namespace.
///
/// @nodoc
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
      statusCode: RuleGroupsNamespaceStatusCode.fromString(
          (json['statusCode'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of a namespace.
///
/// @nodoc
class RuleGroupsNamespaceStatusCode {
  static const creating = RuleGroupsNamespaceStatusCode._('CREATING');
  static const active = RuleGroupsNamespaceStatusCode._('ACTIVE');
  static const updating = RuleGroupsNamespaceStatusCode._('UPDATING');
  static const deleting = RuleGroupsNamespaceStatusCode._('DELETING');
  static const creationFailed =
      RuleGroupsNamespaceStatusCode._('CREATION_FAILED');
  static const updateFailed = RuleGroupsNamespaceStatusCode._('UPDATE_FAILED');

  final String value;

  const RuleGroupsNamespaceStatusCode._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    creationFailed,
    updateFailed
  ];

  static RuleGroupsNamespaceStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleGroupsNamespaceStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is RuleGroupsNamespaceStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details about one rule groups namespace.
///
/// @nodoc
class RuleGroupsNamespaceDescription {
  /// The ARN of the rule groups namespace. For example,
  /// <code>arn:aws:aps:&lt;region&gt;:123456789012:rulegroupsnamespace/ws-example1-1234-abcd-5678-ef90abcd1234/rulesfile1</code>.
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      data: _s.decodeUint8List((json['data'] as String?) ?? ''),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: RuleGroupsNamespaceStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// The status information for a query logging configuration.
///
/// @nodoc
class QueryLoggingConfigurationStatus {
  /// The current status of the query logging configuration.
  final QueryLoggingConfigurationStatusCode statusCode;

  /// If there is a failure, the reason for the failure.
  final String? statusReason;

  QueryLoggingConfigurationStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory QueryLoggingConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return QueryLoggingConfigurationStatus(
      statusCode: QueryLoggingConfigurationStatusCode.fromString(
          (json['statusCode'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// @nodoc
class QueryLoggingConfigurationStatusCode {
  static const creating = QueryLoggingConfigurationStatusCode._('CREATING');
  static const active = QueryLoggingConfigurationStatusCode._('ACTIVE');
  static const updating = QueryLoggingConfigurationStatusCode._('UPDATING');
  static const deleting = QueryLoggingConfigurationStatusCode._('DELETING');
  static const creationFailed =
      QueryLoggingConfigurationStatusCode._('CREATION_FAILED');
  static const updateFailed =
      QueryLoggingConfigurationStatusCode._('UPDATE_FAILED');

  final String value;

  const QueryLoggingConfigurationStatusCode._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    creationFailed,
    updateFailed
  ];

  static QueryLoggingConfigurationStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryLoggingConfigurationStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is QueryLoggingConfigurationStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines a destination and its associated filtering criteria for query
/// logging.
///
/// @nodoc
class LoggingDestination {
  /// Configuration details for logging to CloudWatch Logs.
  final CloudWatchLogDestination cloudWatchLogs;

  /// Filtering criteria that determine which queries are logged.
  final LoggingFilter filters;

  LoggingDestination({
    required this.cloudWatchLogs,
    required this.filters,
  });

  factory LoggingDestination.fromJson(Map<String, dynamic> json) {
    return LoggingDestination(
      cloudWatchLogs: CloudWatchLogDestination.fromJson(
          (json['cloudWatchLogs'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      filters: LoggingFilter.fromJson(
          (json['filters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final filters = this.filters;
    return {
      'cloudWatchLogs': cloudWatchLogs,
      'filters': filters,
    };
  }
}

/// Configuration details for logging to CloudWatch Logs.
///
/// @nodoc
class CloudWatchLogDestination {
  /// The ARN of the CloudWatch log group to which the vended log data will be
  /// published. This log group must exist prior to calling this operation.
  final String logGroupArn;

  CloudWatchLogDestination({
    required this.logGroupArn,
  });

  factory CloudWatchLogDestination.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogDestination(
      logGroupArn: (json['logGroupArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    return {
      'logGroupArn': logGroupArn,
    };
  }
}

/// Filtering criteria that determine which queries are logged.
///
/// @nodoc
class LoggingFilter {
  /// The Query Samples Processed (QSP) threshold above which queries will be
  /// logged. Queries processing more samples than this threshold will be captured
  /// in logs.
  final int qspThreshold;

  LoggingFilter({
    required this.qspThreshold,
  });

  factory LoggingFilter.fromJson(Map<String, dynamic> json) {
    return LoggingFilter(
      qspThreshold: (json['qspThreshold'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final qspThreshold = this.qspThreshold;
    return {
      'qspThreshold': qspThreshold,
    };
  }
}

/// The metadata for a query logging configuration.
///
/// @nodoc
class QueryLoggingConfigurationMetadata {
  /// The date and time when the query logging configuration was created.
  final DateTime createdAt;

  /// The configured destinations for the query logging configuration.
  final List<LoggingDestination> destinations;

  /// The date and time when the query logging configuration was last modified.
  final DateTime modifiedAt;

  /// The current status of the query logging configuration.
  final QueryLoggingConfigurationStatus status;

  /// The ID of the workspace associated with this query logging configuration.
  final String workspace;

  QueryLoggingConfigurationMetadata({
    required this.createdAt,
    required this.destinations,
    required this.modifiedAt,
    required this.status,
    required this.workspace,
  });

  factory QueryLoggingConfigurationMetadata.fromJson(
      Map<String, dynamic> json) {
    return QueryLoggingConfigurationMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      destinations: ((json['destinations'] as List?) ?? const [])
          .nonNulls
          .map((e) => LoggingDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      status: QueryLoggingConfigurationStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      workspace: (json['workspace'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final destinations = this.destinations;
    final modifiedAt = this.modifiedAt;
    final status = this.status;
    final workspace = this.workspace;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'destinations': destinations,
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'status': status,
      'workspace': workspace,
    };
  }
}

/// The status of the logging configuration.
///
/// @nodoc
class LoggingConfigurationStatus {
  /// The current status of the current rules and alerting logging configuration.
  /// <note>
  /// These logging configurations are only for rules and alerting logs.
  /// </note>
  final LoggingConfigurationStatusCode statusCode;

  /// If failed, the reason for the failure.
  final String? statusReason;

  LoggingConfigurationStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory LoggingConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return LoggingConfigurationStatus(
      statusCode: LoggingConfigurationStatusCode.fromString(
          (json['statusCode'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of a logging configuration.
///
/// @nodoc
class LoggingConfigurationStatusCode {
  static const creating = LoggingConfigurationStatusCode._('CREATING');
  static const active = LoggingConfigurationStatusCode._('ACTIVE');
  static const updating = LoggingConfigurationStatusCode._('UPDATING');
  static const deleting = LoggingConfigurationStatusCode._('DELETING');
  static const creationFailed =
      LoggingConfigurationStatusCode._('CREATION_FAILED');
  static const updateFailed = LoggingConfigurationStatusCode._('UPDATE_FAILED');

  final String value;

  const LoggingConfigurationStatusCode._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    creationFailed,
    updateFailed
  ];

  static LoggingConfigurationStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LoggingConfigurationStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is LoggingConfigurationStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the current rules and alerting logging
/// configuration for the workspace.
/// <note>
/// These logging configurations are only for rules and alerting logs.
/// </note>
///
/// @nodoc
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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      logGroupArn: (json['logGroupArn'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      status: LoggingConfigurationStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      workspace: (json['workspace'] as String?) ?? '',
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

/// Summary information about an anomaly detector for list operations.
///
/// @nodoc
class AnomalyDetectorSummary {
  /// The user-friendly name of the anomaly detector.
  final String alias;

  /// The unique identifier of the anomaly detector.
  final String anomalyDetectorId;

  /// The Amazon Resource Name (ARN) of the anomaly detector.
  final String arn;

  /// The timestamp when the anomaly detector was created.
  final DateTime createdAt;

  /// The timestamp when the anomaly detector was last modified.
  final DateTime modifiedAt;

  /// The current status of the anomaly detector.
  final AnomalyDetectorStatus status;

  /// The tags applied to the anomaly detector.
  final Map<String, String>? tags;

  AnomalyDetectorSummary({
    required this.alias,
    required this.anomalyDetectorId,
    required this.arn,
    required this.createdAt,
    required this.modifiedAt,
    required this.status,
    this.tags,
  });

  factory AnomalyDetectorSummary.fromJson(Map<String, dynamic> json) {
    return AnomalyDetectorSummary(
      alias: (json['alias'] as String?) ?? '',
      anomalyDetectorId: (json['anomalyDetectorId'] as String?) ?? '',
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      status: AnomalyDetectorStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final anomalyDetectorId = this.anomalyDetectorId;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final status = this.status;
    final tags = this.tags;
    return {
      'alias': alias,
      'anomalyDetectorId': anomalyDetectorId,
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The status information of an anomaly detector.
///
/// @nodoc
class AnomalyDetectorStatus {
  /// The status code of the anomaly detector.
  final AnomalyDetectorStatusCode statusCode;

  /// A description of the current status of the anomaly detector.
  final String? statusReason;

  AnomalyDetectorStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory AnomalyDetectorStatus.fromJson(Map<String, dynamic> json) {
    return AnomalyDetectorStatus(
      statusCode: AnomalyDetectorStatusCode.fromString(
          (json['statusCode'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// @nodoc
class AnomalyDetectorStatusCode {
  static const creating = AnomalyDetectorStatusCode._('CREATING');
  static const active = AnomalyDetectorStatusCode._('ACTIVE');
  static const updating = AnomalyDetectorStatusCode._('UPDATING');
  static const deleting = AnomalyDetectorStatusCode._('DELETING');
  static const creationFailed = AnomalyDetectorStatusCode._('CREATION_FAILED');
  static const updateFailed = AnomalyDetectorStatusCode._('UPDATE_FAILED');
  static const deletionFailed = AnomalyDetectorStatusCode._('DELETION_FAILED');

  final String value;

  const AnomalyDetectorStatusCode._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    creationFailed,
    updateFailed,
    deletionFailed
  ];

  static AnomalyDetectorStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnomalyDetectorStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is AnomalyDetectorStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about an anomaly detector.
///
/// @nodoc
class AnomalyDetectorDescription {
  /// The user-friendly name of the anomaly detector.
  final String alias;

  /// The unique identifier of the anomaly detector.
  final String anomalyDetectorId;

  /// The Amazon Resource Name (ARN) of the anomaly detector.
  final String arn;

  /// The timestamp when the anomaly detector was created.
  final DateTime createdAt;

  /// The timestamp when the anomaly detector was last modified.
  final DateTime modifiedAt;

  /// The current status of the anomaly detector.
  final AnomalyDetectorStatus status;

  /// The algorithm configuration of the anomaly detector.
  final AnomalyDetectorConfiguration? configuration;

  /// The frequency, in seconds, at which the anomaly detector evaluates metrics.
  final int? evaluationIntervalInSeconds;

  /// The Amazon Managed Service for Prometheus metric labels associated with the
  /// anomaly detector.
  final Map<String, String>? labels;

  /// The action taken when data is missing during evaluation.
  final AnomalyDetectorMissingDataAction? missingDataAction;

  /// The tags applied to the anomaly detector.
  final Map<String, String>? tags;

  AnomalyDetectorDescription({
    required this.alias,
    required this.anomalyDetectorId,
    required this.arn,
    required this.createdAt,
    required this.modifiedAt,
    required this.status,
    this.configuration,
    this.evaluationIntervalInSeconds,
    this.labels,
    this.missingDataAction,
    this.tags,
  });

  factory AnomalyDetectorDescription.fromJson(Map<String, dynamic> json) {
    return AnomalyDetectorDescription(
      alias: (json['alias'] as String?) ?? '',
      anomalyDetectorId: (json['anomalyDetectorId'] as String?) ?? '',
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      status: AnomalyDetectorStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      configuration: json['configuration'] != null
          ? AnomalyDetectorConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      evaluationIntervalInSeconds: json['evaluationIntervalInSeconds'] as int?,
      labels: (json['labels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      missingDataAction: json['missingDataAction'] != null
          ? AnomalyDetectorMissingDataAction.fromJson(
              json['missingDataAction'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final anomalyDetectorId = this.anomalyDetectorId;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final status = this.status;
    final configuration = this.configuration;
    final evaluationIntervalInSeconds = this.evaluationIntervalInSeconds;
    final labels = this.labels;
    final missingDataAction = this.missingDataAction;
    final tags = this.tags;
    return {
      'alias': alias,
      'anomalyDetectorId': anomalyDetectorId,
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'status': status,
      if (configuration != null) 'configuration': configuration,
      if (evaluationIntervalInSeconds != null)
        'evaluationIntervalInSeconds': evaluationIntervalInSeconds,
      if (labels != null) 'labels': labels,
      if (missingDataAction != null) 'missingDataAction': missingDataAction,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies the action to take when data is missing during anomaly detection
/// evaluation.
///
/// @nodoc
class AnomalyDetectorMissingDataAction {
  /// Marks missing data points as anomalies.
  final bool? markAsAnomaly;

  /// Skips evaluation when data is missing.
  final bool? skip;

  AnomalyDetectorMissingDataAction({
    this.markAsAnomaly,
    this.skip,
  });

  factory AnomalyDetectorMissingDataAction.fromJson(Map<String, dynamic> json) {
    return AnomalyDetectorMissingDataAction(
      markAsAnomaly: json['markAsAnomaly'] as bool?,
      skip: json['skip'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final markAsAnomaly = this.markAsAnomaly;
    final skip = this.skip;
    return {
      if (markAsAnomaly != null) 'markAsAnomaly': markAsAnomaly,
      if (skip != null) 'skip': skip,
    };
  }
}

/// The configuration for the anomaly detection algorithm.
///
/// @nodoc
class AnomalyDetectorConfiguration {
  /// The Random Cut Forest algorithm configuration for anomaly detection.
  final RandomCutForestConfiguration? randomCutForest;

  AnomalyDetectorConfiguration({
    this.randomCutForest,
  });

  factory AnomalyDetectorConfiguration.fromJson(Map<String, dynamic> json) {
    return AnomalyDetectorConfiguration(
      randomCutForest: json['randomCutForest'] != null
          ? RandomCutForestConfiguration.fromJson(
              json['randomCutForest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final randomCutForest = this.randomCutForest;
    return {
      if (randomCutForest != null) 'randomCutForest': randomCutForest,
    };
  }
}

/// Configuration for the Random Cut Forest algorithm used for anomaly detection
/// in time-series data.
///
/// @nodoc
class RandomCutForestConfiguration {
  /// The Prometheus query used to retrieve the time-series data for anomaly
  /// detection.
  /// <important>
  /// Random Cut Forest queries must be wrapped by a supported PromQL aggregation
  /// operator. For more information, see <a
  /// href="https://prometheus.io/docs/prometheus/latest/querying/operators/#aggregation-operators">Aggregation
  /// operators</a> on the <i>Prometheus docs</i> website.
  ///
  /// <b>Supported PromQL aggregation operators</b>: <code>avg</code>,
  /// <code>count</code>, <code>group</code>, <code>max</code>, <code>min</code>,
  /// <code>quantile</code>, <code>stddev</code>, <code>stdvar</code>, and
  /// <code>sum</code>.
  /// </important>
  final String query;

  /// Configuration for ignoring values that are near expected values from above
  /// during anomaly detection.
  final IgnoreNearExpected? ignoreNearExpectedFromAbove;

  /// Configuration for ignoring values that are near expected values from below
  /// during anomaly detection.
  final IgnoreNearExpected? ignoreNearExpectedFromBelow;

  /// The number of data points sampled from the input stream for the Random Cut
  /// Forest algorithm. The default number is 256 consecutive data points.
  final int? sampleSize;

  /// The number of consecutive data points used to create a shingle for the
  /// Random Cut Forest algorithm. The default number is 8 consecutive data
  /// points.
  final int? shingleSize;

  RandomCutForestConfiguration({
    required this.query,
    this.ignoreNearExpectedFromAbove,
    this.ignoreNearExpectedFromBelow,
    this.sampleSize,
    this.shingleSize,
  });

  factory RandomCutForestConfiguration.fromJson(Map<String, dynamic> json) {
    return RandomCutForestConfiguration(
      query: (json['query'] as String?) ?? '',
      ignoreNearExpectedFromAbove: json['ignoreNearExpectedFromAbove'] != null
          ? IgnoreNearExpected.fromJson(
              json['ignoreNearExpectedFromAbove'] as Map<String, dynamic>)
          : null,
      ignoreNearExpectedFromBelow: json['ignoreNearExpectedFromBelow'] != null
          ? IgnoreNearExpected.fromJson(
              json['ignoreNearExpectedFromBelow'] as Map<String, dynamic>)
          : null,
      sampleSize: json['sampleSize'] as int?,
      shingleSize: json['shingleSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final query = this.query;
    final ignoreNearExpectedFromAbove = this.ignoreNearExpectedFromAbove;
    final ignoreNearExpectedFromBelow = this.ignoreNearExpectedFromBelow;
    final sampleSize = this.sampleSize;
    final shingleSize = this.shingleSize;
    return {
      'query': query,
      if (ignoreNearExpectedFromAbove != null)
        'ignoreNearExpectedFromAbove': ignoreNearExpectedFromAbove,
      if (ignoreNearExpectedFromBelow != null)
        'ignoreNearExpectedFromBelow': ignoreNearExpectedFromBelow,
      if (sampleSize != null) 'sampleSize': sampleSize,
      if (shingleSize != null) 'shingleSize': shingleSize,
    };
  }
}

/// Configuration for threshold settings that determine when values near
/// expected values should be ignored during anomaly detection.
///
/// @nodoc
class IgnoreNearExpected {
  /// The absolute amount by which values can differ from expected values before
  /// being considered anomalous.
  final double? amount;

  /// The ratio by which values can differ from expected values before being
  /// considered anomalous.
  final double? ratio;

  IgnoreNearExpected({
    this.amount,
    this.ratio,
  });

  factory IgnoreNearExpected.fromJson(Map<String, dynamic> json) {
    return IgnoreNearExpected(
      amount: json['amount'] as double?,
      ratio: json['ratio'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final ratio = this.ratio;
    return {
      if (amount != null) 'amount': amount,
      if (ratio != null) 'ratio': ratio,
    };
  }
}

/// The status of the alert manager.
///
/// @nodoc
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
      statusCode: AlertManagerDefinitionStatusCode.fromString(
          (json['statusCode'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of an <code>AlertManagerDefinition</code>.
///
/// @nodoc
class AlertManagerDefinitionStatusCode {
  static const creating = AlertManagerDefinitionStatusCode._('CREATING');
  static const active = AlertManagerDefinitionStatusCode._('ACTIVE');
  static const updating = AlertManagerDefinitionStatusCode._('UPDATING');
  static const deleting = AlertManagerDefinitionStatusCode._('DELETING');
  static const creationFailed =
      AlertManagerDefinitionStatusCode._('CREATION_FAILED');
  static const updateFailed =
      AlertManagerDefinitionStatusCode._('UPDATE_FAILED');

  final String value;

  const AlertManagerDefinitionStatusCode._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    creationFailed,
    updateFailed
  ];

  static AlertManagerDefinitionStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AlertManagerDefinitionStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is AlertManagerDefinitionStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of an alert manager definition. It is the configuration for the
/// alert manager, including information about receivers for routing alerts.
///
/// @nodoc
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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      data: _s.decodeUint8List((json['data'] as String?) ?? ''),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      status: AlertManagerDefinitionStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// The information about one Amazon Managed Service for Prometheus workspace in
/// your account.
///
/// @nodoc
class WorkspaceSummary {
  /// The ARN of the workspace.
  final String arn;

  /// The date and time that the workspace was created.
  final DateTime createdAt;

  /// The current status of the workspace.
  final WorkspaceStatus status;

  /// The unique ID for the workspace.
  final String workspaceId;

  /// The alias that is assigned to this workspace to help identify it. It does
  /// not need to be unique.
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      status: WorkspaceStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      workspaceId: (json['workspaceId'] as String?) ?? '',
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

/// The status of the workspace.
///
/// @nodoc
class WorkspaceStatus {
  /// The current status of the workspace.
  final WorkspaceStatusCode statusCode;

  WorkspaceStatus({
    required this.statusCode,
  });

  factory WorkspaceStatus.fromJson(Map<String, dynamic> json) {
    return WorkspaceStatus(
      statusCode:
          WorkspaceStatusCode.fromString((json['statusCode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      'statusCode': statusCode.value,
    };
  }
}

/// State of a workspace.
///
/// @nodoc
class WorkspaceStatusCode {
  static const creating = WorkspaceStatusCode._('CREATING');
  static const active = WorkspaceStatusCode._('ACTIVE');
  static const updating = WorkspaceStatusCode._('UPDATING');
  static const deleting = WorkspaceStatusCode._('DELETING');
  static const creationFailed = WorkspaceStatusCode._('CREATION_FAILED');

  final String value;

  const WorkspaceStatusCode._(this.value);

  static const values = [creating, active, updating, deleting, creationFailed];

  static WorkspaceStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkspaceStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is WorkspaceStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The full details about one Amazon Managed Service for Prometheus workspace
/// in your account.
///
/// @nodoc
class WorkspaceDescription {
  /// The ARN of the workspace. For example,
  /// <code>arn:aws:aps:&lt;region&gt;:123456789012:workspace/ws-example1-1234-abcd-5678-ef90abcd1234</code>.
  final String arn;

  /// The date and time that the workspace was created.
  final DateTime createdAt;

  /// The current status of the workspace.
  final WorkspaceStatus status;

  /// The unique ID for the workspace. For example,
  /// <code>ws-example1-1234-abcd-5678-ef90abcd1234</code>.
  final String workspaceId;

  /// The alias that is assigned to this workspace to help identify it. It does
  /// not need to be unique.
  final String? alias;

  /// (optional) If the workspace was created with a customer managed KMS key, the
  /// ARN for the key used.
  final String? kmsKeyArn;

  /// The Prometheus endpoint available for this workspace. For example,
  /// <code>https://aps-workspaces.&lt;region&gt;.amazonaws.com/workspaces/ws-example1-1234-abcd-5678-ef90abcd1234/api/v1/</code>.
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      status: WorkspaceStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      workspaceId: (json['workspaceId'] as String?) ?? '',
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

/// The status of a scraper logging configuration.
///
/// @nodoc
class ScraperLoggingConfigurationStatus {
  /// The status code of the scraper logging configuration.
  final ScraperLoggingConfigurationStatusCode statusCode;

  /// The reason for the current status of the scraper logging configuration.
  final String? statusReason;

  ScraperLoggingConfigurationStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory ScraperLoggingConfigurationStatus.fromJson(
      Map<String, dynamic> json) {
    return ScraperLoggingConfigurationStatus(
      statusCode: ScraperLoggingConfigurationStatusCode.fromString(
          (json['statusCode'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// The destination where scraper logs are sent.
///
/// @nodoc
class ScraperLoggingDestination {
  /// The CloudWatch Logs configuration for the scraper logging destination.
  final CloudWatchLogDestination? cloudWatchLogs;

  ScraperLoggingDestination({
    this.cloudWatchLogs,
  });

  factory ScraperLoggingDestination.fromJson(Map<String, dynamic> json) {
    return ScraperLoggingDestination(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogDestination.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
    };
  }
}

/// A component of a Amazon Managed Service for Prometheus scraper that can be
/// configured for logging.
///
/// @nodoc
class ScraperComponent {
  /// The type of the scraper component.
  final ScraperComponentType type;

  /// The configuration settings for the scraper component.
  final ComponentConfig? config;

  ScraperComponent({
    required this.type,
    this.config,
  });

  factory ScraperComponent.fromJson(Map<String, dynamic> json) {
    return ScraperComponent(
      type: ScraperComponentType.fromString((json['type'] as String?) ?? ''),
      config: json['config'] != null
          ? ComponentConfig.fromJson(json['config'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final config = this.config;
    return {
      'type': type.value,
      if (config != null) 'config': config,
    };
  }
}

/// @nodoc
class ScraperComponentType {
  static const serviceDiscovery = ScraperComponentType._('SERVICE_DISCOVERY');
  static const collector = ScraperComponentType._('COLLECTOR');
  static const exporter = ScraperComponentType._('EXPORTER');

  final String value;

  const ScraperComponentType._(this.value);

  static const values = [serviceDiscovery, collector, exporter];

  static ScraperComponentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScraperComponentType._(value));

  @override
  bool operator ==(other) =>
      other is ScraperComponentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings for a scraper component.
///
/// @nodoc
class ComponentConfig {
  /// Configuration options for the scraper component.
  final Map<String, String>? options;

  ComponentConfig({
    this.options,
  });

  factory ComponentConfig.fromJson(Map<String, dynamic> json) {
    return ComponentConfig(
      options: (json['options'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    return {
      if (options != null) 'options': options,
    };
  }
}

/// @nodoc
class ScraperLoggingConfigurationStatusCode {
  static const creating = ScraperLoggingConfigurationStatusCode._('CREATING');
  static const active = ScraperLoggingConfigurationStatusCode._('ACTIVE');
  static const updating = ScraperLoggingConfigurationStatusCode._('UPDATING');
  static const deleting = ScraperLoggingConfigurationStatusCode._('DELETING');
  static const creationFailed =
      ScraperLoggingConfigurationStatusCode._('CREATION_FAILED');
  static const updateFailed =
      ScraperLoggingConfigurationStatusCode._('UPDATE_FAILED');

  final String value;

  const ScraperLoggingConfigurationStatusCode._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    creationFailed,
    updateFailed
  ];

  static ScraperLoggingConfigurationStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScraperLoggingConfigurationStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is ScraperLoggingConfigurationStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The <code>ScraperSummary</code> structure contains a summary of the details
/// about one scraper in your account.
///
/// @nodoc
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

  /// This structure displays information about the IAM roles used for
  /// cross-account scraping configuration.
  final RoleConfiguration? roleConfiguration;

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
    this.roleConfiguration,
    this.statusReason,
    this.tags,
  });

  factory ScraperSummary.fromJson(Map<String, dynamic> json) {
    return ScraperSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      destination: Destination.fromJson(
          (json['destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastModifiedAt: nonNullableTimeStampFromJson(json['lastModifiedAt'] ?? 0),
      roleArn: (json['roleArn'] as String?) ?? '',
      scraperId: (json['scraperId'] as String?) ?? '',
      source: Source.fromJson((json['source'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      status: ScraperStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      alias: json['alias'] as String?,
      roleConfiguration: json['roleConfiguration'] != null
          ? RoleConfiguration.fromJson(
              json['roleConfiguration'] as Map<String, dynamic>)
          : null,
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
    final roleConfiguration = this.roleConfiguration;
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
      if (roleConfiguration != null) 'roleConfiguration': roleConfiguration,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The <code>ScraperStatus</code> structure contains status information about
/// the scraper.
///
/// @nodoc
class ScraperStatus {
  /// The current status of the scraper.
  final ScraperStatusCode statusCode;

  ScraperStatus({
    required this.statusCode,
  });

  factory ScraperStatus.fromJson(Map<String, dynamic> json) {
    return ScraperStatus(
      statusCode:
          ScraperStatusCode.fromString((json['statusCode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      'statusCode': statusCode.value,
    };
  }
}

/// The source of collected metrics for a scraper.
///
/// @nodoc
class Source {
  /// The Amazon EKS cluster from which a scraper collects metrics.
  final EksConfiguration? eksConfiguration;

  /// The Amazon VPC configuration for the Prometheus collector when connecting to
  /// Amazon MSK clusters. This configuration enables secure, private network
  /// connectivity between the collector and your Amazon MSK cluster within your
  /// Amazon VPC.
  final VpcConfiguration? vpcConfiguration;

  Source({
    this.eksConfiguration,
    this.vpcConfiguration,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      eksConfiguration: json['eksConfiguration'] != null
          ? EksConfiguration.fromJson(
              json['eksConfiguration'] as Map<String, dynamic>)
          : null,
      vpcConfiguration: json['vpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['vpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eksConfiguration = this.eksConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (eksConfiguration != null) 'eksConfiguration': eksConfiguration,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
  }
}

/// Where to send the metrics from a scraper.
///
/// @nodoc
class Destination {
  /// The Amazon Managed Service for Prometheus workspace to send metrics to.
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

/// Use this structure to enable cross-account access, so that you can use a
/// target account to access Prometheus metrics from source accounts.
///
/// @nodoc
class RoleConfiguration {
  /// The Amazon Resource Name (ARN) of the role used in the source account to
  /// enable cross-account scraping. For information about the contents of this
  /// policy, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html#cross-account-remote-write">Cross-account
  /// setup</a>.
  final String? sourceRoleArn;

  /// The Amazon Resource Name (ARN) of the role used in the target account to
  /// enable cross-account scraping. For information about the contents of this
  /// policy, see <a
  /// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html#cross-account-remote-write">Cross-account
  /// setup</a>.
  final String? targetRoleArn;

  RoleConfiguration({
    this.sourceRoleArn,
    this.targetRoleArn,
  });

  factory RoleConfiguration.fromJson(Map<String, dynamic> json) {
    return RoleConfiguration(
      sourceRoleArn: json['sourceRoleArn'] as String?,
      targetRoleArn: json['targetRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceRoleArn = this.sourceRoleArn;
    final targetRoleArn = this.targetRoleArn;
    return {
      if (sourceRoleArn != null) 'sourceRoleArn': sourceRoleArn,
      if (targetRoleArn != null) 'targetRoleArn': targetRoleArn,
    };
  }
}

/// The <code>AmpConfiguration</code> structure defines the Amazon Managed
/// Service for Prometheus instance a scraper should send metrics to.
///
/// @nodoc
class AmpConfiguration {
  /// ARN of the Amazon Managed Service for Prometheus workspace.
  final String workspaceArn;

  AmpConfiguration({
    required this.workspaceArn,
  });

  factory AmpConfiguration.fromJson(Map<String, dynamic> json) {
    return AmpConfiguration(
      workspaceArn: (json['workspaceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final workspaceArn = this.workspaceArn;
    return {
      'workspaceArn': workspaceArn,
    };
  }
}

/// The <code>EksConfiguration</code> structure describes the connection to the
/// Amazon EKS cluster from which a scraper collects metrics.
///
/// @nodoc
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
      clusterArn: (json['clusterArn'] as String?) ?? '',
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
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

/// The Amazon VPC configuration that specifies the network settings for a
/// Prometheus collector to securely connect to Amazon MSK clusters. This
/// configuration includes the security groups and subnets that control network
/// access and placement for the collector.
///
/// @nodoc
class VpcConfiguration {
  /// The security group IDs that control network access for the Prometheus
  /// collector. These security groups must allow the collector to communicate
  /// with your Amazon MSK cluster on the required ports.
  final List<String> securityGroupIds;

  /// The subnet IDs where the Prometheus collector will be deployed. The subnets
  /// must be in the same Amazon VPC as your Amazon MSK cluster and have network
  /// connectivity to the cluster.
  final List<String> subnetIds;

  VpcConfiguration({
    required this.securityGroupIds,
    required this.subnetIds,
  });

  factory VpcConfiguration.fromJson(Map<String, dynamic> json) {
    return VpcConfiguration(
      securityGroupIds: ((json['securityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
    };
  }
}

/// State of a scraper.
///
/// @nodoc
class ScraperStatusCode {
  static const creating = ScraperStatusCode._('CREATING');
  static const updating = ScraperStatusCode._('UPDATING');
  static const active = ScraperStatusCode._('ACTIVE');
  static const deleting = ScraperStatusCode._('DELETING');
  static const creationFailed = ScraperStatusCode._('CREATION_FAILED');
  static const updateFailed = ScraperStatusCode._('UPDATE_FAILED');
  static const deletionFailed = ScraperStatusCode._('DELETION_FAILED');

  final String value;

  const ScraperStatusCode._(this.value);

  static const values = [
    creating,
    updating,
    active,
    deleting,
    creationFailed,
    updateFailed,
    deletionFailed
  ];

  static ScraperStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScraperStatusCode._(value));

  @override
  bool operator ==(other) => other is ScraperStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A scrape configuration for a scraper, base 64 encoded. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html#AMP-collector-configuration">Scraper
/// configuration</a> in the <i>Amazon Managed Service for Prometheus User
/// Guide</i>.
///
/// @nodoc
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
///
/// @nodoc
class ScraperDescription {
  /// The Amazon Resource Name (ARN) of the scraper. For example,
  /// <code>arn:aws:aps:&lt;region&gt;:123456798012:scraper/s-example1-1234-abcd-5678-ef9012abcd34</code>.
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
  ///
  /// For example,
  /// <code>arn:aws:iam::123456789012:role/service-role/AmazonGrafanaServiceRole-12example</code>.
  final String roleArn;

  /// The configuration in use by the scraper.
  final ScrapeConfiguration scrapeConfiguration;

  /// The ID of the scraper. For example,
  /// <code>s-example1-1234-abcd-5678-ef9012abcd34</code>.
  final String scraperId;

  /// The Amazon EKS cluster from which the scraper collects metrics.
  final Source source;

  /// A structure that contains the current status of the scraper.
  final ScraperStatus status;

  /// (Optional) A name associated with the scraper.
  final String? alias;

  /// This structure displays information about the IAM roles used for
  /// cross-account scraping configuration.
  final RoleConfiguration? roleConfiguration;

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
    this.roleConfiguration,
    this.statusReason,
    this.tags,
  });

  factory ScraperDescription.fromJson(Map<String, dynamic> json) {
    return ScraperDescription(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      destination: Destination.fromJson(
          (json['destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastModifiedAt: nonNullableTimeStampFromJson(json['lastModifiedAt'] ?? 0),
      roleArn: (json['roleArn'] as String?) ?? '',
      scrapeConfiguration: ScrapeConfiguration.fromJson(
          (json['scrapeConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      scraperId: (json['scraperId'] as String?) ?? '',
      source: Source.fromJson((json['source'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      status: ScraperStatus.fromJson(
          (json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      alias: json['alias'] as String?,
      roleConfiguration: json['roleConfiguration'] != null
          ? RoleConfiguration.fromJson(
              json['roleConfiguration'] as Map<String, dynamic>)
          : null,
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
    final roleConfiguration = this.roleConfiguration;
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
      if (roleConfiguration != null) 'roleConfiguration': roleConfiguration,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
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
