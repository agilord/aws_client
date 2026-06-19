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

/// AWS Supply Chain is a cloud-based application that works with your
/// enterprise resource planning (ERP) and supply chain management systems.
/// Using AWS Supply Chain, you can connect and extract your inventory, supply,
/// and demand related data from existing ERP or supply chain systems into a
/// single data model.
///
/// The AWS Supply Chain API supports configuration data import for Supply
/// Planning.
///
/// All AWS Supply chain API operations are Amazon-authenticated and
/// certificate-signed. They not only require the use of the AWS SDK, but also
/// allow for the exclusive use of AWS Identity and Access Management users and
/// roles to help facilitate access, trust, and permission policies.
class SupplyChain {
  final _s.RestJsonProtocol _protocol;
  SupplyChain({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'scn',
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

  /// Enables you to programmatically view an Amazon Web Services Supply Chain
  /// Data Integration Event. Developers can view the eventType, eventGroupId,
  /// eventTimestamp, datasetTarget, datasetLoadExecution.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventId] :
  /// The unique event identifier.
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  Future<GetDataIntegrationEventResponse> getDataIntegrationEvent({
    required String eventId,
    required String instanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api-data/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-events/${Uri.encodeComponent(eventId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataIntegrationEventResponse.fromJson(response);
  }

  /// Get the flow execution.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionId] :
  /// The flow execution identifier.
  ///
  /// Parameter [flowName] :
  /// The flow name.
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  Future<GetDataIntegrationFlowExecutionResponse>
      getDataIntegrationFlowExecution({
    required String executionId,
    required String flowName,
    required String instanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api-data/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-flows/${Uri.encodeComponent(flowName)}/executions/${Uri.encodeComponent(executionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataIntegrationFlowExecutionResponse.fromJson(response);
  }

  /// Enables you to programmatically list all data integration events for the
  /// provided Amazon Web Services Supply Chain instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [eventType] :
  /// List data integration events for the specified eventType.
  ///
  /// Parameter [maxResults] :
  /// Specify the maximum number of data integration events to fetch in one
  /// paginated request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to fetch the next page of the data integration
  /// events.
  Future<ListDataIntegrationEventsResponse> listDataIntegrationEvents({
    required String instanceId,
    DataIntegrationEventType? eventType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (eventType != null) 'eventType': [eventType.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api-data/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataIntegrationEventsResponse.fromJson(response);
  }

  /// List flow executions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [flowName] :
  /// The flow name.
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [maxResults] :
  /// The number to specify the max number of flow executions to fetch in this
  /// paginated request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to fetch next page of flow executions.
  Future<ListDataIntegrationFlowExecutionsResponse>
      listDataIntegrationFlowExecutions({
    required String flowName,
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api-data/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-flows/${Uri.encodeComponent(flowName)}/executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataIntegrationFlowExecutionsResponse.fromJson(response);
  }

  /// List all the tags for an Amazon Web ServicesSupply Chain resource. You can
  /// list all the tags added to a resource. By listing the tags, developers can
  /// view the tag level information on a resource and perform actions such as,
  /// deleting a resource associated with a particular tag.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Web Services Supply chain resource ARN that needs tags to be
  /// listed.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Send the data payload for the event with real-time data for analysis or
  /// monitoring. The real-time data events are stored in an Amazon Web Services
  /// service before being processed and stored in data lake.
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
  /// The data payload of the event, should follow the data schema of the target
  /// dataset, or see <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">Data
  /// entities supported in AWS Supply Chain</a>. To send single data record,
  /// use JsonObject format; to send multiple data records, use JsonArray
  /// format.
  ///
  /// Note that for AWS Supply Chain dataset under <b>asc</b> namespace, it has
  /// a connection_id internal field that is not allowed to be provided by
  /// client directly, they will be auto populated.
  ///
  /// Parameter [eventGroupId] :
  /// Event identifier (for example, orderId for InboundOrder) used for data
  /// sharding or partitioning. Noted under one eventGroupId of same eventType
  /// and instanceId, events are processed sequentially in the order they are
  /// received by the server.
  ///
  /// Parameter [eventType] :
  /// The data event type.
  ///
  /// <ul>
  /// <li>
  /// <b>scn.data.dataset</b> - Send data directly to any specified dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.supplyplan</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/supply-plan-entity.html">supply_plan</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.shipmentstoporder</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/replenishment-shipment-stop-order-entity.html">shipment_stop_order</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.shipmentstop</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/replenishment-shipment-stop-entity.html">shipment_stop</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.shipment</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/replenishment-shipment-entity.html">shipment</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.reservation</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/planning-reservation-entity.html">reservation</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.processproduct</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/operation-process-product-entity.html">process_product</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.processoperation</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/operation-process-operation-entity.html">process_operation</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.processheader</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/operation-process-header-entity.html">process_header</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.forecast</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/forecast-forecast-entity.html">forecast</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.inventorylevel</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/inventory_mgmnt-inv-level-entity.html">inv_level</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.inboundorder</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/replenishment-inbound-order-entity.html">inbound_order</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.inboundorderline</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/replenishment-inbound-order-line-entity.html">inbound_order_line</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.inboundorderlineschedule</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/replenishment-inbound-order-line-schedule-entity.html">inbound_order_line_schedule</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.outboundorderline</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/outbound-fulfillment-order-line-entity.html">outbound_order_line</a>
  /// dataset.
  /// </li>
  /// <li>
  /// <b>scn.data.outboundshipment</b> - Send data to <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/outbound-fulfillment-shipment-entity.html">outbound_shipment</a>
  /// dataset.
  /// </li>
  /// </ul>
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [clientToken] :
  /// The idempotent client token. The token is active for 8 hours, and within
  /// its lifetime, it ensures the request completes only once upon retry with
  /// same client token. If omitted, the AWS SDK generates a unique value so
  /// that AWS SDK can safely retry the request upon network errors.
  ///
  /// Parameter [datasetTarget] :
  /// The target dataset configuration for <b>scn.data.dataset</b> event type.
  ///
  /// Parameter [eventTimestamp] :
  /// The timestamp (in epoch seconds) associated with the event. If not
  /// provided, it will be assigned with current timestamp.
  Future<SendDataIntegrationEventResponse> sendDataIntegrationEvent({
    required String data,
    required String eventGroupId,
    required DataIntegrationEventType eventType,
    required String instanceId,
    String? clientToken,
    DataIntegrationEventDatasetTargetConfiguration? datasetTarget,
    DateTime? eventTimestamp,
  }) async {
    final $payload = <String, dynamic>{
      'data': data,
      'eventGroupId': eventGroupId,
      'eventType': eventType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (datasetTarget != null) 'datasetTarget': datasetTarget,
      if (eventTimestamp != null)
        'eventTimestamp': unixTimestampToJson(eventTimestamp),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/api-data/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-events',
      exceptionFnMap: _exceptionFns,
    );
    return SendDataIntegrationEventResponse.fromJson(response);
  }

  /// You can create tags during or after creating a resource such as instance,
  /// data flow, or dataset in AWS Supply chain. During the data ingestion
  /// process, you can add tags such as dev, test, or prod to data flows created
  /// during the data ingestion process in the AWS Supply Chain datasets. You
  /// can use these tags to identify a group of resources or a single resource
  /// used by the developer.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Web Services Supply chain resource ARN that needs to be tagged.
  ///
  /// Parameter [tags] :
  /// The tags of the Amazon Web Services Supply chain resource to be created.
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
      requestUri: '/api/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// You can delete tags for an Amazon Web Services Supply chain resource such
  /// as instance, data flow, or dataset in AWS Supply Chain. During the data
  /// ingestion process, you can delete tags such as dev, test, or prod to data
  /// flows created during the data ingestion process in the AWS Supply Chain
  /// datasets.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Web Services Supply chain resource ARN that needs to be
  /// untagged.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to be deleted for an Amazon Web Services Supply Chain
  /// resource.
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
      requestUri: '/api/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// CreateBillOfMaterialsImportJob creates an import job for the Product Bill
  /// Of Materials (BOM) entity. For information on the product_bom entity, see
  /// the AWS Supply Chain User Guide.
  ///
  /// The CSV file must be located in an Amazon S3 location accessible to AWS
  /// Supply Chain. It is recommended to use the same Amazon S3 bucket created
  /// during your AWS Supply Chain instance creation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [s3uri] :
  /// The S3 URI of the CSV file to be imported. The bucket must grant
  /// permissions for AWS Supply Chain to read the file.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token ensures the API request is only completed no more
  /// than once. This way, retrying the request will not trigger the operation
  /// multiple times. A client token is a unique, case-sensitive string of 33 to
  /// 128 ASCII characters. To make an idempotent API request, specify a client
  /// token in the request. You should not reuse the same client token for other
  /// requests. If you retry a successful request with the same client token,
  /// the request will succeed with no further actions being taken, and you will
  /// receive the same API response as the original successful request.
  Future<CreateBillOfMaterialsImportJobResponse>
      createBillOfMaterialsImportJob({
    required String instanceId,
    required String s3uri,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      's3uri': s3uri,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/api/configuration/instances/${Uri.encodeComponent(instanceId)}/bill-of-materials-import-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBillOfMaterialsImportJobResponse.fromJson(response);
  }

  /// Get status and details of a BillOfMaterialsImportJob.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [jobId] :
  /// The BillOfMaterialsImportJob identifier.
  Future<GetBillOfMaterialsImportJobResponse> getBillOfMaterialsImportJob({
    required String instanceId,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/configuration/instances/${Uri.encodeComponent(instanceId)}/bill-of-materials-import-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBillOfMaterialsImportJobResponse.fromJson(response);
  }

  /// Enables you to programmatically create a data pipeline to ingest data from
  /// source systems such as Amazon S3 buckets, to a predefined Amazon Web
  /// Services Supply Chain dataset (product, inbound_order) or a temporary
  /// dataset along with the data transformation query provided with the API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// Name of the DataIntegrationFlow.
  ///
  /// Parameter [sources] :
  /// The source configurations for DataIntegrationFlow.
  ///
  /// Parameter [target] :
  /// The target configurations for DataIntegrationFlow.
  ///
  /// Parameter [transformation] :
  /// The transformation configurations for DataIntegrationFlow.
  ///
  /// Parameter [tags] :
  /// The tags of the DataIntegrationFlow to be created
  Future<CreateDataIntegrationFlowResponse> createDataIntegrationFlow({
    required String instanceId,
    required String name,
    required List<DataIntegrationFlowSource> sources,
    required DataIntegrationFlowTarget target,
    required DataIntegrationFlowTransformation transformation,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sources': sources,
      'target': target,
      'transformation': transformation,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/api/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-flows/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataIntegrationFlowResponse.fromJson(response);
  }

  /// Enables you to programmatically view a specific data pipeline for the
  /// provided Amazon Web Services Supply Chain instance and DataIntegrationFlow
  /// name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the DataIntegrationFlow created.
  Future<GetDataIntegrationFlowResponse> getDataIntegrationFlow({
    required String instanceId,
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-flows/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataIntegrationFlowResponse.fromJson(response);
  }

  /// Enables you to programmatically update an existing data pipeline to ingest
  /// data from the source systems such as, Amazon S3 buckets, to a predefined
  /// Amazon Web Services Supply Chain dataset (product, inbound_order) or a
  /// temporary dataset along with the data transformation query provided with
  /// the API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the DataIntegrationFlow to be updated.
  ///
  /// Parameter [sources] :
  /// The new source configurations for the DataIntegrationFlow.
  ///
  /// Parameter [target] :
  /// The new target configurations for the DataIntegrationFlow.
  ///
  /// Parameter [transformation] :
  /// The new transformation configurations for the DataIntegrationFlow.
  Future<UpdateDataIntegrationFlowResponse> updateDataIntegrationFlow({
    required String instanceId,
    required String name,
    List<DataIntegrationFlowSource>? sources,
    DataIntegrationFlowTarget? target,
    DataIntegrationFlowTransformation? transformation,
  }) async {
    final $payload = <String, dynamic>{
      if (sources != null) 'sources': sources,
      if (target != null) 'target': target,
      if (transformation != null) 'transformation': transformation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/api/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-flows/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataIntegrationFlowResponse.fromJson(response);
  }

  /// Enable you to programmatically delete an existing data pipeline for the
  /// provided Amazon Web Services Supply Chain instance and DataIntegrationFlow
  /// name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the DataIntegrationFlow to be deleted.
  Future<DeleteDataIntegrationFlowResponse> deleteDataIntegrationFlow({
    required String instanceId,
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-flows/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataIntegrationFlowResponse.fromJson(response);
  }

  /// Enables you to programmatically list all data pipelines for the provided
  /// Amazon Web Services Supply Chain instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [maxResults] :
  /// Specify the maximum number of DataIntegrationFlows to fetch in one
  /// paginated request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to fetch the next page of the DataIntegrationFlows.
  Future<ListDataIntegrationFlowsResponse> listDataIntegrationFlows({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/data-integration/instance/${Uri.encodeComponent(instanceId)}/data-integration-flows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataIntegrationFlowsResponse.fromJson(response);
  }

  /// Enables you to programmatically create an Amazon Web Services Supply Chain
  /// data lake dataset. Developers can create the datasets using their
  /// pre-defined or custom schema for a given instance ID, namespace, and
  /// dataset name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the dataset. For <b>asc</b> name space, the name must be one
  /// of the supported data entities under <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  ///
  /// Parameter [namespace] :
  /// The namespace of the dataset, besides the custom defined namespace, every
  /// instance comes with below pre-defined namespaces:
  ///
  /// <ul>
  /// <li>
  /// <b>asc</b> - For information on the Amazon Web Services Supply Chain
  /// supported datasets see <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  /// </li>
  /// <li>
  /// <b>default</b> - For datasets with custom user-defined schemas.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The description of the dataset.
  ///
  /// Parameter [partitionSpec] :
  /// The partition specification of the dataset. Partitioning can effectively
  /// improve the dataset query performance by reducing the amount of data
  /// scanned during query execution. But partitioning or not will affect how
  /// data get ingested by data ingestion methods, such as
  /// SendDataIntegrationEvent's dataset UPSERT will upsert records within
  /// partition (instead of within whole dataset). For more details, refer to
  /// those data ingestion documentations.
  ///
  /// Parameter [schema] :
  /// The custom schema of the data lake dataset and required for dataset in
  /// <b>default</b> and custom namespaces.
  ///
  /// Parameter [tags] :
  /// The tags of the dataset.
  Future<CreateDataLakeDatasetResponse> createDataLakeDataset({
    required String instanceId,
    required String name,
    required String namespace,
    String? description,
    DataLakeDatasetPartitionSpec? partitionSpec,
    DataLakeDatasetSchema? schema,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (partitionSpec != null) 'partitionSpec': partitionSpec,
      if (schema != null) 'schema': schema,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(namespace)}/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataLakeDatasetResponse.fromJson(response);
  }

  /// Enables you to programmatically view an Amazon Web Services Supply Chain
  /// data lake dataset. Developers can view the data lake dataset information
  /// such as namespace, schema, and so on for a given instance ID, namespace,
  /// and dataset name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the dataset. For <b>asc</b> namespace, the name must be one of
  /// the supported data entities under <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  ///
  /// Parameter [namespace] :
  /// The namespace of the dataset, besides the custom defined namespace, every
  /// instance comes with below pre-defined namespaces:
  ///
  /// <ul>
  /// <li>
  /// <b>asc</b> - For information on the Amazon Web Services Supply Chain
  /// supported datasets see <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  /// </li>
  /// <li>
  /// <b>default</b> - For datasets with custom user-defined schemas.
  /// </li>
  /// </ul>
  Future<GetDataLakeDatasetResponse> getDataLakeDataset({
    required String instanceId,
    required String name,
    required String namespace,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(namespace)}/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataLakeDatasetResponse.fromJson(response);
  }

  /// Enables you to programmatically update an Amazon Web Services Supply Chain
  /// data lake dataset. Developers can update the description of a data lake
  /// dataset for a given instance ID, namespace, and dataset name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the dataset. For <b>asc</b> namespace, the name must be one of
  /// the supported data entities under <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  ///
  /// Parameter [namespace] :
  /// The namespace of the dataset, besides the custom defined namespace, every
  /// instance comes with below pre-defined namespaces:
  ///
  /// <ul>
  /// <li>
  /// <b>asc</b> - For information on the Amazon Web Services Supply Chain
  /// supported datasets see <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  /// </li>
  /// <li>
  /// <b>default</b> - For datasets with custom user-defined schemas.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The updated description of the data lake dataset.
  Future<UpdateDataLakeDatasetResponse> updateDataLakeDataset({
    required String instanceId,
    required String name,
    required String namespace,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(namespace)}/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataLakeDatasetResponse.fromJson(response);
  }

  /// Enables you to programmatically delete an Amazon Web Services Supply Chain
  /// data lake dataset. Developers can delete the existing datasets for a given
  /// instance ID, namespace, and instance name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the dataset. For <b>asc</b> namespace, the name must be one of
  /// the supported data entities under <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  ///
  /// Parameter [namespace] :
  /// The namespace of the dataset, besides the custom defined namespace, every
  /// instance comes with below pre-defined namespaces:
  ///
  /// <ul>
  /// <li>
  /// <b>asc</b> - For information on the Amazon Web Services Supply Chain
  /// supported datasets see <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  /// </li>
  /// <li>
  /// <b>default</b> - For datasets with custom user-defined schemas.
  /// </li>
  /// </ul>
  Future<DeleteDataLakeDatasetResponse> deleteDataLakeDataset({
    required String instanceId,
    required String name,
    required String namespace,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(namespace)}/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataLakeDatasetResponse.fromJson(response);
  }

  /// Enables you to programmatically view the list of Amazon Web Services
  /// Supply Chain data lake datasets. Developers can view the datasets and the
  /// corresponding information such as namespace, schema, and so on for a given
  /// instance ID and namespace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [namespace] :
  /// The namespace of the dataset, besides the custom defined namespace, every
  /// instance comes with below pre-defined namespaces:
  ///
  /// <ul>
  /// <li>
  /// <b>asc</b> - For information on the Amazon Web Services Supply Chain
  /// supported datasets see <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  /// </li>
  /// <li>
  /// <b>default</b> - For datasets with custom user-defined schemas.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The max number of datasets to fetch in this paginated request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to fetch next page of datasets.
  Future<ListDataLakeDatasetsResponse> listDataLakeDatasets({
    required String instanceId,
    required String namespace,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(namespace)}/datasets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataLakeDatasetsResponse.fromJson(response);
  }

  /// Enables you to programmatically create an Amazon Web Services Supply Chain
  /// data lake namespace. Developers can create the namespaces for a given
  /// instance ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the namespace. Noted you cannot create namespace with name
  /// starting with <b>asc</b>, <b>default</b>, <b>scn</b>, <b>aws</b>,
  /// <b>amazon</b>, <b>amzn</b>
  ///
  /// Parameter [description] :
  /// The description of the namespace.
  ///
  /// Parameter [tags] :
  /// The tags of the namespace.
  Future<CreateDataLakeNamespaceResponse> createDataLakeNamespace({
    required String instanceId,
    required String name,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataLakeNamespaceResponse.fromJson(response);
  }

  /// Enables you to programmatically view an Amazon Web Services Supply Chain
  /// data lake namespace. Developers can view the data lake namespace
  /// information such as description for a given instance ID and namespace
  /// name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the namespace. Besides the namespaces user created, you can
  /// also specify the pre-defined namespaces:
  ///
  /// <ul>
  /// <li>
  /// <b>asc</b> - Pre-defined namespace containing Amazon Web Services Supply
  /// Chain supported datasets, see <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  /// </li>
  /// <li>
  /// <b>default</b> - Pre-defined namespace containing datasets with custom
  /// user-defined schemas.
  /// </li>
  /// </ul>
  Future<GetDataLakeNamespaceResponse> getDataLakeNamespace({
    required String instanceId,
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataLakeNamespaceResponse.fromJson(response);
  }

  /// Enables you to programmatically update an Amazon Web Services Supply Chain
  /// data lake namespace. Developers can update the description of a data lake
  /// namespace for a given instance ID and namespace name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the namespace. Noted you cannot update namespace with name
  /// starting with <b>asc</b>, <b>default</b>, <b>scn</b>, <b>aws</b>,
  /// <b>amazon</b>, <b>amzn</b>
  ///
  /// Parameter [description] :
  /// The updated description of the data lake namespace.
  Future<UpdateDataLakeNamespaceResponse> updateDataLakeNamespace({
    required String instanceId,
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataLakeNamespaceResponse.fromJson(response);
  }

  /// Enables you to programmatically delete an Amazon Web Services Supply Chain
  /// data lake namespace and its underling datasets. Developers can delete the
  /// existing namespaces for a given instance ID and namespace name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [name] :
  /// The name of the namespace. Noted you cannot delete pre-defined namespace
  /// like <b>asc</b>, <b>default</b> which are only deleted through instance
  /// deletion.
  Future<DeleteDataLakeNamespaceResponse> deleteDataLakeNamespace({
    required String instanceId,
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataLakeNamespaceResponse.fromJson(response);
  }

  /// Enables you to programmatically view the list of Amazon Web Services
  /// Supply Chain data lake namespaces. Developers can view the namespaces and
  /// the corresponding information such as description for a given instance ID.
  /// Note that this API only return custom namespaces, instance pre-defined
  /// namespaces are not included.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The Amazon Web Services Supply Chain instance identifier.
  ///
  /// Parameter [maxResults] :
  /// The max number of namespaces to fetch in this paginated request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to fetch next page of namespaces.
  Future<ListDataLakeNamespacesResponse> listDataLakeNamespaces({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/datalake/instance/${Uri.encodeComponent(instanceId)}/namespaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataLakeNamespacesResponse.fromJson(response);
  }

  /// Enables you to programmatically create an Amazon Web Services Supply Chain
  /// instance by applying KMS keys and relevant information associated with the
  /// API without using the Amazon Web Services console.
  ///
  /// This is an asynchronous operation. Upon receiving a CreateInstance
  /// request, Amazon Web Services Supply Chain immediately returns the instance
  /// resource, instance ID, and the initializing state while simultaneously
  /// creating all required Amazon Web Services resources for an instance
  /// creation. You can use GetInstance to check the status of the instance. If
  /// the instance results in an unhealthy state, you need to check the error
  /// message, delete the current instance, and recreate a new one based on the
  /// mitigation from the error message.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// The client token for idempotency.
  ///
  /// Parameter [instanceDescription] :
  /// The AWS Supply Chain instance description.
  ///
  /// Parameter [instanceName] :
  /// The AWS Supply Chain instance name.
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  /// provide for encryption. This is required if you do not want to use the
  /// Amazon Web Services owned KMS key. If you don't provide anything here, AWS
  /// Supply Chain uses the Amazon Web Services owned KMS key.
  ///
  /// Parameter [tags] :
  /// The Amazon Web Services tags of an instance to be created.
  ///
  /// Parameter [webAppDnsDomain] :
  /// The DNS subdomain of the web app. This would be "example" in the URL
  /// "example.scn.global.on.aws". You can set this to a custom value, as long
  /// as the domain isn't already being used by someone else. The name may only
  /// include alphanumeric characters and hyphens.
  Future<CreateInstanceResponse> createInstance({
    String? clientToken,
    String? instanceDescription,
    String? instanceName,
    String? kmsKeyArn,
    Map<String, String>? tags,
    String? webAppDnsDomain,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (instanceDescription != null)
        'instanceDescription': instanceDescription,
      if (instanceName != null) 'instanceName': instanceName,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
      if (webAppDnsDomain != null) 'webAppDnsDomain': webAppDnsDomain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/api/instance',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInstanceResponse.fromJson(response);
  }

  /// Enables you to programmatically retrieve the information related to an
  /// Amazon Web Services Supply Chain instance ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier
  Future<GetInstanceResponse> getInstance({
    required String instanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/instance/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetInstanceResponse.fromJson(response);
  }

  /// Enables you to programmatically update an Amazon Web Services Supply Chain
  /// instance description by providing all the relevant information such as
  /// account ID, instance ID and so on without using the AWS console.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  ///
  /// Parameter [instanceDescription] :
  /// The AWS Supply Chain instance description.
  ///
  /// Parameter [instanceName] :
  /// The AWS Supply Chain instance name.
  Future<UpdateInstanceResponse> updateInstance({
    required String instanceId,
    String? instanceDescription,
    String? instanceName,
  }) async {
    final $payload = <String, dynamic>{
      if (instanceDescription != null)
        'instanceDescription': instanceDescription,
      if (instanceName != null) 'instanceName': instanceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/api/instance/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateInstanceResponse.fromJson(response);
  }

  /// Enables you to programmatically delete an Amazon Web Services Supply Chain
  /// instance by deleting the KMS keys and relevant information associated with
  /// the API without using the Amazon Web Services console.
  ///
  /// This is an asynchronous operation. Upon receiving a DeleteInstance
  /// request, Amazon Web Services Supply Chain immediately returns a response
  /// with the instance resource, delete state while cleaning up all Amazon Web
  /// Services resources created during the instance creation process. You can
  /// use the GetInstance action to check the instance status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceId] :
  /// The AWS Supply Chain instance identifier.
  Future<DeleteInstanceResponse> deleteInstance({
    required String instanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/api/instance/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInstanceResponse.fromJson(response);
  }

  /// List all Amazon Web Services Supply Chain instances for a specific
  /// account. Enables you to programmatically list all Amazon Web Services
  /// Supply Chain instances based on their account ID, instance name, and state
  /// of the instance (active or delete).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceNameFilter] :
  /// The filter to ListInstances based on their names.
  ///
  /// Parameter [instanceStateFilter] :
  /// The filter to ListInstances based on their state.
  ///
  /// Parameter [maxResults] :
  /// Specify the maximum number of instances to fetch in this paginated
  /// request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to fetch the next page of instances.
  Future<ListInstancesResponse> listInstances({
    List<String>? instanceNameFilter,
    List<InstanceState>? instanceStateFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      20,
    );
    final $query = <String, List<String>>{
      if (instanceNameFilter != null) 'instanceNameFilter': instanceNameFilter,
      if (instanceStateFilter != null)
        'instanceStateFilter': instanceStateFilter.map((e) => e.value).toList(),
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/instance',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInstancesResponse.fromJson(response);
  }
}

/// The response parameters for GetDataIntegrationEvent.
///
/// @nodoc
class GetDataIntegrationEventResponse {
  /// The details of the DataIntegrationEvent returned.
  final DataIntegrationEvent event;

  GetDataIntegrationEventResponse({
    required this.event,
  });

  factory GetDataIntegrationEventResponse.fromJson(Map<String, dynamic> json) {
    return GetDataIntegrationEventResponse(
      event: DataIntegrationEvent.fromJson(
          (json['event'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    return {
      'event': event,
    };
  }
}

/// The response parameters of GetFlowExecution.
///
/// @nodoc
class GetDataIntegrationFlowExecutionResponse {
  /// The flow execution details.
  final DataIntegrationFlowExecution flowExecution;

  GetDataIntegrationFlowExecutionResponse({
    required this.flowExecution,
  });

  factory GetDataIntegrationFlowExecutionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDataIntegrationFlowExecutionResponse(
      flowExecution: DataIntegrationFlowExecution.fromJson(
          (json['flowExecution'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final flowExecution = this.flowExecution;
    return {
      'flowExecution': flowExecution,
    };
  }
}

/// The response parameters for ListDataIntegrationEvents.
///
/// @nodoc
class ListDataIntegrationEventsResponse {
  /// The list of data integration events.
  final List<DataIntegrationEvent> events;

  /// The pagination token to fetch the next page of the
  /// ListDataIntegrationEvents.
  final String? nextToken;

  ListDataIntegrationEventsResponse({
    required this.events,
    this.nextToken,
  });

  factory ListDataIntegrationEventsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataIntegrationEventsResponse(
      events: ((json['events'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataIntegrationEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response parameters of ListFlowExecutions.
///
/// @nodoc
class ListDataIntegrationFlowExecutionsResponse {
  /// The list of flow executions.
  final List<DataIntegrationFlowExecution> flowExecutions;

  /// The pagination token to fetch next page of flow executions.
  final String? nextToken;

  ListDataIntegrationFlowExecutionsResponse({
    required this.flowExecutions,
    this.nextToken,
  });

  factory ListDataIntegrationFlowExecutionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataIntegrationFlowExecutionsResponse(
      flowExecutions: ((json['flowExecutions'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DataIntegrationFlowExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowExecutions = this.flowExecutions;
    final nextToken = this.nextToken;
    return {
      'flowExecutions': flowExecutions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response parameters of ListTagsForResource.
///
/// @nodoc
class ListTagsForResourceResponse {
  /// The tags added to an Amazon Web Services Supply Chain resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

/// The response parameters for SendDataIntegrationEvent.
///
/// @nodoc
class SendDataIntegrationEventResponse {
  /// The unique event identifier.
  final String eventId;

  SendDataIntegrationEventResponse({
    required this.eventId,
  });

  factory SendDataIntegrationEventResponse.fromJson(Map<String, dynamic> json) {
    return SendDataIntegrationEventResponse(
      eventId: (json['eventId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    return {
      'eventId': eventId,
    };
  }
}

/// The response parameters for TagResource.
///
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

/// The response parameters of UntagResource.
///
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

/// The response parameters of CreateBillOfMaterialsImportJob.
///
/// @nodoc
class CreateBillOfMaterialsImportJobResponse {
  /// The new BillOfMaterialsImportJob identifier.
  final String jobId;

  CreateBillOfMaterialsImportJobResponse({
    required this.jobId,
  });

  factory CreateBillOfMaterialsImportJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateBillOfMaterialsImportJobResponse(
      jobId: (json['jobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// The response parameters for GetBillOfMaterialsImportJob.
///
/// @nodoc
class GetBillOfMaterialsImportJobResponse {
  /// The BillOfMaterialsImportJob.
  final BillOfMaterialsImportJob job;

  GetBillOfMaterialsImportJobResponse({
    required this.job,
  });

  factory GetBillOfMaterialsImportJobResponse.fromJson(
      Map<String, dynamic> json) {
    return GetBillOfMaterialsImportJobResponse(
      job: BillOfMaterialsImportJob.fromJson(
          (json['job'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      'job': job,
    };
  }
}

/// The response parameters for CreateDataIntegrationFlow.
///
/// @nodoc
class CreateDataIntegrationFlowResponse {
  /// The Amazon Web Services Supply Chain instance identifier.
  final String instanceId;

  /// The name of the DataIntegrationFlow created.
  final String name;

  CreateDataIntegrationFlowResponse({
    required this.instanceId,
    required this.name,
  });

  factory CreateDataIntegrationFlowResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDataIntegrationFlowResponse(
      instanceId: (json['instanceId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final name = this.name;
    return {
      'instanceId': instanceId,
      'name': name,
    };
  }
}

/// The response parameters for GetDataIntegrationFlow.
///
/// @nodoc
class GetDataIntegrationFlowResponse {
  /// The details of the DataIntegrationFlow returned.
  final DataIntegrationFlow flow;

  GetDataIntegrationFlowResponse({
    required this.flow,
  });

  factory GetDataIntegrationFlowResponse.fromJson(Map<String, dynamic> json) {
    return GetDataIntegrationFlowResponse(
      flow: DataIntegrationFlow.fromJson(
          (json['flow'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final flow = this.flow;
    return {
      'flow': flow,
    };
  }
}

/// The response parameters for UpdateDataIntegrationFlow.
///
/// @nodoc
class UpdateDataIntegrationFlowResponse {
  /// The details of the updated DataIntegrationFlow.
  final DataIntegrationFlow flow;

  UpdateDataIntegrationFlowResponse({
    required this.flow,
  });

  factory UpdateDataIntegrationFlowResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDataIntegrationFlowResponse(
      flow: DataIntegrationFlow.fromJson(
          (json['flow'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final flow = this.flow;
    return {
      'flow': flow,
    };
  }
}

/// The response parameters for DeleteDataIntegrationFlow.
///
/// @nodoc
class DeleteDataIntegrationFlowResponse {
  /// The Amazon Web Services Supply Chain instance identifier.
  final String instanceId;

  /// The name of the DataIntegrationFlow deleted.
  final String name;

  DeleteDataIntegrationFlowResponse({
    required this.instanceId,
    required this.name,
  });

  factory DeleteDataIntegrationFlowResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteDataIntegrationFlowResponse(
      instanceId: (json['instanceId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final name = this.name;
    return {
      'instanceId': instanceId,
      'name': name,
    };
  }
}

/// The response parameters for ListDataIntegrationFlows.
///
/// @nodoc
class ListDataIntegrationFlowsResponse {
  /// The response parameters for ListDataIntegrationFlows.
  final List<DataIntegrationFlow> flows;

  /// The pagination token to fetch the next page of the DataIntegrationFlows.
  final String? nextToken;

  ListDataIntegrationFlowsResponse({
    required this.flows,
    this.nextToken,
  });

  factory ListDataIntegrationFlowsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataIntegrationFlowsResponse(
      flows: ((json['flows'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataIntegrationFlow.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flows = this.flows;
    final nextToken = this.nextToken;
    return {
      'flows': flows,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response parameters of CreateDataLakeDataset.
///
/// @nodoc
class CreateDataLakeDatasetResponse {
  /// The detail of created dataset.
  final DataLakeDataset dataset;

  CreateDataLakeDatasetResponse({
    required this.dataset,
  });

  factory CreateDataLakeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataLakeDatasetResponse(
      dataset: DataLakeDataset.fromJson(
          (json['dataset'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    return {
      'dataset': dataset,
    };
  }
}

/// The response parameters for GetDataLakeDataset.
///
/// @nodoc
class GetDataLakeDatasetResponse {
  /// The fetched dataset details.
  final DataLakeDataset dataset;

  GetDataLakeDatasetResponse({
    required this.dataset,
  });

  factory GetDataLakeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return GetDataLakeDatasetResponse(
      dataset: DataLakeDataset.fromJson(
          (json['dataset'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    return {
      'dataset': dataset,
    };
  }
}

/// The response parameters of UpdateDataLakeDataset.
///
/// @nodoc
class UpdateDataLakeDatasetResponse {
  /// The updated dataset details.
  final DataLakeDataset dataset;

  UpdateDataLakeDatasetResponse({
    required this.dataset,
  });

  factory UpdateDataLakeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataLakeDatasetResponse(
      dataset: DataLakeDataset.fromJson(
          (json['dataset'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    return {
      'dataset': dataset,
    };
  }
}

/// The response parameters of DeleteDataLakeDataset.
///
/// @nodoc
class DeleteDataLakeDatasetResponse {
  /// The AWS Supply Chain instance identifier.
  final String instanceId;

  /// The name of deleted dataset.
  final String name;

  /// The namespace of deleted dataset.
  final String namespace;

  DeleteDataLakeDatasetResponse({
    required this.instanceId,
    required this.name,
    required this.namespace,
  });

  factory DeleteDataLakeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDataLakeDatasetResponse(
      instanceId: (json['instanceId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      namespace: (json['namespace'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final name = this.name;
    final namespace = this.namespace;
    return {
      'instanceId': instanceId,
      'name': name,
      'namespace': namespace,
    };
  }
}

/// The response parameters of ListDataLakeDatasets.
///
/// @nodoc
class ListDataLakeDatasetsResponse {
  /// The list of fetched dataset details.
  final List<DataLakeDataset> datasets;

  /// The pagination token to fetch next page of datasets.
  final String? nextToken;

  ListDataLakeDatasetsResponse({
    required this.datasets,
    this.nextToken,
  });

  factory ListDataLakeDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataLakeDatasetsResponse(
      datasets: ((json['datasets'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataLakeDataset.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasets = this.datasets;
    final nextToken = this.nextToken;
    return {
      'datasets': datasets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response parameters of CreateDataLakeNamespace.
///
/// @nodoc
class CreateDataLakeNamespaceResponse {
  /// The detail of created namespace.
  final DataLakeNamespace namespace;

  CreateDataLakeNamespaceResponse({
    required this.namespace,
  });

  factory CreateDataLakeNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataLakeNamespaceResponse(
      namespace: DataLakeNamespace.fromJson(
          (json['namespace'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'namespace': namespace,
    };
  }
}

/// The response parameters for GetDataLakeNamespace.
///
/// @nodoc
class GetDataLakeNamespaceResponse {
  /// The fetched namespace details.
  final DataLakeNamespace namespace;

  GetDataLakeNamespaceResponse({
    required this.namespace,
  });

  factory GetDataLakeNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return GetDataLakeNamespaceResponse(
      namespace: DataLakeNamespace.fromJson(
          (json['namespace'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'namespace': namespace,
    };
  }
}

/// The response parameters of UpdateDataLakeNamespace.
///
/// @nodoc
class UpdateDataLakeNamespaceResponse {
  /// The updated namespace details.
  final DataLakeNamespace namespace;

  UpdateDataLakeNamespaceResponse({
    required this.namespace,
  });

  factory UpdateDataLakeNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataLakeNamespaceResponse(
      namespace: DataLakeNamespace.fromJson(
          (json['namespace'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'namespace': namespace,
    };
  }
}

/// The response parameters of DeleteDataLakeNamespace.
///
/// @nodoc
class DeleteDataLakeNamespaceResponse {
  /// The AWS Supply Chain instance identifier.
  final String instanceId;

  /// The name of deleted namespace.
  final String name;

  DeleteDataLakeNamespaceResponse({
    required this.instanceId,
    required this.name,
  });

  factory DeleteDataLakeNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDataLakeNamespaceResponse(
      instanceId: (json['instanceId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final name = this.name;
    return {
      'instanceId': instanceId,
      'name': name,
    };
  }
}

/// The response parameters of ListDataLakeNamespaces.
///
/// @nodoc
class ListDataLakeNamespacesResponse {
  /// The list of fetched namespace details. Noted it only contains custom
  /// namespaces, pre-defined namespaces are not included.
  final List<DataLakeNamespace> namespaces;

  /// The pagination token to fetch next page of namespaces.
  final String? nextToken;

  ListDataLakeNamespacesResponse({
    required this.namespaces,
    this.nextToken,
  });

  factory ListDataLakeNamespacesResponse.fromJson(Map<String, dynamic> json) {
    return ListDataLakeNamespacesResponse(
      namespaces: ((json['namespaces'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataLakeNamespace.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaces = this.namespaces;
    final nextToken = this.nextToken;
    return {
      'namespaces': namespaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response parameters for CreateInstance.
///
/// @nodoc
class CreateInstanceResponse {
  /// The AWS Supply Chain instance resource data details.
  final Instance instance;

  CreateInstanceResponse({
    required this.instance,
  });

  factory CreateInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateInstanceResponse(
      instance: Instance.fromJson((json['instance'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      'instance': instance,
    };
  }
}

/// The response parameters for GetInstance.
///
/// @nodoc
class GetInstanceResponse {
  /// The instance resource data details.
  final Instance instance;

  GetInstanceResponse({
    required this.instance,
  });

  factory GetInstanceResponse.fromJson(Map<String, dynamic> json) {
    return GetInstanceResponse(
      instance: Instance.fromJson((json['instance'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      'instance': instance,
    };
  }
}

/// The response parameters for UpdateInstance.
///
/// @nodoc
class UpdateInstanceResponse {
  /// The instance resource data details.
  final Instance instance;

  UpdateInstanceResponse({
    required this.instance,
  });

  factory UpdateInstanceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateInstanceResponse(
      instance: Instance.fromJson((json['instance'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      'instance': instance,
    };
  }
}

/// The response parameters for DeleteInstance.
///
/// @nodoc
class DeleteInstanceResponse {
  /// The AWS Supply Chain instance resource data details.
  final Instance instance;

  DeleteInstanceResponse({
    required this.instance,
  });

  factory DeleteInstanceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInstanceResponse(
      instance: Instance.fromJson((json['instance'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      'instance': instance,
    };
  }
}

/// The response parameters for ListInstances.
///
/// @nodoc
class ListInstancesResponse {
  /// The list of instances resource data details.
  final List<Instance> instances;

  /// The pagination token to fetch the next page of instances.
  final String? nextToken;

  ListInstancesResponse({
    required this.instances,
    this.nextToken,
  });

  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListInstancesResponse(
      instances: ((json['instances'] as List?) ?? const [])
          .nonNulls
          .map((e) => Instance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final nextToken = this.nextToken;
    return {
      'instances': instances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The details of the instance.
///
/// @nodoc
class Instance {
  /// The Amazon Web Services account ID that owns the instance.
  final String awsAccountId;

  /// The Amazon Web Services Supply Chain instance identifier.
  final String instanceId;

  /// The state of the instance.
  final InstanceState state;

  /// The instance creation timestamp.
  final DateTime? createdTime;

  /// The Amazon Web Services Supply Chain instance error message. If the instance
  /// results in an unhealthy state, customers need to check the error message,
  /// delete the current instance, and recreate a new one based on the mitigation
  /// from the error message.
  final String? errorMessage;

  /// The Amazon Web Services Supply Chain instance description.
  final String? instanceDescription;

  /// The Amazon Web Services Supply Chain instance name.
  final String? instanceName;

  /// The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  /// optionally provided for encryption. If you did not provide anything here,
  /// AWS Supply Chain uses the Amazon Web Services owned KMS key and nothing is
  /// returned.
  final String? kmsKeyArn;

  /// The instance last modified timestamp.
  final DateTime? lastModifiedTime;

  /// The version number of the instance.
  final double? versionNumber;

  /// The WebApp DNS domain name of the instance.
  final String? webAppDnsDomain;

  Instance({
    required this.awsAccountId,
    required this.instanceId,
    required this.state,
    this.createdTime,
    this.errorMessage,
    this.instanceDescription,
    this.instanceName,
    this.kmsKeyArn,
    this.lastModifiedTime,
    this.versionNumber,
    this.webAppDnsDomain,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      awsAccountId: (json['awsAccountId'] as String?) ?? '',
      instanceId: (json['instanceId'] as String?) ?? '',
      state: InstanceState.fromString((json['state'] as String?) ?? ''),
      createdTime: timeStampFromJson(json['createdTime']),
      errorMessage: json['errorMessage'] as String?,
      instanceDescription: json['instanceDescription'] as String?,
      instanceName: json['instanceName'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      versionNumber: json['versionNumber'] as double?,
      webAppDnsDomain: json['webAppDnsDomain'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final instanceId = this.instanceId;
    final state = this.state;
    final createdTime = this.createdTime;
    final errorMessage = this.errorMessage;
    final instanceDescription = this.instanceDescription;
    final instanceName = this.instanceName;
    final kmsKeyArn = this.kmsKeyArn;
    final lastModifiedTime = this.lastModifiedTime;
    final versionNumber = this.versionNumber;
    final webAppDnsDomain = this.webAppDnsDomain;
    return {
      'awsAccountId': awsAccountId,
      'instanceId': instanceId,
      'state': state.value,
      if (createdTime != null) 'createdTime': unixTimestampToJson(createdTime),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (instanceDescription != null)
        'instanceDescription': instanceDescription,
      if (instanceName != null) 'instanceName': instanceName,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (lastModifiedTime != null)
        'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (versionNumber != null) 'versionNumber': versionNumber,
      if (webAppDnsDomain != null) 'webAppDnsDomain': webAppDnsDomain,
    };
  }
}

/// @nodoc
class InstanceState {
  static const initializing = InstanceState._('Initializing');
  static const active = InstanceState._('Active');
  static const createFailed = InstanceState._('CreateFailed');
  static const deleteFailed = InstanceState._('DeleteFailed');
  static const deleting = InstanceState._('Deleting');
  static const deleted = InstanceState._('Deleted');

  final String value;

  const InstanceState._(this.value);

  static const values = [
    initializing,
    active,
    createFailed,
    deleteFailed,
    deleting,
    deleted
  ];

  static InstanceState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceState._(value));

  @override
  bool operator ==(other) => other is InstanceState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data lake namespace details.
///
/// @nodoc
class DataLakeNamespace {
  /// The arn of the namespace.
  final String arn;

  /// The creation time of the namespace.
  final DateTime createdTime;

  /// The Amazon Web Services Supply Chain instance identifier.
  final String instanceId;

  /// The last modified time of the namespace.
  final DateTime lastModifiedTime;

  /// The name of the namespace.
  final String name;

  /// The description of the namespace.
  final String? description;

  DataLakeNamespace({
    required this.arn,
    required this.createdTime,
    required this.instanceId,
    required this.lastModifiedTime,
    required this.name,
    this.description,
  });

  factory DataLakeNamespace.fromJson(Map<String, dynamic> json) {
    return DataLakeNamespace(
      arn: (json['arn'] as String?) ?? '',
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      instanceId: (json['instanceId'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final instanceId = this.instanceId;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final description = this.description;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'instanceId': instanceId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// The data lake dataset details.
///
/// @nodoc
class DataLakeDataset {
  /// The arn of the dataset.
  final String arn;

  /// The creation time of the dataset.
  final DateTime createdTime;

  /// The Amazon Web Services Supply Chain instance identifier.
  final String instanceId;

  /// The last modified time of the dataset.
  final DateTime lastModifiedTime;

  /// The name of the dataset. For <b>asc</b> namespace, the name must be one of
  /// the supported data entities under <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  final String name;

  /// The namespace of the dataset, besides the custom defined namespace, every
  /// instance comes with below pre-defined namespaces:
  ///
  /// <ul>
  /// <li>
  /// <b>asc</b> - For information on the Amazon Web Services Supply Chain
  /// supported datasets see <a
  /// href="https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html">https://docs.aws.amazon.com/aws-supply-chain/latest/userguide/data-model-asc.html</a>.
  /// </li>
  /// <li>
  /// <b>default</b> - For datasets with custom user-defined schemas.
  /// </li>
  /// </ul>
  final String namespace;

  /// The schema of the dataset.
  final DataLakeDatasetSchema schema;

  /// The description of the dataset.
  final String? description;
  final DataLakeDatasetPartitionSpec? partitionSpec;

  DataLakeDataset({
    required this.arn,
    required this.createdTime,
    required this.instanceId,
    required this.lastModifiedTime,
    required this.name,
    required this.namespace,
    required this.schema,
    this.description,
    this.partitionSpec,
  });

  factory DataLakeDataset.fromJson(Map<String, dynamic> json) {
    return DataLakeDataset(
      arn: (json['arn'] as String?) ?? '',
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      instanceId: (json['instanceId'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      namespace: (json['namespace'] as String?) ?? '',
      schema: DataLakeDatasetSchema.fromJson(
          (json['schema'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      description: json['description'] as String?,
      partitionSpec: json['partitionSpec'] != null
          ? DataLakeDatasetPartitionSpec.fromJson(
              json['partitionSpec'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final instanceId = this.instanceId;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final namespace = this.namespace;
    final schema = this.schema;
    final description = this.description;
    final partitionSpec = this.partitionSpec;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'instanceId': instanceId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'name': name,
      'namespace': namespace,
      'schema': schema,
      if (description != null) 'description': description,
      if (partitionSpec != null) 'partitionSpec': partitionSpec,
    };
  }
}

/// The schema details of the dataset. Note that for AWS Supply Chain dataset
/// under <b>asc</b> namespace, it may have internal fields like connection_id
/// that will be auto populated by data ingestion methods.
///
/// @nodoc
class DataLakeDatasetSchema {
  /// The list of field details of the dataset schema.
  final List<DataLakeDatasetSchemaField> fields;

  /// The name of the dataset schema.
  final String name;

  /// The list of primary key fields for the dataset. Primary keys defined can
  /// help data ingestion methods to ensure data uniqueness:
  /// CreateDataIntegrationFlow's dedupe strategy will leverage primary keys to
  /// perform records deduplication before write to dataset;
  /// SendDataIntegrationEvent's UPSERT and DELETE can only work with dataset with
  /// primary keys. For more details, refer to those data ingestion
  /// documentations.
  ///
  /// Note that defining primary keys does not necessarily mean the dataset cannot
  /// have duplicate records, duplicate records can still be ingested if
  /// CreateDataIntegrationFlow's dedupe disabled or through
  /// SendDataIntegrationEvent's APPEND operation.
  final List<DataLakeDatasetPrimaryKeyField>? primaryKeys;

  DataLakeDatasetSchema({
    required this.fields,
    required this.name,
    this.primaryKeys,
  });

  factory DataLakeDatasetSchema.fromJson(Map<String, dynamic> json) {
    return DataLakeDatasetSchema(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DataLakeDatasetSchemaField.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['name'] as String?) ?? '',
      primaryKeys: (json['primaryKeys'] as List?)
          ?.nonNulls
          .map((e) => DataLakeDatasetPrimaryKeyField.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final name = this.name;
    final primaryKeys = this.primaryKeys;
    return {
      'fields': fields,
      'name': name,
      if (primaryKeys != null) 'primaryKeys': primaryKeys,
    };
  }
}

/// The partition specification for a dataset.
///
/// @nodoc
class DataLakeDatasetPartitionSpec {
  /// The fields on which to partition a dataset. The partitions will be applied
  /// hierarchically based on the order of this list.
  final List<DataLakeDatasetPartitionField> fields;

  DataLakeDatasetPartitionSpec({
    required this.fields,
  });

  factory DataLakeDatasetPartitionSpec.fromJson(Map<String, dynamic> json) {
    return DataLakeDatasetPartitionSpec(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DataLakeDatasetPartitionField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      'fields': fields,
    };
  }
}

/// The detail of the partition field.
///
/// @nodoc
class DataLakeDatasetPartitionField {
  /// The name of the partition field.
  final String name;

  /// The transformation of the partition field. A transformation specifies how to
  /// partition on a given field. For example, with timestamp you can specify that
  /// you'd like to partition fields by day, e.g. data record with value
  /// 2025-01-03T00:00:00Z in partition field is in 2025-01-03 partition. Also
  /// noted that data record without any value in optional partition field is in
  /// NULL partition.
  final DataLakeDatasetPartitionFieldTransform transform;

  DataLakeDatasetPartitionField({
    required this.name,
    required this.transform,
  });

  factory DataLakeDatasetPartitionField.fromJson(Map<String, dynamic> json) {
    return DataLakeDatasetPartitionField(
      name: (json['name'] as String?) ?? '',
      transform: DataLakeDatasetPartitionFieldTransform.fromJson(
          (json['transform'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final transform = this.transform;
    return {
      'name': name,
      'transform': transform,
    };
  }
}

/// The detail of the partition field transformation.
///
/// @nodoc
class DataLakeDatasetPartitionFieldTransform {
  /// The type of partitioning transformation for this field. The available
  /// options are:
  ///
  /// <ul>
  /// <li>
  /// <b>IDENTITY</b> - Partitions data on a given field by its exact values.
  /// </li>
  /// <li>
  /// <b>YEAR</b> - Partitions data on a timestamp field using year granularity.
  /// </li>
  /// <li>
  /// <b>MONTH</b> - Partitions data on a timestamp field using month granularity.
  /// </li>
  /// <li>
  /// <b>DAY</b> - Partitions data on a timestamp field using day granularity.
  /// </li>
  /// <li>
  /// <b>HOUR</b> - Partitions data on a timestamp field using hour granularity.
  /// </li>
  /// </ul>
  final DataLakeDatasetPartitionTransformType type;

  DataLakeDatasetPartitionFieldTransform({
    required this.type,
  });

  factory DataLakeDatasetPartitionFieldTransform.fromJson(
      Map<String, dynamic> json) {
    return DataLakeDatasetPartitionFieldTransform(
      type: DataLakeDatasetPartitionTransformType.fromString(
          (json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

/// @nodoc
class DataLakeDatasetPartitionTransformType {
  static const year = DataLakeDatasetPartitionTransformType._('YEAR');
  static const month = DataLakeDatasetPartitionTransformType._('MONTH');
  static const day = DataLakeDatasetPartitionTransformType._('DAY');
  static const hour = DataLakeDatasetPartitionTransformType._('HOUR');
  static const identity = DataLakeDatasetPartitionTransformType._('IDENTITY');

  final String value;

  const DataLakeDatasetPartitionTransformType._(this.value);

  static const values = [year, month, day, hour, identity];

  static DataLakeDatasetPartitionTransformType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataLakeDatasetPartitionTransformType._(value));

  @override
  bool operator ==(other) =>
      other is DataLakeDatasetPartitionTransformType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The detail of the primary key field.
///
/// @nodoc
class DataLakeDatasetPrimaryKeyField {
  /// The name of the primary key field.
  final String name;

  DataLakeDatasetPrimaryKeyField({
    required this.name,
  });

  factory DataLakeDatasetPrimaryKeyField.fromJson(Map<String, dynamic> json) {
    return DataLakeDatasetPrimaryKeyField(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// The dataset field details.
///
/// @nodoc
class DataLakeDatasetSchemaField {
  /// Indicate if the field is required or not.
  final bool isRequired;

  /// The dataset field name.
  final String name;

  /// The dataset field type.
  final DataLakeDatasetSchemaFieldType type;

  DataLakeDatasetSchemaField({
    required this.isRequired,
    required this.name,
    required this.type,
  });

  factory DataLakeDatasetSchemaField.fromJson(Map<String, dynamic> json) {
    return DataLakeDatasetSchemaField(
      isRequired: (json['isRequired'] as bool?) ?? false,
      name: (json['name'] as String?) ?? '',
      type: DataLakeDatasetSchemaFieldType.fromString(
          (json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final isRequired = this.isRequired;
    final name = this.name;
    final type = this.type;
    return {
      'isRequired': isRequired,
      'name': name,
      'type': type.value,
    };
  }
}

/// @nodoc
class DataLakeDatasetSchemaFieldType {
  static const $int = DataLakeDatasetSchemaFieldType._('INT');
  static const $double = DataLakeDatasetSchemaFieldType._('DOUBLE');
  static const string = DataLakeDatasetSchemaFieldType._('STRING');
  static const timestamp = DataLakeDatasetSchemaFieldType._('TIMESTAMP');
  static const long = DataLakeDatasetSchemaFieldType._('LONG');

  final String value;

  const DataLakeDatasetSchemaFieldType._(this.value);

  static const values = [$int, $double, string, timestamp, long];

  static DataLakeDatasetSchemaFieldType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataLakeDatasetSchemaFieldType._(value));

  @override
  bool operator ==(other) =>
      other is DataLakeDatasetSchemaFieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The DataIntegrationFlow details.
///
/// @nodoc
class DataIntegrationFlow {
  /// The DataIntegrationFlow creation timestamp.
  final DateTime createdTime;

  /// The DataIntegrationFlow instance ID.
  final String instanceId;

  /// The DataIntegrationFlow last modified timestamp.
  final DateTime lastModifiedTime;

  /// The DataIntegrationFlow name.
  final String name;

  /// The DataIntegrationFlow source configurations.
  final List<DataIntegrationFlowSource> sources;

  /// The DataIntegrationFlow target configuration.
  final DataIntegrationFlowTarget target;

  /// The DataIntegrationFlow transformation configurations.
  final DataIntegrationFlowTransformation transformation;

  DataIntegrationFlow({
    required this.createdTime,
    required this.instanceId,
    required this.lastModifiedTime,
    required this.name,
    required this.sources,
    required this.target,
    required this.transformation,
  });

  factory DataIntegrationFlow.fromJson(Map<String, dynamic> json) {
    return DataIntegrationFlow(
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] ?? 0),
      instanceId: (json['instanceId'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      sources: ((json['sources'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DataIntegrationFlowSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      target: DataIntegrationFlowTarget.fromJson(
          (json['target'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      transformation: DataIntegrationFlowTransformation.fromJson(
          (json['transformation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final instanceId = this.instanceId;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final sources = this.sources;
    final target = this.target;
    final transformation = this.transformation;
    return {
      'createdTime': unixTimestampToJson(createdTime),
      'instanceId': instanceId,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'name': name,
      'sources': sources,
      'target': target,
      'transformation': transformation,
    };
  }
}

/// The DataIntegrationFlow transformation parameters.
///
/// @nodoc
class DataIntegrationFlowTransformation {
  /// The DataIntegrationFlow transformation type.
  final DataIntegrationFlowTransformationType transformationType;

  /// The SQL DataIntegrationFlow transformation configuration.
  final DataIntegrationFlowSQLTransformationConfiguration? sqlTransformation;

  DataIntegrationFlowTransformation({
    required this.transformationType,
    this.sqlTransformation,
  });

  factory DataIntegrationFlowTransformation.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowTransformation(
      transformationType: DataIntegrationFlowTransformationType.fromString(
          (json['transformationType'] as String?) ?? ''),
      sqlTransformation: json['sqlTransformation'] != null
          ? DataIntegrationFlowSQLTransformationConfiguration.fromJson(
              json['sqlTransformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transformationType = this.transformationType;
    final sqlTransformation = this.sqlTransformation;
    return {
      'transformationType': transformationType.value,
      if (sqlTransformation != null) 'sqlTransformation': sqlTransformation,
    };
  }
}

/// The DataIntegrationFlow target parameters.
///
/// @nodoc
class DataIntegrationFlowTarget {
  /// The DataIntegrationFlow target type.
  final DataIntegrationFlowTargetType targetType;

  /// The dataset DataIntegrationFlow target. Note that for AWS Supply Chain
  /// dataset under <b>asc</b> namespace, it has a connection_id internal field
  /// that is not allowed to be provided by client directly, they will be auto
  /// populated.
  final DataIntegrationFlowDatasetTargetConfiguration? datasetTarget;

  /// The S3 DataIntegrationFlow target.
  final DataIntegrationFlowS3TargetConfiguration? s3Target;

  DataIntegrationFlowTarget({
    required this.targetType,
    this.datasetTarget,
    this.s3Target,
  });

  factory DataIntegrationFlowTarget.fromJson(Map<String, dynamic> json) {
    return DataIntegrationFlowTarget(
      targetType: DataIntegrationFlowTargetType.fromString(
          (json['targetType'] as String?) ?? ''),
      datasetTarget: json['datasetTarget'] != null
          ? DataIntegrationFlowDatasetTargetConfiguration.fromJson(
              json['datasetTarget'] as Map<String, dynamic>)
          : null,
      s3Target: json['s3Target'] != null
          ? DataIntegrationFlowS3TargetConfiguration.fromJson(
              json['s3Target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetType = this.targetType;
    final datasetTarget = this.datasetTarget;
    final s3Target = this.s3Target;
    return {
      'targetType': targetType.value,
      if (datasetTarget != null) 'datasetTarget': datasetTarget,
      if (s3Target != null) 's3Target': s3Target,
    };
  }
}

/// @nodoc
class DataIntegrationFlowTargetType {
  static const s3 = DataIntegrationFlowTargetType._('S3');
  static const dataset = DataIntegrationFlowTargetType._('DATASET');

  final String value;

  const DataIntegrationFlowTargetType._(this.value);

  static const values = [s3, dataset];

  static DataIntegrationFlowTargetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationFlowTargetType._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationFlowTargetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The S3 DataIntegrationFlow target configuration parameters.
///
/// @nodoc
class DataIntegrationFlowS3TargetConfiguration {
  /// The bucketName of the S3 target objects.
  final String bucketName;

  /// The prefix of the S3 target objects.
  final String prefix;

  /// The S3 DataIntegrationFlow target options.
  final DataIntegrationFlowS3Options? options;

  DataIntegrationFlowS3TargetConfiguration({
    required this.bucketName,
    required this.prefix,
    this.options,
  });

  factory DataIntegrationFlowS3TargetConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowS3TargetConfiguration(
      bucketName: (json['bucketName'] as String?) ?? '',
      prefix: (json['prefix'] as String?) ?? '',
      options: json['options'] != null
          ? DataIntegrationFlowS3Options.fromJson(
              json['options'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final prefix = this.prefix;
    final options = this.options;
    return {
      'bucketName': bucketName,
      'prefix': prefix,
      if (options != null) 'options': options,
    };
  }
}

/// The dataset DataIntegrationFlow target configuration parameters.
///
/// @nodoc
class DataIntegrationFlowDatasetTargetConfiguration {
  /// The dataset ARN.
  final String datasetIdentifier;

  /// The dataset DataIntegrationFlow target options.
  final DataIntegrationFlowDatasetOptions? options;

  DataIntegrationFlowDatasetTargetConfiguration({
    required this.datasetIdentifier,
    this.options,
  });

  factory DataIntegrationFlowDatasetTargetConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowDatasetTargetConfiguration(
      datasetIdentifier: (json['datasetIdentifier'] as String?) ?? '',
      options: json['options'] != null
          ? DataIntegrationFlowDatasetOptions.fromJson(
              json['options'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetIdentifier = this.datasetIdentifier;
    final options = this.options;
    return {
      'datasetIdentifier': datasetIdentifier,
      if (options != null) 'options': options,
    };
  }
}

/// The dataset options used in dataset source and target configurations.
///
/// @nodoc
class DataIntegrationFlowDatasetOptions {
  /// The option to perform deduplication on data records sharing same primary key
  /// values. If disabled, transformed data with duplicate primary key values will
  /// ingest into dataset, for datasets within <b>asc</b> namespace, such
  /// duplicates will cause ingestion fail. If enabled without dedupeStrategy,
  /// deduplication is done by retaining a random data record among those sharing
  /// the same primary key values. If enabled with dedupeStragtegy, the
  /// deduplication is done following the strategy.
  ///
  /// Note that target dataset may have partition configured, when dedupe is
  /// enabled, it only dedupe against primary keys and retain only one record out
  /// of those duplicates regardless of its partition status.
  final bool? dedupeRecords;

  /// The deduplication strategy to dedupe the data records sharing same primary
  /// key values of the target dataset. This strategy only applies to target
  /// dataset with primary keys and with dedupeRecords option enabled. If
  /// transformed data still got duplicates after the dedupeStrategy evaluation, a
  /// random data record is chosen to be retained.
  final DataIntegrationFlowDedupeStrategy? dedupeStrategy;

  /// The target dataset's data load type. This only affects how source S3 files
  /// are selected in the S3-to-dataset flow.
  ///
  /// <ul>
  /// <li>
  /// <b>REPLACE</b> - Target dataset will get replaced with the new file added
  /// under the source s3 prefix.
  /// </li>
  /// <li>
  /// <b>INCREMENTAL</b> - Target dataset will get updated with the up-to-date
  /// content under S3 prefix incorporating any file additions or removals there.
  /// </li>
  /// </ul>
  final DataIntegrationFlowLoadType? loadType;

  DataIntegrationFlowDatasetOptions({
    this.dedupeRecords,
    this.dedupeStrategy,
    this.loadType,
  });

  factory DataIntegrationFlowDatasetOptions.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowDatasetOptions(
      dedupeRecords: json['dedupeRecords'] as bool?,
      dedupeStrategy: json['dedupeStrategy'] != null
          ? DataIntegrationFlowDedupeStrategy.fromJson(
              json['dedupeStrategy'] as Map<String, dynamic>)
          : null,
      loadType: (json['loadType'] as String?)
          ?.let(DataIntegrationFlowLoadType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dedupeRecords = this.dedupeRecords;
    final dedupeStrategy = this.dedupeStrategy;
    final loadType = this.loadType;
    return {
      if (dedupeRecords != null) 'dedupeRecords': dedupeRecords,
      if (dedupeStrategy != null) 'dedupeStrategy': dedupeStrategy,
      if (loadType != null) 'loadType': loadType.value,
    };
  }
}

/// @nodoc
class DataIntegrationFlowLoadType {
  static const incremental = DataIntegrationFlowLoadType._('INCREMENTAL');
  static const replace = DataIntegrationFlowLoadType._('REPLACE');

  final String value;

  const DataIntegrationFlowLoadType._(this.value);

  static const values = [incremental, replace];

  static DataIntegrationFlowLoadType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationFlowLoadType._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationFlowLoadType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The deduplication strategy details.
///
/// @nodoc
class DataIntegrationFlowDedupeStrategy {
  /// The type of the deduplication strategy.
  ///
  /// <ul>
  /// <li>
  /// <b>FIELD_PRIORITY</b> - Field priority configuration for the deduplication
  /// strategy specifies an ordered list of fields used to tie-break the data
  /// records sharing the same primary key values. Fields earlier in the list have
  /// higher priority for evaluation. For each field, the sort order determines
  /// whether to retain data record with larger or smaller field value.
  /// </li>
  /// </ul>
  final DataIntegrationFlowDedupeStrategyType type;

  /// The field priority deduplication strategy.
  final DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration?
      fieldPriority;

  DataIntegrationFlowDedupeStrategy({
    required this.type,
    this.fieldPriority,
  });

  factory DataIntegrationFlowDedupeStrategy.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowDedupeStrategy(
      type: DataIntegrationFlowDedupeStrategyType.fromString(
          (json['type'] as String?) ?? ''),
      fieldPriority: json['fieldPriority'] != null
          ? DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration
              .fromJson(json['fieldPriority'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final fieldPriority = this.fieldPriority;
    return {
      'type': type.value,
      if (fieldPriority != null) 'fieldPriority': fieldPriority,
    };
  }
}

/// @nodoc
class DataIntegrationFlowDedupeStrategyType {
  static const fieldPriority =
      DataIntegrationFlowDedupeStrategyType._('FIELD_PRIORITY');

  final String value;

  const DataIntegrationFlowDedupeStrategyType._(this.value);

  static const values = [fieldPriority];

  static DataIntegrationFlowDedupeStrategyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationFlowDedupeStrategyType._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationFlowDedupeStrategyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The field priority deduplication strategy details.
///
/// @nodoc
class DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration {
  /// The list of field names and their sort order for deduplication, arranged in
  /// descending priority from highest to lowest.
  final List<DataIntegrationFlowFieldPriorityDedupeField> fields;

  DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration({
    required this.fields,
  });

  factory DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowFieldPriorityDedupeStrategyConfiguration(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataIntegrationFlowFieldPriorityDedupeField.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      'fields': fields,
    };
  }
}

/// The field used in the field priority deduplication strategy.
///
/// @nodoc
class DataIntegrationFlowFieldPriorityDedupeField {
  /// The name of the deduplication field. Must exist in the dataset and not be a
  /// primary key.
  final String name;

  /// The sort order for the deduplication field.
  final DataIntegrationFlowFieldPriorityDedupeSortOrder sortOrder;

  DataIntegrationFlowFieldPriorityDedupeField({
    required this.name,
    required this.sortOrder,
  });

  factory DataIntegrationFlowFieldPriorityDedupeField.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowFieldPriorityDedupeField(
      name: (json['name'] as String?) ?? '',
      sortOrder: DataIntegrationFlowFieldPriorityDedupeSortOrder.fromString(
          (json['sortOrder'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sortOrder = this.sortOrder;
    return {
      'name': name,
      'sortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class DataIntegrationFlowFieldPriorityDedupeSortOrder {
  static const asc = DataIntegrationFlowFieldPriorityDedupeSortOrder._('ASC');
  static const desc = DataIntegrationFlowFieldPriorityDedupeSortOrder._('DESC');

  final String value;

  const DataIntegrationFlowFieldPriorityDedupeSortOrder._(this.value);

  static const values = [asc, desc];

  static DataIntegrationFlowFieldPriorityDedupeSortOrder fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              DataIntegrationFlowFieldPriorityDedupeSortOrder._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationFlowFieldPriorityDedupeSortOrder &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon S3 options used in S3 source and target configurations.
///
/// @nodoc
class DataIntegrationFlowS3Options {
  /// The Amazon S3 file type in S3 options.
  final DataIntegrationFlowFileType? fileType;

  DataIntegrationFlowS3Options({
    this.fileType,
  });

  factory DataIntegrationFlowS3Options.fromJson(Map<String, dynamic> json) {
    return DataIntegrationFlowS3Options(
      fileType: (json['fileType'] as String?)
          ?.let(DataIntegrationFlowFileType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final fileType = this.fileType;
    return {
      if (fileType != null) 'fileType': fileType.value,
    };
  }
}

/// @nodoc
class DataIntegrationFlowFileType {
  static const csv = DataIntegrationFlowFileType._('CSV');
  static const parquet = DataIntegrationFlowFileType._('PARQUET');
  static const json = DataIntegrationFlowFileType._('JSON');

  final String value;

  const DataIntegrationFlowFileType._(this.value);

  static const values = [csv, parquet, json];

  static DataIntegrationFlowFileType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationFlowFileType._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationFlowFileType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DataIntegrationFlowTransformationType {
  static const sql = DataIntegrationFlowTransformationType._('SQL');
  static const none = DataIntegrationFlowTransformationType._('NONE');

  final String value;

  const DataIntegrationFlowTransformationType._(this.value);

  static const values = [sql, none];

  static DataIntegrationFlowTransformationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationFlowTransformationType._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationFlowTransformationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The SQL DataIntegrationFlow transformation configuration parameters.
///
/// @nodoc
class DataIntegrationFlowSQLTransformationConfiguration {
  /// The transformation SQL query body based on SparkSQL.
  final String query;

  DataIntegrationFlowSQLTransformationConfiguration({
    required this.query,
  });

  factory DataIntegrationFlowSQLTransformationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowSQLTransformationConfiguration(
      query: (json['query'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final query = this.query;
    return {
      'query': query,
    };
  }
}

/// The DataIntegrationFlow source parameters.
///
/// @nodoc
class DataIntegrationFlowSource {
  /// The DataIntegrationFlow source name that can be used as table alias in SQL
  /// transformation query.
  final String sourceName;

  /// The DataIntegrationFlow source type.
  final DataIntegrationFlowSourceType sourceType;

  /// The dataset DataIntegrationFlow source.
  final DataIntegrationFlowDatasetSourceConfiguration? datasetSource;

  /// The S3 DataIntegrationFlow source.
  final DataIntegrationFlowS3SourceConfiguration? s3Source;

  DataIntegrationFlowSource({
    required this.sourceName,
    required this.sourceType,
    this.datasetSource,
    this.s3Source,
  });

  factory DataIntegrationFlowSource.fromJson(Map<String, dynamic> json) {
    return DataIntegrationFlowSource(
      sourceName: (json['sourceName'] as String?) ?? '',
      sourceType: DataIntegrationFlowSourceType.fromString(
          (json['sourceType'] as String?) ?? ''),
      datasetSource: json['datasetSource'] != null
          ? DataIntegrationFlowDatasetSourceConfiguration.fromJson(
              json['datasetSource'] as Map<String, dynamic>)
          : null,
      s3Source: json['s3Source'] != null
          ? DataIntegrationFlowS3SourceConfiguration.fromJson(
              json['s3Source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceName = this.sourceName;
    final sourceType = this.sourceType;
    final datasetSource = this.datasetSource;
    final s3Source = this.s3Source;
    return {
      'sourceName': sourceName,
      'sourceType': sourceType.value,
      if (datasetSource != null) 'datasetSource': datasetSource,
      if (s3Source != null) 's3Source': s3Source,
    };
  }
}

/// @nodoc
class DataIntegrationFlowSourceType {
  static const s3 = DataIntegrationFlowSourceType._('S3');
  static const dataset = DataIntegrationFlowSourceType._('DATASET');

  final String value;

  const DataIntegrationFlowSourceType._(this.value);

  static const values = [s3, dataset];

  static DataIntegrationFlowSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationFlowSourceType._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationFlowSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The S3 DataIntegrationFlow source configuration parameters.
///
/// @nodoc
class DataIntegrationFlowS3SourceConfiguration {
  /// The bucketName of the S3 source objects.
  final String bucketName;

  /// The prefix of the S3 source objects. To trigger data ingestion, S3 files
  /// need to be put under <code>s3://<i>bucketName</i>/<i>prefix</i>/</code>.
  final String prefix;

  /// The other options of the S3 DataIntegrationFlow source.
  final DataIntegrationFlowS3Options? options;

  DataIntegrationFlowS3SourceConfiguration({
    required this.bucketName,
    required this.prefix,
    this.options,
  });

  factory DataIntegrationFlowS3SourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowS3SourceConfiguration(
      bucketName: (json['bucketName'] as String?) ?? '',
      prefix: (json['prefix'] as String?) ?? '',
      options: json['options'] != null
          ? DataIntegrationFlowS3Options.fromJson(
              json['options'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final prefix = this.prefix;
    final options = this.options;
    return {
      'bucketName': bucketName,
      'prefix': prefix,
      if (options != null) 'options': options,
    };
  }
}

/// The dataset DataIntegrationFlow source configuration parameters.
///
/// @nodoc
class DataIntegrationFlowDatasetSourceConfiguration {
  /// The ARN of the dataset.
  final String datasetIdentifier;

  /// The dataset DataIntegrationFlow source options.
  final DataIntegrationFlowDatasetOptions? options;

  DataIntegrationFlowDatasetSourceConfiguration({
    required this.datasetIdentifier,
    this.options,
  });

  factory DataIntegrationFlowDatasetSourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowDatasetSourceConfiguration(
      datasetIdentifier: (json['datasetIdentifier'] as String?) ?? '',
      options: json['options'] != null
          ? DataIntegrationFlowDatasetOptions.fromJson(
              json['options'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetIdentifier = this.datasetIdentifier;
    final options = this.options;
    return {
      'datasetIdentifier': datasetIdentifier,
      if (options != null) 'options': options,
    };
  }
}

/// The BillOfMaterialsImportJob details.
///
/// @nodoc
class BillOfMaterialsImportJob {
  /// The BillOfMaterialsImportJob instanceId.
  final String instanceId;

  /// The BillOfMaterialsImportJob jobId.
  final String jobId;

  /// The S3 URI from which the CSV is read.
  final String s3uri;

  /// The BillOfMaterialsImportJob ConfigurationJobStatus.
  final ConfigurationJobStatus status;

  /// When the BillOfMaterialsImportJob has reached a terminal state, there will
  /// be a message.
  final String? message;

  BillOfMaterialsImportJob({
    required this.instanceId,
    required this.jobId,
    required this.s3uri,
    required this.status,
    this.message,
  });

  factory BillOfMaterialsImportJob.fromJson(Map<String, dynamic> json) {
    return BillOfMaterialsImportJob(
      instanceId: (json['instanceId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      s3uri: (json['s3uri'] as String?) ?? '',
      status:
          ConfigurationJobStatus.fromString((json['status'] as String?) ?? ''),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final jobId = this.jobId;
    final s3uri = this.s3uri;
    final status = this.status;
    final message = this.message;
    return {
      'instanceId': instanceId,
      'jobId': jobId,
      's3uri': s3uri,
      'status': status.value,
      if (message != null) 'message': message,
    };
  }
}

/// The status of the job.
///
/// @nodoc
class ConfigurationJobStatus {
  static const $new = ConfigurationJobStatus._('NEW');
  static const failed = ConfigurationJobStatus._('FAILED');
  static const inProgress = ConfigurationJobStatus._('IN_PROGRESS');
  static const queued = ConfigurationJobStatus._('QUEUED');
  static const success = ConfigurationJobStatus._('SUCCESS');

  final String value;

  const ConfigurationJobStatus._(this.value);

  static const values = [$new, failed, inProgress, queued, success];

  static ConfigurationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DataIntegrationEventType {
  static const scnDataForecast =
      DataIntegrationEventType._('scn.data.forecast');
  static const scnDataInventorylevel =
      DataIntegrationEventType._('scn.data.inventorylevel');
  static const scnDataInboundorder =
      DataIntegrationEventType._('scn.data.inboundorder');
  static const scnDataInboundorderline =
      DataIntegrationEventType._('scn.data.inboundorderline');
  static const scnDataInboundorderlineschedule =
      DataIntegrationEventType._('scn.data.inboundorderlineschedule');
  static const scnDataOutboundorderline =
      DataIntegrationEventType._('scn.data.outboundorderline');
  static const scnDataOutboundshipment =
      DataIntegrationEventType._('scn.data.outboundshipment');
  static const scnDataProcessheader =
      DataIntegrationEventType._('scn.data.processheader');
  static const scnDataProcessoperation =
      DataIntegrationEventType._('scn.data.processoperation');
  static const scnDataProcessproduct =
      DataIntegrationEventType._('scn.data.processproduct');
  static const scnDataReservation =
      DataIntegrationEventType._('scn.data.reservation');
  static const scnDataShipment =
      DataIntegrationEventType._('scn.data.shipment');
  static const scnDataShipmentstop =
      DataIntegrationEventType._('scn.data.shipmentstop');
  static const scnDataShipmentstoporder =
      DataIntegrationEventType._('scn.data.shipmentstoporder');
  static const scnDataSupplyplan =
      DataIntegrationEventType._('scn.data.supplyplan');
  static const scnDataDataset = DataIntegrationEventType._('scn.data.dataset');

  final String value;

  const DataIntegrationEventType._(this.value);

  static const values = [
    scnDataForecast,
    scnDataInventorylevel,
    scnDataInboundorder,
    scnDataInboundorderline,
    scnDataInboundorderlineschedule,
    scnDataOutboundorderline,
    scnDataOutboundshipment,
    scnDataProcessheader,
    scnDataProcessoperation,
    scnDataProcessproduct,
    scnDataReservation,
    scnDataShipment,
    scnDataShipmentstop,
    scnDataShipmentstoporder,
    scnDataSupplyplan,
    scnDataDataset
  ];

  static DataIntegrationEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationEventType._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The target dataset configuration for a DATASET event type.
///
/// @nodoc
class DataIntegrationEventDatasetTargetConfiguration {
  /// The datalake dataset ARN identifier.
  final String datasetIdentifier;

  /// The target dataset load operation type.
  final DataIntegrationEventDatasetOperationType operationType;

  DataIntegrationEventDatasetTargetConfiguration({
    required this.datasetIdentifier,
    required this.operationType,
  });

  Map<String, dynamic> toJson() {
    final datasetIdentifier = this.datasetIdentifier;
    final operationType = this.operationType;
    return {
      'datasetIdentifier': datasetIdentifier,
      'operationType': operationType.value,
    };
  }
}

/// @nodoc
class DataIntegrationEventDatasetOperationType {
  static const append = DataIntegrationEventDatasetOperationType._('APPEND');
  static const upsert = DataIntegrationEventDatasetOperationType._('UPSERT');
  static const delete = DataIntegrationEventDatasetOperationType._('DELETE');

  final String value;

  const DataIntegrationEventDatasetOperationType._(this.value);

  static const values = [append, upsert, delete];

  static DataIntegrationEventDatasetOperationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationEventDatasetOperationType._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationEventDatasetOperationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The flow execution details.
///
/// @nodoc
class DataIntegrationFlowExecution {
  /// The flow executionId.
  final String executionId;

  /// The flow execution's flowName.
  final String flowName;

  /// The flow execution's instanceId.
  final String instanceId;

  /// The flow execution end timestamp.
  final DateTime? endTime;

  /// The failure message (if any) of failed flow execution.
  final String? message;

  /// The flow execution output metadata.
  final DataIntegrationFlowExecutionOutputMetadata? outputMetadata;

  /// The source information for a flow execution.
  final DataIntegrationFlowExecutionSourceInfo? sourceInfo;

  /// The flow execution start timestamp.
  final DateTime? startTime;

  /// The status of flow execution.
  final DataIntegrationFlowExecutionStatus? status;

  DataIntegrationFlowExecution({
    required this.executionId,
    required this.flowName,
    required this.instanceId,
    this.endTime,
    this.message,
    this.outputMetadata,
    this.sourceInfo,
    this.startTime,
    this.status,
  });

  factory DataIntegrationFlowExecution.fromJson(Map<String, dynamic> json) {
    return DataIntegrationFlowExecution(
      executionId: (json['executionId'] as String?) ?? '',
      flowName: (json['flowName'] as String?) ?? '',
      instanceId: (json['instanceId'] as String?) ?? '',
      endTime: timeStampFromJson(json['endTime']),
      message: json['message'] as String?,
      outputMetadata: json['outputMetadata'] != null
          ? DataIntegrationFlowExecutionOutputMetadata.fromJson(
              json['outputMetadata'] as Map<String, dynamic>)
          : null,
      sourceInfo: json['sourceInfo'] != null
          ? DataIntegrationFlowExecutionSourceInfo.fromJson(
              json['sourceInfo'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)
          ?.let(DataIntegrationFlowExecutionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final flowName = this.flowName;
    final instanceId = this.instanceId;
    final endTime = this.endTime;
    final message = this.message;
    final outputMetadata = this.outputMetadata;
    final sourceInfo = this.sourceInfo;
    final startTime = this.startTime;
    final status = this.status;
    return {
      'executionId': executionId,
      'flowName': flowName,
      'instanceId': instanceId,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (message != null) 'message': message,
      if (outputMetadata != null) 'outputMetadata': outputMetadata,
      if (sourceInfo != null) 'sourceInfo': sourceInfo,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class DataIntegrationFlowExecutionStatus {
  static const succeeded = DataIntegrationFlowExecutionStatus._('SUCCEEDED');
  static const inProgress = DataIntegrationFlowExecutionStatus._('IN_PROGRESS');
  static const failed = DataIntegrationFlowExecutionStatus._('FAILED');

  final String value;

  const DataIntegrationFlowExecutionStatus._(this.value);

  static const values = [succeeded, inProgress, failed];

  static DataIntegrationFlowExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationFlowExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationFlowExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The source information of a flow execution.
///
/// @nodoc
class DataIntegrationFlowExecutionSourceInfo {
  /// The data integration flow execution source type.
  final DataIntegrationFlowSourceType sourceType;

  /// The source details of a flow execution with dataset source.
  final DataIntegrationFlowDatasetSource? datasetSource;

  /// The source details of a flow execution with S3 source.
  final DataIntegrationFlowS3Source? s3Source;

  DataIntegrationFlowExecutionSourceInfo({
    required this.sourceType,
    this.datasetSource,
    this.s3Source,
  });

  factory DataIntegrationFlowExecutionSourceInfo.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowExecutionSourceInfo(
      sourceType: DataIntegrationFlowSourceType.fromString(
          (json['sourceType'] as String?) ?? ''),
      datasetSource: json['datasetSource'] != null
          ? DataIntegrationFlowDatasetSource.fromJson(
              json['datasetSource'] as Map<String, dynamic>)
          : null,
      s3Source: json['s3Source'] != null
          ? DataIntegrationFlowS3Source.fromJson(
              json['s3Source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceType = this.sourceType;
    final datasetSource = this.datasetSource;
    final s3Source = this.s3Source;
    return {
      'sourceType': sourceType.value,
      if (datasetSource != null) 'datasetSource': datasetSource,
      if (s3Source != null) 's3Source': s3Source,
    };
  }
}

/// The output metadata of the flow execution.
///
/// @nodoc
class DataIntegrationFlowExecutionOutputMetadata {
  /// The S3 URI under which all diagnostic files (such as deduped records if any)
  /// are stored.
  final String? diagnosticReportsRootS3URI;

  DataIntegrationFlowExecutionOutputMetadata({
    this.diagnosticReportsRootS3URI,
  });

  factory DataIntegrationFlowExecutionOutputMetadata.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationFlowExecutionOutputMetadata(
      diagnosticReportsRootS3URI: json['diagnosticReportsRootS3URI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final diagnosticReportsRootS3URI = this.diagnosticReportsRootS3URI;
    return {
      if (diagnosticReportsRootS3URI != null)
        'diagnosticReportsRootS3URI': diagnosticReportsRootS3URI,
    };
  }
}

/// The details of a flow execution with S3 source.
///
/// @nodoc
class DataIntegrationFlowS3Source {
  /// The S3 bucket name of the S3 source.
  final String bucketName;

  /// The S3 object key of the S3 source.
  final String key;

  DataIntegrationFlowS3Source({
    required this.bucketName,
    required this.key,
  });

  factory DataIntegrationFlowS3Source.fromJson(Map<String, dynamic> json) {
    return DataIntegrationFlowS3Source(
      bucketName: (json['bucketName'] as String?) ?? '',
      key: (json['key'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final key = this.key;
    return {
      'bucketName': bucketName,
      'key': key,
    };
  }
}

/// The details of a flow execution with dataset source.
///
/// @nodoc
class DataIntegrationFlowDatasetSource {
  /// The ARN of the dataset source.
  final String datasetIdentifier;

  DataIntegrationFlowDatasetSource({
    required this.datasetIdentifier,
  });

  factory DataIntegrationFlowDatasetSource.fromJson(Map<String, dynamic> json) {
    return DataIntegrationFlowDatasetSource(
      datasetIdentifier: (json['datasetIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final datasetIdentifier = this.datasetIdentifier;
    return {
      'datasetIdentifier': datasetIdentifier,
    };
  }
}

/// The data integration event details.
///
/// @nodoc
class DataIntegrationEvent {
  /// Event identifier (for example, orderId for InboundOrder) used for data
  /// sharding or partitioning.
  final String eventGroupId;

  /// The unique event identifier.
  final String eventId;

  /// The event timestamp (in epoch seconds).
  final DateTime eventTimestamp;

  /// The data event type.
  final DataIntegrationEventType eventType;

  /// The AWS Supply Chain instance identifier.
  final String instanceId;

  /// The target dataset details for a DATASET event type.
  final DataIntegrationEventDatasetTargetDetails? datasetTargetDetails;

  DataIntegrationEvent({
    required this.eventGroupId,
    required this.eventId,
    required this.eventTimestamp,
    required this.eventType,
    required this.instanceId,
    this.datasetTargetDetails,
  });

  factory DataIntegrationEvent.fromJson(Map<String, dynamic> json) {
    return DataIntegrationEvent(
      eventGroupId: (json['eventGroupId'] as String?) ?? '',
      eventId: (json['eventId'] as String?) ?? '',
      eventTimestamp: nonNullableTimeStampFromJson(json['eventTimestamp'] ?? 0),
      eventType: DataIntegrationEventType.fromString(
          (json['eventType'] as String?) ?? ''),
      instanceId: (json['instanceId'] as String?) ?? '',
      datasetTargetDetails: json['datasetTargetDetails'] != null
          ? DataIntegrationEventDatasetTargetDetails.fromJson(
              json['datasetTargetDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventGroupId = this.eventGroupId;
    final eventId = this.eventId;
    final eventTimestamp = this.eventTimestamp;
    final eventType = this.eventType;
    final instanceId = this.instanceId;
    final datasetTargetDetails = this.datasetTargetDetails;
    return {
      'eventGroupId': eventGroupId,
      'eventId': eventId,
      'eventTimestamp': unixTimestampToJson(eventTimestamp),
      'eventType': eventType.value,
      'instanceId': instanceId,
      if (datasetTargetDetails != null)
        'datasetTargetDetails': datasetTargetDetails,
    };
  }
}

/// The target dataset details for a DATASET event type.
///
/// @nodoc
class DataIntegrationEventDatasetTargetDetails {
  /// The datalake dataset ARN identifier.
  final String datasetIdentifier;

  /// The target dataset load execution.
  final DataIntegrationEventDatasetLoadExecutionDetails datasetLoadExecution;

  /// The target dataset load operation type. The available options are:
  ///
  /// <ul>
  /// <li>
  /// <b>APPEND</b> - Add new records to the dataset. Noted that this operation
  /// type will just try to append records as-is without any primary key or
  /// partition constraints.
  /// </li>
  /// <li>
  /// <b>UPSERT</b> - Modify existing records in the dataset with primary key
  /// configured, events for datasets without primary keys are not allowed. If
  /// event data contains primary keys that match records in the dataset within
  /// same partition, then those existing records (in that partition) will be
  /// updated. If primary keys do not match, new records will be added. Note that
  /// if dataset contain records with duplicate primary key values in the same
  /// partition, those duplicate records will be deduped into one updated record.
  /// </li>
  /// <li>
  /// <b>DELETE</b> - Remove existing records in the dataset with primary key
  /// configured, events for datasets without primary keys are not allowed. If
  /// event data contains primary keys that match records in the dataset within
  /// same partition, then those existing records (in that partition) will be
  /// deleted. If primary keys do not match, no actions will be done. Note that if
  /// dataset contain records with duplicate primary key values in the same
  /// partition, all those duplicates will be removed.
  /// </li>
  /// </ul>
  final DataIntegrationEventDatasetOperationType operationType;

  DataIntegrationEventDatasetTargetDetails({
    required this.datasetIdentifier,
    required this.datasetLoadExecution,
    required this.operationType,
  });

  factory DataIntegrationEventDatasetTargetDetails.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationEventDatasetTargetDetails(
      datasetIdentifier: (json['datasetIdentifier'] as String?) ?? '',
      datasetLoadExecution:
          DataIntegrationEventDatasetLoadExecutionDetails.fromJson(
              (json['datasetLoadExecution'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      operationType: DataIntegrationEventDatasetOperationType.fromString(
          (json['operationType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final datasetIdentifier = this.datasetIdentifier;
    final datasetLoadExecution = this.datasetLoadExecution;
    final operationType = this.operationType;
    return {
      'datasetIdentifier': datasetIdentifier,
      'datasetLoadExecution': datasetLoadExecution,
      'operationType': operationType.value,
    };
  }
}

/// The target dataset load execution details.
///
/// @nodoc
class DataIntegrationEventDatasetLoadExecutionDetails {
  /// The event load execution status to target dataset.
  final DataIntegrationEventDatasetLoadStatus status;

  /// The failure message (if any) of failed event load execution to dataset.
  final String? message;

  DataIntegrationEventDatasetLoadExecutionDetails({
    required this.status,
    this.message,
  });

  factory DataIntegrationEventDatasetLoadExecutionDetails.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationEventDatasetLoadExecutionDetails(
      status: DataIntegrationEventDatasetLoadStatus.fromString(
          (json['status'] as String?) ?? ''),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final message = this.message;
    return {
      'status': status.value,
      if (message != null) 'message': message,
    };
  }
}

/// @nodoc
class DataIntegrationEventDatasetLoadStatus {
  static const succeeded = DataIntegrationEventDatasetLoadStatus._('SUCCEEDED');
  static const inProgress =
      DataIntegrationEventDatasetLoadStatus._('IN_PROGRESS');
  static const failed = DataIntegrationEventDatasetLoadStatus._('FAILED');

  final String value;

  const DataIntegrationEventDatasetLoadStatus._(this.value);

  static const values = [succeeded, inProgress, failed];

  static DataIntegrationEventDatasetLoadStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataIntegrationEventDatasetLoadStatus._(value));

  @override
  bool operator ==(other) =>
      other is DataIntegrationEventDatasetLoadStatus && other.value == value;

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
