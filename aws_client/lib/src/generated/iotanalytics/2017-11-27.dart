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

part '2017-11-27.g.dart';

/// AWS IoT Analytics allows you to collect large amounts of device data,
/// process messages, and store them. You can then query the data and run
/// sophisticated analytics on it. AWS IoT Analytics enables advanced data
/// exploration through integration with Jupyter Notebooks and data
/// visualization through integration with Amazon QuickSight.
///
/// Traditional analytics and business intelligence tools are designed to
/// process structured data. IoT data often comes from devices that record noisy
/// processes (such as temperature, motion, or sound). As a result the data from
/// these devices can have significant gaps, corrupted messages, and false
/// readings that must be cleaned up before analysis can occur. Also, IoT data
/// is often only meaningful in the context of other data from external sources.
///
/// AWS IoT Analytics automates the steps required to analyze data from IoT
/// devices. AWS IoT Analytics filters, transforms, and enriches IoT data before
/// storing it in a time-series data store for analysis. You can set up the
/// service to collect only the data you need from your devices, apply
/// mathematical transforms to process the data, and enrich the data with
/// device-specific metadata such as device type and location before storing it.
/// Then, you can analyze your data by running queries using the built-in SQL
/// query engine, or perform more complex analytics and machine learning
/// inference. AWS IoT Analytics includes pre-built models for common IoT use
/// cases so you can answer questions like which devices are about to fail or
/// which customers are at risk of abandoning their wearable devices.
class IoTAnalytics {
  final _s.RestJsonProtocol _protocol;
  IoTAnalytics({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotanalytics',
            signingName: 'iotanalytics',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// The field names of message payloads (data) that you send to AWS IoT
  /// Analytics:
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
    @_s.required String channelName,
    @_s.required List<Message> messages,
  }) async {
    ArgumentError.checkNotNull(channelName, 'channelName');
    _s.validateStringLength(
      'channelName',
      channelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelName',
      channelName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(messages, 'messages');
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
    @_s.required String pipelineName,
    @_s.required String reprocessingId,
  }) async {
    ArgumentError.checkNotNull(pipelineName, 'pipelineName');
    _s.validateStringLength(
      'pipelineName',
      pipelineName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineName',
      pipelineName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(reprocessingId, 'reprocessingId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/pipelines/${Uri.encodeComponent(pipelineName)}/reprocessing/${Uri.encodeComponent(reprocessingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelPipelineReprocessingResponse.fromJson(response);
  }

  /// Creates a channel. A channel collects data from an MQTT topic and archives
  /// the raw, unprocessed messages before publishing the data to a pipeline.
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
  /// If not specified, the default is <code>serviceManagedS3</code>. You cannot
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
    @_s.required String channelName,
    ChannelStorage channelStorage,
    RetentionPeriod retentionPeriod,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(channelName, 'channelName');
    _s.validateStringLength(
      'channelName',
      channelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelName',
      channelName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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

  /// Creates a dataset. A dataset stores data retrieved from a data store by
  /// applying a <code>queryAction</code> (a SQL query) or a
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
  /// A list of actions that create the data set contents.
  ///
  /// Parameter [datasetName] :
  /// The name of the data set.
  ///
  /// Parameter [contentDeliveryRules] :
  /// When dataset contents are created, they are delivered to destinations
  /// specified here.
  ///
  /// Parameter [lateDataRules] :
  /// A list of data rules that send notifications to Amazon CloudWatch, when
  /// data arrives late. To specify <code>lateDataRules</code>, the dataset must
  /// use a <a
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
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions">Keeping
  /// Multiple Versions of AWS IoT Analytics Data Sets</a> in the <i>AWS IoT
  /// Analytics User Guide</i>.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the data set.
  ///
  /// Parameter [triggers] :
  /// A list of triggers. A trigger causes data set contents to be populated at
  /// a specified time interval or when another data set's contents are created.
  /// The list of triggers can be empty or contain up to five
  /// <code>DataSetTrigger</code> objects.
  ///
  /// Parameter [versioningConfiguration] :
  /// Optional. How many versions of dataset contents are kept. If not specified
  /// or set to null, only the latest version plus the latest succeeded version
  /// (if they are different) are kept for the time period specified by the
  /// <code>retentionPeriod</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions">Keeping
  /// Multiple Versions of AWS IoT Analytics Data Sets</a> in the <i>AWS IoT
  /// Analytics User Guide</i>.
  Future<CreateDatasetResponse> createDataset({
    @_s.required List<DatasetAction> actions,
    @_s.required String datasetName,
    List<DatasetContentDeliveryRule> contentDeliveryRules,
    List<LateDataRule> lateDataRules,
    RetentionPeriod retentionPeriod,
    List<Tag> tags,
    List<DatasetTrigger> triggers,
    VersioningConfiguration versioningConfiguration,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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

  /// Creates the content of a data set by applying a <code>queryAction</code>
  /// (a SQL query) or a <code>containerAction</code> (executing a containerized
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
    @_s.required String datasetName,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      7,
      36,
    );
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
  /// Parameter [datastoreStorage] :
  /// Where data store data is stored. You can choose one of
  /// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage.
  /// If not specified, the default is <code>serviceManagedS3</code>. You cannot
  /// change this storage option after the data store is created.
  ///
  /// Parameter [fileFormatConfiguration] :
  /// Contains the configuration information of file formats. AWS IoT Analytics
  /// data stores support JSON and <a
  /// href="https://parquet.apache.org/">Parquet</a>.
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
    @_s.required String datastoreName,
    DatastoreStorage datastoreStorage,
    FileFormatConfiguration fileFormatConfiguration,
    RetentionPeriod retentionPeriod,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(datastoreName, 'datastoreName');
    _s.validateStringLength(
      'datastoreName',
      datastoreName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datastoreName',
      datastoreName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'datastoreName': datastoreName,
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
  /// The name of the pipeline.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the pipeline.
  Future<CreatePipelineResponse> createPipeline({
    @_s.required List<PipelineActivity> pipelineActivities,
    @_s.required String pipelineName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(pipelineActivities, 'pipelineActivities');
    ArgumentError.checkNotNull(pipelineName, 'pipelineName');
    _s.validateStringLength(
      'pipelineName',
      pipelineName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineName',
      pipelineName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
    @_s.required String channelName,
  }) async {
    ArgumentError.checkNotNull(channelName, 'channelName');
    _s.validateStringLength(
      'channelName',
      channelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelName',
      channelName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
  /// The name of the data set to delete.
  Future<void> deleteDataset({
    @_s.required String datasetName,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
    @_s.required String datasetName,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      7,
      36,
    );
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
    @_s.required String datastoreName,
  }) async {
    ArgumentError.checkNotNull(datastoreName, 'datastoreName');
    _s.validateStringLength(
      'datastoreName',
      datastoreName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datastoreName',
      datastoreName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
    @_s.required String pipelineName,
  }) async {
    ArgumentError.checkNotNull(pipelineName, 'pipelineName');
    _s.validateStringLength(
      'pipelineName',
      pipelineName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineName',
      pipelineName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
  /// in the response. This feature cannot be used with a channel whose S3
  /// storage is customer-managed.
  Future<DescribeChannelResponse> describeChannel({
    @_s.required String channelName,
    bool includeStatistics,
  }) async {
    ArgumentError.checkNotNull(channelName, 'channelName');
    _s.validateStringLength(
      'channelName',
      channelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelName',
      channelName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
  /// The name of the data set whose information is retrieved.
  Future<DescribeDatasetResponse> describeDataset({
    @_s.required String datasetName,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
  /// included in the response. This feature cannot be used with a data store
  /// whose S3 storage is customer-managed.
  Future<DescribeDatastoreResponse> describeDatastore({
    @_s.required String datastoreName,
    bool includeStatistics,
  }) async {
    ArgumentError.checkNotNull(datastoreName, 'datastoreName');
    _s.validateStringLength(
      'datastoreName',
      datastoreName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datastoreName',
      datastoreName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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

  /// Retrieves the current settings of the AWS IoT Analytics logging options.
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
    @_s.required String pipelineName,
  }) async {
    ArgumentError.checkNotNull(pipelineName, 'pipelineName');
    _s.validateStringLength(
      'pipelineName',
      pipelineName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineName',
      pipelineName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/pipelines/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePipelineResponse.fromJson(response);
  }

  /// Retrieves the contents of a data set as presigned URIs.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetName] :
  /// The name of the data set whose contents are retrieved.
  ///
  /// Parameter [versionId] :
  /// The version of the data set whose contents are retrieved. You can also use
  /// the strings "$LATEST" or "$LATEST_SUCCEEDED" to retrieve the contents of
  /// the latest or latest successfully completed data set. If not specified,
  /// "$LATEST_SUCCEEDED" is the default.
  Future<GetDatasetContentResponse> getDatasetContent({
    @_s.required String datasetName,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      7,
      36,
    );
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
    int maxResults,
    String nextToken,
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

  /// Lists information about data set contents that have been created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetName] :
  /// The name of the data set whose contents information you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [scheduledBefore] :
  /// A filter to limit results to those data set contents whose creation is
  /// scheduled before the given time. See the field
  /// <code>triggers.schedule</code> in the <code>CreateDataset</code> request.
  /// (timestamp)
  ///
  /// Parameter [scheduledOnOrAfter] :
  /// A filter to limit results to those data set contents whose creation is
  /// scheduled on or after the given time. See the field
  /// <code>triggers.schedule</code> in the <code>CreateDataset</code> request.
  /// (timestamp)
  Future<ListDatasetContentsResponse> listDatasetContents({
    @_s.required String datasetName,
    int maxResults,
    String nextToken,
    DateTime scheduledBefore,
    DateTime scheduledOnOrAfter,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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

  /// Retrieves information about data sets.
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
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

  /// Sets or updates the AWS IoT Analytics logging options.
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
  /// The new values of the AWS IoT Analytics logging options.
  Future<void> putLoggingOptions({
    @_s.required LoggingOptions loggingOptions,
  }) async {
    ArgumentError.checkNotNull(loggingOptions, 'loggingOptions');
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
  /// a datastore activity because these activities are used in a pipeline only
  /// to load the original message and to store the (possibly) transformed
  /// message. If a lambda activity is specified, only short-running Lambda
  /// functions (those with a timeout of less than 30 seconds or less) can be
  /// used.
  Future<RunPipelineActivityResponse> runPipelineActivity({
    @_s.required List<Uint8List> payloads,
    @_s.required PipelineActivity pipelineActivity,
  }) async {
    ArgumentError.checkNotNull(payloads, 'payloads');
    ArgumentError.checkNotNull(pipelineActivity, 'pipelineActivity');
    final $payload = <String, dynamic>{
      'payloads': payloads?.map((e) => e?.let(base64Encode))?.toList(),
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
    @_s.required String channelName,
    DateTime endTime,
    int maxMessages,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(channelName, 'channelName');
    _s.validateStringLength(
      'channelName',
      channelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelName',
      channelName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
    @_s.required String pipelineName,
    ChannelMessages channelMessages,
    DateTime endTime,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(pipelineName, 'pipelineName');
    _s.validateStringLength(
      'pipelineName',
      pipelineName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineName',
      pipelineName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates the settings of a channel.
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
  /// If not specified, the default is <code>serviceManagedS3</code>. You cannot
  /// change this storage option after the channel is created.
  ///
  /// Parameter [retentionPeriod] :
  /// How long, in days, message data is kept for the channel. The retention
  /// period cannot be updated if the channel's S3 storage is customer-managed.
  Future<void> updateChannel({
    @_s.required String channelName,
    ChannelStorage channelStorage,
    RetentionPeriod retentionPeriod,
  }) async {
    ArgumentError.checkNotNull(channelName, 'channelName');
    _s.validateStringLength(
      'channelName',
      channelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelName',
      channelName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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

  /// Updates the settings of a data set.
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
  /// The name of the data set to update.
  ///
  /// Parameter [contentDeliveryRules] :
  /// When dataset contents are created, they are delivered to destinations
  /// specified here.
  ///
  /// Parameter [lateDataRules] :
  /// A list of data rules that send notifications to Amazon CloudWatch, when
  /// data arrives late. To specify <code>lateDataRules</code>, the dataset must
  /// use a <a
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
  /// Multiple Versions of AWS IoT Analytics Data Sets</a> in the <i>AWS IoT
  /// Analytics User Guide</i>.
  Future<void> updateDataset({
    @_s.required List<DatasetAction> actions,
    @_s.required String datasetName,
    List<DatasetContentDeliveryRule> contentDeliveryRules,
    List<LateDataRule> lateDataRules,
    RetentionPeriod retentionPeriod,
    List<DatasetTrigger> triggers,
    VersioningConfiguration versioningConfiguration,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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

  /// Updates the settings of a data store.
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
  /// Where data store data is stored. You can choose one of
  /// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage.
  /// If not specified, the default is<code>serviceManagedS3</code>. You cannot
  /// change this storage option after the data store is created.
  ///
  /// Parameter [fileFormatConfiguration] :
  /// Contains the configuration information of file formats. AWS IoT Analytics
  /// data stores support JSON and <a
  /// href="https://parquet.apache.org/">Parquet</a>.
  ///
  /// The default file format is JSON. You can specify only one format.
  ///
  /// You can't change the file format after you create the data store.
  ///
  /// Parameter [retentionPeriod] :
  /// How long, in days, message data is kept for the data store. The retention
  /// period cannot be updated if the data store's S3 storage is
  /// customer-managed.
  Future<void> updateDatastore({
    @_s.required String datastoreName,
    DatastoreStorage datastoreStorage,
    FileFormatConfiguration fileFormatConfiguration,
    RetentionPeriod retentionPeriod,
  }) async {
    ArgumentError.checkNotNull(datastoreName, 'datastoreName');
    _s.validateStringLength(
      'datastoreName',
      datastoreName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datastoreName',
      datastoreName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
    @_s.required List<PipelineActivity> pipelineActivities,
    @_s.required String pipelineName,
  }) async {
    ArgumentError.checkNotNull(pipelineActivities, 'pipelineActivities');
    ArgumentError.checkNotNull(pipelineName, 'pipelineName');
    _s.validateStringLength(
      'pipelineName',
      pipelineName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineName',
      pipelineName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AddAttributesActivity {
  /// A list of 1-50 <code>AttributeNameMapping</code> objects that map an
  /// existing attribute to a new attribute.
  /// <note>
  /// The existing attributes remain in the message, so if you want to remove the
  /// originals, use <code>RemoveAttributeActivity</code>.
  /// </note>
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// The name of the addAttributes activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  AddAttributesActivity({
    @_s.required this.attributes,
    @_s.required this.name,
    this.next,
  });
  factory AddAttributesActivity.fromJson(Map<String, dynamic> json) =>
      _$AddAttributesActivityFromJson(json);

  Map<String, dynamic> toJson() => _$AddAttributesActivityToJson(this);
}

/// Contains informations about errors.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutMessageErrorEntry {
  /// The code associated with the error.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The message associated with the error.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The ID of the message that caused the error. See the value corresponding to
  /// the <code>messageId</code> key in the message object.
  @_s.JsonKey(name: 'messageId')
  final String messageId;

  BatchPutMessageErrorEntry({
    this.errorCode,
    this.errorMessage,
    this.messageId,
  });
  factory BatchPutMessageErrorEntry.fromJson(Map<String, dynamic> json) =>
      _$BatchPutMessageErrorEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutMessageResponse {
  /// A list of any errors encountered when sending the messages to the channel.
  @_s.JsonKey(name: 'batchPutMessageErrorEntries')
  final List<BatchPutMessageErrorEntry> batchPutMessageErrorEntries;

  BatchPutMessageResponse({
    this.batchPutMessageErrorEntries,
  });
  factory BatchPutMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchPutMessageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelPipelineReprocessingResponse {
  CancelPipelineReprocessingResponse();
  factory CancelPipelineReprocessingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelPipelineReprocessingResponseFromJson(json);
}

/// A collection of data from an MQTT topic. Channels archive the raw,
/// unprocessed messages before publishing the data to a pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Channel {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// When the channel was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The last time when a new message arrived in the channel.
  ///
  /// AWS IoT Analytics updates this value at most once per minute for one
  /// channel. Hence, the <code>lastMessageArrivalTime</code> value is an
  /// approximation.
  ///
  /// This feature only applies to messages that arrived in the data store after
  /// October 23, 2020.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastMessageArrivalTime')
  final DateTime lastMessageArrivalTime;

  /// When the channel was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The name of the channel.
  @_s.JsonKey(name: 'name')
  final String name;

  /// How long, in days, message data is kept for the channel.
  @_s.JsonKey(name: 'retentionPeriod')
  final RetentionPeriod retentionPeriod;

  /// The status of the channel.
  @_s.JsonKey(name: 'status')
  final ChannelStatus status;

  /// Where channel data is stored. You can choose one of
  /// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage. If
  /// not specified, the default is <code>serviceManagedS3</code>. You cannot
  /// change this storage option after the channel is created.
  @_s.JsonKey(name: 'storage')
  final ChannelStorage storage;

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
  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

/// The activity that determines the source of the messages to be processed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ChannelActivity {
  /// The name of the channel from which the messages are processed.
  @_s.JsonKey(name: 'channelName')
  final String channelName;

  /// The name of the channel activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  ChannelActivity({
    @_s.required this.channelName,
    @_s.required this.name,
    this.next,
  });
  factory ChannelActivity.fromJson(Map<String, dynamic> json) =>
      _$ChannelActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelActivityToJson(this);
}

/// Specifies one or more sets of channel messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ChannelMessages {
  /// Specifies one or more keys that identify the Amazon Simple Storage Service
  /// (Amazon S3) objects that save your channel messages.
  @_s.JsonKey(name: 's3Paths')
  final List<String> s3Paths;

  ChannelMessages({
    this.s3Paths,
  });
  Map<String, dynamic> toJson() => _$ChannelMessagesToJson(this);
}

/// Statistics information about the channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelStatistics {
  /// The estimated size of the channel.
  @_s.JsonKey(name: 'size')
  final EstimatedResourceSize size;

  ChannelStatistics({
    this.size,
  });
  factory ChannelStatistics.fromJson(Map<String, dynamic> json) =>
      _$ChannelStatisticsFromJson(json);
}

enum ChannelStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
}

/// Where channel data is stored. You may choose one of
/// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage. If
/// not specified, the default is <code>serviceManagedS3</code>. This cannot be
/// changed after creation of the channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ChannelStorage {
  /// Use this to store channel data in an S3 bucket that you manage. If customer
  /// managed storage is selected, the <code>retentionPeriod</code> parameter is
  /// ignored. You cannot change the choice of service-managed or customer-managed
  /// S3 storage after the channel is created.
  @_s.JsonKey(name: 'customerManagedS3')
  final CustomerManagedChannelS3Storage customerManagedS3;

  /// Use this to store channel data in an S3 bucket managed by AWS IoT Analytics.
  /// You cannot change the choice of service-managed or customer-managed S3
  /// storage after the channel is created.
  @_s.JsonKey(name: 'serviceManagedS3')
  final ServiceManagedChannelS3Storage serviceManagedS3;

  ChannelStorage({
    this.customerManagedS3,
    this.serviceManagedS3,
  });
  factory ChannelStorage.fromJson(Map<String, dynamic> json) =>
      _$ChannelStorageFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelStorageToJson(this);
}

/// Where channel data is stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelStorageSummary {
  /// Used to store channel data in an S3 bucket that you manage.
  @_s.JsonKey(name: 'customerManagedS3')
  final CustomerManagedChannelS3StorageSummary customerManagedS3;

  /// Used to store channel data in an S3 bucket managed by AWS IoT Analytics.
  @_s.JsonKey(name: 'serviceManagedS3')
  final ServiceManagedChannelS3StorageSummary serviceManagedS3;

  ChannelStorageSummary({
    this.customerManagedS3,
    this.serviceManagedS3,
  });
  factory ChannelStorageSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelStorageSummaryFromJson(json);
}

/// A summary of information about a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelSummary {
  /// The name of the channel.
  @_s.JsonKey(name: 'channelName')
  final String channelName;

  /// Where channel data is stored.
  @_s.JsonKey(name: 'channelStorage')
  final ChannelStorageSummary channelStorage;

  /// When the channel was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The last time when a new message arrived in the channel.
  ///
  /// AWS IoT Analytics updates this value at most once per minute for one
  /// channel. Hence, the <code>lastMessageArrivalTime</code> value is an
  /// approximation.
  ///
  /// This feature only applies to messages that arrived in the data store after
  /// October 23, 2020.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastMessageArrivalTime')
  final DateTime lastMessageArrivalTime;

  /// The last time the channel was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The status of the channel.
  @_s.JsonKey(name: 'status')
  final ChannelStatus status;

  ChannelSummary({
    this.channelName,
    this.channelStorage,
    this.creationTime,
    this.lastMessageArrivalTime,
    this.lastUpdateTime,
    this.status,
  });
  factory ChannelSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelSummaryFromJson(json);
}

/// Contains information about a column that stores your data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Column {
  /// The name of the column.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of data. For more information about the supported data types, see
  /// <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-common.html">Common
  /// data types</a> in the <i>AWS Glue Developer Guide</i>.
  @_s.JsonKey(name: 'type')
  final String type;

  Column({
    @_s.required this.name,
    @_s.required this.type,
  });
  factory Column.fromJson(Map<String, dynamic> json) => _$ColumnFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnToJson(this);
}

enum ComputeType {
  @_s.JsonValue('ACU_1')
  acu_1,
  @_s.JsonValue('ACU_2')
  acu_2,
}

/// Information required to run the <code>containerAction</code> to produce
/// dataset contents.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerDatasetAction {
  /// The ARN of the role that gives permission to the system to access required
  /// resources to run the <code>containerAction</code>. This includes, at
  /// minimum, permission to retrieve the dataset contents that are the input to
  /// the containerized application.
  @_s.JsonKey(name: 'executionRoleArn')
  final String executionRoleArn;

  /// The ARN of the Docker container stored in your account. The Docker container
  /// contains an application and required support libraries and is used to
  /// generate dataset contents.
  @_s.JsonKey(name: 'image')
  final String image;

  /// Configuration of the resource that executes the
  /// <code>containerAction</code>.
  @_s.JsonKey(name: 'resourceConfiguration')
  final ResourceConfiguration resourceConfiguration;

  /// The values of variables used in the context of the execution of the
  /// containerized application (basically, parameters passed to the application).
  /// Each variable must have a name and a value given by one of
  /// <code>stringValue</code>, <code>datasetContentVersionValue</code>, or
  /// <code>outputFileUriValue</code>.
  @_s.JsonKey(name: 'variables')
  final List<Variable> variables;

  ContainerDatasetAction({
    @_s.required this.executionRoleArn,
    @_s.required this.image,
    @_s.required this.resourceConfiguration,
    this.variables,
  });
  factory ContainerDatasetAction.fromJson(Map<String, dynamic> json) =>
      _$ContainerDatasetActionFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerDatasetActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateChannelResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'channelArn')
  final String channelArn;

  /// The name of the channel.
  @_s.JsonKey(name: 'channelName')
  final String channelName;

  /// How long, in days, message data is kept for the channel.
  @_s.JsonKey(name: 'retentionPeriod')
  final RetentionPeriod retentionPeriod;

  CreateChannelResponse({
    this.channelArn,
    this.channelName,
    this.retentionPeriod,
  });
  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatasetContentResponse {
  /// The version ID of the dataset contents that are being created.
  @_s.JsonKey(name: 'versionId')
  final String versionId;

  CreateDatasetContentResponse({
    this.versionId,
  });
  factory CreateDatasetContentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatasetContentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatasetResponse {
  /// The ARN of the dataset.
  @_s.JsonKey(name: 'datasetArn')
  final String datasetArn;

  /// The name of the dataset.
  @_s.JsonKey(name: 'datasetName')
  final String datasetName;

  /// How long, in days, dataset contents are kept for the dataset.
  @_s.JsonKey(name: 'retentionPeriod')
  final RetentionPeriod retentionPeriod;

  CreateDatasetResponse({
    this.datasetArn,
    this.datasetName,
    this.retentionPeriod,
  });
  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatastoreResponse {
  /// The ARN of the data store.
  @_s.JsonKey(name: 'datastoreArn')
  final String datastoreArn;

  /// The name of the data store.
  @_s.JsonKey(name: 'datastoreName')
  final String datastoreName;

  /// How long, in days, message data is kept for the data store.
  @_s.JsonKey(name: 'retentionPeriod')
  final RetentionPeriod retentionPeriod;

  CreateDatastoreResponse({
    this.datastoreArn,
    this.datastoreName,
    this.retentionPeriod,
  });
  factory CreateDatastoreResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatastoreResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePipelineResponse {
  /// The ARN of the pipeline.
  @_s.JsonKey(name: 'pipelineArn')
  final String pipelineArn;

  /// The name of the pipeline.
  @_s.JsonKey(name: 'pipelineName')
  final String pipelineName;

  CreatePipelineResponse({
    this.pipelineArn,
    this.pipelineName,
  });
  factory CreatePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePipelineResponseFromJson(json);
}

/// Use this to store channel data in an S3 bucket that you manage. If customer
/// managed storage is selected, the <code>retentionPeriod</code> parameter is
/// ignored. You cannot change the choice of service-managed or customer-managed
/// S3 storage after the channel is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomerManagedChannelS3Storage {
  /// The name of the S3 bucket in which channel data is stored.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// The ARN of the role that grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 resources.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Optional. The prefix used to create the keys of the channel data objects.
  /// Each object in an S3 bucket has a key that is its unique identifier in the
  /// bucket. Each object in a bucket has exactly one key. The prefix must end
  /// with a forward slash (/).
  @_s.JsonKey(name: 'keyPrefix')
  final String keyPrefix;

  CustomerManagedChannelS3Storage({
    @_s.required this.bucket,
    @_s.required this.roleArn,
    this.keyPrefix,
  });
  factory CustomerManagedChannelS3Storage.fromJson(Map<String, dynamic> json) =>
      _$CustomerManagedChannelS3StorageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomerManagedChannelS3StorageToJson(this);
}

/// Used to store channel data in an S3 bucket that you manage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomerManagedChannelS3StorageSummary {
  /// The name of the S3 bucket in which channel data is stored.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// Optional. The prefix used to create the keys of the channel data objects.
  /// Each object in an S3 bucket has a key that is its unique identifier within
  /// the bucket (each object in a bucket has exactly one key). The prefix must
  /// end with a forward slash (/).
  @_s.JsonKey(name: 'keyPrefix')
  final String keyPrefix;

  /// The ARN of the role that grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 resources.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  CustomerManagedChannelS3StorageSummary({
    this.bucket,
    this.keyPrefix,
    this.roleArn,
  });
  factory CustomerManagedChannelS3StorageSummary.fromJson(
          Map<String, dynamic> json) =>
      _$CustomerManagedChannelS3StorageSummaryFromJson(json);
}

/// Use this to store data store data in an S3 bucket that you manage. When
/// customer-managed storage is selected, the <code>retentionPeriod</code>
/// parameter is ignored. You cannot change the choice of service-managed or
/// customer-managed S3 storage after the data store is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomerManagedDatastoreS3Storage {
  /// The name of the S3 bucket in which data store data is stored.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// The ARN of the role that grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 resources.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Optional. The prefix used to create the keys of the data store data objects.
  /// Each object in an S3 bucket has a key that is its unique identifier in the
  /// bucket. Each object in a bucket has exactly one key. The prefix must end
  /// with a forward slash (/).
  @_s.JsonKey(name: 'keyPrefix')
  final String keyPrefix;

  CustomerManagedDatastoreS3Storage({
    @_s.required this.bucket,
    @_s.required this.roleArn,
    this.keyPrefix,
  });
  factory CustomerManagedDatastoreS3Storage.fromJson(
          Map<String, dynamic> json) =>
      _$CustomerManagedDatastoreS3StorageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomerManagedDatastoreS3StorageToJson(this);
}

/// Used to store data store data in an S3 bucket that you manage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomerManagedDatastoreS3StorageSummary {
  /// The name of the S3 bucket in which data store data is stored.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// Optional. The prefix used to create the keys of the data store data objects.
  /// Each object in an S3 bucket has a key that is its unique identifier in the
  /// bucket. Each object in a bucket has exactly one key. The prefix must end
  /// with a forward slash (/).
  @_s.JsonKey(name: 'keyPrefix')
  final String keyPrefix;

  /// The ARN of the role that grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 resources.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  CustomerManagedDatastoreS3StorageSummary({
    this.bucket,
    this.keyPrefix,
    this.roleArn,
  });
  factory CustomerManagedDatastoreS3StorageSummary.fromJson(
          Map<String, dynamic> json) =>
      _$CustomerManagedDatastoreS3StorageSummaryFromJson(json);
}

/// Information about a data set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Dataset {
  /// The <code>DatasetAction</code> objects that automatically create the data
  /// set contents.
  @_s.JsonKey(name: 'actions')
  final List<DatasetAction> actions;

  /// The ARN of the data set.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// When dataset contents are created they are delivered to destinations
  /// specified here.
  @_s.JsonKey(name: 'contentDeliveryRules')
  final List<DatasetContentDeliveryRule> contentDeliveryRules;

  /// When the data set was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The last time the data set was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// A list of data rules that send notifications to Amazon CloudWatch, when data
  /// arrives late. To specify <code>lateDataRules</code>, the dataset must use a
  /// <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_DeltaTime.html">DeltaTimer</a>
  /// filter.
  @_s.JsonKey(name: 'lateDataRules')
  final List<LateDataRule> lateDataRules;

  /// The name of the data set.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Optional. How long, in days, message data is kept for the data set.
  @_s.JsonKey(name: 'retentionPeriod')
  final RetentionPeriod retentionPeriod;

  /// The status of the data set.
  @_s.JsonKey(name: 'status')
  final DatasetStatus status;

  /// The <code>DatasetTrigger</code> objects that specify when the data set is
  /// automatically updated.
  @_s.JsonKey(name: 'triggers')
  final List<DatasetTrigger> triggers;

  /// Optional. How many versions of dataset contents are kept. If not specified
  /// or set to null, only the latest version plus the latest succeeded version
  /// (if they are different) are kept for the time period specified by the
  /// <code>retentionPeriod</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions">Keeping
  /// Multiple Versions of AWS IoT Analytics Data Sets</a> in the <i>AWS IoT
  /// Analytics User Guide</i>.
  @_s.JsonKey(name: 'versioningConfiguration')
  final VersioningConfiguration versioningConfiguration;

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
  factory Dataset.fromJson(Map<String, dynamic> json) =>
      _$DatasetFromJson(json);
}

/// A <code>DatasetAction</code> object that specifies how data set contents are
/// automatically created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatasetAction {
  /// The name of the data set action by which data set contents are automatically
  /// created.
  @_s.JsonKey(name: 'actionName')
  final String actionName;

  /// Information that allows the system to run a containerized application to
  /// create the dataset contents. The application must be in a Docker container
  /// along with any required support libraries.
  @_s.JsonKey(name: 'containerAction')
  final ContainerDatasetAction containerAction;

  /// An <code>SqlQueryDatasetAction</code> object that uses an SQL query to
  /// automatically create data set contents.
  @_s.JsonKey(name: 'queryAction')
  final SqlQueryDatasetAction queryAction;

  DatasetAction({
    this.actionName,
    this.containerAction,
    this.queryAction,
  });
  factory DatasetAction.fromJson(Map<String, dynamic> json) =>
      _$DatasetActionFromJson(json);

  Map<String, dynamic> toJson() => _$DatasetActionToJson(this);
}

/// Information about the action that automatically creates the dataset's
/// contents.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetActionSummary {
  /// The name of the action that automatically creates the dataset's contents.
  @_s.JsonKey(name: 'actionName')
  final String actionName;

  /// The type of action by which the dataset's contents are automatically
  /// created.
  @_s.JsonKey(name: 'actionType')
  final DatasetActionType actionType;

  DatasetActionSummary({
    this.actionName,
    this.actionType,
  });
  factory DatasetActionSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetActionSummaryFromJson(json);
}

enum DatasetActionType {
  @_s.JsonValue('QUERY')
  query,
  @_s.JsonValue('CONTAINER')
  container,
}

/// The destination to which dataset contents are delivered.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatasetContentDeliveryDestination {
  /// Configuration information for delivery of dataset contents to AWS IoT
  /// Events.
  @_s.JsonKey(name: 'iotEventsDestinationConfiguration')
  final IotEventsDestinationConfiguration iotEventsDestinationConfiguration;

  /// Configuration information for delivery of dataset contents to Amazon S3.
  @_s.JsonKey(name: 's3DestinationConfiguration')
  final S3DestinationConfiguration s3DestinationConfiguration;

  DatasetContentDeliveryDestination({
    this.iotEventsDestinationConfiguration,
    this.s3DestinationConfiguration,
  });
  factory DatasetContentDeliveryDestination.fromJson(
          Map<String, dynamic> json) =>
      _$DatasetContentDeliveryDestinationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DatasetContentDeliveryDestinationToJson(this);
}

/// When dataset contents are created, they are delivered to destination
/// specified here.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatasetContentDeliveryRule {
  /// The destination to which dataset contents are delivered.
  @_s.JsonKey(name: 'destination')
  final DatasetContentDeliveryDestination destination;

  /// The name of the dataset content delivery rules entry.
  @_s.JsonKey(name: 'entryName')
  final String entryName;

  DatasetContentDeliveryRule({
    @_s.required this.destination,
    this.entryName,
  });
  factory DatasetContentDeliveryRule.fromJson(Map<String, dynamic> json) =>
      _$DatasetContentDeliveryRuleFromJson(json);

  Map<String, dynamic> toJson() => _$DatasetContentDeliveryRuleToJson(this);
}

enum DatasetContentState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

/// The state of the data set contents and the reason they are in this state.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetContentStatus {
  /// The reason the data set contents are in this state.
  @_s.JsonKey(name: 'reason')
  final String reason;

  /// The state of the data set contents. Can be one of READY, CREATING,
  /// SUCCEEDED, or FAILED.
  @_s.JsonKey(name: 'state')
  final DatasetContentState state;

  DatasetContentStatus({
    this.reason,
    this.state,
  });
  factory DatasetContentStatus.fromJson(Map<String, dynamic> json) =>
      _$DatasetContentStatusFromJson(json);
}

/// Summary information about dataset contents.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetContentSummary {
  /// The time the dataset content status was updated to SUCCEEDED or FAILED.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'completionTime')
  final DateTime completionTime;

  /// The actual time the creation of the dataset contents was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The time the creation of the dataset contents was scheduled to start.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'scheduleTime')
  final DateTime scheduleTime;

  /// The status of the data set contents.
  @_s.JsonKey(name: 'status')
  final DatasetContentStatus status;

  /// The version of the dataset contents.
  @_s.JsonKey(name: 'version')
  final String version;

  DatasetContentSummary({
    this.completionTime,
    this.creationTime,
    this.scheduleTime,
    this.status,
    this.version,
  });
  factory DatasetContentSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetContentSummaryFromJson(json);
}

/// The dataset whose latest contents are used as input to the notebook or
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatasetContentVersionValue {
  /// The name of the dataset whose latest contents are used as input to the
  /// notebook or application.
  @_s.JsonKey(name: 'datasetName')
  final String datasetName;

  DatasetContentVersionValue({
    @_s.required this.datasetName,
  });
  factory DatasetContentVersionValue.fromJson(Map<String, dynamic> json) =>
      _$DatasetContentVersionValueFromJson(json);

  Map<String, dynamic> toJson() => _$DatasetContentVersionValueToJson(this);
}

/// The reference to a data set entry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetEntry {
  /// The presigned URI of the data set item.
  @_s.JsonKey(name: 'dataURI')
  final String dataURI;

  /// The name of the data set item.
  @_s.JsonKey(name: 'entryName')
  final String entryName;

  DatasetEntry({
    this.dataURI,
    this.entryName,
  });
  factory DatasetEntry.fromJson(Map<String, dynamic> json) =>
      _$DatasetEntryFromJson(json);
}

enum DatasetStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
}

/// A summary of information about a data set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetSummary {
  /// A list of <code>DataActionSummary</code> objects.
  @_s.JsonKey(name: 'actions')
  final List<DatasetActionSummary> actions;

  /// The time the data set was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The name of the data set.
  @_s.JsonKey(name: 'datasetName')
  final String datasetName;

  /// The last time the data set was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The status of the data set.
  @_s.JsonKey(name: 'status')
  final DatasetStatus status;

  /// A list of triggers. A trigger causes data set content to be populated at a
  /// specified time interval or when another data set is populated. The list of
  /// triggers can be empty or contain up to five <code>DataSetTrigger</code>
  /// objects
  @_s.JsonKey(name: 'triggers')
  final List<DatasetTrigger> triggers;

  DatasetSummary({
    this.actions,
    this.creationTime,
    this.datasetName,
    this.lastUpdateTime,
    this.status,
    this.triggers,
  });
  factory DatasetSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetSummaryFromJson(json);
}

/// The <code>DatasetTrigger</code> that specifies when the data set is
/// automatically updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatasetTrigger {
  /// The data set whose content creation triggers the creation of this data set's
  /// contents.
  @_s.JsonKey(name: 'dataset')
  final TriggeringDataset dataset;

  /// The Schedule when the trigger is initiated.
  @_s.JsonKey(name: 'schedule')
  final Schedule schedule;

  DatasetTrigger({
    this.dataset,
    this.schedule,
  });
  factory DatasetTrigger.fromJson(Map<String, dynamic> json) =>
      _$DatasetTriggerFromJson(json);

  Map<String, dynamic> toJson() => _$DatasetTriggerToJson(this);
}

/// Information about a data store.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Datastore {
  /// The ARN of the data store.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// When the data store was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// Contains the configuration information of file formats. AWS IoT Analytics
  /// data stores support JSON and <a
  /// href="https://parquet.apache.org/">Parquet</a>.
  ///
  /// The default file format is JSON. You can specify only one format.
  ///
  /// You can't change the file format after you create the data store.
  @_s.JsonKey(name: 'fileFormatConfiguration')
  final FileFormatConfiguration fileFormatConfiguration;

