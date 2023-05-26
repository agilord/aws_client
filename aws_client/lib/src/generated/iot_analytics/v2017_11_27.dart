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

/// IoT Analytics allows you to collect large amounts of device data, process
/// messages, and store them. You can then query the data and run sophisticated
/// analytics on it. IoT Analytics enables advanced data exploration through
/// integration with Jupyter Notebooks and data visualization through
/// integration with Amazon QuickSight.
///
/// Traditional analytics and business intelligence tools are designed to
/// process structured data. IoT data often comes from devices that record noisy
/// processes (such as temperature, motion, or sound). As a result the data from
/// these devices can have significant gaps, corrupted messages, and false
/// readings that must be cleaned up before analysis can occur. Also, IoT data
/// is often only meaningful in the context of other data from external sources.
///
/// IoT Analytics automates the steps required to analyze data from IoT devices.
/// IoT Analytics filters, transforms, and enriches IoT data before storing it
/// in a time-series data store for analysis. You can set up the service to
/// collect only the data you need from your devices, apply mathematical
/// transforms to process the data, and enrich the data with device-specific
/// metadata such as device type and location before storing it. Then, you can
/// analyze your data by running queries using the built-in SQL query engine, or
/// perform more complex analytics and machine learning inference. IoT Analytics
/// includes pre-built models for common IoT use cases so you can answer
/// questions like which devices are about to fail or which customers are at
/// risk of abandoning their wearable devices.
class IoTAnalytics {
  final _s.RestJsonProtocol _protocol;
  IoTAnalytics({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotanalytics',
            signingName: 'iotanalytics',
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

  /// Sends messages to a channel.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [channelName] :
  /// The name of the channel where the messages are sent.
  ///
  /// Parameter [messages] :
  /// The list of messages to be sent. Each message has the format: {
  /// "messageId": "string", "payload": "string"}.
  ///
  /// The field names of message payloads (data) that you send to IoT Analytics:
  ///
  /// <ul>
  /// <li>
  /// Must contain only alphanumeric characters and undescores (_). No other
  /// special characters are allowed.
  /// </li>
  /// <li>
  /// Must begin with an alphabetic character or single underscore (_).
  /// </li>
  /// <li>
  /// Cannot contain hyphens (-).
  /// </li>
  /// <li>
  /// In regular expression terms:
  /// "^[A-Za-z_]([A-Za-z0-9]*|[A-Za-z0-9][A-Za-z0-9_]*)$".
  /// </li>
  /// <li>
  /// Cannot be more than 255 characters.
  /// </li>
  /// <li>
  /// Are case insensitive. (Fields named foo and FOO in the same payload are
  /// considered duplicates.)
  /// </li>
  /// </ul>
  /// For example, {"temp_01": 29} or {"_temp_01": 29} are valid, but
  /// {"temp-01": 29}, {"01_temp": 29} or {"__temp_01": 29} are invalid in
  /// message payloads.
  Future<BatchPutMessageResponse> batchPutMessage({
    required String channelName,
    required List<Message> messages,
  }) async {
    final $payload = <String, dynamic>{
      'channelName': channelName,
      'messages': messages,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/messages/batch',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutMessageResponse.fromJson(response);
  }

  /// Cancels the reprocessing of data through the pipeline.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [pipelineName] :
  /// The name of pipeline for which data reprocessing is canceled.
  ///
  /// Parameter [reprocessingId] :
  /// The ID of the reprocessing task (returned by
  /// <code>StartPipelineReprocessing</code>).
  Future<void> cancelPipelineReprocessing({
    required String pipelineName,
    required String reprocessingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/pipelines/${Uri.encodeComponent(pipelineName)}/reprocessing/${Uri.encodeComponent(reprocessingId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to create a channel. A channel collects data from an MQTT topic and
  /// archives the raw, unprocessed messages before publishing the data to a
  /// pipeline.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  ///
  /// Parameter [channelStorage] :
  /// Where channel data is stored. You can choose one of
  /// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage.
  /// If not specified, the default is <code>serviceManagedS3</code>. You can't
  /// change this storage option after the channel is created.
  ///
  /// Parameter [retentionPeriod] :
  /// How long, in days, message data is kept for the channel. When
  /// <code>customerManagedS3</code> storage is selected, this parameter is
  /// ignored.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the channel.
  Future<CreateChannelResponse> createChannel({
    required String channelName,
    ChannelStorage? channelStorage,
    RetentionPeriod? retentionPeriod,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'channelName': channelName,
      if (channelStorage != null) 'channelStorage': channelStorage,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelResponse.fromJson(response);
  }

  /// Used to create a dataset. A dataset stores data retrieved from a data
  /// store by applying a <code>queryAction</code> (a SQL query) or a
  /// <code>containerAction</code> (executing a containerized application). This
  /// operation creates the skeleton of a dataset. The dataset can be populated
  /// manually by calling <code>CreateDatasetContent</code> or automatically
  /// according to a trigger you specify.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [actions] :
  /// A list of actions that create the dataset contents.
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset.
  ///
  /// Parameter [contentDeliveryRules] :
  /// When dataset contents are created, they are delivered to destinations
  /// specified here.
  ///
  /// Parameter [lateDataRules] :
  /// A list of data rules that send notifications to CloudWatch, when data
  /// arrives late. To specify <code>lateDataRules</code>, the dataset must use
  /// a <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_DeltaTime.html">DeltaTimer</a>
  /// filter.
  ///
  /// Parameter [retentionPeriod] :
  /// Optional. How long, in days, versions of dataset contents are kept for the
  /// dataset. If not specified or set to <code>null</code>, versions of dataset
  /// contents are retained for at most 90 days. The number of versions of
  /// dataset contents retained is determined by the
  /// <code>versioningConfiguration</code> parameter. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions">
  /// Keeping Multiple Versions of IoT Analytics datasets</a> in the <i>IoT
  /// Analytics User Guide</i>.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the dataset.
  ///
  /// Parameter [triggers] :
  /// A list of triggers. A trigger causes dataset contents to be populated at a
  /// specified time interval or when another dataset's contents are created.
  /// The list of triggers can be empty or contain up to five
  /// <code>DataSetTrigger</code> objects.
  ///
  /// Parameter [versioningConfiguration] :
  /// Optional. How many versions of dataset contents are kept. If not specified
  /// or set to null, only the latest version plus the latest succeeded version
  /// (if they are different) are kept for the time period specified by the
  /// <code>retentionPeriod</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions">Keeping
  /// Multiple Versions of IoT Analytics datasets</a> in the <i>IoT Analytics
  /// User Guide</i>.
  Future<CreateDatasetResponse> createDataset({
    required List<DatasetAction> actions,
    required String datasetName,
    List<DatasetContentDeliveryRule>? contentDeliveryRules,
    List<LateDataRule>? lateDataRules,
    RetentionPeriod? retentionPeriod,
    List<Tag>? tags,
    List<DatasetTrigger>? triggers,
    VersioningConfiguration? versioningConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'actions': actions,
      'datasetName': datasetName,
      if (contentDeliveryRules != null)
        'contentDeliveryRules': contentDeliveryRules,
      if (lateDataRules != null) 'lateDataRules': lateDataRules,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (tags != null) 'tags': tags,
      if (triggers != null) 'triggers': triggers,
      if (versioningConfiguration != null)
        'versioningConfiguration': versioningConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDatasetResponse.fromJson(response);
  }

  /// Creates the content of a dataset by applying a <code>queryAction</code> (a
  /// SQL query) or a <code>containerAction</code> (executing a containerized
  /// application).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset.
  ///
  /// Parameter [versionId] :
  /// The version ID of the dataset content. To specify <code>versionId</code>
  /// for a dataset content, the dataset must use a <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_DeltaTime.html">DeltaTimer</a>
  /// filter.
  Future<CreateDatasetContentResponse> createDatasetContent({
    required String datasetName,
    String? versionId,
  }) async {
    final $payload = <String, dynamic>{
      if (versionId != null) 'versionId': versionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasets/${Uri.encodeComponent(datasetName)}/content',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDatasetContentResponse.fromJson(response);
  }

  /// Creates a data store, which is a repository for messages.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [datastoreName] :
  /// The name of the data store.
  ///
  /// Parameter [datastorePartitions] :
  /// Contains information about the partition dimensions in a data store.
  ///
  /// Parameter [datastoreStorage] :
  /// Where data in a data store is stored.. You can choose
  /// <code>serviceManagedS3</code> storage, <code>customerManagedS3</code>
  /// storage, or <code>iotSiteWiseMultiLayerStorage</code> storage. The default
  /// is <code>serviceManagedS3</code>. You can't change the choice of Amazon S3
  /// storage after your data store is created.
  ///
  /// Parameter [fileFormatConfiguration] :
  /// Contains the configuration information of file formats. IoT Analytics data
  /// stores support JSON and <a href="https://parquet.apache.org/">Parquet</a>.
  ///
  /// The default file format is JSON. You can specify only one format.
  ///
  /// You can't change the file format after you create the data store.
  ///
  /// Parameter [retentionPeriod] :
  /// How long, in days, message data is kept for the data store. When
  /// <code>customerManagedS3</code> storage is selected, this parameter is
  /// ignored.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the data store.
  Future<CreateDatastoreResponse> createDatastore({
    required String datastoreName,
    DatastorePartitions? datastorePartitions,
    DatastoreStorage? datastoreStorage,
    FileFormatConfiguration? fileFormatConfiguration,
    RetentionPeriod? retentionPeriod,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'datastoreName': datastoreName,
      if (datastorePartitions != null)
        'datastorePartitions': datastorePartitions,
      if (datastoreStorage != null) 'datastoreStorage': datastoreStorage,
      if (fileFormatConfiguration != null)
        'fileFormatConfiguration': fileFormatConfiguration,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datastores',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDatastoreResponse.fromJson(response);
  }

  /// Creates a pipeline. A pipeline consumes messages from a channel and allows
  /// you to process the messages before storing them in a data store. You must
  /// specify both a <code>channel</code> and a <code>datastore</code> activity
  /// and, optionally, as many as 23 additional activities in the
  /// <code>pipelineActivities</code> array.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [pipelineActivities] :
  /// A list of <code>PipelineActivity</code> objects. Activities perform
  /// transformations on your messages, such as removing, renaming or adding
  /// message attributes; filtering messages based on attribute values; invoking
  /// your Lambda unctions on messages for advanced processing; or performing
  /// mathematical transformations to normalize device data.
  ///
  /// The list can be 2-25 <code>PipelineActivity</code> objects and must
  /// contain both a <code>channel</code> and a <code>datastore</code> activity.
  /// Each entry in the list must contain only one activity. For example:
  ///
  /// <code>pipelineActivities = [ { "channel": { ... } }, { "lambda": { ... }
  /// }, ... ]</code>
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the pipeline.
  Future<CreatePipelineResponse> createPipeline({
    required List<PipelineActivity> pipelineActivities,
    required String pipelineName,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'pipelineActivities': pipelineActivities,
      'pipelineName': pipelineName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/pipelines',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePipelineResponse.fromJson(response);
  }

  /// Deletes the specified channel.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [channelName] :
  /// The name of the channel to delete.
  Future<void> deleteChannel({
    required String channelName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(channelName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified dataset.
  ///
  /// You do not have to delete the content of the dataset before you perform
  /// this operation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset to delete.
  Future<void> deleteDataset({
    required String datasetName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/datasets/${Uri.encodeComponent(datasetName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the content of the specified dataset.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset whose content is deleted.
  ///
  /// Parameter [versionId] :
  /// The version of the dataset whose content is deleted. You can also use the
  /// strings "$LATEST" or "$LATEST_SUCCEEDED" to delete the latest or latest
  /// successfully completed data set. If not specified, "$LATEST_SUCCEEDED" is
  /// the default.
  Future<void> deleteDatasetContent({
    required String datasetName,
    String? versionId,
  }) async {
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/datasets/${Uri.encodeComponent(datasetName)}/content',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified data store.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datastoreName] :
  /// The name of the data store to delete.
  Future<void> deleteDatastore({
    required String datastoreName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/datastores/${Uri.encodeComponent(datastoreName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified pipeline.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline to delete.
  Future<void> deletePipeline({
    required String pipelineName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/pipelines/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about a channel.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [channelName] :
  /// The name of the channel whose information is retrieved.
  ///
  /// Parameter [includeStatistics] :
  /// If true, additional statistical information about the channel is included
  /// in the response. This feature can't be used with a channel whose S3
  /// storage is customer-managed.
  Future<DescribeChannelResponse> describeChannel({
    required String channelName,
    bool? includeStatistics,
  }) async {
    final $query = <String, List<String>>{
      if (includeStatistics != null)
        'includeStatistics': [includeStatistics.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelResponse.fromJson(response);
  }

  /// Retrieves information about a dataset.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset whose information is retrieved.
  Future<DescribeDatasetResponse> describeDataset({
    required String datasetName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasets/${Uri.encodeComponent(datasetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDatasetResponse.fromJson(response);
  }

  /// Retrieves information about a data store.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datastoreName] :
  /// The name of the data store
  ///
  /// Parameter [includeStatistics] :
  /// If true, additional statistical information about the data store is
  /// included in the response. This feature can't be used with a data store
  /// whose S3 storage is customer-managed.
  Future<DescribeDatastoreResponse> describeDatastore({
    required String datastoreName,
    bool? includeStatistics,
  }) async {
    final $query = <String, List<String>>{
      if (includeStatistics != null)
        'includeStatistics': [includeStatistics.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datastores/${Uri.encodeComponent(datastoreName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDatastoreResponse.fromJson(response);
  }

  /// Retrieves the current settings of the IoT Analytics logging options.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  Future<DescribeLoggingOptionsResponse> describeLoggingOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLoggingOptionsResponse.fromJson(response);
  }

  /// Retrieves information about a pipeline.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline whose information is retrieved.
  Future<DescribePipelineResponse> describePipeline({
    required String pipelineName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/pipelines/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePipelineResponse.fromJson(response);
  }

  /// Retrieves the contents of a dataset as presigned URIs.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset whose contents are retrieved.
  ///
  /// Parameter [versionId] :
  /// The version of the dataset whose contents are retrieved. You can also use
  /// the strings "$LATEST" or "$LATEST_SUCCEEDED" to retrieve the contents of
  /// the latest or latest successfully completed dataset. If not specified,
  /// "$LATEST_SUCCEEDED" is the default.
  Future<GetDatasetContentResponse> getDatasetContent({
    required String datasetName,
    String? versionId,
  }) async {
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasets/${Uri.encodeComponent(datasetName)}/content',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDatasetContentResponse.fromJson(response);
  }

  /// Retrieves a list of channels.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListChannelsResponse> listChannels({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// Lists information about dataset contents that have been created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset whose contents information you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [scheduledBefore] :
  /// A filter to limit results to those dataset contents whose creation is
  /// scheduled before the given time. See the field
  /// <code>triggers.schedule</code> in the <code>CreateDataset</code> request.
  /// (timestamp)
  ///
  /// Parameter [scheduledOnOrAfter] :
  /// A filter to limit results to those dataset contents whose creation is
  /// scheduled on or after the given time. See the field
  /// <code>triggers.schedule</code> in the <code>CreateDataset</code> request.
  /// (timestamp)
  Future<ListDatasetContentsResponse> listDatasetContents({
    required String datasetName,
    int? maxResults,
    String? nextToken,
    DateTime? scheduledBefore,
    DateTime? scheduledOnOrAfter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (scheduledBefore != null)
        'scheduledBefore': [_s.iso8601ToJson(scheduledBefore).toString()],
      if (scheduledOnOrAfter != null)
        'scheduledOnOrAfter': [_s.iso8601ToJson(scheduledOnOrAfter).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasets/${Uri.encodeComponent(datasetName)}/contents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDatasetContentsResponse.fromJson(response);
  }

  /// Retrieves information about datasets.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDatasetsResponse> listDatasets({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDatasetsResponse.fromJson(response);
  }

  /// Retrieves a list of data stores.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDatastoresResponse> listDatastores({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datastores',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDatastoresResponse.fromJson(response);
  }

  /// Retrieves a list of pipelines.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListPipelinesResponse> listPipelines({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/pipelines',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPipelinesResponse.fromJson(response);
  }

  /// Lists the tags (metadata) that you have assigned to the resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource whose tags you want to list.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Sets or updates the IoT Analytics logging options.
  ///
  /// If you update the value of any <code>loggingOptions</code> field, it takes
  /// up to one minute for the change to take effect. Also, if you change the
  /// policy attached to the role you specified in the <code>roleArn</code>
  /// field (for example, to correct an invalid policy), it takes up to five
  /// minutes for that change to take effect.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [loggingOptions] :
  /// The new values of the IoT Analytics logging options.
  Future<void> putLoggingOptions({
    required LoggingOptions loggingOptions,
  }) async {
    final $payload = <String, dynamic>{
      'loggingOptions': loggingOptions,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Simulates the results of running a pipeline activity on a message payload.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [payloads] :
  /// The sample message payloads on which the pipeline activity is run.
  ///
  /// Parameter [pipelineActivity] :
  /// The pipeline activity that is run. This must not be a channel activity or
  /// a data store activity because these activities are used in a pipeline only
  /// to load the original message and to store the (possibly) transformed
  /// message. If a Lambda activity is specified, only short-running Lambda
  /// functions (those with a timeout of less than 30 seconds or less) can be
  /// used.
  Future<RunPipelineActivityResponse> runPipelineActivity({
    required List<Uint8List> payloads,
    required PipelineActivity pipelineActivity,
  }) async {
    final $payload = <String, dynamic>{
      'payloads': payloads.map(base64Encode).toList(),
      'pipelineActivity': pipelineActivity,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/pipelineactivities/run',
      exceptionFnMap: _exceptionFns,
    );
    return RunPipelineActivityResponse.fromJson(response);
  }

  /// Retrieves a sample of messages from the specified channel ingested during
  /// the specified timeframe. Up to 10 messages can be retrieved.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [channelName] :
  /// The name of the channel whose message samples are retrieved.
  ///
  /// Parameter [endTime] :
  /// The end of the time window from which sample messages are retrieved.
  ///
  /// Parameter [maxMessages] :
  /// The number of sample messages to be retrieved. The limit is 10. The
  /// default is also 10.
  ///
  /// Parameter [startTime] :
  /// The start of the time window from which sample messages are retrieved.
  Future<SampleChannelDataResponse> sampleChannelData({
    required String channelName,
    DateTime? endTime,
    int? maxMessages,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxMessages',
      maxMessages,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (maxMessages != null) 'maxMessages': [maxMessages.toString()],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelName)}/sample',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SampleChannelDataResponse.fromJson(response);
  }

  /// Starts the reprocessing of raw message data through the pipeline.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline on which to start reprocessing.
  ///
  /// Parameter [channelMessages] :
  /// Specifies one or more sets of channel messages that you want to reprocess.
  ///
  /// If you use the <code>channelMessages</code> object, you must not specify a
  /// value for <code>startTime</code> and <code>endTime</code>.
  ///
  /// Parameter [endTime] :
  /// The end time (exclusive) of raw message data that is reprocessed.
  ///
  /// If you specify a value for the <code>endTime</code> parameter, you must
  /// not use the <code>channelMessages</code> object.
  ///
  /// Parameter [startTime] :
  /// The start time (inclusive) of raw message data that is reprocessed.
  ///
  /// If you specify a value for the <code>startTime</code> parameter, you must
  /// not use the <code>channelMessages</code> object.
  Future<StartPipelineReprocessingResponse> startPipelineReprocessing({
    required String pipelineName,
    ChannelMessages? channelMessages,
    DateTime? endTime,
    DateTime? startTime,
  }) async {
    final $payload = <String, dynamic>{
      if (channelMessages != null) 'channelMessages': channelMessages,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/pipelines/${Uri.encodeComponent(pipelineName)}/reprocessing',
      exceptionFnMap: _exceptionFns,
    );
    return StartPipelineReprocessingResponse.fromJson(response);
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// can be used to manage a resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource whose tags you want to modify.
  ///
  /// Parameter [tags] :
  /// The new or modified tags for the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource whose tags you want to remove.
  ///
  /// Parameter [tagKeys] :
  /// The keys of those tags which you want to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to update the settings of a channel.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [channelName] :
  /// The name of the channel to be updated.
  ///
  /// Parameter [channelStorage] :
  /// Where channel data is stored. You can choose one of
  /// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage.
  /// If not specified, the default is <code>serviceManagedS3</code>. You can't
  /// change this storage option after the channel is created.
  ///
  /// Parameter [retentionPeriod] :
  /// How long, in days, message data is kept for the channel. The retention
  /// period can't be updated if the channel's Amazon S3 storage is
  /// customer-managed.
  Future<void> updateChannel({
    required String channelName,
    ChannelStorage? channelStorage,
    RetentionPeriod? retentionPeriod,
  }) async {
    final $payload = <String, dynamic>{
      if (channelStorage != null) 'channelStorage': channelStorage,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(channelName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the settings of a dataset.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [actions] :
  /// A list of <code>DatasetAction</code> objects.
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset to update.
  ///
  /// Parameter [contentDeliveryRules] :
  /// When dataset contents are created, they are delivered to destinations
  /// specified here.
  ///
  /// Parameter [lateDataRules] :
  /// A list of data rules that send notifications to CloudWatch, when data
  /// arrives late. To specify <code>lateDataRules</code>, the dataset must use
  /// a <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_DeltaTime.html">DeltaTimer</a>
  /// filter.
  ///
  /// Parameter [retentionPeriod] :
  /// How long, in days, dataset contents are kept for the dataset.
  ///
  /// Parameter [triggers] :
  /// A list of <code>DatasetTrigger</code> objects. The list can be empty or
  /// can contain up to five <code>DatasetTrigger</code> objects.
  ///
  /// Parameter [versioningConfiguration] :
  /// Optional. How many versions of dataset contents are kept. If not specified
  /// or set to null, only the latest version plus the latest succeeded version
  /// (if they are different) are kept for the time period specified by the
  /// <code>retentionPeriod</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions">Keeping
  /// Multiple Versions of IoT Analytics datasets</a> in the <i>IoT Analytics
  /// User Guide</i>.
  Future<void> updateDataset({
    required List<DatasetAction> actions,
    required String datasetName,
    List<DatasetContentDeliveryRule>? contentDeliveryRules,
    List<LateDataRule>? lateDataRules,
    RetentionPeriod? retentionPeriod,
    List<DatasetTrigger>? triggers,
    VersioningConfiguration? versioningConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'actions': actions,
      if (contentDeliveryRules != null)
        'contentDeliveryRules': contentDeliveryRules,
      if (lateDataRules != null) 'lateDataRules': lateDataRules,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (triggers != null) 'triggers': triggers,
      if (versioningConfiguration != null)
        'versioningConfiguration': versioningConfiguration,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/datasets/${Uri.encodeComponent(datasetName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to update the settings of a data store.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datastoreName] :
  /// The name of the data store to be updated.
  ///
  /// Parameter [datastoreStorage] :
  /// Where data in a data store is stored.. You can choose
  /// <code>serviceManagedS3</code> storage, <code>customerManagedS3</code>
  /// storage, or <code>iotSiteWiseMultiLayerStorage</code> storage. The default
  /// is <code>serviceManagedS3</code>. You can't change the choice of Amazon S3
  /// storage after your data store is created.
  ///
  /// Parameter [fileFormatConfiguration] :
  /// Contains the configuration information of file formats. IoT Analytics data
  /// stores support JSON and <a href="https://parquet.apache.org/">Parquet</a>.
  ///
  /// The default file format is JSON. You can specify only one format.
  ///
  /// You can't change the file format after you create the data store.
  ///
  /// Parameter [retentionPeriod] :
  /// How long, in days, message data is kept for the data store. The retention
  /// period can't be updated if the data store's Amazon S3 storage is
  /// customer-managed.
  Future<void> updateDatastore({
    required String datastoreName,
    DatastoreStorage? datastoreStorage,
    FileFormatConfiguration? fileFormatConfiguration,
    RetentionPeriod? retentionPeriod,
  }) async {
    final $payload = <String, dynamic>{
      if (datastoreStorage != null) 'datastoreStorage': datastoreStorage,
      if (fileFormatConfiguration != null)
        'fileFormatConfiguration': fileFormatConfiguration,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/datastores/${Uri.encodeComponent(datastoreName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the settings of a pipeline. You must specify both a
  /// <code>channel</code> and a <code>datastore</code> activity and,
  /// optionally, as many as 23 additional activities in the
  /// <code>pipelineActivities</code> array.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [pipelineActivities] :
  /// A list of <code>PipelineActivity</code> objects. Activities perform
  /// transformations on your messages, such as removing, renaming or adding
  /// message attributes; filtering messages based on attribute values; invoking
  /// your Lambda functions on messages for advanced processing; or performing
  /// mathematical transformations to normalize device data.
  ///
  /// The list can be 2-25 <code>PipelineActivity</code> objects and must
  /// contain both a <code>channel</code> and a <code>datastore</code> activity.
  /// Each entry in the list must contain only one activity. For example:
  ///
  /// <code>pipelineActivities = [ { "channel": { ... } }, { "lambda": { ... }
  /// }, ... ]</code>
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline to update.
  Future<void> updatePipeline({
    required List<PipelineActivity> pipelineActivities,
    required String pipelineName,
  }) async {
    final $payload = <String, dynamic>{
      'pipelineActivities': pipelineActivities,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/pipelines/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// An activity that adds other attributes based on existing attributes in the
/// message.
class AddAttributesActivity {
  /// A list of 1-50 <code>AttributeNameMapping</code> objects that map an
  /// existing attribute to a new attribute.
  /// <note>
  /// The existing attributes remain in the message, so if you want to remove the
  /// originals, use <code>RemoveAttributeActivity</code>.
  /// </note>
  final Map<String, String> attributes;

  /// The name of the addAttributes activity.
  final String name;

  /// The next activity in the pipeline.
  final String? next;

  AddAttributesActivity({
    required this.attributes,
    required this.name,
    this.next,
  });

  factory AddAttributesActivity.fromJson(Map<String, dynamic> json) {
    return AddAttributesActivity(
      attributes: (json['attributes'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final name = this.name;
    final next = this.next;
    return {
      'attributes': attributes,
      'name': name,
      if (next != null) 'next': next,
    };
  }
}

/// Contains informations about errors.
class BatchPutMessageErrorEntry {
  /// The code associated with the error.
  final String? errorCode;

  /// The message associated with the error.
  final String? errorMessage;

  /// The ID of the message that caused the error. See the value corresponding to
  /// the <code>messageId</code> key in the message object.
  final String? messageId;

  BatchPutMessageErrorEntry({
    this.errorCode,
    this.errorMessage,
    this.messageId,
  });

  factory BatchPutMessageErrorEntry.fromJson(Map<String, dynamic> json) {
    return BatchPutMessageErrorEntry(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      messageId: json['messageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final messageId = this.messageId;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (messageId != null) 'messageId': messageId,
    };
  }
}

class BatchPutMessageResponse {
  /// A list of any errors encountered when sending the messages to the channel.
  final List<BatchPutMessageErrorEntry>? batchPutMessageErrorEntries;

  BatchPutMessageResponse({
    this.batchPutMessageErrorEntries,
  });

  factory BatchPutMessageResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutMessageResponse(
      batchPutMessageErrorEntries:
          (json['batchPutMessageErrorEntries'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  BatchPutMessageErrorEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final batchPutMessageErrorEntries = this.batchPutMessageErrorEntries;
    return {
      if (batchPutMessageErrorEntries != null)
        'batchPutMessageErrorEntries': batchPutMessageErrorEntries,
    };
  }
}

class CancelPipelineReprocessingResponse {
  CancelPipelineReprocessingResponse();

  factory CancelPipelineReprocessingResponse.fromJson(Map<String, dynamic> _) {
    return CancelPipelineReprocessingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A collection of data from an MQTT topic. Channels archive the raw,
/// unprocessed messages before publishing the data to a pipeline.
class Channel {
  /// The ARN of the channel.
  final String? arn;

  /// When the channel was created.
  final DateTime? creationTime;

  /// The last time when a new message arrived in the channel.
  ///
  /// IoT Analytics updates this value at most once per minute for one channel.
  /// Hence, the <code>lastMessageArrivalTime</code> value is an approximation.
  ///
  /// This feature only applies to messages that arrived in the data store after
  /// October 23, 2020.
  final DateTime? lastMessageArrivalTime;

  /// When the channel was last updated.
  final DateTime? lastUpdateTime;

  /// The name of the channel.
  final String? name;

  /// How long, in days, message data is kept for the channel.
  final RetentionPeriod? retentionPeriod;

  /// The status of the channel.
  final ChannelStatus? status;

  /// Where channel data is stored. You can choose one of
  /// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage. If
  /// not specified, the default is <code>serviceManagedS3</code>. You can't
  /// change this storage option after the channel is created.
  final ChannelStorage? storage;

  Channel({
    this.arn,
    this.creationTime,
    this.lastMessageArrivalTime,
    this.lastUpdateTime,
    this.name,
    this.retentionPeriod,
    this.status,
    this.storage,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      lastMessageArrivalTime: timeStampFromJson(json['lastMessageArrivalTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
      retentionPeriod: json['retentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['retentionPeriod'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toChannelStatus(),
      storage: json['storage'] != null
          ? ChannelStorage.fromJson(json['storage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final lastMessageArrivalTime = this.lastMessageArrivalTime;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final retentionPeriod = this.retentionPeriod;
    final status = this.status;
    final storage = this.storage;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastMessageArrivalTime != null)
        'lastMessageArrivalTime': unixTimestampToJson(lastMessageArrivalTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (name != null) 'name': name,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (status != null) 'status': status.toValue(),
      if (storage != null) 'storage': storage,
    };
  }
}

/// The activity that determines the source of the messages to be processed.
class ChannelActivity {
  /// The name of the channel from which the messages are processed.
  final String channelName;

  /// The name of the channel activity.
  final String name;

  /// The next activity in the pipeline.
  final String? next;

  ChannelActivity({
    required this.channelName,
    required this.name,
    this.next,
  });

  factory ChannelActivity.fromJson(Map<String, dynamic> json) {
    return ChannelActivity(
      channelName: json['channelName'] as String,
      name: json['name'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelName = this.channelName;
    final name = this.name;
    final next = this.next;
    return {
      'channelName': channelName,
      'name': name,
      if (next != null) 'next': next,
    };
  }
}

/// Specifies one or more sets of channel messages.
class ChannelMessages {
  /// Specifies one or more keys that identify the Amazon Simple Storage Service
  /// (Amazon S3) objects that save your channel messages.
  ///
  /// You must use the full path for the key.
  ///
  /// Example path: <code>channel/mychannel/__dt=2020-02-29
  /// 00:00:00/1582940490000_1582940520000_123456789012_mychannel_0_2118.0.json.gz</code>
  final List<String>? s3Paths;

  ChannelMessages({
    this.s3Paths,
  });

  Map<String, dynamic> toJson() {
    final s3Paths = this.s3Paths;
    return {
      if (s3Paths != null) 's3Paths': s3Paths,
    };
  }
}

/// Statistics information about the channel.
class ChannelStatistics {
  /// The estimated size of the channel.
  final EstimatedResourceSize? size;

  ChannelStatistics({
    this.size,
  });

  factory ChannelStatistics.fromJson(Map<String, dynamic> json) {
    return ChannelStatistics(
      size: json['size'] != null
          ? EstimatedResourceSize.fromJson(json['size'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    return {
      if (size != null) 'size': size,
    };
  }
}

enum ChannelStatus {
  creating,
  active,
  deleting,
}

extension ChannelStatusValueExtension on ChannelStatus {
  String toValue() {
    switch (this) {
      case ChannelStatus.creating:
        return 'CREATING';
      case ChannelStatus.active:
        return 'ACTIVE';
      case ChannelStatus.deleting:
        return 'DELETING';
    }
  }
}

extension ChannelStatusFromString on String {
  ChannelStatus toChannelStatus() {
    switch (this) {
      case 'CREATING':
        return ChannelStatus.creating;
      case 'ACTIVE':
        return ChannelStatus.active;
      case 'DELETING':
        return ChannelStatus.deleting;
    }
    throw Exception('$this is not known in enum ChannelStatus');
  }
}

/// Where channel data is stored. You may choose one of
/// <code>serviceManagedS3</code>, <code>customerManagedS3</code> storage. If
/// not specified, the default is <code>serviceManagedS3</code>. This can't be
/// changed after creation of the channel.
class ChannelStorage {
  /// Used to store channel data in an S3 bucket that you manage. If customer
  /// managed storage is selected, the <code>retentionPeriod</code> parameter is
  /// ignored. You can't change the choice of S3 storage after the data store is
  /// created.
  final CustomerManagedChannelS3Storage? customerManagedS3;

  /// Used to store channel data in an S3 bucket managed by IoT Analytics. You
  /// can't change the choice of S3 storage after the data store is created.
  final ServiceManagedChannelS3Storage? serviceManagedS3;

  ChannelStorage({
    this.customerManagedS3,
    this.serviceManagedS3,
  });

  factory ChannelStorage.fromJson(Map<String, dynamic> json) {
    return ChannelStorage(
      customerManagedS3: json['customerManagedS3'] != null
          ? CustomerManagedChannelS3Storage.fromJson(
              json['customerManagedS3'] as Map<String, dynamic>)
          : null,
      serviceManagedS3: json['serviceManagedS3'] != null
          ? ServiceManagedChannelS3Storage.fromJson(
              json['serviceManagedS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManagedS3 = this.customerManagedS3;
    final serviceManagedS3 = this.serviceManagedS3;
    return {
      if (customerManagedS3 != null) 'customerManagedS3': customerManagedS3,
      if (serviceManagedS3 != null) 'serviceManagedS3': serviceManagedS3,
    };
  }
}

/// Where channel data is stored.
class ChannelStorageSummary {
  /// Used to store channel data in an S3 bucket that you manage.
  final CustomerManagedChannelS3StorageSummary? customerManagedS3;

  /// Used to store channel data in an S3 bucket managed by IoT Analytics.
  final ServiceManagedChannelS3StorageSummary? serviceManagedS3;

  ChannelStorageSummary({
    this.customerManagedS3,
    this.serviceManagedS3,
  });

  factory ChannelStorageSummary.fromJson(Map<String, dynamic> json) {
    return ChannelStorageSummary(
      customerManagedS3: json['customerManagedS3'] != null
          ? CustomerManagedChannelS3StorageSummary.fromJson(
              json['customerManagedS3'] as Map<String, dynamic>)
          : null,
      serviceManagedS3: json['serviceManagedS3'] != null
          ? ServiceManagedChannelS3StorageSummary.fromJson(
              json['serviceManagedS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManagedS3 = this.customerManagedS3;
    final serviceManagedS3 = this.serviceManagedS3;
    return {
      if (customerManagedS3 != null) 'customerManagedS3': customerManagedS3,
      if (serviceManagedS3 != null) 'serviceManagedS3': serviceManagedS3,
    };
  }
}

/// A summary of information about a channel.
class ChannelSummary {
  /// The name of the channel.
  final String? channelName;

  /// Where channel data is stored.
  final ChannelStorageSummary? channelStorage;

  /// When the channel was created.
  final DateTime? creationTime;

  /// The last time when a new message arrived in the channel.
  ///
  /// IoT Analytics updates this value at most once per minute for one channel.
  /// Hence, the <code>lastMessageArrivalTime</code> value is an approximation.
  ///
  /// This feature only applies to messages that arrived in the data store after
  /// October 23, 2020.
  final DateTime? lastMessageArrivalTime;

  /// The last time the channel was updated.
  final DateTime? lastUpdateTime;

  /// The status of the channel.
  final ChannelStatus? status;

  ChannelSummary({
    this.channelName,
    this.channelStorage,
    this.creationTime,
    this.lastMessageArrivalTime,
    this.lastUpdateTime,
    this.status,
  });

  factory ChannelSummary.fromJson(Map<String, dynamic> json) {
    return ChannelSummary(
      channelName: json['channelName'] as String?,
      channelStorage: json['channelStorage'] != null
          ? ChannelStorageSummary.fromJson(
              json['channelStorage'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['creationTime']),
      lastMessageArrivalTime: timeStampFromJson(json['lastMessageArrivalTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      status: (json['status'] as String?)?.toChannelStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelName = this.channelName;
    final channelStorage = this.channelStorage;
    final creationTime = this.creationTime;
    final lastMessageArrivalTime = this.lastMessageArrivalTime;
    final lastUpdateTime = this.lastUpdateTime;
    final status = this.status;
    return {
      if (channelName != null) 'channelName': channelName,
      if (channelStorage != null) 'channelStorage': channelStorage,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastMessageArrivalTime != null)
        'lastMessageArrivalTime': unixTimestampToJson(lastMessageArrivalTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Contains information about a column that stores your data.
class Column {
  /// The name of the column.
  final String name;

  /// The type of data. For more information about the supported data types, see
  /// <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-common.html">Common
  /// data types</a> in the <i>Glue Developer Guide</i>.
  final String type;

  Column({
    required this.name,
    required this.type,
  });

  factory Column.fromJson(Map<String, dynamic> json) {
    return Column(
      name: json['name'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type,
    };
  }
}

enum ComputeType {
  acu_1,
  acu_2,
}

extension ComputeTypeValueExtension on ComputeType {
  String toValue() {
    switch (this) {
      case ComputeType.acu_1:
        return 'ACU_1';
      case ComputeType.acu_2:
        return 'ACU_2';
    }
  }
}

extension ComputeTypeFromString on String {
  ComputeType toComputeType() {
    switch (this) {
      case 'ACU_1':
        return ComputeType.acu_1;
      case 'ACU_2':
        return ComputeType.acu_2;
    }
    throw Exception('$this is not known in enum ComputeType');
  }
}

/// Information required to run the <code>containerAction</code> to produce
/// dataset contents.
class ContainerDatasetAction {
  /// The ARN of the role that gives permission to the system to access required
  /// resources to run the <code>containerAction</code>. This includes, at
  /// minimum, permission to retrieve the dataset contents that are the input to
  /// the containerized application.
  final String executionRoleArn;

  /// The ARN of the Docker container stored in your account. The Docker container
  /// contains an application and required support libraries and is used to
  /// generate dataset contents.
  final String image;

  /// Configuration of the resource that executes the
  /// <code>containerAction</code>.
  final ResourceConfiguration resourceConfiguration;

  /// The values of variables used in the context of the execution of the
  /// containerized application (basically, parameters passed to the application).
  /// Each variable must have a name and a value given by one of
  /// <code>stringValue</code>, <code>datasetContentVersionValue</code>, or
  /// <code>outputFileUriValue</code>.
  final List<Variable>? variables;

  ContainerDatasetAction({
    required this.executionRoleArn,
    required this.image,
    required this.resourceConfiguration,
    this.variables,
  });

  factory ContainerDatasetAction.fromJson(Map<String, dynamic> json) {
    return ContainerDatasetAction(
      executionRoleArn: json['executionRoleArn'] as String,
      image: json['image'] as String,
      resourceConfiguration: ResourceConfiguration.fromJson(
          json['resourceConfiguration'] as Map<String, dynamic>),
      variables: (json['variables'] as List?)
          ?.whereNotNull()
          .map((e) => Variable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final executionRoleArn = this.executionRoleArn;
    final image = this.image;
    final resourceConfiguration = this.resourceConfiguration;
    final variables = this.variables;
    return {
      'executionRoleArn': executionRoleArn,
      'image': image,
      'resourceConfiguration': resourceConfiguration,
      if (variables != null) 'variables': variables,
    };
  }
}

class CreateChannelResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The name of the channel.
  final String? channelName;

  /// How long, in days, message data is kept for the channel.
  final RetentionPeriod? retentionPeriod;

  CreateChannelResponse({
    this.channelArn,
    this.channelName,
    this.retentionPeriod,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      channelArn: json['channelArn'] as String?,
      channelName: json['channelName'] as String?,
      retentionPeriod: json['retentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['retentionPeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final channelName = this.channelName;
    final retentionPeriod = this.retentionPeriod;
    return {
      if (channelArn != null) 'channelArn': channelArn,
      if (channelName != null) 'channelName': channelName,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
    };
  }
}

class CreateDatasetContentResponse {
  /// The version ID of the dataset contents that are being created.
  final String? versionId;

  CreateDatasetContentResponse({
    this.versionId,
  });

  factory CreateDatasetContentResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetContentResponse(
      versionId: json['versionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final versionId = this.versionId;
    return {
      if (versionId != null) 'versionId': versionId,
    };
  }
}

class CreateDatasetResponse {
  /// The ARN of the dataset.
  final String? datasetArn;

  /// The name of the dataset.
  final String? datasetName;

  /// How long, in days, dataset contents are kept for the dataset.
  final RetentionPeriod? retentionPeriod;

  CreateDatasetResponse({
    this.datasetArn,
    this.datasetName,
    this.retentionPeriod,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      datasetArn: json['datasetArn'] as String?,
      datasetName: json['datasetName'] as String?,
      retentionPeriod: json['retentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['retentionPeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final retentionPeriod = this.retentionPeriod;
    return {
      if (datasetArn != null) 'datasetArn': datasetArn,
      if (datasetName != null) 'datasetName': datasetName,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
    };
  }
}

class CreateDatastoreResponse {
  /// The ARN of the data store.
  final String? datastoreArn;

  /// The name of the data store.
  final String? datastoreName;

  /// How long, in days, message data is kept for the data store.
  final RetentionPeriod? retentionPeriod;

  CreateDatastoreResponse({
    this.datastoreArn,
    this.datastoreName,
    this.retentionPeriod,
  });

  factory CreateDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatastoreResponse(
      datastoreArn: json['datastoreArn'] as String?,
      datastoreName: json['datastoreName'] as String?,
      retentionPeriod: json['retentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['retentionPeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreArn = this.datastoreArn;
    final datastoreName = this.datastoreName;
    final retentionPeriod = this.retentionPeriod;
    return {
      if (datastoreArn != null) 'datastoreArn': datastoreArn,
      if (datastoreName != null) 'datastoreName': datastoreName,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
    };
  }
}

class CreatePipelineResponse {
  /// The ARN of the pipeline.
  final String? pipelineArn;

  /// The name of the pipeline.
  final String? pipelineName;

  CreatePipelineResponse({
    this.pipelineArn,
    this.pipelineName,
  });

  factory CreatePipelineResponse.fromJson(Map<String, dynamic> json) {
    return CreatePipelineResponse(
      pipelineArn: json['pipelineArn'] as String?,
      pipelineName: json['pipelineName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineArn = this.pipelineArn;
    final pipelineName = this.pipelineName;
    return {
      if (pipelineArn != null) 'pipelineArn': pipelineArn,
      if (pipelineName != null) 'pipelineName': pipelineName,
    };
  }
}

/// Used to store channel data in an S3 bucket that you manage. If
/// customer-managed storage is selected, the <code>retentionPeriod</code>
/// parameter is ignored. You can't change the choice of S3 storage after the
/// data store is created.
class CustomerManagedChannelS3Storage {
  /// The name of the S3 bucket in which channel data is stored.
  final String bucket;

  /// The ARN of the role that grants IoT Analytics permission to interact with
  /// your Amazon S3 resources.
  final String roleArn;

  /// (Optional) The prefix used to create the keys of the channel data objects.
  /// Each object in an S3 bucket has a key that is its unique identifier in the
  /// bucket. Each object in a bucket has exactly one key. The prefix must end
  /// with a forward slash (/).
  final String? keyPrefix;

  CustomerManagedChannelS3Storage({
    required this.bucket,
    required this.roleArn,
    this.keyPrefix,
  });

  factory CustomerManagedChannelS3Storage.fromJson(Map<String, dynamic> json) {
    return CustomerManagedChannelS3Storage(
      bucket: json['bucket'] as String,
      roleArn: json['roleArn'] as String,
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final roleArn = this.roleArn;
    final keyPrefix = this.keyPrefix;
    return {
      'bucket': bucket,
      'roleArn': roleArn,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// Used to store channel data in an S3 bucket that you manage.
class CustomerManagedChannelS3StorageSummary {
  /// The name of the S3 bucket in which channel data is stored.
  final String? bucket;

  /// (Optional) The prefix used to create the keys of the channel data objects.
  /// Each object in an S3 bucket has a key that is its unique identifier within
  /// the bucket (each object in a bucket has exactly one key). The prefix must
  /// end with a forward slash (/).
  final String? keyPrefix;

  /// The ARN of the role that grants IoT Analytics permission to interact with
  /// your Amazon S3 resources.
  final String? roleArn;

  CustomerManagedChannelS3StorageSummary({
    this.bucket,
    this.keyPrefix,
    this.roleArn,
  });

  factory CustomerManagedChannelS3StorageSummary.fromJson(
      Map<String, dynamic> json) {
    return CustomerManagedChannelS3StorageSummary(
      bucket: json['bucket'] as String?,
      keyPrefix: json['keyPrefix'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    final roleArn = this.roleArn;
    return {
      if (bucket != null) 'bucket': bucket,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// S3-customer-managed; When you choose customer-managed storage, the
/// <code>retentionPeriod</code> parameter is ignored. You can't change the
/// choice of Amazon S3 storage after your data store is created.
class CustomerManagedDatastoreS3Storage {
  /// The name of the Amazon S3 bucket where your data is stored.
  final String bucket;

  /// The ARN of the role that grants IoT Analytics permission to interact with
  /// your Amazon S3 resources.
  final String roleArn;

  /// (Optional) The prefix used to create the keys of the data store data
  /// objects. Each object in an Amazon S3 bucket has a key that is its unique
  /// identifier in the bucket. Each object in a bucket has exactly one key. The
  /// prefix must end with a forward slash (/).
  final String? keyPrefix;

  CustomerManagedDatastoreS3Storage({
    required this.bucket,
    required this.roleArn,
    this.keyPrefix,
  });

  factory CustomerManagedDatastoreS3Storage.fromJson(
      Map<String, dynamic> json) {
    return CustomerManagedDatastoreS3Storage(
      bucket: json['bucket'] as String,
      roleArn: json['roleArn'] as String,
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final roleArn = this.roleArn;
    final keyPrefix = this.keyPrefix;
    return {
      'bucket': bucket,
      'roleArn': roleArn,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// Contains information about the data store that you manage.
class CustomerManagedDatastoreS3StorageSummary {
  /// The name of the Amazon S3 bucket where your data is stored.
  final String? bucket;

  /// (Optional) The prefix used to create the keys of the data store data
  /// objects. Each object in an Amazon S3 bucket has a key that is its unique
  /// identifier in the bucket. Each object in a bucket has exactly one key. The
  /// prefix must end with a forward slash (/).
  final String? keyPrefix;

  /// The ARN of the role that grants IoT Analytics permission to interact with
  /// your Amazon S3 resources.
  final String? roleArn;

  CustomerManagedDatastoreS3StorageSummary({
    this.bucket,
    this.keyPrefix,
    this.roleArn,
  });

  factory CustomerManagedDatastoreS3StorageSummary.fromJson(
      Map<String, dynamic> json) {
    return CustomerManagedDatastoreS3StorageSummary(
      bucket: json['bucket'] as String?,
      keyPrefix: json['keyPrefix'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    final roleArn = this.roleArn;
    return {
      if (bucket != null) 'bucket': bucket,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Information about a dataset.
class Dataset {
  /// The <code>DatasetAction</code> objects that automatically create the dataset
  /// contents.
  final List<DatasetAction>? actions;

  /// The ARN of the dataset.
  final String? arn;

  /// When dataset contents are created they are delivered to destinations
  /// specified here.
  final List<DatasetContentDeliveryRule>? contentDeliveryRules;

  /// When the dataset was created.
  final DateTime? creationTime;

  /// The last time the dataset was updated.
  final DateTime? lastUpdateTime;

  /// A list of data rules that send notifications to CloudWatch, when data
  /// arrives late. To specify <code>lateDataRules</code>, the dataset must use a
  /// <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_DeltaTime.html">DeltaTimer</a>
  /// filter.
  final List<LateDataRule>? lateDataRules;

  /// The name of the dataset.
  final String? name;

  /// Optional. How long, in days, message data is kept for the dataset.
  final RetentionPeriod? retentionPeriod;

  /// The status of the dataset.
  final DatasetStatus? status;

  /// The <code>DatasetTrigger</code> objects that specify when the dataset is
  /// automatically updated.
  final List<DatasetTrigger>? triggers;

  /// Optional. How many versions of dataset contents are kept. If not specified
  /// or set to null, only the latest version plus the latest succeeded version
  /// (if they are different) are kept for the time period specified by the
  /// <code>retentionPeriod</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions">
  /// Keeping Multiple Versions of IoT Analytics datasets</a> in the <i>IoT
  /// Analytics User Guide</i>.
  final VersioningConfiguration? versioningConfiguration;

  Dataset({
    this.actions,
    this.arn,
    this.contentDeliveryRules,
    this.creationTime,
    this.lastUpdateTime,
    this.lateDataRules,
    this.name,
    this.retentionPeriod,
    this.status,
    this.triggers,
    this.versioningConfiguration,
  });

  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['arn'] as String?,
      contentDeliveryRules: (json['contentDeliveryRules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DatasetContentDeliveryRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      lateDataRules: (json['lateDataRules'] as List?)
          ?.whereNotNull()
          .map((e) => LateDataRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      retentionPeriod: json['retentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['retentionPeriod'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toDatasetStatus(),
      triggers: (json['triggers'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetTrigger.fromJson(e as Map<String, dynamic>))
          .toList(),
      versioningConfiguration: json['versioningConfiguration'] != null
          ? VersioningConfiguration.fromJson(
              json['versioningConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final arn = this.arn;
    final contentDeliveryRules = this.contentDeliveryRules;
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final lateDataRules = this.lateDataRules;
    final name = this.name;
    final retentionPeriod = this.retentionPeriod;
    final status = this.status;
    final triggers = this.triggers;
    final versioningConfiguration = this.versioningConfiguration;
    return {
      if (actions != null) 'actions': actions,
      if (arn != null) 'arn': arn,
      if (contentDeliveryRules != null)
        'contentDeliveryRules': contentDeliveryRules,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (lateDataRules != null) 'lateDataRules': lateDataRules,
      if (name != null) 'name': name,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (status != null) 'status': status.toValue(),
      if (triggers != null) 'triggers': triggers,
      if (versioningConfiguration != null)
        'versioningConfiguration': versioningConfiguration,
    };
  }
}

/// A <code>DatasetAction</code> object that specifies how dataset contents are
/// automatically created.
class DatasetAction {
  /// The name of the dataset action by which dataset contents are automatically
  /// created.
  final String? actionName;

  /// Information that allows the system to run a containerized application to
  /// create the dataset contents. The application must be in a Docker container
  /// along with any required support libraries.
  final ContainerDatasetAction? containerAction;

  /// An <code>SqlQueryDatasetAction</code> object that uses an SQL query to
  /// automatically create dataset contents.
  final SqlQueryDatasetAction? queryAction;

  DatasetAction({
    this.actionName,
    this.containerAction,
    this.queryAction,
  });

  factory DatasetAction.fromJson(Map<String, dynamic> json) {
    return DatasetAction(
      actionName: json['actionName'] as String?,
      containerAction: json['containerAction'] != null
          ? ContainerDatasetAction.fromJson(
              json['containerAction'] as Map<String, dynamic>)
          : null,
      queryAction: json['queryAction'] != null
          ? SqlQueryDatasetAction.fromJson(
              json['queryAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final containerAction = this.containerAction;
    final queryAction = this.queryAction;
    return {
      if (actionName != null) 'actionName': actionName,
      if (containerAction != null) 'containerAction': containerAction,
      if (queryAction != null) 'queryAction': queryAction,
    };
  }
}

/// Information about the action that automatically creates the dataset's
/// contents.
class DatasetActionSummary {
  /// The name of the action that automatically creates the dataset's contents.
  final String? actionName;

  /// The type of action by which the dataset's contents are automatically
  /// created.
  final DatasetActionType? actionType;

  DatasetActionSummary({
    this.actionName,
    this.actionType,
  });

  factory DatasetActionSummary.fromJson(Map<String, dynamic> json) {
    return DatasetActionSummary(
      actionName: json['actionName'] as String?,
      actionType: (json['actionType'] as String?)?.toDatasetActionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final actionType = this.actionType;
    return {
      if (actionName != null) 'actionName': actionName,
      if (actionType != null) 'actionType': actionType.toValue(),
    };
  }
}

enum DatasetActionType {
  query,
  container,
}

extension DatasetActionTypeValueExtension on DatasetActionType {
  String toValue() {
    switch (this) {
      case DatasetActionType.query:
        return 'QUERY';
      case DatasetActionType.container:
        return 'CONTAINER';
    }
  }
}

extension DatasetActionTypeFromString on String {
  DatasetActionType toDatasetActionType() {
    switch (this) {
      case 'QUERY':
        return DatasetActionType.query;
      case 'CONTAINER':
        return DatasetActionType.container;
    }
    throw Exception('$this is not known in enum DatasetActionType');
  }
}

/// The destination to which dataset contents are delivered.
class DatasetContentDeliveryDestination {
  /// Configuration information for delivery of dataset contents to IoT Events.
  final IotEventsDestinationConfiguration? iotEventsDestinationConfiguration;

  /// Configuration information for delivery of dataset contents to Amazon S3.
  final S3DestinationConfiguration? s3DestinationConfiguration;

  DatasetContentDeliveryDestination({
    this.iotEventsDestinationConfiguration,
    this.s3DestinationConfiguration,
  });

  factory DatasetContentDeliveryDestination.fromJson(
      Map<String, dynamic> json) {
    return DatasetContentDeliveryDestination(
      iotEventsDestinationConfiguration:
          json['iotEventsDestinationConfiguration'] != null
              ? IotEventsDestinationConfiguration.fromJson(
                  json['iotEventsDestinationConfiguration']
                      as Map<String, dynamic>)
              : null,
      s3DestinationConfiguration: json['s3DestinationConfiguration'] != null
          ? S3DestinationConfiguration.fromJson(
              json['s3DestinationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iotEventsDestinationConfiguration =
        this.iotEventsDestinationConfiguration;
    final s3DestinationConfiguration = this.s3DestinationConfiguration;
    return {
      if (iotEventsDestinationConfiguration != null)
        'iotEventsDestinationConfiguration': iotEventsDestinationConfiguration,
      if (s3DestinationConfiguration != null)
        's3DestinationConfiguration': s3DestinationConfiguration,
    };
  }
}

/// When dataset contents are created, they are delivered to destination
/// specified here.
class DatasetContentDeliveryRule {
  /// The destination to which dataset contents are delivered.
  final DatasetContentDeliveryDestination destination;

  /// The name of the dataset content delivery rules entry.
  final String? entryName;

  DatasetContentDeliveryRule({
    required this.destination,
    this.entryName,
  });

  factory DatasetContentDeliveryRule.fromJson(Map<String, dynamic> json) {
    return DatasetContentDeliveryRule(
      destination: DatasetContentDeliveryDestination.fromJson(
          json['destination'] as Map<String, dynamic>),
      entryName: json['entryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final entryName = this.entryName;
    return {
      'destination': destination,
      if (entryName != null) 'entryName': entryName,
    };
  }
}

enum DatasetContentState {
  creating,
  succeeded,
  failed,
}

extension DatasetContentStateValueExtension on DatasetContentState {
  String toValue() {
    switch (this) {
      case DatasetContentState.creating:
        return 'CREATING';
      case DatasetContentState.succeeded:
        return 'SUCCEEDED';
      case DatasetContentState.failed:
        return 'FAILED';
    }
  }
}

extension DatasetContentStateFromString on String {
  DatasetContentState toDatasetContentState() {
    switch (this) {
      case 'CREATING':
        return DatasetContentState.creating;
      case 'SUCCEEDED':
        return DatasetContentState.succeeded;
      case 'FAILED':
        return DatasetContentState.failed;
    }
    throw Exception('$this is not known in enum DatasetContentState');
  }
}

/// The state of the dataset contents and the reason they are in this state.
class DatasetContentStatus {
  /// The reason the dataset contents are in this state.
  final String? reason;

  /// The state of the dataset contents. Can be one of READY, CREATING, SUCCEEDED,
  /// or FAILED.
  final DatasetContentState? state;

  DatasetContentStatus({
    this.reason,
    this.state,
  });

  factory DatasetContentStatus.fromJson(Map<String, dynamic> json) {
    return DatasetContentStatus(
      reason: json['reason'] as String?,
      state: (json['state'] as String?)?.toDatasetContentState(),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final state = this.state;
    return {
      if (reason != null) 'reason': reason,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// Summary information about dataset contents.
class DatasetContentSummary {
  /// The time the dataset content status was updated to SUCCEEDED or FAILED.
  final DateTime? completionTime;

  /// The actual time the creation of the dataset contents was started.
  final DateTime? creationTime;

  /// The time the creation of the dataset contents was scheduled to start.
  final DateTime? scheduleTime;

  /// The status of the dataset contents.
  final DatasetContentStatus? status;

  /// The version of the dataset contents.
  final String? version;

  DatasetContentSummary({
    this.completionTime,
    this.creationTime,
    this.scheduleTime,
    this.status,
    this.version,
  });

  factory DatasetContentSummary.fromJson(Map<String, dynamic> json) {
    return DatasetContentSummary(
      completionTime: timeStampFromJson(json['completionTime']),
      creationTime: timeStampFromJson(json['creationTime']),
      scheduleTime: timeStampFromJson(json['scheduleTime']),
      status: json['status'] != null
          ? DatasetContentStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final scheduleTime = this.scheduleTime;
    final status = this.status;
    final version = this.version;
    return {
      if (completionTime != null)
        'completionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (scheduleTime != null)
        'scheduleTime': unixTimestampToJson(scheduleTime),
      if (status != null) 'status': status,
      if (version != null) 'version': version,
    };
  }
}

/// The dataset whose latest contents are used as input to the notebook or
/// application.
class DatasetContentVersionValue {
  /// The name of the dataset whose latest contents are used as input to the
  /// notebook or application.
  final String datasetName;

  DatasetContentVersionValue({
    required this.datasetName,
  });

  factory DatasetContentVersionValue.fromJson(Map<String, dynamic> json) {
    return DatasetContentVersionValue(
      datasetName: json['datasetName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetName = this.datasetName;
    return {
      'datasetName': datasetName,
    };
  }
}

/// The reference to a dataset entry.
class DatasetEntry {
  /// The presigned URI of the dataset item.
  final String? dataURI;

  /// The name of the dataset item.
  final String? entryName;

  DatasetEntry({
    this.dataURI,
    this.entryName,
  });

  factory DatasetEntry.fromJson(Map<String, dynamic> json) {
    return DatasetEntry(
      dataURI: json['dataURI'] as String?,
      entryName: json['entryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataURI = this.dataURI;
    final entryName = this.entryName;
    return {
      if (dataURI != null) 'dataURI': dataURI,
      if (entryName != null) 'entryName': entryName,
    };
  }
}

enum DatasetStatus {
  creating,
  active,
  deleting,
}

extension DatasetStatusValueExtension on DatasetStatus {
  String toValue() {
    switch (this) {
      case DatasetStatus.creating:
        return 'CREATING';
      case DatasetStatus.active:
        return 'ACTIVE';
      case DatasetStatus.deleting:
        return 'DELETING';
    }
  }
}

extension DatasetStatusFromString on String {
  DatasetStatus toDatasetStatus() {
    switch (this) {
      case 'CREATING':
        return DatasetStatus.creating;
      case 'ACTIVE':
        return DatasetStatus.active;
      case 'DELETING':
        return DatasetStatus.deleting;
    }
    throw Exception('$this is not known in enum DatasetStatus');
  }
}

/// A summary of information about a dataset.
class DatasetSummary {
  /// A list of <code>DataActionSummary</code> objects.
  final List<DatasetActionSummary>? actions;

  /// The time the dataset was created.
  final DateTime? creationTime;

  /// The name of the dataset.
  final String? datasetName;

  /// The last time the dataset was updated.
  final DateTime? lastUpdateTime;

  /// The status of the dataset.
  final DatasetStatus? status;

  /// A list of triggers. A trigger causes dataset content to be populated at a
  /// specified time interval or when another dataset is populated. The list of
  /// triggers can be empty or contain up to five <code>DataSetTrigger</code>
  /// objects
  final List<DatasetTrigger>? triggers;

  DatasetSummary({
    this.actions,
    this.creationTime,
    this.datasetName,
    this.lastUpdateTime,
    this.status,
    this.triggers,
  });

  factory DatasetSummary.fromJson(Map<String, dynamic> json) {
    return DatasetSummary(
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationTime: timeStampFromJson(json['creationTime']),
      datasetName: json['datasetName'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      status: (json['status'] as String?)?.toDatasetStatus(),
      triggers: (json['triggers'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetTrigger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final creationTime = this.creationTime;
    final datasetName = this.datasetName;
    final lastUpdateTime = this.lastUpdateTime;
    final status = this.status;
    final triggers = this.triggers;
    return {
      if (actions != null) 'actions': actions,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (datasetName != null) 'datasetName': datasetName,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (status != null) 'status': status.toValue(),
      if (triggers != null) 'triggers': triggers,
    };
  }
}

/// The <code>DatasetTrigger</code> that specifies when the dataset is
/// automatically updated.
class DatasetTrigger {
  /// The dataset whose content creation triggers the creation of this dataset's
  /// contents.
  final TriggeringDataset? dataset;

  /// The Schedule when the trigger is initiated.
  final Schedule? schedule;

  DatasetTrigger({
    this.dataset,
    this.schedule,
  });

  factory DatasetTrigger.fromJson(Map<String, dynamic> json) {
    return DatasetTrigger(
      dataset: json['dataset'] != null
          ? TriggeringDataset.fromJson(json['dataset'] as Map<String, dynamic>)
          : null,
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    final schedule = this.schedule;
    return {
      if (dataset != null) 'dataset': dataset,
      if (schedule != null) 'schedule': schedule,
    };
  }
}

/// Information about a data store.
class Datastore {
  /// The ARN of the data store.
  final String? arn;

  /// When the data store was created.
  final DateTime? creationTime;

  /// Contains information about the partition dimensions in a data store.
  final DatastorePartitions? datastorePartitions;

  /// Contains the configuration information of file formats. IoT Analytics data
  /// stores support JSON and <a href="https://parquet.apache.org/">Parquet</a>.
  ///
  /// The default file format is JSON. You can specify only one format.
  ///
  /// You can't change the file format after you create the data store.
  final FileFormatConfiguration? fileFormatConfiguration;

  /// The last time when a new message arrived in the data store.
  ///
  /// IoT Analytics updates this value at most once per minute for Amazon Simple
  /// Storage Service one data store. Hence, the
  /// <code>lastMessageArrivalTime</code> value is an approximation.
  ///
  /// This feature only applies to messages that arrived in the data store after
  /// October 23, 2020.
  final DateTime? lastMessageArrivalTime;

  /// The last time the data store was updated.
  final DateTime? lastUpdateTime;

  /// The name of the data store.
  final String? name;

  /// How long, in days, message data is kept for the data store. When
  /// <code>customerManagedS3</code> storage is selected, this parameter is
  /// ignored.
  final RetentionPeriod? retentionPeriod;

  /// The status of a data store:
  /// <dl> <dt>CREATING</dt> <dd>
  /// The data store is being created.
  /// </dd> <dt>ACTIVE</dt> <dd>
  /// The data store has been created and can be used.
  /// </dd> <dt>DELETING</dt> <dd>
  /// The data store is being deleted.
  /// </dd> </dl>
  final DatastoreStatus? status;

  /// Where data in a data store is stored.. You can choose
  /// <code>serviceManagedS3</code> storage, <code>customerManagedS3</code>
  /// storage, or <code>iotSiteWiseMultiLayerStorage</code> storage. The default
  /// is <code>serviceManagedS3</code>. You can't change the choice of Amazon S3
  /// storage after your data store is created.
  final DatastoreStorage? storage;

  Datastore({
    this.arn,
    this.creationTime,
    this.datastorePartitions,
    this.fileFormatConfiguration,
    this.lastMessageArrivalTime,
    this.lastUpdateTime,
    this.name,
    this.retentionPeriod,
    this.status,
    this.storage,
  });

  factory Datastore.fromJson(Map<String, dynamic> json) {
    return Datastore(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      datastorePartitions: json['datastorePartitions'] != null
          ? DatastorePartitions.fromJson(
              json['datastorePartitions'] as Map<String, dynamic>)
          : null,
      fileFormatConfiguration: json['fileFormatConfiguration'] != null
          ? FileFormatConfiguration.fromJson(
              json['fileFormatConfiguration'] as Map<String, dynamic>)
          : null,
      lastMessageArrivalTime: timeStampFromJson(json['lastMessageArrivalTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
      retentionPeriod: json['retentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['retentionPeriod'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toDatastoreStatus(),
      storage: json['storage'] != null
          ? DatastoreStorage.fromJson(json['storage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final datastorePartitions = this.datastorePartitions;
    final fileFormatConfiguration = this.fileFormatConfiguration;
    final lastMessageArrivalTime = this.lastMessageArrivalTime;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final retentionPeriod = this.retentionPeriod;
    final status = this.status;
    final storage = this.storage;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (datastorePartitions != null)
        'datastorePartitions': datastorePartitions,
      if (fileFormatConfiguration != null)
        'fileFormatConfiguration': fileFormatConfiguration,
      if (lastMessageArrivalTime != null)
        'lastMessageArrivalTime': unixTimestampToJson(lastMessageArrivalTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (name != null) 'name': name,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (status != null) 'status': status.toValue(),
      if (storage != null) 'storage': storage,
    };
  }
}

/// The datastore activity that specifies where to store the processed data.
class DatastoreActivity {
  /// The name of the data store where processed messages are stored.
  final String datastoreName;

  /// The name of the datastore activity.
  final String name;

  DatastoreActivity({
    required this.datastoreName,
    required this.name,
  });

  factory DatastoreActivity.fromJson(Map<String, dynamic> json) {
    return DatastoreActivity(
      datastoreName: json['datastoreName'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreName = this.datastoreName;
    final name = this.name;
    return {
      'datastoreName': datastoreName,
      'name': name,
    };
  }
}

/// Used to store data used by IoT SiteWise in an Amazon S3 bucket that you
/// manage. You can't change the choice of Amazon S3 storage after your data
/// store is created.
class DatastoreIotSiteWiseMultiLayerStorage {
  /// Used to store data used by IoT SiteWise in an Amazon S3 bucket that you
  /// manage.
  final IotSiteWiseCustomerManagedDatastoreS3Storage customerManagedS3Storage;

  DatastoreIotSiteWiseMultiLayerStorage({
    required this.customerManagedS3Storage,
  });

  factory DatastoreIotSiteWiseMultiLayerStorage.fromJson(
      Map<String, dynamic> json) {
    return DatastoreIotSiteWiseMultiLayerStorage(
      customerManagedS3Storage:
          IotSiteWiseCustomerManagedDatastoreS3Storage.fromJson(
              json['customerManagedS3Storage'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final customerManagedS3Storage = this.customerManagedS3Storage;
    return {
      'customerManagedS3Storage': customerManagedS3Storage,
    };
  }
}

/// Contains information about the data store that you manage, which stores data
/// used by IoT SiteWise.
class DatastoreIotSiteWiseMultiLayerStorageSummary {
  /// Used to store data used by IoT SiteWise in an Amazon S3 bucket that you
  /// manage.
  final IotSiteWiseCustomerManagedDatastoreS3StorageSummary?
      customerManagedS3Storage;

  DatastoreIotSiteWiseMultiLayerStorageSummary({
    this.customerManagedS3Storage,
  });

  factory DatastoreIotSiteWiseMultiLayerStorageSummary.fromJson(
      Map<String, dynamic> json) {
    return DatastoreIotSiteWiseMultiLayerStorageSummary(
      customerManagedS3Storage: json['customerManagedS3Storage'] != null
          ? IotSiteWiseCustomerManagedDatastoreS3StorageSummary.fromJson(
              json['customerManagedS3Storage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManagedS3Storage = this.customerManagedS3Storage;
    return {
      if (customerManagedS3Storage != null)
        'customerManagedS3Storage': customerManagedS3Storage,
    };
  }
}

/// A single dimension to partition a data store. The dimension must be an
/// <code>AttributePartition</code> or a <code>TimestampPartition</code>.
class DatastorePartition {
  /// A partition dimension defined by an <code>attributeName</code>.
  final Partition? attributePartition;

  /// A partition dimension defined by a timestamp attribute.
  final TimestampPartition? timestampPartition;

  DatastorePartition({
    this.attributePartition,
    this.timestampPartition,
  });

  factory DatastorePartition.fromJson(Map<String, dynamic> json) {
    return DatastorePartition(
      attributePartition: json['attributePartition'] != null
          ? Partition.fromJson(
              json['attributePartition'] as Map<String, dynamic>)
          : null,
      timestampPartition: json['timestampPartition'] != null
          ? TimestampPartition.fromJson(
              json['timestampPartition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributePartition = this.attributePartition;
    final timestampPartition = this.timestampPartition;
    return {
      if (attributePartition != null) 'attributePartition': attributePartition,
      if (timestampPartition != null) 'timestampPartition': timestampPartition,
    };
  }
}

/// Contains information about the partition dimensions in a data store.
class DatastorePartitions {
  /// A list of partition dimensions in a data store.
  final List<DatastorePartition>? partitions;

  DatastorePartitions({
    this.partitions,
  });

  factory DatastorePartitions.fromJson(Map<String, dynamic> json) {
    return DatastorePartitions(
      partitions: (json['partitions'] as List?)
          ?.whereNotNull()
          .map((e) => DatastorePartition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final partitions = this.partitions;
    return {
      if (partitions != null) 'partitions': partitions,
    };
  }
}

/// Statistical information about the data store.
class DatastoreStatistics {
  /// The estimated size of the data store.
  final EstimatedResourceSize? size;

  DatastoreStatistics({
    this.size,
  });

  factory DatastoreStatistics.fromJson(Map<String, dynamic> json) {
    return DatastoreStatistics(
      size: json['size'] != null
          ? EstimatedResourceSize.fromJson(json['size'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    return {
      if (size != null) 'size': size,
    };
  }
}

enum DatastoreStatus {
  creating,
  active,
  deleting,
}

extension DatastoreStatusValueExtension on DatastoreStatus {
  String toValue() {
    switch (this) {
      case DatastoreStatus.creating:
        return 'CREATING';
      case DatastoreStatus.active:
        return 'ACTIVE';
      case DatastoreStatus.deleting:
        return 'DELETING';
    }
  }
}

extension DatastoreStatusFromString on String {
  DatastoreStatus toDatastoreStatus() {
    switch (this) {
      case 'CREATING':
        return DatastoreStatus.creating;
      case 'ACTIVE':
        return DatastoreStatus.active;
      case 'DELETING':
        return DatastoreStatus.deleting;
    }
    throw Exception('$this is not known in enum DatastoreStatus');
  }
}

/// Where data in a data store is stored.. You can choose
/// <code>serviceManagedS3</code> storage, <code>customerManagedS3</code>
/// storage, or <code>iotSiteWiseMultiLayerStorage</code> storage. The default
/// is <code>serviceManagedS3</code>. You can't change the choice of Amazon S3
/// storage after your data store is created.
class DatastoreStorage {
  /// S3-customer-managed; When you choose customer-managed storage, the
  /// <code>retentionPeriod</code> parameter is ignored. You can't change the
  /// choice of Amazon S3 storage after your data store is created.
  final CustomerManagedDatastoreS3Storage? customerManagedS3;

  /// Used to store data used by IoT SiteWise in an Amazon S3 bucket that you
  /// manage. You can't change the choice of Amazon S3 storage after your data
  /// store is created.
  final DatastoreIotSiteWiseMultiLayerStorage? iotSiteWiseMultiLayerStorage;

  /// Used to store data in an Amazon S3 bucket managed by IoT Analytics. You
  /// can't change the choice of Amazon S3 storage after your data store is
  /// created.
  final ServiceManagedDatastoreS3Storage? serviceManagedS3;

  DatastoreStorage({
    this.customerManagedS3,
    this.iotSiteWiseMultiLayerStorage,
    this.serviceManagedS3,
  });

  factory DatastoreStorage.fromJson(Map<String, dynamic> json) {
    return DatastoreStorage(
      customerManagedS3: json['customerManagedS3'] != null
          ? CustomerManagedDatastoreS3Storage.fromJson(
              json['customerManagedS3'] as Map<String, dynamic>)
          : null,
      iotSiteWiseMultiLayerStorage: json['iotSiteWiseMultiLayerStorage'] != null
          ? DatastoreIotSiteWiseMultiLayerStorage.fromJson(
              json['iotSiteWiseMultiLayerStorage'] as Map<String, dynamic>)
          : null,
      serviceManagedS3: json['serviceManagedS3'] != null
          ? ServiceManagedDatastoreS3Storage.fromJson(
              json['serviceManagedS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManagedS3 = this.customerManagedS3;
    final iotSiteWiseMultiLayerStorage = this.iotSiteWiseMultiLayerStorage;
    final serviceManagedS3 = this.serviceManagedS3;
    return {
      if (customerManagedS3 != null) 'customerManagedS3': customerManagedS3,
      if (iotSiteWiseMultiLayerStorage != null)
        'iotSiteWiseMultiLayerStorage': iotSiteWiseMultiLayerStorage,
      if (serviceManagedS3 != null) 'serviceManagedS3': serviceManagedS3,
    };
  }
}

/// Contains information about your data store.
class DatastoreStorageSummary {
  /// Used to store data in an Amazon S3 bucket managed by IoT Analytics.
  final CustomerManagedDatastoreS3StorageSummary? customerManagedS3;

  /// Used to store data used by IoT SiteWise in an Amazon S3 bucket that you
  /// manage.
  final DatastoreIotSiteWiseMultiLayerStorageSummary?
      iotSiteWiseMultiLayerStorage;

  /// Used to store data in an Amazon S3 bucket managed by IoT Analytics.
  final ServiceManagedDatastoreS3StorageSummary? serviceManagedS3;

  DatastoreStorageSummary({
    this.customerManagedS3,
    this.iotSiteWiseMultiLayerStorage,
    this.serviceManagedS3,
  });

  factory DatastoreStorageSummary.fromJson(Map<String, dynamic> json) {
    return DatastoreStorageSummary(
      customerManagedS3: json['customerManagedS3'] != null
          ? CustomerManagedDatastoreS3StorageSummary.fromJson(
              json['customerManagedS3'] as Map<String, dynamic>)
          : null,
      iotSiteWiseMultiLayerStorage: json['iotSiteWiseMultiLayerStorage'] != null
          ? DatastoreIotSiteWiseMultiLayerStorageSummary.fromJson(
              json['iotSiteWiseMultiLayerStorage'] as Map<String, dynamic>)
          : null,
      serviceManagedS3: json['serviceManagedS3'] != null
          ? ServiceManagedDatastoreS3StorageSummary.fromJson(
              json['serviceManagedS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManagedS3 = this.customerManagedS3;
    final iotSiteWiseMultiLayerStorage = this.iotSiteWiseMultiLayerStorage;
    final serviceManagedS3 = this.serviceManagedS3;
    return {
      if (customerManagedS3 != null) 'customerManagedS3': customerManagedS3,
      if (iotSiteWiseMultiLayerStorage != null)
        'iotSiteWiseMultiLayerStorage': iotSiteWiseMultiLayerStorage,
      if (serviceManagedS3 != null) 'serviceManagedS3': serviceManagedS3,
    };
  }
}

/// A summary of information about a data store.
class DatastoreSummary {
  /// When the data store was created.
  final DateTime? creationTime;

  /// The name of the data store.
  final String? datastoreName;

  /// Contains information about the partition dimensions in a data store.
  final DatastorePartitions? datastorePartitions;

  /// Where data in a data store is stored.
  final DatastoreStorageSummary? datastoreStorage;

  /// The file format of the data in the data store.
  final FileFormatType? fileFormatType;

  /// The last time when a new message arrived in the data store.
  ///
  /// IoT Analytics updates this value at most once per minute for Amazon Simple
  /// Storage Service one data store. Hence, the
  /// <code>lastMessageArrivalTime</code> value is an approximation.
  ///
  /// This feature only applies to messages that arrived in the data store after
  /// October 23, 2020.
  final DateTime? lastMessageArrivalTime;

  /// The last time the data store was updated.
  final DateTime? lastUpdateTime;

  /// The status of the data store.
  final DatastoreStatus? status;

  DatastoreSummary({
    this.creationTime,
    this.datastoreName,
    this.datastorePartitions,
    this.datastoreStorage,
    this.fileFormatType,
    this.lastMessageArrivalTime,
    this.lastUpdateTime,
    this.status,
  });

  factory DatastoreSummary.fromJson(Map<String, dynamic> json) {
    return DatastoreSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      datastoreName: json['datastoreName'] as String?,
      datastorePartitions: json['datastorePartitions'] != null
          ? DatastorePartitions.fromJson(
              json['datastorePartitions'] as Map<String, dynamic>)
          : null,
      datastoreStorage: json['datastoreStorage'] != null
          ? DatastoreStorageSummary.fromJson(
              json['datastoreStorage'] as Map<String, dynamic>)
          : null,
      fileFormatType: (json['fileFormatType'] as String?)?.toFileFormatType(),
      lastMessageArrivalTime: timeStampFromJson(json['lastMessageArrivalTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      status: (json['status'] as String?)?.toDatastoreStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final datastoreName = this.datastoreName;
    final datastorePartitions = this.datastorePartitions;
    final datastoreStorage = this.datastoreStorage;
    final fileFormatType = this.fileFormatType;
    final lastMessageArrivalTime = this.lastMessageArrivalTime;
    final lastUpdateTime = this.lastUpdateTime;
    final status = this.status;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (datastoreName != null) 'datastoreName': datastoreName,
      if (datastorePartitions != null)
        'datastorePartitions': datastorePartitions,
      if (datastoreStorage != null) 'datastoreStorage': datastoreStorage,
      if (fileFormatType != null) 'fileFormatType': fileFormatType.toValue(),
      if (lastMessageArrivalTime != null)
        'lastMessageArrivalTime': unixTimestampToJson(lastMessageArrivalTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Used to limit data to that which has arrived since the last execution of the
/// action.
class DeltaTime {
  /// The number of seconds of estimated in-flight lag time of message data. When
  /// you create dataset contents using message data from a specified timeframe,
  /// some message data might still be in flight when processing begins, and so do
  /// not arrive in time to be processed. Use this field to make allowances for
  /// the in flight time of your message data, so that data not processed from a
  /// previous timeframe is included with the next timeframe. Otherwise, missed
  /// message data would be excluded from processing during the next timeframe
  /// too, because its timestamp places it within the previous timeframe.
  final int offsetSeconds;

  /// An expression by which the time of the message data might be determined.
  /// This can be the name of a timestamp field or a SQL expression that is used
  /// to derive the time the message data was generated.
  final String timeExpression;

  DeltaTime({
    required this.offsetSeconds,
    required this.timeExpression,
  });

  factory DeltaTime.fromJson(Map<String, dynamic> json) {
    return DeltaTime(
      offsetSeconds: json['offsetSeconds'] as int,
      timeExpression: json['timeExpression'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final offsetSeconds = this.offsetSeconds;
    final timeExpression = this.timeExpression;
    return {
      'offsetSeconds': offsetSeconds,
      'timeExpression': timeExpression,
    };
  }
}

/// A structure that contains the configuration information of a delta time
/// session window.
///
/// <a
/// href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_DeltaTime.html">
/// <code>DeltaTime</code> </a> specifies a time interval. You can use
/// <code>DeltaTime</code> to create dataset contents with data that has arrived
/// in the data store since the last execution. For an example of
/// <code>DeltaTime</code>, see <a
/// href="https://docs.aws.amazon.com/iotanalytics/latest/userguide/automate-create-dataset.html#automate-example6">
/// Creating a SQL dataset with a delta window (CLI)</a> in the <i>IoT Analytics
/// User Guide</i>.
class DeltaTimeSessionWindowConfiguration {
  /// A time interval. You can use <code>timeoutInMinutes</code> so that IoT
  /// Analytics can batch up late data notifications that have been generated
  /// since the last execution. IoT Analytics sends one batch of notifications to
  /// Amazon CloudWatch Events at one time.
  ///
  /// For more information about how to write a timestamp expression, see <a
  /// href="https://prestodb.io/docs/0.172/functions/datetime.html">Date and Time
  /// Functions and Operators</a>, in the <i>Presto 0.172 Documentation</i>.
  final int timeoutInMinutes;

  DeltaTimeSessionWindowConfiguration({
    required this.timeoutInMinutes,
  });

  factory DeltaTimeSessionWindowConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DeltaTimeSessionWindowConfiguration(
      timeoutInMinutes: json['timeoutInMinutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final timeoutInMinutes = this.timeoutInMinutes;
    return {
      'timeoutInMinutes': timeoutInMinutes,
    };
  }
}

class DescribeChannelResponse {
  /// An object that contains information about the channel.
  final Channel? channel;

  /// Statistics about the channel. Included if the <code>includeStatistics</code>
  /// parameter is set to <code>true</code> in the request.
  final ChannelStatistics? statistics;

  DescribeChannelResponse({
    this.channel,
    this.statistics,
  });

  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChannelResponse(
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
      statistics: json['statistics'] != null
          ? ChannelStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final statistics = this.statistics;
    return {
      if (channel != null) 'channel': channel,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

class DescribeDatasetResponse {
  /// An object that contains information about the dataset.
  final Dataset? dataset;

  DescribeDatasetResponse({
    this.dataset,
  });

  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetResponse(
      dataset: json['dataset'] != null
          ? Dataset.fromJson(json['dataset'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    return {
      if (dataset != null) 'dataset': dataset,
    };
  }
}

class DescribeDatastoreResponse {
  /// Information about the data store.
  final Datastore? datastore;

  /// Additional statistical information about the data store. Included if the
  /// <code>includeStatistics</code> parameter is set to <code>true</code> in the
  /// request.
  final DatastoreStatistics? statistics;

  DescribeDatastoreResponse({
    this.datastore,
    this.statistics,
  });

  factory DescribeDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatastoreResponse(
      datastore: json['datastore'] != null
          ? Datastore.fromJson(json['datastore'] as Map<String, dynamic>)
          : null,
      statistics: json['statistics'] != null
          ? DatastoreStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datastore = this.datastore;
    final statistics = this.statistics;
    return {
      if (datastore != null) 'datastore': datastore,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

class DescribeLoggingOptionsResponse {
  /// The current settings of the IoT Analytics logging options.
  final LoggingOptions? loggingOptions;

  DescribeLoggingOptionsResponse({
    this.loggingOptions,
  });

  factory DescribeLoggingOptionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLoggingOptionsResponse(
      loggingOptions: json['loggingOptions'] != null
          ? LoggingOptions.fromJson(
              json['loggingOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingOptions = this.loggingOptions;
    return {
      if (loggingOptions != null) 'loggingOptions': loggingOptions,
    };
  }
}

class DescribePipelineResponse {
  /// A <code>Pipeline</code> object that contains information about the pipeline.
  final Pipeline? pipeline;

  DescribePipelineResponse({
    this.pipeline,
  });

  factory DescribePipelineResponse.fromJson(Map<String, dynamic> json) {
    return DescribePipelineResponse(
      pipeline: json['pipeline'] != null
          ? Pipeline.fromJson(json['pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      if (pipeline != null) 'pipeline': pipeline,
    };
  }
}

/// An activity that adds data from the IoT device registry to your message.
class DeviceRegistryEnrichActivity {
  /// The name of the attribute that is added to the message.
  final String attribute;

  /// The name of the <code>deviceRegistryEnrich</code> activity.
  final String name;

  /// The ARN of the role that allows access to the device's registry information.
  final String roleArn;

  /// The name of the IoT device whose registry information is added to the
  /// message.
  final String thingName;

  /// The next activity in the pipeline.
  final String? next;

  DeviceRegistryEnrichActivity({
    required this.attribute,
    required this.name,
    required this.roleArn,
    required this.thingName,
    this.next,
  });

  factory DeviceRegistryEnrichActivity.fromJson(Map<String, dynamic> json) {
    return DeviceRegistryEnrichActivity(
      attribute: json['attribute'] as String,
      name: json['name'] as String,
      roleArn: json['roleArn'] as String,
      thingName: json['thingName'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final name = this.name;
    final roleArn = this.roleArn;
    final thingName = this.thingName;
    final next = this.next;
    return {
      'attribute': attribute,
      'name': name,
      'roleArn': roleArn,
      'thingName': thingName,
      if (next != null) 'next': next,
    };
  }
}

/// An activity that adds information from the IoT Device Shadow service to a
/// message.
class DeviceShadowEnrichActivity {
  /// The name of the attribute that is added to the message.
  final String attribute;

  /// The name of the <code>deviceShadowEnrich</code> activity.
  final String name;

  /// The ARN of the role that allows access to the device's shadow.
  final String roleArn;

  /// The name of the IoT device whose shadow information is added to the message.
  final String thingName;

  /// The next activity in the pipeline.
  final String? next;

  DeviceShadowEnrichActivity({
    required this.attribute,
    required this.name,
    required this.roleArn,
    required this.thingName,
    this.next,
  });

  factory DeviceShadowEnrichActivity.fromJson(Map<String, dynamic> json) {
    return DeviceShadowEnrichActivity(
      attribute: json['attribute'] as String,
      name: json['name'] as String,
      roleArn: json['roleArn'] as String,
      thingName: json['thingName'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final name = this.name;
    final roleArn = this.roleArn;
    final thingName = this.thingName;
    final next = this.next;
    return {
      'attribute': attribute,
      'name': name,
      'roleArn': roleArn,
      'thingName': thingName,
      if (next != null) 'next': next,
    };
  }
}

/// The estimated size of the resource.
class EstimatedResourceSize {
  /// The time when the estimate of the size of the resource was made.
  final DateTime? estimatedOn;

  /// The estimated size of the resource, in bytes.
  final double? estimatedSizeInBytes;

  EstimatedResourceSize({
    this.estimatedOn,
    this.estimatedSizeInBytes,
  });

  factory EstimatedResourceSize.fromJson(Map<String, dynamic> json) {
    return EstimatedResourceSize(
      estimatedOn: timeStampFromJson(json['estimatedOn']),
      estimatedSizeInBytes: json['estimatedSizeInBytes'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedOn = this.estimatedOn;
    final estimatedSizeInBytes = this.estimatedSizeInBytes;
    return {
      if (estimatedOn != null) 'estimatedOn': unixTimestampToJson(estimatedOn),
      if (estimatedSizeInBytes != null)
        'estimatedSizeInBytes': estimatedSizeInBytes,
    };
  }
}

/// Contains the configuration information of file formats. IoT Analytics data
/// stores support JSON and <a href="https://parquet.apache.org/">Parquet</a>.
///
/// The default file format is JSON. You can specify only one format.
///
/// You can't change the file format after you create the data store.
class FileFormatConfiguration {
  /// Contains the configuration information of the JSON format.
  final JsonConfiguration? jsonConfiguration;

  /// Contains the configuration information of the Parquet format.
  final ParquetConfiguration? parquetConfiguration;

  FileFormatConfiguration({
    this.jsonConfiguration,
    this.parquetConfiguration,
  });

  factory FileFormatConfiguration.fromJson(Map<String, dynamic> json) {
    return FileFormatConfiguration(
      jsonConfiguration: json['jsonConfiguration'] != null
          ? JsonConfiguration.fromJson(
              json['jsonConfiguration'] as Map<String, dynamic>)
          : null,
      parquetConfiguration: json['parquetConfiguration'] != null
          ? ParquetConfiguration.fromJson(
              json['parquetConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonConfiguration = this.jsonConfiguration;
    final parquetConfiguration = this.parquetConfiguration;
    return {
      if (jsonConfiguration != null) 'jsonConfiguration': jsonConfiguration,
      if (parquetConfiguration != null)
        'parquetConfiguration': parquetConfiguration,
    };
  }
}

enum FileFormatType {
  json,
  parquet,
}

extension FileFormatTypeValueExtension on FileFormatType {
  String toValue() {
    switch (this) {
      case FileFormatType.json:
        return 'JSON';
      case FileFormatType.parquet:
        return 'PARQUET';
    }
  }
}

extension FileFormatTypeFromString on String {
  FileFormatType toFileFormatType() {
    switch (this) {
      case 'JSON':
        return FileFormatType.json;
      case 'PARQUET':
        return FileFormatType.parquet;
    }
    throw Exception('$this is not known in enum FileFormatType');
  }
}

/// An activity that filters a message based on its attributes.
class FilterActivity {
  /// An expression that looks like a SQL WHERE clause that must return a Boolean
  /// value. Messages that satisfy the condition are passed to the next activity.
  final String filter;

  /// The name of the filter activity.
  final String name;

  /// The next activity in the pipeline.
  final String? next;

  FilterActivity({
    required this.filter,
    required this.name,
    this.next,
  });

  factory FilterActivity.fromJson(Map<String, dynamic> json) {
    return FilterActivity(
      filter: json['filter'] as String,
      name: json['name'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final name = this.name;
    final next = this.next;
    return {
      'filter': filter,
      'name': name,
      if (next != null) 'next': next,
    };
  }
}

class GetDatasetContentResponse {
  /// A list of <code>DatasetEntry</code> objects.
  final List<DatasetEntry>? entries;

  /// The status of the dataset content.
  final DatasetContentStatus? status;

  /// The time when the request was made.
  final DateTime? timestamp;

  GetDatasetContentResponse({
    this.entries,
    this.status,
    this.timestamp,
  });

  factory GetDatasetContentResponse.fromJson(Map<String, dynamic> json) {
    return GetDatasetContentResponse(
      entries: (json['entries'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] != null
          ? DatasetContentStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final status = this.status;
    final timestamp = this.timestamp;
    return {
      if (entries != null) 'entries': entries,
      if (status != null) 'status': status,
      if (timestamp != null) 'timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// Configuration information for coordination with Glue, a fully managed
/// extract, transform and load (ETL) service.
class GlueConfiguration {
  /// The name of the database in your Glue Data Catalog in which the table is
  /// located. An Glue Data Catalog database contains metadata tables.
  final String databaseName;

  /// The name of the table in your Glue Data Catalog that is used to perform the
  /// ETL operations. An Glue Data Catalog table contains partitioned data and
  /// descriptions of data sources and targets.
  final String tableName;

  GlueConfiguration({
    required this.databaseName,
    required this.tableName,
  });

  factory GlueConfiguration.fromJson(Map<String, dynamic> json) {
    return GlueConfiguration(
      databaseName: json['databaseName'] as String,
      tableName: json['tableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    return {
      'databaseName': databaseName,
      'tableName': tableName,
    };
  }
}

/// Configuration information for delivery of dataset contents to IoT Events.
class IotEventsDestinationConfiguration {
  /// The name of the IoT Events input to which dataset contents are delivered.
  final String inputName;

  /// The ARN of the role that grants IoT Analytics permission to deliver dataset
  /// contents to an IoT Events input.
  final String roleArn;

  IotEventsDestinationConfiguration({
    required this.inputName,
    required this.roleArn,
  });

  factory IotEventsDestinationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return IotEventsDestinationConfiguration(
      inputName: json['inputName'] as String,
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final inputName = this.inputName;
    final roleArn = this.roleArn;
    return {
      'inputName': inputName,
      'roleArn': roleArn,
    };
  }
}

/// Used to store data used by IoT SiteWise in an Amazon S3 bucket that you
/// manage. You can't change the choice of Amazon S3 storage after your data
/// store is created.
class IotSiteWiseCustomerManagedDatastoreS3Storage {
  /// The name of the Amazon S3 bucket where your data is stored.
  final String bucket;

  /// (Optional) The prefix used to create the keys of the data store data
  /// objects. Each object in an Amazon S3 bucket has a key that is its unique
  /// identifier in the bucket. Each object in a bucket has exactly one key. The
  /// prefix must end with a forward slash (/).
  final String? keyPrefix;

  IotSiteWiseCustomerManagedDatastoreS3Storage({
    required this.bucket,
    this.keyPrefix,
  });

  factory IotSiteWiseCustomerManagedDatastoreS3Storage.fromJson(
      Map<String, dynamic> json) {
    return IotSiteWiseCustomerManagedDatastoreS3Storage(
      bucket: json['bucket'] as String,
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    return {
      'bucket': bucket,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// Contains information about the data store that you manage, which stores data
/// used by IoT SiteWise.
class IotSiteWiseCustomerManagedDatastoreS3StorageSummary {
  /// The name of the Amazon S3 bucket where your data is stored.
  final String? bucket;

  /// (Optional) The prefix used to create the keys of the data store data
  /// objects. Each object in an Amazon S3 bucket has a key that is its unique
  /// identifier in the bucket. Each object in a bucket has exactly one key. The
  /// prefix must end with a forward slash (/).
  final String? keyPrefix;

  IotSiteWiseCustomerManagedDatastoreS3StorageSummary({
    this.bucket,
    this.keyPrefix,
  });

  factory IotSiteWiseCustomerManagedDatastoreS3StorageSummary.fromJson(
      Map<String, dynamic> json) {
    return IotSiteWiseCustomerManagedDatastoreS3StorageSummary(
      bucket: json['bucket'] as String?,
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    return {
      if (bucket != null) 'bucket': bucket,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// Contains the configuration information of the JSON format.
class JsonConfiguration {
  JsonConfiguration();

  factory JsonConfiguration.fromJson(Map<String, dynamic> _) {
    return JsonConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An activity that runs a Lambda function to modify the message.
class LambdaActivity {
  /// The number of messages passed to the Lambda function for processing.
  ///
  /// The Lambda function must be able to process all of these messages within
  /// five minutes, which is the maximum timeout duration for Lambda functions.
  final int batchSize;

  /// The name of the Lambda function that is run on the message.
  final String lambdaName;

  /// The name of the lambda activity.
  final String name;

  /// The next activity in the pipeline.
  final String? next;

  LambdaActivity({
    required this.batchSize,
    required this.lambdaName,
    required this.name,
    this.next,
  });

  factory LambdaActivity.fromJson(Map<String, dynamic> json) {
    return LambdaActivity(
      batchSize: json['batchSize'] as int,
      lambdaName: json['lambdaName'] as String,
      name: json['name'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final lambdaName = this.lambdaName;
    final name = this.name;
    final next = this.next;
    return {
      'batchSize': batchSize,
      'lambdaName': lambdaName,
      'name': name,
      if (next != null) 'next': next,
    };
  }
}

/// A structure that contains the name and configuration information of a late
/// data rule.
class LateDataRule {
  /// The information needed to configure the late data rule.
  final LateDataRuleConfiguration ruleConfiguration;

  /// The name of the late data rule.
  final String? ruleName;

  LateDataRule({
    required this.ruleConfiguration,
    this.ruleName,
  });

  factory LateDataRule.fromJson(Map<String, dynamic> json) {
    return LateDataRule(
      ruleConfiguration: LateDataRuleConfiguration.fromJson(
          json['ruleConfiguration'] as Map<String, dynamic>),
      ruleName: json['ruleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleConfiguration = this.ruleConfiguration;
    final ruleName = this.ruleName;
    return {
      'ruleConfiguration': ruleConfiguration,
      if (ruleName != null) 'ruleName': ruleName,
    };
  }
}

/// The information needed to configure a delta time session window.
class LateDataRuleConfiguration {
  /// The information needed to configure a delta time session window.
  final DeltaTimeSessionWindowConfiguration?
      deltaTimeSessionWindowConfiguration;

  LateDataRuleConfiguration({
    this.deltaTimeSessionWindowConfiguration,
  });

  factory LateDataRuleConfiguration.fromJson(Map<String, dynamic> json) {
    return LateDataRuleConfiguration(
      deltaTimeSessionWindowConfiguration:
          json['deltaTimeSessionWindowConfiguration'] != null
              ? DeltaTimeSessionWindowConfiguration.fromJson(
                  json['deltaTimeSessionWindowConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deltaTimeSessionWindowConfiguration =
        this.deltaTimeSessionWindowConfiguration;
    return {
      if (deltaTimeSessionWindowConfiguration != null)
        'deltaTimeSessionWindowConfiguration':
            deltaTimeSessionWindowConfiguration,
    };
  }
}

class ListChannelsResponse {
  /// A list of <code>ChannelSummary</code> objects.
  final List<ChannelSummary>? channelSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  ListChannelsResponse({
    this.channelSummaries,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      channelSummaries: (json['channelSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelSummaries = this.channelSummaries;
    final nextToken = this.nextToken;
    return {
      if (channelSummaries != null) 'channelSummaries': channelSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDatasetContentsResponse {
  /// Summary information about dataset contents that have been created.
  final List<DatasetContentSummary>? datasetContentSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  ListDatasetContentsResponse({
    this.datasetContentSummaries,
    this.nextToken,
  });

  factory ListDatasetContentsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetContentsResponse(
      datasetContentSummaries: (json['datasetContentSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetContentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetContentSummaries = this.datasetContentSummaries;
    final nextToken = this.nextToken;
    return {
      if (datasetContentSummaries != null)
        'datasetContentSummaries': datasetContentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDatasetsResponse {
  /// A list of <code>DatasetSummary</code> objects.
  final List<DatasetSummary>? datasetSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  ListDatasetsResponse({
    this.datasetSummaries,
    this.nextToken,
  });

  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetsResponse(
      datasetSummaries: (json['datasetSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetSummaries = this.datasetSummaries;
    final nextToken = this.nextToken;
    return {
      if (datasetSummaries != null) 'datasetSummaries': datasetSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDatastoresResponse {
  /// A list of <code>DatastoreSummary</code> objects.
  final List<DatastoreSummary>? datastoreSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  ListDatastoresResponse({
    this.datastoreSummaries,
    this.nextToken,
  });

  factory ListDatastoresResponse.fromJson(Map<String, dynamic> json) {
    return ListDatastoresResponse(
      datastoreSummaries: (json['datastoreSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => DatastoreSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreSummaries = this.datastoreSummaries;
    final nextToken = this.nextToken;
    return {
      if (datastoreSummaries != null) 'datastoreSummaries': datastoreSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPipelinesResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// A list of <code>PipelineSummary</code> objects.
  final List<PipelineSummary>? pipelineSummaries;

  ListPipelinesResponse({
    this.nextToken,
    this.pipelineSummaries,
  });

  factory ListPipelinesResponse.fromJson(Map<String, dynamic> json) {
    return ListPipelinesResponse(
      nextToken: json['nextToken'] as String?,
      pipelineSummaries: (json['pipelineSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pipelineSummaries = this.pipelineSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (pipelineSummaries != null) 'pipelineSummaries': pipelineSummaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags (metadata) that you have assigned to the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
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

enum LoggingLevel {
  error,
}

extension LoggingLevelValueExtension on LoggingLevel {
  String toValue() {
    switch (this) {
      case LoggingLevel.error:
        return 'ERROR';
    }
  }
}

extension LoggingLevelFromString on String {
  LoggingLevel toLoggingLevel() {
    switch (this) {
      case 'ERROR':
        return LoggingLevel.error;
    }
    throw Exception('$this is not known in enum LoggingLevel');
  }
}

/// Information about logging options.
class LoggingOptions {
  /// If true, logging is enabled for IoT Analytics.
  final bool enabled;

  /// The logging level. Currently, only ERROR is supported.
  final LoggingLevel level;

  /// The ARN of the role that grants permission to IoT Analytics to perform
  /// logging.
  final String roleArn;

  LoggingOptions({
    required this.enabled,
    required this.level,
    required this.roleArn,
  });

  factory LoggingOptions.fromJson(Map<String, dynamic> json) {
    return LoggingOptions(
      enabled: json['enabled'] as bool,
      level: (json['level'] as String).toLoggingLevel(),
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final level = this.level;
    final roleArn = this.roleArn;
    return {
      'enabled': enabled,
      'level': level.toValue(),
      'roleArn': roleArn,
    };
  }
}

/// An activity that computes an arithmetic expression using the message's
/// attributes.
class MathActivity {
  /// The name of the attribute that contains the result of the math operation.
  final String attribute;

  /// An expression that uses one or more existing attributes and must return an
  /// integer value.
  final String math;

  /// The name of the math activity.
  final String name;

  /// The next activity in the pipeline.
  final String? next;

  MathActivity({
    required this.attribute,
    required this.math,
    required this.name,
    this.next,
  });

  factory MathActivity.fromJson(Map<String, dynamic> json) {
    return MathActivity(
      attribute: json['attribute'] as String,
      math: json['math'] as String,
      name: json['name'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final math = this.math;
    final name = this.name;
    final next = this.next;
    return {
      'attribute': attribute,
      'math': math,
      'name': name,
      if (next != null) 'next': next,
    };
  }
}

/// Information about a message.
class Message {
  /// The ID you want to assign to the message. Each <code>messageId</code> must
  /// be unique within each batch sent.
  final String messageId;

  /// The payload of the message. This can be a JSON string or a base64-encoded
  /// string representing binary data, in which case you must decode it by means
  /// of a pipeline activity.
  final Uint8List payload;

  Message({
    required this.messageId,
    required this.payload,
  });

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    final payload = this.payload;
    return {
      'messageId': messageId,
      'payload': base64Encode(payload),
    };
  }
}

/// The value of the variable as a structure that specifies an output file URI.
class OutputFileUriValue {
  /// The URI of the location where dataset contents are stored, usually the URI
  /// of a file in an S3 bucket.
  final String fileName;

  OutputFileUriValue({
    required this.fileName,
  });

  factory OutputFileUriValue.fromJson(Map<String, dynamic> json) {
    return OutputFileUriValue(
      fileName: json['fileName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fileName = this.fileName;
    return {
      'fileName': fileName,
    };
  }
}

/// Contains the configuration information of the Parquet format.
class ParquetConfiguration {
  /// Information needed to define a schema.
  final SchemaDefinition? schemaDefinition;

  ParquetConfiguration({
    this.schemaDefinition,
  });

  factory ParquetConfiguration.fromJson(Map<String, dynamic> json) {
    return ParquetConfiguration(
      schemaDefinition: json['schemaDefinition'] != null
          ? SchemaDefinition.fromJson(
              json['schemaDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaDefinition = this.schemaDefinition;
    return {
      if (schemaDefinition != null) 'schemaDefinition': schemaDefinition,
    };
  }
}

/// A partition dimension defined by an attribute.
class Partition {
  /// The name of the attribute that defines a partition dimension.
  final String attributeName;

  Partition({
    required this.attributeName,
  });

  factory Partition.fromJson(Map<String, dynamic> json) {
    return Partition(
      attributeName: json['attributeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    return {
      'attributeName': attributeName,
    };
  }
}

/// Contains information about a pipeline.
class Pipeline {
  /// The activities that perform transformations on the messages.
  final List<PipelineActivity>? activities;

  /// The ARN of the pipeline.
  final String? arn;

  /// When the pipeline was created.
  final DateTime? creationTime;

  /// The last time the pipeline was updated.
  final DateTime? lastUpdateTime;

  /// The name of the pipeline.
  final String? name;

  /// A summary of information about the pipeline reprocessing.
  final List<ReprocessingSummary>? reprocessingSummaries;

  Pipeline({
    this.activities,
    this.arn,
    this.creationTime,
    this.lastUpdateTime,
    this.name,
    this.reprocessingSummaries,
  });

  factory Pipeline.fromJson(Map<String, dynamic> json) {
    return Pipeline(
      activities: (json['activities'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      name: json['name'] as String?,
      reprocessingSummaries: (json['reprocessingSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ReprocessingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final activities = this.activities;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final reprocessingSummaries = this.reprocessingSummaries;
    return {
      if (activities != null) 'activities': activities,
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (name != null) 'name': name,
      if (reprocessingSummaries != null)
        'reprocessingSummaries': reprocessingSummaries,
    };
  }
}

/// An activity that performs a transformation on a message.
class PipelineActivity {
  /// Adds other attributes based on existing attributes in the message.
  final AddAttributesActivity? addAttributes;

  /// Determines the source of the messages to be processed.
  final ChannelActivity? channel;

  /// Specifies where to store the processed message data.
  final DatastoreActivity? datastore;

  /// Adds data from the IoT device registry to your message.
  final DeviceRegistryEnrichActivity? deviceRegistryEnrich;

  /// Adds information from the IoT Device Shadow service to a message.
  final DeviceShadowEnrichActivity? deviceShadowEnrich;

  /// Filters a message based on its attributes.
  final FilterActivity? filter;

  /// Runs a Lambda function to modify the message.
  final LambdaActivity? lambda;

  /// Computes an arithmetic expression using the message's attributes and adds it
  /// to the message.
  final MathActivity? math;

  /// Removes attributes from a message.
  final RemoveAttributesActivity? removeAttributes;

  /// Used to create a new message using only the specified attributes from the
  /// original message.
  final SelectAttributesActivity? selectAttributes;

  PipelineActivity({
    this.addAttributes,
    this.channel,
    this.datastore,
    this.deviceRegistryEnrich,
    this.deviceShadowEnrich,
    this.filter,
    this.lambda,
    this.math,
    this.removeAttributes,
    this.selectAttributes,
  });

  factory PipelineActivity.fromJson(Map<String, dynamic> json) {
    return PipelineActivity(
      addAttributes: json['addAttributes'] != null
          ? AddAttributesActivity.fromJson(
              json['addAttributes'] as Map<String, dynamic>)
          : null,
      channel: json['channel'] != null
          ? ChannelActivity.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
      datastore: json['datastore'] != null
          ? DatastoreActivity.fromJson(
              json['datastore'] as Map<String, dynamic>)
          : null,
      deviceRegistryEnrich: json['deviceRegistryEnrich'] != null
          ? DeviceRegistryEnrichActivity.fromJson(
              json['deviceRegistryEnrich'] as Map<String, dynamic>)
          : null,
      deviceShadowEnrich: json['deviceShadowEnrich'] != null
          ? DeviceShadowEnrichActivity.fromJson(
              json['deviceShadowEnrich'] as Map<String, dynamic>)
          : null,
      filter: json['filter'] != null
          ? FilterActivity.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
      lambda: json['lambda'] != null
          ? LambdaActivity.fromJson(json['lambda'] as Map<String, dynamic>)
          : null,
      math: json['math'] != null
          ? MathActivity.fromJson(json['math'] as Map<String, dynamic>)
          : null,
      removeAttributes: json['removeAttributes'] != null
          ? RemoveAttributesActivity.fromJson(
              json['removeAttributes'] as Map<String, dynamic>)
          : null,
      selectAttributes: json['selectAttributes'] != null
          ? SelectAttributesActivity.fromJson(
              json['selectAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addAttributes = this.addAttributes;
    final channel = this.channel;
    final datastore = this.datastore;
    final deviceRegistryEnrich = this.deviceRegistryEnrich;
    final deviceShadowEnrich = this.deviceShadowEnrich;
    final filter = this.filter;
    final lambda = this.lambda;
    final math = this.math;
    final removeAttributes = this.removeAttributes;
    final selectAttributes = this.selectAttributes;
    return {
      if (addAttributes != null) 'addAttributes': addAttributes,
      if (channel != null) 'channel': channel,
      if (datastore != null) 'datastore': datastore,
      if (deviceRegistryEnrich != null)
        'deviceRegistryEnrich': deviceRegistryEnrich,
      if (deviceShadowEnrich != null) 'deviceShadowEnrich': deviceShadowEnrich,
      if (filter != null) 'filter': filter,
      if (lambda != null) 'lambda': lambda,
      if (math != null) 'math': math,
      if (removeAttributes != null) 'removeAttributes': removeAttributes,
      if (selectAttributes != null) 'selectAttributes': selectAttributes,
    };
  }
}

/// A summary of information about a pipeline.
class PipelineSummary {
  /// When the pipeline was created.
  final DateTime? creationTime;

  /// When the pipeline was last updated.
  final DateTime? lastUpdateTime;

  /// The name of the pipeline.
  final String? pipelineName;

  /// A summary of information about the pipeline reprocessing.
  final List<ReprocessingSummary>? reprocessingSummaries;

  PipelineSummary({
    this.creationTime,
    this.lastUpdateTime,
    this.pipelineName,
    this.reprocessingSummaries,
  });

  factory PipelineSummary.fromJson(Map<String, dynamic> json) {
    return PipelineSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      pipelineName: json['pipelineName'] as String?,
      reprocessingSummaries: (json['reprocessingSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ReprocessingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final pipelineName = this.pipelineName;
    final reprocessingSummaries = this.reprocessingSummaries;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (pipelineName != null) 'pipelineName': pipelineName,
      if (reprocessingSummaries != null)
        'reprocessingSummaries': reprocessingSummaries,
    };
  }
}

/// Information that is used to filter message data, to segregate it according
/// to the timeframe in which it arrives.
class QueryFilter {
  /// Used to limit data to that which has arrived since the last execution of the
  /// action.
  final DeltaTime? deltaTime;

  QueryFilter({
    this.deltaTime,
  });

  factory QueryFilter.fromJson(Map<String, dynamic> json) {
    return QueryFilter(
      deltaTime: json['deltaTime'] != null
          ? DeltaTime.fromJson(json['deltaTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deltaTime = this.deltaTime;
    return {
      if (deltaTime != null) 'deltaTime': deltaTime,
    };
  }
}

/// An activity that removes attributes from a message.
class RemoveAttributesActivity {
  /// A list of 1-50 attributes to remove from the message.
  final List<String> attributes;

  /// The name of the <code>removeAttributes</code> activity.
  final String name;

  /// The next activity in the pipeline.
  final String? next;

  RemoveAttributesActivity({
    required this.attributes,
    required this.name,
    this.next,
  });

  factory RemoveAttributesActivity.fromJson(Map<String, dynamic> json) {
    return RemoveAttributesActivity(
      attributes: (json['attributes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final name = this.name;
    final next = this.next;
    return {
      'attributes': attributes,
      'name': name,
      if (next != null) 'next': next,
    };
  }
}

enum ReprocessingStatus {
  running,
  succeeded,
  cancelled,
  failed,
}

extension ReprocessingStatusValueExtension on ReprocessingStatus {
  String toValue() {
    switch (this) {
      case ReprocessingStatus.running:
        return 'RUNNING';
      case ReprocessingStatus.succeeded:
        return 'SUCCEEDED';
      case ReprocessingStatus.cancelled:
        return 'CANCELLED';
      case ReprocessingStatus.failed:
        return 'FAILED';
    }
  }
}

extension ReprocessingStatusFromString on String {
  ReprocessingStatus toReprocessingStatus() {
    switch (this) {
      case 'RUNNING':
        return ReprocessingStatus.running;
      case 'SUCCEEDED':
        return ReprocessingStatus.succeeded;
      case 'CANCELLED':
        return ReprocessingStatus.cancelled;
      case 'FAILED':
        return ReprocessingStatus.failed;
    }
    throw Exception('$this is not known in enum ReprocessingStatus');
  }
}

/// Information about pipeline reprocessing.
class ReprocessingSummary {
  /// The time the pipeline reprocessing was created.
  final DateTime? creationTime;

  /// The <code>reprocessingId</code> returned by
  /// <code>StartPipelineReprocessing</code>.
  final String? id;

  /// The status of the pipeline reprocessing.
  final ReprocessingStatus? status;

  ReprocessingSummary({
    this.creationTime,
    this.id,
    this.status,
  });

  factory ReprocessingSummary.fromJson(Map<String, dynamic> json) {
    return ReprocessingSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toReprocessingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final status = this.status;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The configuration of the resource used to execute the
/// <code>containerAction</code>.
class ResourceConfiguration {
  /// The type of the compute resource used to execute the
  /// <code>containerAction</code>. Possible values are: <code>ACU_1</code>
  /// (vCPU=4, memory=16 GiB) or <code>ACU_2</code> (vCPU=8, memory=32 GiB).
  final ComputeType computeType;

  /// The size, in GB, of the persistent storage available to the resource
  /// instance used to execute the <code>containerAction</code> (min: 1, max: 50).
  final int volumeSizeInGB;

  ResourceConfiguration({
    required this.computeType,
    required this.volumeSizeInGB,
  });

  factory ResourceConfiguration.fromJson(Map<String, dynamic> json) {
    return ResourceConfiguration(
      computeType: (json['computeType'] as String).toComputeType(),
      volumeSizeInGB: json['volumeSizeInGB'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final computeType = this.computeType;
    final volumeSizeInGB = this.volumeSizeInGB;
    return {
      'computeType': computeType.toValue(),
      'volumeSizeInGB': volumeSizeInGB,
    };
  }
}

/// How long, in days, message data is kept.
class RetentionPeriod {
  /// The number of days that message data is kept. The <code>unlimited</code>
  /// parameter must be false.
  final int? numberOfDays;

  /// If true, message data is kept indefinitely.
  final bool? unlimited;

  RetentionPeriod({
    this.numberOfDays,
    this.unlimited,
  });

  factory RetentionPeriod.fromJson(Map<String, dynamic> json) {
    return RetentionPeriod(
      numberOfDays: json['numberOfDays'] as int?,
      unlimited: json['unlimited'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfDays = this.numberOfDays;
    final unlimited = this.unlimited;
    return {
      if (numberOfDays != null) 'numberOfDays': numberOfDays,
      if (unlimited != null) 'unlimited': unlimited,
    };
  }
}

class RunPipelineActivityResponse {
  /// In case the pipeline activity fails, the log message that is generated.
  final String? logResult;

  /// The enriched or transformed sample message payloads as base64-encoded
  /// strings. (The results of running the pipeline activity on each input sample
  /// message payload, encoded in base64.)
  final List<Uint8List>? payloads;

  RunPipelineActivityResponse({
    this.logResult,
    this.payloads,
  });

  factory RunPipelineActivityResponse.fromJson(Map<String, dynamic> json) {
    return RunPipelineActivityResponse(
      logResult: json['logResult'] as String?,
      payloads: (json['payloads'] as List?)
          ?.whereNotNull()
          .map((e) => _s.decodeUint8List(e as String))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logResult = this.logResult;
    final payloads = this.payloads;
    return {
      if (logResult != null) 'logResult': logResult,
      if (payloads != null) 'payloads': payloads.map(base64Encode).toList(),
    };
  }
}

/// Configuration information for delivery of dataset contents to Amazon Simple
/// Storage Service (Amazon S3).
class S3DestinationConfiguration {
  /// The name of the S3 bucket to which dataset contents are delivered.
  final String bucket;

  /// The key of the dataset contents object in an S3 bucket. Each object has a
  /// key that is a unique identifier. Each object has exactly one key.
  ///
  /// You can create a unique key with the following options:
  ///
  /// <ul>
  /// <li>
  /// Use <code>!{iotanalytics:scheduleTime}</code> to insert the time of a
  /// scheduled SQL query run.
  /// </li>
  /// <li>
  /// Use <code>!{iotanalytics:versionId}</code> to insert a unique hash that
  /// identifies a dataset content.
  /// </li>
  /// <li>
  /// Use <code>!{iotanalytics:creationTime}</code> to insert the creation time of
  /// a dataset content.
  /// </li>
  /// </ul>
  /// The following example creates a unique key for a CSV file:
  /// <code>dataset/mydataset/!{iotanalytics:scheduleTime}/!{iotanalytics:versionId}.csv</code>
  /// <note>
  /// If you don't use <code>!{iotanalytics:versionId}</code> to specify the key,
  /// you might get duplicate keys. For example, you might have two dataset
  /// contents with the same <code>scheduleTime</code> but different
  /// <code>versionId</code>s. This means that one dataset content overwrites the
  /// other.
  /// </note>
  final String key;

  /// The ARN of the role that grants IoT Analytics permission to interact with
  /// your Amazon S3 and Glue resources.
  final String roleArn;

  /// Configuration information for coordination with Glue, a fully managed
  /// extract, transform and load (ETL) service.
  final GlueConfiguration? glueConfiguration;

  S3DestinationConfiguration({
    required this.bucket,
    required this.key,
    required this.roleArn,
    this.glueConfiguration,
  });

  factory S3DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DestinationConfiguration(
      bucket: json['bucket'] as String,
      key: json['key'] as String,
      roleArn: json['roleArn'] as String,
      glueConfiguration: json['glueConfiguration'] != null
          ? GlueConfiguration.fromJson(
              json['glueConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final roleArn = this.roleArn;
    final glueConfiguration = this.glueConfiguration;
    return {
      'bucket': bucket,
      'key': key,
      'roleArn': roleArn,
      if (glueConfiguration != null) 'glueConfiguration': glueConfiguration,
    };
  }
}

class SampleChannelDataResponse {
  /// The list of message samples. Each sample message is returned as a
  /// base64-encoded string.
  final List<Uint8List>? payloads;

  SampleChannelDataResponse({
    this.payloads,
  });

  factory SampleChannelDataResponse.fromJson(Map<String, dynamic> json) {
    return SampleChannelDataResponse(
      payloads: (json['payloads'] as List?)
          ?.whereNotNull()
          .map((e) => _s.decodeUint8List(e as String))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final payloads = this.payloads;
    return {
      if (payloads != null) 'payloads': payloads.map(base64Encode).toList(),
    };
  }
}

/// The schedule for when to trigger an update.
class Schedule {
  /// The expression that defines when to trigger an update. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html">Schedule
  /// Expressions for Rules</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  final String? expression;

  Schedule({
    this.expression,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      expression: json['expression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    return {
      if (expression != null) 'expression': expression,
    };
  }
}

/// Information needed to define a schema.
class SchemaDefinition {
  /// Specifies one or more columns that store your data.
  ///
  /// Each schema can have up to 100 columns. Each column can have up to 100
  /// nested types.
  final List<Column>? columns;

  SchemaDefinition({
    this.columns,
  });

  factory SchemaDefinition.fromJson(Map<String, dynamic> json) {
    return SchemaDefinition(
      columns: (json['columns'] as List?)
          ?.whereNotNull()
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    return {
      if (columns != null) 'columns': columns,
    };
  }
}

/// Used to create a new message using only the specified attributes from the
/// original message.
class SelectAttributesActivity {
  /// A list of the attributes to select from the message.
  final List<String> attributes;

  /// The name of the <code>selectAttributes</code> activity.
  final String name;

  /// The next activity in the pipeline.
  final String? next;

  SelectAttributesActivity({
    required this.attributes,
    required this.name,
    this.next,
  });

  factory SelectAttributesActivity.fromJson(Map<String, dynamic> json) {
    return SelectAttributesActivity(
      attributes: (json['attributes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      next: json['next'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final name = this.name;
    final next = this.next;
    return {
      'attributes': attributes,
      'name': name,
      if (next != null) 'next': next,
    };
  }
}

/// Used to store channel data in an S3 bucket managed by IoT Analytics. You
/// can't change the choice of S3 storage after the data store is created.
class ServiceManagedChannelS3Storage {
  ServiceManagedChannelS3Storage();

  factory ServiceManagedChannelS3Storage.fromJson(Map<String, dynamic> _) {
    return ServiceManagedChannelS3Storage();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Used to store channel data in an S3 bucket managed by IoT Analytics.
class ServiceManagedChannelS3StorageSummary {
  ServiceManagedChannelS3StorageSummary();

  factory ServiceManagedChannelS3StorageSummary.fromJson(
      Map<String, dynamic> _) {
    return ServiceManagedChannelS3StorageSummary();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Used to store data in an Amazon S3 bucket managed by IoT Analytics. You
/// can't change the choice of Amazon S3 storage after your data store is
/// created.
class ServiceManagedDatastoreS3Storage {
  ServiceManagedDatastoreS3Storage();

  factory ServiceManagedDatastoreS3Storage.fromJson(Map<String, dynamic> _) {
    return ServiceManagedDatastoreS3Storage();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about the data store that is managed by IoT Analytics.
class ServiceManagedDatastoreS3StorageSummary {
  ServiceManagedDatastoreS3StorageSummary();

  factory ServiceManagedDatastoreS3StorageSummary.fromJson(
      Map<String, dynamic> _) {
    return ServiceManagedDatastoreS3StorageSummary();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The SQL query to modify the message.
class SqlQueryDatasetAction {
  /// A SQL query string.
  final String sqlQuery;

  /// Prefilters applied to message data.
  final List<QueryFilter>? filters;

  SqlQueryDatasetAction({
    required this.sqlQuery,
    this.filters,
  });

  factory SqlQueryDatasetAction.fromJson(Map<String, dynamic> json) {
    return SqlQueryDatasetAction(
      sqlQuery: json['sqlQuery'] as String,
      filters: (json['filters'] as List?)
          ?.whereNotNull()
          .map((e) => QueryFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sqlQuery = this.sqlQuery;
    final filters = this.filters;
    return {
      'sqlQuery': sqlQuery,
      if (filters != null) 'filters': filters,
    };
  }
}

class StartPipelineReprocessingResponse {
  /// The ID of the pipeline reprocessing activity that was started.
  final String? reprocessingId;

  StartPipelineReprocessingResponse({
    this.reprocessingId,
  });

  factory StartPipelineReprocessingResponse.fromJson(
      Map<String, dynamic> json) {
    return StartPipelineReprocessingResponse(
      reprocessingId: json['reprocessingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reprocessingId = this.reprocessingId;
    return {
      if (reprocessingId != null) 'reprocessingId': reprocessingId,
    };
  }
}

/// A set of key-value pairs that are used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A partition dimension defined by a timestamp attribute.
class TimestampPartition {
  /// The attribute name of the partition defined by a timestamp.
  final String attributeName;

  /// The timestamp format of a partition defined by a timestamp. The default
  /// format is seconds since epoch (January 1, 1970 at midnight UTC time).
  final String? timestampFormat;

  TimestampPartition({
    required this.attributeName,
    this.timestampFormat,
  });

  factory TimestampPartition.fromJson(Map<String, dynamic> json) {
    return TimestampPartition(
      attributeName: json['attributeName'] as String,
      timestampFormat: json['timestampFormat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final timestampFormat = this.timestampFormat;
    return {
      'attributeName': attributeName,
      if (timestampFormat != null) 'timestampFormat': timestampFormat,
    };
  }
}

/// Information about the dataset whose content generation triggers the new
/// dataset content generation.
class TriggeringDataset {
  /// The name of the dataset whose content generation triggers the new dataset
  /// content generation.
  final String name;

  TriggeringDataset({
    required this.name,
  });

  factory TriggeringDataset.fromJson(Map<String, dynamic> json) {
    return TriggeringDataset(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
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

/// An instance of a variable to be passed to the <code>containerAction</code>
/// execution. Each variable must have a name and a value given by one of
/// <code>stringValue</code>, <code>datasetContentVersionValue</code>, or
/// <code>outputFileUriValue</code>.
class Variable {
  /// The name of the variable.
  final String name;

  /// The value of the variable as a structure that specifies a dataset content
  /// version.
  final DatasetContentVersionValue? datasetContentVersionValue;

  /// The value of the variable as a double (numeric).
  final double? doubleValue;

  /// The value of the variable as a structure that specifies an output file URI.
  final OutputFileUriValue? outputFileUriValue;

  /// The value of the variable as a string.
  final String? stringValue;

  Variable({
    required this.name,
    this.datasetContentVersionValue,
    this.doubleValue,
    this.outputFileUriValue,
    this.stringValue,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      name: json['name'] as String,
      datasetContentVersionValue: json['datasetContentVersionValue'] != null
          ? DatasetContentVersionValue.fromJson(
              json['datasetContentVersionValue'] as Map<String, dynamic>)
          : null,
      doubleValue: json['doubleValue'] as double?,
      outputFileUriValue: json['outputFileUriValue'] != null
          ? OutputFileUriValue.fromJson(
              json['outputFileUriValue'] as Map<String, dynamic>)
          : null,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final datasetContentVersionValue = this.datasetContentVersionValue;
    final doubleValue = this.doubleValue;
    final outputFileUriValue = this.outputFileUriValue;
    final stringValue = this.stringValue;
    return {
      'name': name,
      if (datasetContentVersionValue != null)
        'datasetContentVersionValue': datasetContentVersionValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (outputFileUriValue != null) 'outputFileUriValue': outputFileUriValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// Information about the versioning of dataset contents.
class VersioningConfiguration {
  /// How many versions of dataset contents are kept. The <code>unlimited</code>
  /// parameter must be <code>false</code>.
  final int? maxVersions;

  /// If true, unlimited versions of dataset contents are kept.
  final bool? unlimited;

  VersioningConfiguration({
    this.maxVersions,
    this.unlimited,
  });

  factory VersioningConfiguration.fromJson(Map<String, dynamic> json) {
    return VersioningConfiguration(
      maxVersions: json['maxVersions'] as int?,
      unlimited: json['unlimited'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxVersions = this.maxVersions;
    final unlimited = this.unlimited;
    return {
      if (maxVersions != null) 'maxVersions': maxVersions,
      if (unlimited != null) 'unlimited': unlimited,
    };
  }
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