  /// The last time when a new message arrived in the data store.
  ///
  /// AWS IoT Analytics updates this value at most once per minute for one data
  /// store. Hence, the <code>lastMessageArrivalTime</code> value is an
  /// approximation.
  ///
  /// This feature only applies to messages that arrived in the data store after
  /// October 23, 2020.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastMessageArrivalTime')
  final DateTime lastMessageArrivalTime;

  /// The last time the data store was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The name of the data store.
  @_s.JsonKey(name: 'name')
  final String name;

  /// How long, in days, message data is kept for the data store. When
  /// <code>customerManagedS3</code> storage is selected, this parameter is
  /// ignored.
  @_s.JsonKey(name: 'retentionPeriod')
  final RetentionPeriod retentionPeriod;

  /// The status of a data store:
  /// <dl> <dt>CREATING</dt> <dd>
  /// The data store is being created.
  /// </dd> <dt>ACTIVE</dt> <dd>
  /// The data store has been created and can be used.
  /// </dd> <dt>DELETING</dt> <dd>
  /// The data store is being deleted.
  /// </dd> </dl>
  @_s.JsonKey(name: 'status')
  final DatastoreStatus status;

  /// Where data store data is stored. You can choose one of
  /// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage. If
  /// not specified, the default is <code>serviceManagedS3</code>. You cannot
  /// change this storage option after the data store is created.
  @_s.JsonKey(name: 'storage')
  final DatastoreStorage storage;

  Datastore({
    this.arn,
    this.creationTime,
    this.fileFormatConfiguration,
    this.lastMessageArrivalTime,
    this.lastUpdateTime,
    this.name,
    this.retentionPeriod,
    this.status,
    this.storage,
  });
  factory Datastore.fromJson(Map<String, dynamic> json) =>
      _$DatastoreFromJson(json);
}

/// The datastore activity that specifies where to store the processed data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatastoreActivity {
  /// The name of the data store where processed messages are stored.
  @_s.JsonKey(name: 'datastoreName')
  final String datastoreName;

  /// The name of the datastore activity.
  @_s.JsonKey(name: 'name')
  final String name;

  DatastoreActivity({
    @_s.required this.datastoreName,
    @_s.required this.name,
  });
  factory DatastoreActivity.fromJson(Map<String, dynamic> json) =>
      _$DatastoreActivityFromJson(json);

  Map<String, dynamic> toJson() => _$DatastoreActivityToJson(this);
}

/// Statistical information about the data store.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatastoreStatistics {
  /// The estimated size of the data store.
  @_s.JsonKey(name: 'size')
  final EstimatedResourceSize size;

  DatastoreStatistics({
    this.size,
  });
  factory DatastoreStatistics.fromJson(Map<String, dynamic> json) =>
      _$DatastoreStatisticsFromJson(json);
}

enum DatastoreStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
}

/// Where data store data is stored. You can choose one of
/// <code>serviceManagedS3</code> or <code>customerManagedS3</code> storage. If
/// not specified, the default is <code>serviceManagedS3</code>. You cannot
/// change this storage option after the data store is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatastoreStorage {
  /// Use this to store data store data in an S3 bucket that you manage. When
  /// customer managed storage is selected, the <code>retentionPeriod</code>
  /// parameter is ignored. The choice of service-managed or customer-managed S3
  /// storage cannot be changed after creation of the data store.
  @_s.JsonKey(name: 'customerManagedS3')
  final CustomerManagedDatastoreS3Storage customerManagedS3;

  /// Use this to store data store data in an S3 bucket managed by AWS IoT
  /// Analytics. You cannot change the choice of service-managed or
  /// customer-managed S3 storage after the data store is created.
  @_s.JsonKey(name: 'serviceManagedS3')
  final ServiceManagedDatastoreS3Storage serviceManagedS3;

  DatastoreStorage({
    this.customerManagedS3,
    this.serviceManagedS3,
  });
  factory DatastoreStorage.fromJson(Map<String, dynamic> json) =>
      _$DatastoreStorageFromJson(json);

  Map<String, dynamic> toJson() => _$DatastoreStorageToJson(this);
}

/// Where data store data is stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatastoreStorageSummary {
  /// Used to store data store data in an S3 bucket that you manage.
  @_s.JsonKey(name: 'customerManagedS3')
  final CustomerManagedDatastoreS3StorageSummary customerManagedS3;

  /// Used to store data store data in an S3 bucket managed by AWS IoT Analytics.
  @_s.JsonKey(name: 'serviceManagedS3')
  final ServiceManagedDatastoreS3StorageSummary serviceManagedS3;

  DatastoreStorageSummary({
    this.customerManagedS3,
    this.serviceManagedS3,
  });
  factory DatastoreStorageSummary.fromJson(Map<String, dynamic> json) =>
      _$DatastoreStorageSummaryFromJson(json);
}

/// A summary of information about a data store.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatastoreSummary {
  /// When the data store was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The name of the data store.
  @_s.JsonKey(name: 'datastoreName')
  final String datastoreName;

  /// Where data store data is stored.
  @_s.JsonKey(name: 'datastoreStorage')
  final DatastoreStorageSummary datastoreStorage;

  /// The file format of the data in the data store.
  @_s.JsonKey(name: 'fileFormatType')
  final FileFormatType fileFormatType;

  /// The last time when a new message arrived in the data store.
  ///
  /// AWS IoT Analytics updates this value at most once per minute for one data
  /// store. Hence, the <code>lastMessageArrivalTime</code> value is an
  /// approximation.
  ///
  /// This feature only applies to messages that arrived in the data store after
  /// October 23, 2020.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastMessageArrivalTime')
  final DateTime lastMessageArrivalTime;

  /// The last time the data store was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The status of the data store.
  @_s.JsonKey(name: 'status')
  final DatastoreStatus status;

  DatastoreSummary({
    this.creationTime,
    this.datastoreName,
    this.datastoreStorage,
    this.fileFormatType,
    this.lastMessageArrivalTime,
    this.lastUpdateTime,
    this.status,
  });
  factory DatastoreSummary.fromJson(Map<String, dynamic> json) =>
      _$DatastoreSummaryFromJson(json);
}

/// Used to limit data to that which has arrived since the last execution of the
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeltaTime {
  /// The number of seconds of estimated in-flight lag time of message data. When
  /// you create dataset contents using message data from a specified timeframe,
  /// some message data might still be in flight when processing begins, and so do
  /// not arrive in time to be processed. Use this field to make allowances for
  /// the in flight time of your message data, so that data not processed from a
  /// previous timeframe is included with the next timeframe. Otherwise, missed
  /// message data would be excluded from processing during the next timeframe
  /// too, because its timestamp places it within the previous timeframe.
  @_s.JsonKey(name: 'offsetSeconds')
  final int offsetSeconds;

  /// An expression by which the time of the message data might be determined.
  /// This can be the name of a timestamp field or a SQL expression that is used
  /// to derive the time the message data was generated.
  @_s.JsonKey(name: 'timeExpression')
  final String timeExpression;

  DeltaTime({
    @_s.required this.offsetSeconds,
    @_s.required this.timeExpression,
  });
  factory DeltaTime.fromJson(Map<String, dynamic> json) =>
      _$DeltaTimeFromJson(json);

  Map<String, dynamic> toJson() => _$DeltaTimeToJson(this);
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
/// Creating a SQL dataset with a delta window (CLI)</a> in the <i>AWS IoT
/// Analytics User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeltaTimeSessionWindowConfiguration {
  /// A time interval. You can use <code>timeoutInMinutes</code> so that AWS IoT
  /// Analytics can batch up late data notifications that have been generated
  /// since the last execution. AWS IoT Analytics sends one batch of notifications
  /// to Amazon CloudWatch Events at one time.
  ///
  /// For more information about how to write a timestamp expression, see <a
  /// href="https://prestodb.io/docs/0.172/functions/datetime.html">Date and Time
  /// Functions and Operators</a>, in the <i>Presto 0.172 Documentation</i>.
  @_s.JsonKey(name: 'timeoutInMinutes')
  final int timeoutInMinutes;

  DeltaTimeSessionWindowConfiguration({
    @_s.required this.timeoutInMinutes,
  });
  factory DeltaTimeSessionWindowConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$DeltaTimeSessionWindowConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeltaTimeSessionWindowConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelResponse {
  /// An object that contains information about the channel.
  @_s.JsonKey(name: 'channel')
  final Channel channel;

  /// Statistics about the channel. Included if the <code>includeStatistics</code>
  /// parameter is set to <code>true</code> in the request.
  @_s.JsonKey(name: 'statistics')
  final ChannelStatistics statistics;

  DescribeChannelResponse({
    this.channel,
    this.statistics,
  });
  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatasetResponse {
  /// An object that contains information about the data set.
  @_s.JsonKey(name: 'dataset')
  final Dataset dataset;

  DescribeDatasetResponse({
    this.dataset,
  });
  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatastoreResponse {
  /// Information about the data store.
  @_s.JsonKey(name: 'datastore')
  final Datastore datastore;

  /// Additional statistical information about the data store. Included if the
  /// <code>includeStatistics</code> parameter is set to <code>true</code> in the
  /// request.
  @_s.JsonKey(name: 'statistics')
  final DatastoreStatistics statistics;

  DescribeDatastoreResponse({
    this.datastore,
    this.statistics,
  });
  factory DescribeDatastoreResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatastoreResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLoggingOptionsResponse {
  /// The current settings of the AWS IoT Analytics logging options.
  @_s.JsonKey(name: 'loggingOptions')
  final LoggingOptions loggingOptions;

  DescribeLoggingOptionsResponse({
    this.loggingOptions,
  });
  factory DescribeLoggingOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLoggingOptionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePipelineResponse {
  /// A <code>Pipeline</code> object that contains information about the pipeline.
  @_s.JsonKey(name: 'pipeline')
  final Pipeline pipeline;

  DescribePipelineResponse({
    this.pipeline,
  });
  factory DescribePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePipelineResponseFromJson(json);
}

/// An activity that adds data from the AWS IoT device registry to your message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeviceRegistryEnrichActivity {
  /// The name of the attribute that is added to the message.
  @_s.JsonKey(name: 'attribute')
  final String attribute;

  /// The name of the <code>deviceRegistryEnrich</code> activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ARN of the role that allows access to the device's registry information.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The name of the IoT device whose registry information is added to the
  /// message.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  DeviceRegistryEnrichActivity({
    @_s.required this.attribute,
    @_s.required this.name,
    @_s.required this.roleArn,
    @_s.required this.thingName,
    this.next,
  });
  factory DeviceRegistryEnrichActivity.fromJson(Map<String, dynamic> json) =>
      _$DeviceRegistryEnrichActivityFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceRegistryEnrichActivityToJson(this);
}

/// An activity that adds information from the AWS IoT Device Shadow service to
/// a message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeviceShadowEnrichActivity {
  /// The name of the attribute that is added to the message.
  @_s.JsonKey(name: 'attribute')
  final String attribute;

  /// The name of the <code>deviceShadowEnrich</code> activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ARN of the role that allows access to the device's shadow.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The name of the IoT device whose shadow information is added to the message.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  DeviceShadowEnrichActivity({
    @_s.required this.attribute,
    @_s.required this.name,
    @_s.required this.roleArn,
    @_s.required this.thingName,
    this.next,
  });
  factory DeviceShadowEnrichActivity.fromJson(Map<String, dynamic> json) =>
      _$DeviceShadowEnrichActivityFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceShadowEnrichActivityToJson(this);
}

/// The estimated size of the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EstimatedResourceSize {
  /// The time when the estimate of the size of the resource was made.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'estimatedOn')
  final DateTime estimatedOn;

  /// The estimated size of the resource, in bytes.
  @_s.JsonKey(name: 'estimatedSizeInBytes')
  final double estimatedSizeInBytes;

  EstimatedResourceSize({
    this.estimatedOn,
    this.estimatedSizeInBytes,
  });
  factory EstimatedResourceSize.fromJson(Map<String, dynamic> json) =>
      _$EstimatedResourceSizeFromJson(json);
}

/// Contains the configuration information of file formats. AWS IoT Analytics
/// data stores support JSON and <a
/// href="https://parquet.apache.org/">Parquet</a>.
///
/// The default file format is JSON. You can specify only one format.
///
/// You can't change the file format after you create the data store.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FileFormatConfiguration {
  /// Contains the configuration information of the JSON format.
  @_s.JsonKey(name: 'jsonConfiguration')
  final JsonConfiguration jsonConfiguration;

  /// Contains the configuration information of the Parquet format.
  @_s.JsonKey(name: 'parquetConfiguration')
  final ParquetConfiguration parquetConfiguration;

  FileFormatConfiguration({
    this.jsonConfiguration,
    this.parquetConfiguration,
  });
  factory FileFormatConfiguration.fromJson(Map<String, dynamic> json) =>
      _$FileFormatConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$FileFormatConfigurationToJson(this);
}

enum FileFormatType {
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('PARQUET')
  parquet,
}

/// An activity that filters a message based on its attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FilterActivity {
  /// An expression that looks like a SQL WHERE clause that must return a Boolean
  /// value. Messages that satisfy the condition are passed to the next activity.
  @_s.JsonKey(name: 'filter')
  final String filter;

  /// The name of the filter activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  FilterActivity({
    @_s.required this.filter,
    @_s.required this.name,
    this.next,
  });
  factory FilterActivity.fromJson(Map<String, dynamic> json) =>
      _$FilterActivityFromJson(json);

  Map<String, dynamic> toJson() => _$FilterActivityToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDatasetContentResponse {
  /// A list of <code>DatasetEntry</code> objects.
  @_s.JsonKey(name: 'entries')
  final List<DatasetEntry> entries;

  /// The status of the data set content.
  @_s.JsonKey(name: 'status')
  final DatasetContentStatus status;

  /// The time when the request was made.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'timestamp')
  final DateTime timestamp;

  GetDatasetContentResponse({
    this.entries,
    this.status,
    this.timestamp,
  });
  factory GetDatasetContentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDatasetContentResponseFromJson(json);
}

/// Configuration information for coordination with AWS Glue, a fully managed
/// extract, transform and load (ETL) service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GlueConfiguration {
  /// The name of the database in your AWS Glue Data Catalog in which the table is
  /// located. An AWS Glue Data Catalog database contains metadata tables.
  @_s.JsonKey(name: 'databaseName')
  final String databaseName;

  /// The name of the table in your AWS Glue Data Catalog that is used to perform
  /// the ETL operations. An AWS Glue Data Catalog table contains partitioned data
  /// and descriptions of data sources and targets.
  @_s.JsonKey(name: 'tableName')
  final String tableName;

  GlueConfiguration({
    @_s.required this.databaseName,
    @_s.required this.tableName,
  });
  factory GlueConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GlueConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$GlueConfigurationToJson(this);
}

/// Configuration information for delivery of dataset contents to AWS IoT
/// Events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IotEventsDestinationConfiguration {
  /// The name of the AWS IoT Events input to which dataset contents are
  /// delivered.
  @_s.JsonKey(name: 'inputName')
  final String inputName;

  /// The ARN of the role that grants AWS IoT Analytics permission to deliver
  /// dataset contents to an AWS IoT Events input.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  IotEventsDestinationConfiguration({
    @_s.required this.inputName,
    @_s.required this.roleArn,
  });
  factory IotEventsDestinationConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$IotEventsDestinationConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IotEventsDestinationConfigurationToJson(this);
}

/// Contains the configuration information of the JSON format.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JsonConfiguration {
  JsonConfiguration();
  factory JsonConfiguration.fromJson(Map<String, dynamic> json) =>
      _$JsonConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$JsonConfigurationToJson(this);
}

/// An activity that runs a Lambda function to modify the message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LambdaActivity {
  /// The number of messages passed to the Lambda function for processing.
  ///
  /// The Lambda function must be able to process all of these messages within
  /// five minutes, which is the maximum timeout duration for Lambda functions.
  @_s.JsonKey(name: 'batchSize')
  final int batchSize;

  /// The name of the Lambda function that is run on the message.
  @_s.JsonKey(name: 'lambdaName')
  final String lambdaName;

  /// The name of the lambda activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  LambdaActivity({
    @_s.required this.batchSize,
    @_s.required this.lambdaName,
    @_s.required this.name,
    this.next,
  });
  factory LambdaActivity.fromJson(Map<String, dynamic> json) =>
      _$LambdaActivityFromJson(json);

  Map<String, dynamic> toJson() => _$LambdaActivityToJson(this);
}

/// A structure that contains the name and configuration information of a late
/// data rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LateDataRule {
  /// The information needed to configure the late data rule.
  @_s.JsonKey(name: 'ruleConfiguration')
  final LateDataRuleConfiguration ruleConfiguration;

  /// The name of the late data rule.
  @_s.JsonKey(name: 'ruleName')
  final String ruleName;

  LateDataRule({
    @_s.required this.ruleConfiguration,
    this.ruleName,
  });
  factory LateDataRule.fromJson(Map<String, dynamic> json) =>
      _$LateDataRuleFromJson(json);

  Map<String, dynamic> toJson() => _$LateDataRuleToJson(this);
}

/// The information needed to configure a delta time session window.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LateDataRuleConfiguration {
  /// The information needed to configure a delta time session window.
  @_s.JsonKey(name: 'deltaTimeSessionWindowConfiguration')
  final DeltaTimeSessionWindowConfiguration deltaTimeSessionWindowConfiguration;

  LateDataRuleConfiguration({
    this.deltaTimeSessionWindowConfiguration,
  });
  factory LateDataRuleConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LateDataRuleConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$LateDataRuleConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelsResponse {
  /// A list of <code>ChannelSummary</code> objects.
  @_s.JsonKey(name: 'channelSummaries')
  final List<ChannelSummary> channelSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListChannelsResponse({
    this.channelSummaries,
    this.nextToken,
  });
  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetContentsResponse {
  /// Summary information about data set contents that have been created.
  @_s.JsonKey(name: 'datasetContentSummaries')
  final List<DatasetContentSummary> datasetContentSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDatasetContentsResponse({
    this.datasetContentSummaries,
    this.nextToken,
  });
  factory ListDatasetContentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatasetContentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetsResponse {
  /// A list of <code>DatasetSummary</code> objects.
  @_s.JsonKey(name: 'datasetSummaries')
  final List<DatasetSummary> datasetSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDatasetsResponse({
    this.datasetSummaries,
    this.nextToken,
  });
  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatasetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatastoresResponse {
  /// A list of <code>DatastoreSummary</code> objects.
  @_s.JsonKey(name: 'datastoreSummaries')
  final List<DatastoreSummary> datastoreSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDatastoresResponse({
    this.datastoreSummaries,
    this.nextToken,
  });
  factory ListDatastoresResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatastoresResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPipelinesResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of <code>PipelineSummary</code> objects.
  @_s.JsonKey(name: 'pipelineSummaries')
  final List<PipelineSummary> pipelineSummaries;

  ListPipelinesResponse({
    this.nextToken,
    this.pipelineSummaries,
  });
  factory ListPipelinesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPipelinesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags (metadata) that you have assigned to the resource.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum LoggingLevel {
  @_s.JsonValue('ERROR')
  error,
}

/// Information about logging options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingOptions {
  /// If true, logging is enabled for AWS IoT Analytics.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// The logging level. Currently, only ERROR is supported.
  @_s.JsonKey(name: 'level')
  final LoggingLevel level;

  /// The ARN of the role that grants permission to AWS IoT Analytics to perform
  /// logging.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  LoggingOptions({
    @_s.required this.enabled,
    @_s.required this.level,
    @_s.required this.roleArn,
  });
  factory LoggingOptions.fromJson(Map<String, dynamic> json) =>
      _$LoggingOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingOptionsToJson(this);
}

/// An activity that computes an arithmetic expression using the message's
/// attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MathActivity {
  /// The name of the attribute that contains the result of the math operation.
  @_s.JsonKey(name: 'attribute')
  final String attribute;

  /// An expression that uses one or more existing attributes and must return an
  /// integer value.
  @_s.JsonKey(name: 'math')
  final String math;

  /// The name of the math activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  MathActivity({
    @_s.required this.attribute,
    @_s.required this.math,
    @_s.required this.name,
    this.next,
  });
  factory MathActivity.fromJson(Map<String, dynamic> json) =>
      _$MathActivityFromJson(json);

  Map<String, dynamic> toJson() => _$MathActivityToJson(this);
}

/// Information about a message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Message {
  /// The ID you want to assign to the message. Each <code>messageId</code> must
  /// be unique within each batch sent.
  @_s.JsonKey(name: 'messageId')
  final String messageId;

  /// The payload of the message. This can be a JSON string or a base64-encoded
  /// string representing binary data, in which case you must decode it by means
  /// of a pipeline activity.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'payload')
  final Uint8List payload;

  Message({
    @_s.required this.messageId,
    @_s.required this.payload,
  });
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// The value of the variable as a structure that specifies an output file URI.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputFileUriValue {
  /// The URI of the location where dataset contents are stored, usually the URI
  /// of a file in an S3 bucket.
  @_s.JsonKey(name: 'fileName')
  final String fileName;

  OutputFileUriValue({
    @_s.required this.fileName,
  });
  factory OutputFileUriValue.fromJson(Map<String, dynamic> json) =>
      _$OutputFileUriValueFromJson(json);

  Map<String, dynamic> toJson() => _$OutputFileUriValueToJson(this);
}

/// Contains the configuration information of the Parquet format.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParquetConfiguration {
  /// Information needed to define a schema.
  @_s.JsonKey(name: 'schemaDefinition')
  final SchemaDefinition schemaDefinition;

  ParquetConfiguration({
    this.schemaDefinition,
  });
  factory ParquetConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ParquetConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ParquetConfigurationToJson(this);
}

/// Contains information about a pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Pipeline {
  /// The activities that perform transformations on the messages.
  @_s.JsonKey(name: 'activities')
  final List<PipelineActivity> activities;

  /// The ARN of the pipeline.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// When the pipeline was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The last time the pipeline was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The name of the pipeline.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A summary of information about the pipeline reprocessing.
  @_s.JsonKey(name: 'reprocessingSummaries')
  final List<ReprocessingSummary> reprocessingSummaries;

  Pipeline({
    this.activities,
    this.arn,
    this.creationTime,
    this.lastUpdateTime,
    this.name,
    this.reprocessingSummaries,
  });
  factory Pipeline.fromJson(Map<String, dynamic> json) =>
      _$PipelineFromJson(json);
}

/// An activity that performs a transformation on a message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PipelineActivity {
  /// Adds other attributes based on existing attributes in the message.
  @_s.JsonKey(name: 'addAttributes')
  final AddAttributesActivity addAttributes;

  /// Determines the source of the messages to be processed.
  @_s.JsonKey(name: 'channel')
  final ChannelActivity channel;

  /// Specifies where to store the processed message data.
  @_s.JsonKey(name: 'datastore')
  final DatastoreActivity datastore;

  /// Adds data from the AWS IoT device registry to your message.
  @_s.JsonKey(name: 'deviceRegistryEnrich')
  final DeviceRegistryEnrichActivity deviceRegistryEnrich;

  /// Adds information from the AWS IoT Device Shadow service to a message.
  @_s.JsonKey(name: 'deviceShadowEnrich')
  final DeviceShadowEnrichActivity deviceShadowEnrich;

  /// Filters a message based on its attributes.
  @_s.JsonKey(name: 'filter')
  final FilterActivity filter;

  /// Runs a Lambda function to modify the message.
  @_s.JsonKey(name: 'lambda')
  final LambdaActivity lambda;

  /// Computes an arithmetic expression using the message's attributes and adds it
  /// to the message.
  @_s.JsonKey(name: 'math')
  final MathActivity math;

  /// Removes attributes from a message.
  @_s.JsonKey(name: 'removeAttributes')
  final RemoveAttributesActivity removeAttributes;

  /// Creates a new message using only the specified attributes from the original
  /// message.
  @_s.JsonKey(name: 'selectAttributes')
  final SelectAttributesActivity selectAttributes;

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
  factory PipelineActivity.fromJson(Map<String, dynamic> json) =>
      _$PipelineActivityFromJson(json);

  Map<String, dynamic> toJson() => _$PipelineActivityToJson(this);
}

/// A summary of information about a pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PipelineSummary {
  /// When the pipeline was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// When the pipeline was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The name of the pipeline.
  @_s.JsonKey(name: 'pipelineName')
  final String pipelineName;

  /// A summary of information about the pipeline reprocessing.
  @_s.JsonKey(name: 'reprocessingSummaries')
  final List<ReprocessingSummary> reprocessingSummaries;

  PipelineSummary({
    this.creationTime,
    this.lastUpdateTime,
    this.pipelineName,
    this.reprocessingSummaries,
  });
  factory PipelineSummary.fromJson(Map<String, dynamic> json) =>
      _$PipelineSummaryFromJson(json);
}

/// Information that is used to filter message data, to segregate it according
/// to the timeframe in which it arrives.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class QueryFilter {
  /// Used to limit data to that which has arrived since the last execution of the
  /// action.
  @_s.JsonKey(name: 'deltaTime')
  final DeltaTime deltaTime;

  QueryFilter({
    this.deltaTime,
  });
  factory QueryFilter.fromJson(Map<String, dynamic> json) =>
      _$QueryFilterFromJson(json);

  Map<String, dynamic> toJson() => _$QueryFilterToJson(this);
}

/// An activity that removes attributes from a message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RemoveAttributesActivity {
  /// A list of 1-50 attributes to remove from the message.
  @_s.JsonKey(name: 'attributes')
  final List<String> attributes;

  /// The name of the <code>removeAttributes</code> activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  RemoveAttributesActivity({
    @_s.required this.attributes,
    @_s.required this.name,
    this.next,
  });
  factory RemoveAttributesActivity.fromJson(Map<String, dynamic> json) =>
      _$RemoveAttributesActivityFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveAttributesActivityToJson(this);
}

enum ReprocessingStatus {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('FAILED')
  failed,
}

/// Information about pipeline reprocessing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReprocessingSummary {
  /// The time the pipeline reprocessing was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The <code>reprocessingId</code> returned by
  /// <code>StartPipelineReprocessing</code>.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The status of the pipeline reprocessing.
  @_s.JsonKey(name: 'status')
  final ReprocessingStatus status;

  ReprocessingSummary({
    this.creationTime,
    this.id,
    this.status,
  });
  factory ReprocessingSummary.fromJson(Map<String, dynamic> json) =>
      _$ReprocessingSummaryFromJson(json);
}

/// The configuration of the resource used to execute the
/// <code>containerAction</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceConfiguration {
  /// The type of the compute resource used to execute the
  /// <code>containerAction</code>. Possible values are: <code>ACU_1</code>
  /// (vCPU=4, memory=16 GiB) or <code>ACU_2</code> (vCPU=8, memory=32 GiB).
  @_s.JsonKey(name: 'computeType')
  final ComputeType computeType;

  /// The size, in GB, of the persistent storage available to the resource
  /// instance used to execute the <code>containerAction</code> (min: 1, max: 50).
  @_s.JsonKey(name: 'volumeSizeInGB')
  final int volumeSizeInGB;

  ResourceConfiguration({
    @_s.required this.computeType,
    @_s.required this.volumeSizeInGB,
  });
  factory ResourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ResourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceConfigurationToJson(this);
}

/// How long, in days, message data is kept.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RetentionPeriod {
  /// The number of days that message data is kept. The <code>unlimited</code>
  /// parameter must be false.
  @_s.JsonKey(name: 'numberOfDays')
  final int numberOfDays;

  /// If true, message data is kept indefinitely.
  @_s.JsonKey(name: 'unlimited')
  final bool unlimited;

  RetentionPeriod({
    this.numberOfDays,
    this.unlimited,
  });
  factory RetentionPeriod.fromJson(Map<String, dynamic> json) =>
      _$RetentionPeriodFromJson(json);

  Map<String, dynamic> toJson() => _$RetentionPeriodToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RunPipelineActivityResponse {
  /// In case the pipeline activity fails, the log message that is generated.
  @_s.JsonKey(name: 'logResult')
  final String logResult;

  /// The enriched or transformed sample message payloads as base64-encoded
  /// strings. (The results of running the pipeline activity on each input sample
  /// message payload, encoded in base64.)
  @Uint8ListListConverter()
  @_s.JsonKey(name: 'payloads')
  final List<Uint8List> payloads;

  RunPipelineActivityResponse({
    this.logResult,
    this.payloads,
  });
  factory RunPipelineActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$RunPipelineActivityResponseFromJson(json);
}

/// Configuration information for delivery of dataset contents to Amazon Simple
/// Storage Service (Amazon S3).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3DestinationConfiguration {
  /// The name of the S3 bucket to which dataset contents are delivered.
  @_s.JsonKey(name: 'bucket')
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
  @_s.JsonKey(name: 'key')
  final String key;

  /// The ARN of the role that grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 and AWS Glue resources.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Configuration information for coordination with AWS Glue, a fully managed
  /// extract, transform and load (ETL) service.
  @_s.JsonKey(name: 'glueConfiguration')
  final GlueConfiguration glueConfiguration;

  S3DestinationConfiguration({
    @_s.required this.bucket,
    @_s.required this.key,
    @_s.required this.roleArn,
    this.glueConfiguration,
  });
  factory S3DestinationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$S3DestinationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$S3DestinationConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SampleChannelDataResponse {
  /// The list of message samples. Each sample message is returned as a
  /// base64-encoded string.
  @Uint8ListListConverter()
  @_s.JsonKey(name: 'payloads')
  final List<Uint8List> payloads;

  SampleChannelDataResponse({
    this.payloads,
  });
  factory SampleChannelDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SampleChannelDataResponseFromJson(json);
}

/// The schedule for when to trigger an update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Schedule {
  /// The expression that defines when to trigger an update. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html">Schedule
  /// Expressions for Rules</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  @_s.JsonKey(name: 'expression')
  final String expression;

  Schedule({
    this.expression,
  });
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

/// Information needed to define a schema.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SchemaDefinition {
  /// Specifies one or more columns that store your data.
  ///
  /// Each schema can have up to 100 columns. Each column can have up to 100
  /// nested types
  @_s.JsonKey(name: 'columns')
  final List<Column> columns;

  SchemaDefinition({
    this.columns,
  });
  factory SchemaDefinition.fromJson(Map<String, dynamic> json) =>
      _$SchemaDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaDefinitionToJson(this);
}

/// Creates a new message using only the specified attributes from the original
/// message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SelectAttributesActivity {
  /// A list of the attributes to select from the message.
  @_s.JsonKey(name: 'attributes')
  final List<String> attributes;

  /// The name of the <code>selectAttributes</code> activity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next activity in the pipeline.
  @_s.JsonKey(name: 'next')
  final String next;

  SelectAttributesActivity({
    @_s.required this.attributes,
    @_s.required this.name,
    this.next,
  });
  factory SelectAttributesActivity.fromJson(Map<String, dynamic> json) =>
      _$SelectAttributesActivityFromJson(json);

  Map<String, dynamic> toJson() => _$SelectAttributesActivityToJson(this);
}

/// Use this to store channel data in an S3 bucket managed by AWS IoT Analytics.
/// You cannot change the choice of service-managed or customer-managed S3
/// storage after the channel is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceManagedChannelS3Storage {
  ServiceManagedChannelS3Storage();
  factory ServiceManagedChannelS3Storage.fromJson(Map<String, dynamic> json) =>
      _$ServiceManagedChannelS3StorageFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceManagedChannelS3StorageToJson(this);
}

/// Used to store channel data in an S3 bucket managed by AWS IoT Analytics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceManagedChannelS3StorageSummary {
  ServiceManagedChannelS3StorageSummary();
  factory ServiceManagedChannelS3StorageSummary.fromJson(
          Map<String, dynamic> json) =>
      _$ServiceManagedChannelS3StorageSummaryFromJson(json);
}

/// Use this to store data store data in an S3 bucket managed by AWS IoT
/// Analytics. You cannot change the choice of service-managed or
/// customer-managed S3 storage after the data store is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceManagedDatastoreS3Storage {
  ServiceManagedDatastoreS3Storage();
  factory ServiceManagedDatastoreS3Storage.fromJson(
          Map<String, dynamic> json) =>
      _$ServiceManagedDatastoreS3StorageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ServiceManagedDatastoreS3StorageToJson(this);
}

/// Used to store data store data in an S3 bucket managed by AWS IoT Analytics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceManagedDatastoreS3StorageSummary {
  ServiceManagedDatastoreS3StorageSummary();
  factory ServiceManagedDatastoreS3StorageSummary.fromJson(
          Map<String, dynamic> json) =>
      _$ServiceManagedDatastoreS3StorageSummaryFromJson(json);
}

/// The SQL query to modify the message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SqlQueryDatasetAction {
  /// A SQL query string.
  @_s.JsonKey(name: 'sqlQuery')
  final String sqlQuery;

  /// Prefilters applied to message data.
  @_s.JsonKey(name: 'filters')
  final List<QueryFilter> filters;

  SqlQueryDatasetAction({
    @_s.required this.sqlQuery,
    this.filters,
  });
  factory SqlQueryDatasetAction.fromJson(Map<String, dynamic> json) =>
      _$SqlQueryDatasetActionFromJson(json);

  Map<String, dynamic> toJson() => _$SqlQueryDatasetActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartPipelineReprocessingResponse {
  /// The ID of the pipeline reprocessing activity that was started.
  @_s.JsonKey(name: 'reprocessingId')
  final String reprocessingId;

  StartPipelineReprocessingResponse({
    this.reprocessingId,
  });
  factory StartPipelineReprocessingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartPipelineReprocessingResponseFromJson(json);
}

/// A set of key-value pairs that are used to manage the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag's key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The tag's value.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Information about the dataset whose content generation triggers the new
/// dataset content generation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TriggeringDataset {
  /// The name of the dataset whose content generation triggers the new dataset
  /// content generation.
  @_s.JsonKey(name: 'name')
  final String name;

  TriggeringDataset({
    @_s.required this.name,
  });
  factory TriggeringDataset.fromJson(Map<String, dynamic> json) =>
      _$TriggeringDatasetFromJson(json);

  Map<String, dynamic> toJson() => _$TriggeringDatasetToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// An instance of a variable to be passed to the <code>containerAction</code>
/// execution. Each variable must have a name and a value given by one of
/// <code>stringValue</code>, <code>datasetContentVersionValue</code>, or
/// <code>outputFileUriValue</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Variable {
  /// The name of the variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The value of the variable as a structure that specifies a dataset content
  /// version.
  @_s.JsonKey(name: 'datasetContentVersionValue')
  final DatasetContentVersionValue datasetContentVersionValue;

  /// The value of the variable as a double (numeric).
  @_s.JsonKey(name: 'doubleValue')
  final double doubleValue;

  /// The value of the variable as a structure that specifies an output file URI.
  @_s.JsonKey(name: 'outputFileUriValue')
  final OutputFileUriValue outputFileUriValue;

  /// The value of the variable as a string.
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  Variable({
    @_s.required this.name,
    this.datasetContentVersionValue,
    this.doubleValue,
    this.outputFileUriValue,
    this.stringValue,
  });
  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);

  Map<String, dynamic> toJson() => _$VariableToJson(this);
}

/// Information about the versioning of dataset contents.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VersioningConfiguration {
  /// How many versions of dataset contents are kept. The <code>unlimited</code>
  /// parameter must be <code>false</code>.
  @_s.JsonKey(name: 'maxVersions')
  final int maxVersions;

  /// If true, unlimited versions of dataset contents are kept.
  @_s.JsonKey(name: 'unlimited')
  final bool unlimited;

  VersioningConfiguration({
    this.maxVersions,
    this.unlimited,
  });
  factory VersioningConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VersioningConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VersioningConfigurationToJson(this);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
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
