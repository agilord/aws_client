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

/// Welcome to the IoT SiteWise API Reference. IoT SiteWise is an Amazon Web
/// Services service that connects <a
/// href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">Industrial
/// Internet of Things (IIoT)</a> devices to the power of the Amazon Web
/// Services Cloud. For more information, see the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/">IoT
/// SiteWise User Guide</a>. For information about IoT SiteWise quotas, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
/// in the <i>IoT SiteWise User Guide</i>.
class IoTSiteWise {
  final _s.RestJsonProtocol _protocol;
  IoTSiteWise({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotsitewise',
            signingName: 'iotsitewise',
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

  /// Associates a child asset with the given parent asset through a hierarchy
  /// defined in the parent asset's model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/add-associated-assets.html">Associating
  /// assets</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the parent asset.
  ///
  /// Parameter [childAssetId] :
  /// The ID of the child asset to be associated.
  ///
  /// Parameter [hierarchyId] :
  /// The ID of a hierarchy in the parent asset's model. Hierarchies allow
  /// different groupings of assets to be formed that all come from the same
  /// asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> associateAssets({
    required String assetId,
    required String childAssetId,
    required String hierarchyId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'childAssetId': childAssetId,
      'hierarchyId': hierarchyId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/associate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a time series (data stream) with an asset property.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [alias] :
  /// The alias that identifies the time series.
  ///
  /// Parameter [assetId] :
  /// The ID of the asset in which the asset property was created.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> associateTimeSeriesToAssetProperty({
    required String alias,
    required String assetId,
    required String propertyId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'alias': [alias],
      'assetId': [assetId],
      'propertyId': [propertyId],
    };
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/timeseries/associate/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a group (batch) of assets with an IoT SiteWise Monitor project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [assetIds] :
  /// The IDs of the assets to be associated to the project.
  ///
  /// Parameter [projectId] :
  /// The ID of the project to which to associate the assets.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<BatchAssociateProjectAssetsResponse> batchAssociateProjectAssets({
    required List<String> assetIds,
    required String projectId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'assetIds': assetIds,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(projectId)}/assets/associate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAssociateProjectAssetsResponse.fromJson(response);
  }

  /// Disassociates a group (batch) of assets from an IoT SiteWise Monitor
  /// project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetIds] :
  /// The IDs of the assets to be disassociated from the project.
  ///
  /// Parameter [projectId] :
  /// The ID of the project from which to disassociate the assets.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<BatchDisassociateProjectAssetsResponse>
      batchDisassociateProjectAssets({
    required List<String> assetIds,
    required String projectId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'assetIds': assetIds,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(projectId)}/assets/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisassociateProjectAssetsResponse.fromJson(response);
  }

  /// Gets aggregated values (for example, average, minimum, and maximum) for
  /// one or more asset properties. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates">Querying
  /// aggregates</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [entries] :
  /// The list of asset property aggregate entries for the batch get request.
  /// You can specify up to 16 entries per request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request. A
  /// result set is returned in the two cases, whichever occurs first.
  ///
  /// <ul>
  /// <li>
  /// The size of the result set is equal to 1 MB.
  /// </li>
  /// <li>
  /// The number of data points in the result set is equal to the value of
  /// <code>maxResults</code>. The maximum value of <code>maxResults</code> is
  /// 4000.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<BatchGetAssetPropertyAggregatesResponse>
      batchGetAssetPropertyAggregates({
    required List<BatchGetAssetPropertyAggregatesEntry> entries,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'entries': entries,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/properties/batch/aggregates',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetAssetPropertyAggregatesResponse.fromJson(response);
  }

  /// Gets the current value for one or more asset properties. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#current-values">Querying
  /// current values</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [entries] :
  /// The list of asset property value entries for the batch get request. You
  /// can specify up to 128 entries per request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<BatchGetAssetPropertyValueResponse> batchGetAssetPropertyValue({
    required List<BatchGetAssetPropertyValueEntry> entries,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'entries': entries,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/properties/batch/latest',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetAssetPropertyValueResponse.fromJson(response);
  }

  /// Gets the historical values for one or more asset properties. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#historical-values">Querying
  /// historical values</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [entries] :
  /// The list of asset property historical value entries for the batch get
  /// request. You can specify up to 16 entries per request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request. A
  /// result set is returned in the two cases, whichever occurs first.
  ///
  /// <ul>
  /// <li>
  /// The size of the result set is equal to 4 MB.
  /// </li>
  /// <li>
  /// The number of data points in the result set is equal to the value of
  /// <code>maxResults</code>. The maximum value of <code>maxResults</code> is
  /// 20000.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<BatchGetAssetPropertyValueHistoryResponse>
      batchGetAssetPropertyValueHistory({
    required List<BatchGetAssetPropertyValueHistoryEntry> entries,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'entries': entries,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/properties/batch/history',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetAssetPropertyValueHistoryResponse.fromJson(response);
  }

  /// Sends a list of asset property values to IoT SiteWise. Each value is a
  /// timestamp-quality-value (TQV) data point. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ingest-api.html">Ingesting
  /// data using the API</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul> <important>
  /// With respect to Unix epoch time, IoT SiteWise accepts only TQVs that have
  /// a timestamp of no more than 7 days in the past and no more than 10 minutes
  /// in the future. IoT SiteWise rejects timestamps outside of the inclusive
  /// range of [-7 days, +10 minutes] and returns a
  /// <code>TimestampOutOfRangeException</code> error.
  ///
  /// For each asset property, IoT SiteWise overwrites TQVs with duplicate
  /// timestamps unless the newer TQV has a different quality. For example, if
  /// you store a TQV <code>{T1, GOOD, V1}</code>, then storing <code>{T1, GOOD,
  /// V2}</code> replaces the existing TQV.
  /// </important>
  /// IoT SiteWise authorizes access to each
  /// <code>BatchPutAssetPropertyValue</code> entry individually. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-batchputassetpropertyvalue-action">BatchPutAssetPropertyValue
  /// authorization</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [entries] :
  /// The list of asset property value entries for the batch put request. You
  /// can specify up to 10 entries per request.
  Future<BatchPutAssetPropertyValueResponse> batchPutAssetPropertyValue({
    required List<PutAssetPropertyValueEntry> entries,
  }) async {
    final $payload = <String, dynamic>{
      'entries': entries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/properties',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutAssetPropertyValueResponse.fromJson(response);
  }

  /// Creates an access policy that grants the specified identity (IAM Identity
  /// Center user, IAM Identity Center group, or IAM user) access to the
  /// specified IoT SiteWise Monitor portal or project resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accessPolicyIdentity] :
  /// The identity for this access policy. Choose an IAM Identity Center user,
  /// an IAM Identity Center group, or an IAM user.
  ///
  /// Parameter [accessPolicyPermission] :
  /// The permission level for this access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  ///
  /// Parameter [accessPolicyResource] :
  /// The IoT SiteWise Monitor resource for this access policy. Choose either a
  /// portal or a project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the access policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
  Future<CreateAccessPolicyResponse> createAccessPolicy({
    required Identity accessPolicyIdentity,
    required Permission accessPolicyPermission,
    required Resource accessPolicyResource,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'accessPolicyIdentity': accessPolicyIdentity,
      'accessPolicyPermission': accessPolicyPermission.toValue(),
      'accessPolicyResource': accessPolicyResource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/access-policies',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessPolicyResponse.fromJson(response);
  }

  /// Creates an asset from an existing asset model. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-assets.html">Creating
  /// assets</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model from which to create the asset.
  ///
  /// Parameter [assetName] :
  /// A friendly name for the asset.
  ///
  /// Parameter [assetDescription] :
  /// A description for the asset.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the asset. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
  Future<CreateAssetResponse> createAsset({
    required String assetModelId,
    required String assetName,
    String? assetDescription,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'assetModelId': assetModelId,
      'assetName': assetName,
      if (assetDescription != null) 'assetDescription': assetDescription,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssetResponse.fromJson(response);
  }

  /// Creates an asset model from specified property and hierarchy definitions.
  /// You create assets from asset models. With asset models, you can easily
  /// create assets of the same type that have standardized definitions. Each
  /// asset created from a model inherits the asset model's property and
  /// hierarchy definitions. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/define-models.html">Defining
  /// asset models</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetModelName] :
  /// A unique, friendly name for the asset model.
  ///
  /// Parameter [assetModelCompositeModels] :
  /// The composite asset models that are part of this asset model. Composite
  /// asset models are asset models that contain specific properties. Each
  /// composite model has a type that defines the properties that the composite
  /// model supports. Use composite asset models to define alarms on this asset
  /// model.
  ///
  /// Parameter [assetModelDescription] :
  /// A description for the asset model.
  ///
  /// Parameter [assetModelHierarchies] :
  /// The hierarchy definitions of the asset model. Each hierarchy specifies an
  /// asset model whose assets can be children of any other assets created from
  /// this asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 10 hierarchies per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [assetModelProperties] :
  /// The property definitions of the asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset
  /// properties</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 200 properties per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the asset model. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
  Future<CreateAssetModelResponse> createAssetModel({
    required String assetModelName,
    List<AssetModelCompositeModelDefinition>? assetModelCompositeModels,
    String? assetModelDescription,
    List<AssetModelHierarchyDefinition>? assetModelHierarchies,
    List<AssetModelPropertyDefinition>? assetModelProperties,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'assetModelName': assetModelName,
      if (assetModelCompositeModels != null)
        'assetModelCompositeModels': assetModelCompositeModels,
      if (assetModelDescription != null)
        'assetModelDescription': assetModelDescription,
      if (assetModelHierarchies != null)
        'assetModelHierarchies': assetModelHierarchies,
      if (assetModelProperties != null)
        'assetModelProperties': assetModelProperties,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/asset-models',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssetModelResponse.fromJson(response);
  }

  /// Defines a job to ingest data to IoT SiteWise from Amazon S3. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/CreateBulkImportJob.html">Create
  /// a bulk import job (CLI)</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <important>
  /// You must enable IoT SiteWise to export data to Amazon S3 before you create
  /// a bulk import job. For more information about how to configure storage
  /// settings, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_PutStorageConfiguration.html">PutStorageConfiguration</a>.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [errorReportLocation] :
  /// The Amazon S3 destination where errors associated with the job creation
  /// request are saved.
  ///
  /// Parameter [files] :
  /// The files in the specified Amazon S3 bucket that contain your data.
  ///
  /// Parameter [jobConfiguration] :
  /// Contains the configuration information of a job, such as the file format
  /// used to save data in Amazon S3.
  ///
  /// Parameter [jobName] :
  /// The unique name that helps identify the job request.
  ///
  /// Parameter [jobRoleArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the IAM role that allows IoT SiteWise to read Amazon S3 data.
  Future<CreateBulkImportJobResponse> createBulkImportJob({
    required ErrorReportLocation errorReportLocation,
    required List<File> files,
    required JobConfiguration jobConfiguration,
    required String jobName,
    required String jobRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      'errorReportLocation': errorReportLocation,
      'files': files,
      'jobConfiguration': jobConfiguration,
      'jobName': jobName,
      'jobRoleArn': jobRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBulkImportJobResponse.fromJson(response);
  }

  /// Creates a dashboard in an IoT SiteWise Monitor project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [dashboardDefinition] :
  /// The dashboard definition specified in a JSON literal. For detailed
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating
  /// dashboards (CLI)</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [dashboardName] :
  /// A friendly name for the dashboard.
  ///
  /// Parameter [projectId] :
  /// The ID of the project in which to create the dashboard.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [dashboardDescription] :
  /// A description for the dashboard.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the dashboard. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
  Future<CreateDashboardResponse> createDashboard({
    required String dashboardDefinition,
    required String dashboardName,
    required String projectId,
    String? clientToken,
    String? dashboardDescription,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'dashboardDefinition': dashboardDefinition,
      'dashboardName': dashboardName,
      'projectId': projectId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dashboardDescription != null)
        'dashboardDescription': dashboardDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/dashboards',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDashboardResponse.fromJson(response);
  }

  /// Creates a gateway, which is a virtual or edge device that delivers
  /// industrial data streams from local servers to IoT SiteWise. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting
  /// data using a gateway</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [gatewayName] :
  /// A unique, friendly name for the gateway.
  ///
  /// Parameter [gatewayPlatform] :
  /// The gateway's platform. You can only specify one platform in a gateway.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the gateway. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
  Future<CreateGatewayResponse> createGateway({
    required String gatewayName,
    required GatewayPlatform gatewayPlatform,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'gatewayName': gatewayName,
      'gatewayPlatform': gatewayPlatform,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/20200301/gateways',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGatewayResponse.fromJson(response);
  }

  /// Creates a portal, which can contain projects and dashboards. IoT SiteWise
  /// Monitor uses IAM Identity Center or IAM to authenticate portal users and
  /// manage user permissions.
  /// <note>
  /// Before you can sign in to a new portal, you must add at least one identity
  /// to that portal. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/administer-portals.html#portal-change-admins">Adding
  /// or removing portal administrators</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [portalContactEmail] :
  /// The Amazon Web Services administrator's contact email address.
  ///
  /// Parameter [portalName] :
  /// A friendly name for the portal.
  ///
  /// Parameter [roleArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of a service role that allows the portal's users to access your IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for IoT SiteWise Monitor</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  ///
  /// Parameter [alarms] :
  /// Contains the configuration information of an alarm created in an IoT
  /// SiteWise Monitor portal. You can use the alarm to monitor an asset
  /// property and get notified when the asset property value is outside a
  /// specified range. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/appguide/monitor-alarms.html">Monitoring
  /// with alarms</a> in the <i>IoT SiteWise Application Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [notificationSenderEmail] :
  /// The email address that sends alarm notifications.
  /// <important>
  /// If you use the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/lambda-support.html">IoT
  /// Events managed Lambda function</a> to manage your emails, you must <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-email-addresses.html">verify
  /// the sender email address in Amazon SES</a>.
  /// </important>
  ///
  /// Parameter [portalAuthMode] :
  /// The service to use to authenticate users to the portal. Choose from the
  /// following options:
  ///
  /// <ul>
  /// <li>
  /// <code>SSO</code> – The portal uses IAM Identity Center (successor to
  /// Single Sign-On) to authenticate users and manage user permissions. Before
  /// you can create a portal that uses IAM Identity Center, you must enable IAM
  /// Identity Center. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-get-started.html#mon-gs-sso">Enabling
  /// IAM Identity Center</a> in the <i>IoT SiteWise User Guide</i>. This option
  /// is only available in Amazon Web Services Regions other than the China
  /// Regions.
  /// </li>
  /// <li>
  /// <code>IAM</code> – The portal uses Identity and Access Management to
  /// authenticate users and manage user permissions.
  /// </li>
  /// </ul>
  /// You can't change this value after you create a portal.
  ///
  /// Default: <code>SSO</code>
  ///
  /// Parameter [portalDescription] :
  /// A description for the portal.
  ///
  /// Parameter [portalLogoImageFile] :
  /// A logo image to display in the portal. Upload a square, high-resolution
  /// image. The image is displayed on a dark background.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the portal. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
  Future<CreatePortalResponse> createPortal({
    required String portalContactEmail,
    required String portalName,
    required String roleArn,
    Alarms? alarms,
    String? clientToken,
    String? notificationSenderEmail,
    AuthMode? portalAuthMode,
    String? portalDescription,
    ImageFile? portalLogoImageFile,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'portalContactEmail': portalContactEmail,
      'portalName': portalName,
      'roleArn': roleArn,
      if (alarms != null) 'alarms': alarms,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (notificationSenderEmail != null)
        'notificationSenderEmail': notificationSenderEmail,
      if (portalAuthMode != null) 'portalAuthMode': portalAuthMode.toValue(),
      if (portalDescription != null) 'portalDescription': portalDescription,
      if (portalLogoImageFile != null)
        'portalLogoImageFile': portalLogoImageFile,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/portals',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePortalResponse.fromJson(response);
  }

  /// Creates a project in the specified portal.
  /// <note>
  /// Make sure that the project name and description don't contain confidential
  /// information.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal in which to create the project.
  ///
  /// Parameter [projectName] :
  /// A friendly name for the project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [projectDescription] :
  /// A description for the project.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the project. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
  Future<CreateProjectResponse> createProject({
    required String portalId,
    required String projectName,
    String? clientToken,
    String? projectDescription,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'portalId': portalId,
      'projectName': projectName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (projectDescription != null) 'projectDescription': projectDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProjectResponse.fromJson(response);
  }

  /// Deletes an access policy that grants the specified identity access to the
  /// specified IoT SiteWise Monitor resource. You can use this operation to
  /// revoke access to an IoT SiteWise Monitor resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessPolicyId] :
  /// The ID of the access policy to be deleted.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deleteAccessPolicy({
    required String accessPolicyId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/access-policies/${Uri.encodeComponent(accessPolicyId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an asset. This action can't be undone. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting
  /// assets and models</a> in the <i>IoT SiteWise User Guide</i>.
  /// <note>
  /// You can't delete an asset that's associated to another asset. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DisassociateAssets.html">DisassociateAssets</a>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<DeleteAssetResponse> deleteAsset({
    required String assetId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssetResponse.fromJson(response);
  }

  /// Deletes an asset model. This action can't be undone. You must delete all
  /// assets created from an asset model before you can delete the model. Also,
  /// you can't delete an asset model if a parent asset model exists that
  /// contains a property formula expression that depends on the asset model
  /// that you want to delete. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting
  /// assets and models</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<DeleteAssetModelResponse> deleteAssetModel({
    required String assetModelId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/asset-models/${Uri.encodeComponent(assetModelId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssetModelResponse.fromJson(response);
  }

  /// Deletes a dashboard from IoT SiteWise Monitor.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dashboardId] :
  /// The ID of the dashboard to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deleteDashboard({
    required String dashboardId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/dashboards/${Uri.encodeComponent(dashboardId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a gateway from IoT SiteWise. When you delete a gateway, some of
  /// the gateway's files remain in your gateway's file system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway to delete.
  Future<void> deleteGateway({
    required String gatewayId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/20200301/gateways/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a portal from IoT SiteWise Monitor.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<DeletePortalResponse> deletePortal({
    required String portalId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/portals/${Uri.encodeComponent(portalId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePortalResponse.fromJson(response);
  }

  /// Deletes a project from IoT SiteWise Monitor.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deleteProject({
    required String projectId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a time series (data stream). If you delete a time series that's
  /// associated with an asset property, the asset property still exists, but
  /// the time series will no longer be associated with this asset property.
  ///
  /// To identify a time series, do one of the following:
  ///
  /// <ul>
  /// <li>
  /// If the time series isn't associated with an asset property, specify the
  /// <code>alias</code> of the time series.
  /// </li>
  /// <li>
  /// If the time series is associated with an asset property, specify one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>alias</code> of the time series.
  /// </li>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> that identifies the
  /// asset property.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [alias] :
  /// The alias that identifies the time series.
  ///
  /// Parameter [assetId] :
  /// The ID of the asset in which the asset property was created.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  Future<void> deleteTimeSeries({
    String? alias,
    String? assetId,
    String? clientToken,
    String? propertyId,
  }) async {
    final $query = <String, List<String>>{
      if (alias != null) 'alias': [alias],
      if (assetId != null) 'assetId': [assetId],
      if (propertyId != null) 'propertyId': [propertyId],
    };
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/timeseries/delete/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes an access policy, which specifies an identity's access to an IoT
  /// SiteWise Monitor portal or project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessPolicyId] :
  /// The ID of the access policy.
  Future<DescribeAccessPolicyResponse> describeAccessPolicy({
    required String accessPolicyId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-policies/${Uri.encodeComponent(accessPolicyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccessPolicyResponse.fromJson(response);
  }

  /// Retrieves information about an asset.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [excludeProperties] :
  /// Whether or not to exclude asset properties from the response.
  Future<DescribeAssetResponse> describeAsset({
    required String assetId,
    bool? excludeProperties,
  }) async {
    final $query = <String, List<String>>{
      if (excludeProperties != null)
        'excludeProperties': [excludeProperties.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAssetResponse.fromJson(response);
  }

  /// Retrieves information about an asset model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model.
  ///
  /// Parameter [excludeProperties] :
  /// Whether or not to exclude asset model properties from the response.
  Future<DescribeAssetModelResponse> describeAssetModel({
    required String assetModelId,
    bool? excludeProperties,
  }) async {
    final $query = <String, List<String>>{
      if (excludeProperties != null)
        'excludeProperties': [excludeProperties.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/asset-models/${Uri.encodeComponent(assetModelId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAssetModelResponse.fromJson(response);
  }

  /// Retrieves information about an asset property.
  /// <note>
  /// When you call this operation for an attribute property, this response
  /// includes the default attribute value that you define in the asset model.
  /// If you update the default value in the model, this operation's response
  /// includes the new default value.
  /// </note>
  /// This operation doesn't return the value of the asset property. To get the
  /// value of an asset property, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_GetAssetPropertyValue.html">GetAssetPropertyValue</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  Future<DescribeAssetPropertyResponse> describeAssetProperty({
    required String assetId,
    required String propertyId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assets/${Uri.encodeComponent(assetId)}/properties/${Uri.encodeComponent(propertyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAssetPropertyResponse.fromJson(response);
  }

  /// Retrieves information about a bulk import job request. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/DescribeBulkImportJob.html">Describe
  /// a bulk import job (CLI)</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job.
  Future<DescribeBulkImportJobResponse> describeBulkImportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBulkImportJobResponse.fromJson(response);
  }

  /// Retrieves information about a dashboard.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dashboardId] :
  /// The ID of the dashboard.
  Future<DescribeDashboardResponse> describeDashboard({
    required String dashboardId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dashboards/${Uri.encodeComponent(dashboardId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDashboardResponse.fromJson(response);
  }

  /// Retrieves information about the default encryption configuration for the
  /// Amazon Web Services account in the default or specified Region. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html">Key
  /// management</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  Future<DescribeDefaultEncryptionConfigurationResponse>
      describeDefaultEncryptionConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configuration/account/encryption',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDefaultEncryptionConfigurationResponse.fromJson(response);
  }

  /// Retrieves information about a gateway.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway device.
  Future<DescribeGatewayResponse> describeGateway({
    required String gatewayId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/20200301/gateways/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGatewayResponse.fromJson(response);
  }

  /// Retrieves information about a gateway capability configuration. Each
  /// gateway capability defines data sources for a gateway. A capability
  /// configuration can contain multiple data source configurations. If you
  /// define OPC-UA sources for a gateway in the IoT SiteWise console, all of
  /// your OPC-UA sources are stored in one capability configuration. To list
  /// all capability configurations for a gateway, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [capabilityNamespace] :
  /// The namespace of the capability configuration. For example, if you
  /// configure OPC-UA sources from the IoT SiteWise console, your OPC-UA
  /// capability configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where
  /// <code>version</code> is a number such as <code>1</code>.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway that defines the capability configuration.
  Future<DescribeGatewayCapabilityConfigurationResponse>
      describeGatewayCapabilityConfiguration({
    required String capabilityNamespace,
    required String gatewayId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/20200301/gateways/${Uri.encodeComponent(gatewayId)}/capability/${Uri.encodeComponent(capabilityNamespace)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGatewayCapabilityConfigurationResponse.fromJson(response);
  }

  /// Retrieves the current IoT SiteWise logging options.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeLoggingOptionsResponse> describeLoggingOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLoggingOptionsResponse.fromJson(response);
  }

  /// Retrieves information about a portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal.
  Future<DescribePortalResponse> describePortal({
    required String portalId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/portals/${Uri.encodeComponent(portalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePortalResponse.fromJson(response);
  }

  /// Retrieves information about a project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  Future<DescribeProjectResponse> describeProject({
    required String projectId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProjectResponse.fromJson(response);
  }

  /// Retrieves information about the storage configuration for IoT SiteWise.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  Future<DescribeStorageConfigurationResponse>
      describeStorageConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configuration/account/storage',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeStorageConfigurationResponse.fromJson(response);
  }

  /// Retrieves information about a time series (data stream).
  ///
  /// To identify a time series, do one of the following:
  ///
  /// <ul>
  /// <li>
  /// If the time series isn't associated with an asset property, specify the
  /// <code>alias</code> of the time series.
  /// </li>
  /// <li>
  /// If the time series is associated with an asset property, specify one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>alias</code> of the time series.
  /// </li>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> that identifies the
  /// asset property.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [alias] :
  /// The alias that identifies the time series.
  ///
  /// Parameter [assetId] :
  /// The ID of the asset in which the asset property was created.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  Future<DescribeTimeSeriesResponse> describeTimeSeries({
    String? alias,
    String? assetId,
    String? propertyId,
  }) async {
    final $query = <String, List<String>>{
      if (alias != null) 'alias': [alias],
      if (assetId != null) 'assetId': [assetId],
      if (propertyId != null) 'propertyId': [propertyId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/timeseries/describe/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTimeSeriesResponse.fromJson(response);
  }

  /// Disassociates a child asset from the given parent asset through a
  /// hierarchy defined in the parent asset's model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the parent asset from which to disassociate the child asset.
  ///
  /// Parameter [childAssetId] :
  /// The ID of the child asset to disassociate.
  ///
  /// Parameter [hierarchyId] :
  /// The ID of a hierarchy in the parent asset's model. Hierarchies allow
  /// different groupings of assets to be formed that all come from the same
  /// asset model. You can use the hierarchy ID to identify the correct asset to
  /// disassociate. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> disassociateAssets({
    required String assetId,
    required String childAssetId,
    required String hierarchyId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'childAssetId': childAssetId,
      'hierarchyId': hierarchyId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a time series (data stream) from an asset property.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [alias] :
  /// The alias that identifies the time series.
  ///
  /// Parameter [assetId] :
  /// The ID of the asset in which the asset property was created.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> disassociateTimeSeriesFromAssetProperty({
    required String alias,
    required String assetId,
    required String propertyId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'alias': [alias],
      'assetId': [assetId],
      'propertyId': [propertyId],
    };
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/timeseries/disassociate/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets aggregated values for an asset property. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates">Querying
  /// aggregates</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [aggregateTypes] :
  /// The data aggregating function.
  ///
  /// Parameter [endDate] :
  /// The inclusive end of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  ///
  /// Parameter [resolution] :
  /// The time interval over which to aggregate data.
  ///
  /// Parameter [startDate] :
  /// The exclusive start of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request. A
  /// result set is returned in the two cases, whichever occurs first.
  ///
  /// <ul>
  /// <li>
  /// The size of the result set is equal to 1 MB.
  /// </li>
  /// <li>
  /// The number of data points in the result set is equal to the value of
  /// <code>maxResults</code>. The maximum value of <code>maxResults</code> is
  /// 250.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [propertyAlias] :
  /// The alias that identifies the property, such as an OPC-UA server data
  /// stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  ///
  /// Parameter [qualities] :
  /// The quality by which to filter asset data.
  ///
  /// Parameter [timeOrdering] :
  /// The chronological sorting order of the requested information.
  ///
  /// Default: <code>ASCENDING</code>
  Future<GetAssetPropertyAggregatesResponse> getAssetPropertyAggregates({
    required List<AggregateType> aggregateTypes,
    required DateTime endDate,
    required String resolution,
    required DateTime startDate,
    String? assetId,
    int? maxResults,
    String? nextToken,
    String? propertyAlias,
    String? propertyId,
    List<Quality>? qualities,
    TimeOrdering? timeOrdering,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      'aggregateTypes': aggregateTypes.map((e) => e.toValue()).toList(),
      'endDate': [_s.iso8601ToJson(endDate).toString()],
      'resolution': [resolution],
      'startDate': [_s.iso8601ToJson(startDate).toString()],
      if (assetId != null) 'assetId': [assetId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
      if (qualities != null)
        'qualities': qualities.map((e) => e.toValue()).toList(),
      if (timeOrdering != null) 'timeOrdering': [timeOrdering.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/properties/aggregates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetPropertyAggregatesResponse.fromJson(response);
  }

  /// Gets an asset property's current value. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#current-values">Querying
  /// current values</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [propertyAlias] :
  /// The alias that identifies the property, such as an OPC-UA server data
  /// stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  Future<GetAssetPropertyValueResponse> getAssetPropertyValue({
    String? assetId,
    String? propertyAlias,
    String? propertyId,
  }) async {
    final $query = <String, List<String>>{
      if (assetId != null) 'assetId': [assetId],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/properties/latest',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetPropertyValueResponse.fromJson(response);
  }

  /// Gets the history of an asset property's values. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#historical-values">Querying
  /// historical values</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [endDate] :
  /// The inclusive end of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request. A
  /// result set is returned in the two cases, whichever occurs first.
  ///
  /// <ul>
  /// <li>
  /// The size of the result set is equal to 4 MB.
  /// </li>
  /// <li>
  /// The number of data points in the result set is equal to the value of
  /// <code>maxResults</code>. The maximum value of <code>maxResults</code> is
  /// 20000.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [propertyAlias] :
  /// The alias that identifies the property, such as an OPC-UA server data
  /// stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  ///
  /// Parameter [qualities] :
  /// The quality by which to filter asset data.
  ///
  /// Parameter [startDate] :
  /// The exclusive start of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  ///
  /// Parameter [timeOrdering] :
  /// The chronological sorting order of the requested information.
  ///
  /// Default: <code>ASCENDING</code>
  Future<GetAssetPropertyValueHistoryResponse> getAssetPropertyValueHistory({
    String? assetId,
    DateTime? endDate,
    int? maxResults,
    String? nextToken,
    String? propertyAlias,
    String? propertyId,
    List<Quality>? qualities,
    DateTime? startDate,
    TimeOrdering? timeOrdering,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (assetId != null) 'assetId': [assetId],
      if (endDate != null) 'endDate': [_s.iso8601ToJson(endDate).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
      if (qualities != null)
        'qualities': qualities.map((e) => e.toValue()).toList(),
      if (startDate != null)
        'startDate': [_s.iso8601ToJson(startDate).toString()],
      if (timeOrdering != null) 'timeOrdering': [timeOrdering.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/properties/history',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetPropertyValueHistoryResponse.fromJson(response);
  }

  /// Get interpolated values for an asset property for a specified time
  /// interval, during a period of time. If your time series is missing data
  /// points during the specified time interval, you can use interpolation to
  /// estimate the missing data.
  ///
  /// For example, you can use this operation to return the interpolated
  /// temperature values for a wind turbine every 24 hours over a duration of 7
  /// days.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [endTimeInSeconds] :
  /// The inclusive end of the range from which to interpolate data, expressed
  /// in seconds in Unix epoch time.
  ///
  /// Parameter [intervalInSeconds] :
  /// The time interval in seconds over which to interpolate data. Each interval
  /// starts when the previous one ends.
  ///
  /// Parameter [quality] :
  /// The quality of the asset property value. You can use this parameter as a
  /// filter to choose only the asset property values that have a specific
  /// quality.
  ///
  /// Parameter [startTimeInSeconds] :
  /// The exclusive start of the range from which to interpolate data, expressed
  /// in seconds in Unix epoch time.
  ///
  /// Parameter [type] :
  /// The interpolation type.
  ///
  /// Valid values: <code>LINEAR_INTERPOLATION | LOCF_INTERPOLATION</code>
  ///
  /// <ul>
  /// <li>
  /// <code>LINEAR_INTERPOLATION</code> – Estimates missing data using <a
  /// href="https://en.wikipedia.org/wiki/Linear_interpolation">linear
  /// interpolation</a>.
  ///
  /// For example, you can use this operation to return the interpolated
  /// temperature values for a wind turbine every 24 hours over a duration of 7
  /// days. If the interpolation starts July 1, 2021, at 9 AM, IoT SiteWise
  /// returns the first interpolated value on July 2, 2021, at 9 AM, the second
  /// interpolated value on July 3, 2021, at 9 AM, and so on.
  /// </li>
  /// <li>
  /// <code>LOCF_INTERPOLATION</code> – Estimates missing data using last
  /// observation carried forward interpolation
  ///
  /// If no data point is found for an interval, IoT SiteWise returns the last
  /// observed data point for the previous interval and carries forward this
  /// interpolated value until a new data point is found.
  ///
  /// For example, you can get the state of an on-off valve every 24 hours over
  /// a duration of 7 days. If the interpolation starts July 1, 2021, at 9 AM,
  /// IoT SiteWise returns the last observed data point between July 1, 2021, at
  /// 9 AM and July 2, 2021, at 9 AM as the first interpolated value. If a data
  /// point isn't found after 9 AM on July 2, 2021, IoT SiteWise uses the same
  /// interpolated value for the rest of the days.
  /// </li>
  /// </ul>
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [endTimeOffsetInNanos] :
  /// The nanosecond offset converted from <code>endTimeInSeconds</code>.
  ///
  /// Parameter [intervalWindowInSeconds] :
  /// The query interval for the window, in seconds. IoT SiteWise computes each
  /// interpolated value by using data points from the timestamp of each
  /// interval, minus the window to the timestamp of each interval plus the
  /// window. If not specified, the window ranges between the start time minus
  /// the interval and the end time plus the interval.
  /// <note>
  /// <ul>
  /// <li>
  /// If you specify a value for the <code>intervalWindowInSeconds</code>
  /// parameter, the value for the <code>type</code> parameter must be
  /// <code>LINEAR_INTERPOLATION</code>.
  /// </li>
  /// <li>
  /// If a data point isn't found during the specified query window, IoT
  /// SiteWise won't return an interpolated value for the interval. This
  /// indicates that there's a gap in the ingested data points.
  /// </li>
  /// </ul> </note>
  /// For example, you can get the interpolated temperature values for a wind
  /// turbine every 24 hours over a duration of 7 days. If the interpolation
  /// starts on July 1, 2021, at 9 AM with a window of 2 hours, IoT SiteWise
  /// uses the data points from 7 AM (9 AM minus 2 hours) to 11 AM (9 AM plus 2
  /// hours) on July 2, 2021 to compute the first interpolated value. Next, IoT
  /// SiteWise uses the data points from 7 AM (9 AM minus 2 hours) to 11 AM (9
  /// AM plus 2 hours) on July 3, 2021 to compute the second interpolated value,
  /// and so on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request. If not
  /// specified, the default value is 10.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [propertyAlias] :
  /// The alias that identifies the property, such as an OPC-UA server data
  /// stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  ///
  /// Parameter [startTimeOffsetInNanos] :
  /// The nanosecond offset converted from <code>startTimeInSeconds</code>.
  Future<GetInterpolatedAssetPropertyValuesResponse>
      getInterpolatedAssetPropertyValues({
    required int endTimeInSeconds,
    required int intervalInSeconds,
    required Quality quality,
    required int startTimeInSeconds,
    required String type,
    String? assetId,
    int? endTimeOffsetInNanos,
    int? intervalWindowInSeconds,
    int? maxResults,
    String? nextToken,
    String? propertyAlias,
    String? propertyId,
    int? startTimeOffsetInNanos,
  }) async {
    _s.validateNumRange(
      'endTimeInSeconds',
      endTimeInSeconds,
      1,
      9223372036854774,
      isRequired: true,
    );
    _s.validateNumRange(
      'intervalInSeconds',
      intervalInSeconds,
      1,
      320000000,
      isRequired: true,
    );
    _s.validateNumRange(
      'startTimeInSeconds',
      startTimeInSeconds,
      1,
      9223372036854774,
      isRequired: true,
    );
    _s.validateNumRange(
      'endTimeOffsetInNanos',
      endTimeOffsetInNanos,
      0,
      999999999,
    );
    _s.validateNumRange(
      'intervalWindowInSeconds',
      intervalWindowInSeconds,
      1,
      320000000,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'startTimeOffsetInNanos',
      startTimeOffsetInNanos,
      0,
      999999999,
    );
    final $query = <String, List<String>>{
      'endTimeInSeconds': [endTimeInSeconds.toString()],
      'intervalInSeconds': [intervalInSeconds.toString()],
      'quality': [quality.toValue()],
      'startTimeInSeconds': [startTimeInSeconds.toString()],
      'type': [type],
      if (assetId != null) 'assetId': [assetId],
      if (endTimeOffsetInNanos != null)
        'endTimeOffsetInNanos': [endTimeOffsetInNanos.toString()],
      if (intervalWindowInSeconds != null)
        'intervalWindowInSeconds': [intervalWindowInSeconds.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
      if (startTimeOffsetInNanos != null)
        'startTimeOffsetInNanos': [startTimeOffsetInNanos.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/properties/interpolated',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetInterpolatedAssetPropertyValuesResponse.fromJson(response);
  }

  /// Retrieves a paginated list of access policies for an identity (an IAM
  /// Identity Center user, an IAM Identity Center group, or an IAM user) or an
  /// IoT SiteWise Monitor resource (a portal or project).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [iamArn] :
  /// The ARN of the IAM user. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// ARNs</a> in the <i>IAM User Guide</i>. This parameter is required if you
  /// specify <code>IAM</code> for <code>identityType</code>.
  ///
  /// Parameter [identityId] :
  /// The ID of the identity. This parameter is required if you specify
  /// <code>USER</code> or <code>GROUP</code> for <code>identityType</code>.
  ///
  /// Parameter [identityType] :
  /// The type of identity (IAM Identity Center user, IAM Identity Center group,
  /// or IAM user). This parameter is required if you specify
  /// <code>identityId</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource. This parameter is required if you specify
  /// <code>resourceType</code>.
  ///
  /// Parameter [resourceType] :
  /// The type of resource (portal or project). This parameter is required if
  /// you specify <code>resourceId</code>.
  Future<ListAccessPoliciesResponse> listAccessPolicies({
    String? iamArn,
    String? identityId,
    IdentityType? identityType,
    int? maxResults,
    String? nextToken,
    String? resourceId,
    ResourceType? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (iamArn != null) 'iamArn': [iamArn],
      if (identityId != null) 'identityId': [identityId],
      if (identityType != null) 'identityType': [identityType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceId != null) 'resourceId': [resourceId],
      if (resourceType != null) 'resourceType': [resourceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPoliciesResponse.fromJson(response);
  }

  /// Retrieves a paginated list of properties associated with an asset model.
  /// If you update properties associated with the model before you finish
  /// listing all the properties, you need to start all over again.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model.
  ///
  /// Parameter [filter] :
  /// Filters the requested list of asset model properties. You can choose one
  /// of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – The list includes all asset model properties for a
  /// given asset model ID.
  /// </li>
  /// <li>
  /// <code>BASE</code> – The list includes only base asset model properties for
  /// a given asset model ID.
  /// </li>
  /// </ul>
  /// Default: <code>BASE</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request. If not
  /// specified, the default value is 50.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetModelPropertiesResponse> listAssetModelProperties({
    required String assetModelId,
    ListAssetModelPropertiesFilter? filter,
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
      if (filter != null) 'filter': [filter.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/asset-models/${Uri.encodeComponent(assetModelId)}/properties',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetModelPropertiesResponse.fromJson(response);
  }

  /// Retrieves a paginated list of summaries of all asset models.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetModelsResponse> listAssetModels({
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
      requestUri: '/asset-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetModelsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of properties associated with an asset. If you
  /// update properties associated with the model before you finish listing all
  /// the properties, you need to start all over again.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [filter] :
  /// Filters the requested list of asset properties. You can choose one of the
  /// following options:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – The list includes all asset properties for a given
  /// asset model ID.
  /// </li>
  /// <li>
  /// <code>BASE</code> – The list includes only base asset properties for a
  /// given asset model ID.
  /// </li>
  /// </ul>
  /// Default: <code>BASE</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request. If not
  /// specified, the default value is 50.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetPropertiesResponse> listAssetProperties({
    required String assetId,
    ListAssetPropertiesFilter? filter,
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
      if (filter != null) 'filter': [filter.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/properties',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetPropertiesResponse.fromJson(response);
  }

  /// Retrieves a paginated list of asset relationships for an asset. You can
  /// use this operation to identify an asset's root asset and all associated
  /// assets between that asset and its root.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [traversalType] :
  /// The type of traversal to use to identify asset relationships. Choose the
  /// following option:
  ///
  /// <ul>
  /// <li>
  /// <code>PATH_TO_ROOT</code> – Identify the asset's parent assets up to the
  /// root asset. The asset that you specify in <code>assetId</code> is the
  /// first result in the list of <code>assetRelationshipSummaries</code>, and
  /// the root asset is the last result.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetRelationshipsResponse> listAssetRelationships({
    required String assetId,
    required TraversalType traversalType,
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
      'traversalType': [traversalType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/assetRelationships',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetRelationshipsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of asset summaries.
  ///
  /// You can use this operation to do the following:
  ///
  /// <ul>
  /// <li>
  /// List assets based on a specific asset model.
  /// </li>
  /// <li>
  /// List top-level assets.
  /// </li>
  /// </ul>
  /// You can't use this operation to list all assets. To retrieve summaries for
  /// all of your assets, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_ListAssetModels.html">ListAssetModels</a>
  /// to get all of your asset model IDs. Then, use ListAssets to get all assets
  /// for each asset model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model by which to filter the list of assets. This
  /// parameter is required if you choose <code>ALL</code> for
  /// <code>filter</code>.
  ///
  /// Parameter [filter] :
  /// The filter for the requested list of assets. Choose one of the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – The list includes all assets for a given asset model
  /// ID. The <code>assetModelId</code> parameter is required if you filter by
  /// <code>ALL</code>.
  /// </li>
  /// <li>
  /// <code>TOP_LEVEL</code> – The list includes only top-level assets in the
  /// asset hierarchy tree.
  /// </li>
  /// </ul>
  /// Default: <code>ALL</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetsResponse> listAssets({
    String? assetModelId,
    ListAssetsFilter? filter,
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
      if (assetModelId != null) 'assetModelId': [assetModelId],
      if (filter != null) 'filter': [filter.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of associated assets.
  ///
  /// You can use this operation to do the following:
  ///
  /// <ul>
  /// <li>
  /// List child assets associated to a parent asset by a hierarchy that you
  /// specify.
  /// </li>
  /// <li>
  /// List an asset's parent asset.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset to query.
  ///
  /// Parameter [hierarchyId] :
  /// The ID of the hierarchy by which child assets are associated to the asset.
  /// To find a hierarchy ID, use the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAsset.html">DescribeAsset</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>
  /// operations. This parameter is required if you choose <code>CHILD</code>
  /// for <code>traversalDirection</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [traversalDirection] :
  /// The direction to list associated assets. Choose one of the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// <code>CHILD</code> – The list includes all child assets associated to the
  /// asset. The <code>hierarchyId</code> parameter is required if you choose
  /// <code>CHILD</code>.
  /// </li>
  /// <li>
  /// <code>PARENT</code> – The list includes the asset's parent asset.
  /// </li>
  /// </ul>
  /// Default: <code>CHILD</code>
  Future<ListAssociatedAssetsResponse> listAssociatedAssets({
    required String assetId,
    String? hierarchyId,
    int? maxResults,
    String? nextToken,
    TraversalDirection? traversalDirection,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (hierarchyId != null) 'hierarchyId': [hierarchyId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (traversalDirection != null)
        'traversalDirection': [traversalDirection.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/hierarchies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociatedAssetsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of bulk import job requests. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ListBulkImportJobs.html">List
  /// bulk import jobs (CLI)</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filter] :
  /// You can use a filter to select the bulk import jobs that you want to
  /// retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListBulkImportJobsResponse> listBulkImportJobs({
    ListBulkImportJobsFilter? filter,
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
      if (filter != null) 'filter': [filter.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBulkImportJobsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of dashboards for an IoT SiteWise Monitor
  /// project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListDashboardsResponse> listDashboards({
    required String projectId,
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
      'projectId': [projectId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dashboards',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDashboardsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of gateways.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListGatewaysResponse> listGateways({
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
      requestUri: '/20200301/gateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGatewaysResponse.fromJson(response);
  }

  /// Retrieves a paginated list of IoT SiteWise Monitor portals.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListPortalsResponse> listPortals({
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
      requestUri: '/portals',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPortalsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of assets associated with an IoT SiteWise
  /// Monitor project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListProjectAssetsResponse> listProjectAssets({
    required String projectId,
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
      requestUri: '/projects/${Uri.encodeComponent(projectId)}/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectAssetsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of projects for an IoT SiteWise Monitor portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListProjectsResponse> listProjects({
    required String portalId,
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
      'portalId': [portalId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsResponse.fromJson(response);
  }

  /// Retrieves the list of tags for an IoT SiteWise resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource.
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

  /// Retrieves a paginated list of time series (data streams).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [aliasPrefix] :
  /// The alias prefix of the time series.
  ///
  /// Parameter [assetId] :
  /// The ID of the asset in which the asset property was created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for each paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [timeSeriesType] :
  /// The type of the time series. The time series type can be one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ASSOCIATED</code> – The time series is associated with an asset
  /// property.
  /// </li>
  /// <li>
  /// <code>DISASSOCIATED</code> – The time series isn't associated with any
  /// asset property.
  /// </li>
  /// </ul>
  Future<ListTimeSeriesResponse> listTimeSeries({
    String? aliasPrefix,
    String? assetId,
    int? maxResults,
    String? nextToken,
    ListTimeSeriesType? timeSeriesType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (aliasPrefix != null) 'aliasPrefix': [aliasPrefix],
      if (assetId != null) 'assetId': [assetId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (timeSeriesType != null) 'timeSeriesType': [timeSeriesType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/timeseries/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTimeSeriesResponse.fromJson(response);
  }

  /// Sets the default encryption configuration for the Amazon Web Services
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html">Key
  /// management</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [encryptionType] :
  /// The type of encryption used for the encryption configuration.
  ///
  /// Parameter [kmsKeyId] :
  /// The Key ID of the customer managed key used for KMS encryption. This is
  /// required if you use <code>KMS_BASED_ENCRYPTION</code>.
  Future<PutDefaultEncryptionConfigurationResponse>
      putDefaultEncryptionConfiguration({
    required EncryptionType encryptionType,
    String? kmsKeyId,
  }) async {
    final $payload = <String, dynamic>{
      'encryptionType': encryptionType.toValue(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuration/account/encryption',
      exceptionFnMap: _exceptionFns,
    );
    return PutDefaultEncryptionConfigurationResponse.fromJson(response);
  }

  /// Sets logging options for IoT SiteWise.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictingOperationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [loggingOptions] :
  /// The logging options to set.
  Future<void> putLoggingOptions({
    required LoggingOptions loggingOptions,
  }) async {
    final $payload = <String, dynamic>{
      'loggingOptions': loggingOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Configures storage settings for IoT SiteWise.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [storageType] :
  /// The storage tier that you specified for your data. The
  /// <code>storageType</code> parameter can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>SITEWISE_DEFAULT_STORAGE</code> – IoT SiteWise saves your data into
  /// the hot tier. The hot tier is a service-managed database.
  /// </li>
  /// <li>
  /// <code>MULTI_LAYER_STORAGE</code> – IoT SiteWise saves your data in both
  /// the cold tier and the hot tier. The cold tier is a customer-managed Amazon
  /// S3 bucket.
  /// </li>
  /// </ul>
  ///
  /// Parameter [disassociatedDataStorage] :
  /// Contains the storage configuration for time series (data streams) that
  /// aren't associated with asset properties. The
  /// <code>disassociatedDataStorage</code> can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – IoT SiteWise accepts time series that aren't
  /// associated with asset properties.
  /// <important>
  /// After the <code>disassociatedDataStorage</code> is enabled, you can't
  /// disable it.
  /// </important> </li>
  /// <li>
  /// <code>DISABLED</code> – IoT SiteWise doesn't accept time series (data
  /// streams) that aren't associated with asset properties.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/data-streams.html">Data
  /// streams</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [multiLayerStorage] :
  /// Identifies a storage destination. If you specified
  /// <code>MULTI_LAYER_STORAGE</code> for the storage type, you must specify a
  /// <code>MultiLayerStorage</code> object.
  Future<PutStorageConfigurationResponse> putStorageConfiguration({
    required StorageType storageType,
    DisassociatedDataStorageState? disassociatedDataStorage,
    MultiLayerStorage? multiLayerStorage,
    RetentionPeriod? retentionPeriod,
  }) async {
    final $payload = <String, dynamic>{
      'storageType': storageType.toValue(),
      if (disassociatedDataStorage != null)
        'disassociatedDataStorage': disassociatedDataStorage.toValue(),
      if (multiLayerStorage != null) 'multiLayerStorage': multiLayerStorage,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuration/account/storage',
      exceptionFnMap: _exceptionFns,
    );
    return PutStorageConfigurationResponse.fromJson(response);
  }

  /// Adds tags to an IoT SiteWise resource. If a tag already exists for the
  /// resource, this operation updates the tag's value.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource to tag.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
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

  /// Removes a tag from an IoT SiteWise resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys for tags to remove from the resource.
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

  /// Updates an existing access policy that specifies an identity's access to
  /// an IoT SiteWise Monitor portal or project resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessPolicyId] :
  /// The ID of the access policy.
  ///
  /// Parameter [accessPolicyIdentity] :
  /// The identity for this access policy. Choose an IAM Identity Center user,
  /// an IAM Identity Center group, or an IAM user.
  ///
  /// Parameter [accessPolicyPermission] :
  /// The permission level for this access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  ///
  /// Parameter [accessPolicyResource] :
  /// The IoT SiteWise Monitor resource for this access policy. Choose either a
  /// portal or a project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> updateAccessPolicy({
    required String accessPolicyId,
    required Identity accessPolicyIdentity,
    required Permission accessPolicyPermission,
    required Resource accessPolicyResource,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'accessPolicyIdentity': accessPolicyIdentity,
      'accessPolicyPermission': accessPolicyPermission.toValue(),
      'accessPolicyResource': accessPolicyResource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/access-policies/${Uri.encodeComponent(accessPolicyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an asset's name. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating
  /// assets and models</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset to update.
  ///
  /// Parameter [assetName] :
  /// A friendly name for the asset.
  ///
  /// Parameter [assetDescription] :
  /// A description for the asset.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<UpdateAssetResponse> updateAsset({
    required String assetId,
    required String assetName,
    String? assetDescription,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'assetName': assetName,
      if (assetDescription != null) 'assetDescription': assetDescription,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssetResponse.fromJson(response);
  }

  /// Updates an asset model and all of the assets that were created from the
  /// model. Each asset created from the model inherits the updated asset
  /// model's property and hierarchy definitions. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating
  /// assets and models</a> in the <i>IoT SiteWise User Guide</i>.
  /// <important>
  /// This operation overwrites the existing model with the provided model. To
  /// avoid deleting your asset model's properties or hierarchies, you must
  /// include their IDs and definitions in the updated asset model payload. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>.
  ///
  /// If you remove a property from an asset model, IoT SiteWise deletes all
  /// previous data for that property. If you remove a hierarchy definition from
  /// an asset model, IoT SiteWise disassociates every asset associated with
  /// that hierarchy. You can't change the type or data type of an existing
  /// property.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model to update.
  ///
  /// Parameter [assetModelName] :
  /// A unique, friendly name for the asset model.
  ///
  /// Parameter [assetModelCompositeModels] :
  /// The composite asset models that are part of this asset model. Composite
  /// asset models are asset models that contain specific properties. Each
  /// composite model has a type that defines the properties that the composite
  /// model supports. Use composite asset models to define alarms on this asset
  /// model.
  ///
  /// Parameter [assetModelDescription] :
  /// A description for the asset model.
  ///
  /// Parameter [assetModelHierarchies] :
  /// The updated hierarchy definitions of the asset model. Each hierarchy
  /// specifies an asset model whose assets can be children of any other assets
  /// created from this asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 10 hierarchies per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [assetModelProperties] :
  /// The updated property definitions of the asset model. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset
  /// properties</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 200 properties per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<UpdateAssetModelResponse> updateAssetModel({
    required String assetModelId,
    required String assetModelName,
    List<AssetModelCompositeModel>? assetModelCompositeModels,
    String? assetModelDescription,
    List<AssetModelHierarchy>? assetModelHierarchies,
    List<AssetModelProperty>? assetModelProperties,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'assetModelName': assetModelName,
      if (assetModelCompositeModels != null)
        'assetModelCompositeModels': assetModelCompositeModels,
      if (assetModelDescription != null)
        'assetModelDescription': assetModelDescription,
      if (assetModelHierarchies != null)
        'assetModelHierarchies': assetModelHierarchies,
      if (assetModelProperties != null)
        'assetModelProperties': assetModelProperties,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/asset-models/${Uri.encodeComponent(assetModelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssetModelResponse.fromJson(response);
  }

  /// Updates an asset property's alias and notification state.
  /// <important>
  /// This operation overwrites the property's existing alias and notification
  /// state. To keep your existing property's alias or notification state, you
  /// must include the existing values in the UpdateAssetProperty request. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetProperty.html">DescribeAssetProperty</a>.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset to be updated.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property to be updated.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [propertyAlias] :
  /// The alias that identifies the property, such as an OPC-UA server data
  /// stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise
  /// User Guide</i>.
  ///
  /// If you omit this parameter, the alias is removed from the property.
  ///
  /// Parameter [propertyNotificationState] :
  /// The MQTT notification state (enabled or disabled) for this asset property.
  /// When the notification state is enabled, IoT SiteWise publishes property
  /// value updates to a unique MQTT topic. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting
  /// with other services</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// If you omit this parameter, the notification state is set to
  /// <code>DISABLED</code>.
  ///
  /// Parameter [propertyUnit] :
  /// The unit of measure (such as Newtons or RPM) of the asset property. If you
  /// don't specify a value for this parameter, the service uses the value of
  /// the <code>assetModelProperty</code> in the asset model.
  Future<void> updateAssetProperty({
    required String assetId,
    required String propertyId,
    String? clientToken,
    String? propertyAlias,
    PropertyNotificationState? propertyNotificationState,
    String? propertyUnit,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyNotificationState != null)
        'propertyNotificationState': propertyNotificationState.toValue(),
      if (propertyUnit != null) 'propertyUnit': propertyUnit,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assets/${Uri.encodeComponent(assetId)}/properties/${Uri.encodeComponent(propertyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an IoT SiteWise Monitor dashboard.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dashboardDefinition] :
  /// The new dashboard definition, as specified in a JSON literal. For detailed
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating
  /// dashboards (CLI)</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [dashboardId] :
  /// The ID of the dashboard to update.
  ///
  /// Parameter [dashboardName] :
  /// A new friendly name for the dashboard.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [dashboardDescription] :
  /// A new description for the dashboard.
  Future<void> updateDashboard({
    required String dashboardDefinition,
    required String dashboardId,
    required String dashboardName,
    String? clientToken,
    String? dashboardDescription,
  }) async {
    final $payload = <String, dynamic>{
      'dashboardDefinition': dashboardDefinition,
      'dashboardName': dashboardName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dashboardDescription != null)
        'dashboardDescription': dashboardDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/dashboards/${Uri.encodeComponent(dashboardId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a gateway's name.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway to update.
  ///
  /// Parameter [gatewayName] :
  /// A unique, friendly name for the gateway.
  Future<void> updateGateway({
    required String gatewayId,
    required String gatewayName,
  }) async {
    final $payload = <String, dynamic>{
      'gatewayName': gatewayName,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/20200301/gateways/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a gateway capability configuration or defines a new capability
  /// configuration. Each gateway capability defines data sources for a gateway.
  /// A capability configuration can contain multiple data source
  /// configurations. If you define OPC-UA sources for a gateway in the IoT
  /// SiteWise console, all of your OPC-UA sources are stored in one capability
  /// configuration. To list all capability configurations for a gateway, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [capabilityConfiguration] :
  /// The JSON document that defines the configuration for the gateway
  /// capability. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/configure-sources.html#configure-source-cli">Configuring
  /// data sources (CLI)</a> in the <i>IoT SiteWise User Guide</i>.
  ///
  /// Parameter [capabilityNamespace] :
  /// The namespace of the gateway capability configuration to be updated. For
  /// example, if you configure OPC-UA sources from the IoT SiteWise console,
  /// your OPC-UA capability configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where
  /// <code>version</code> is a number such as <code>1</code>.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway to be updated.
  Future<UpdateGatewayCapabilityConfigurationResponse>
      updateGatewayCapabilityConfiguration({
    required String capabilityConfiguration,
    required String capabilityNamespace,
    required String gatewayId,
  }) async {
    final $payload = <String, dynamic>{
      'capabilityConfiguration': capabilityConfiguration,
      'capabilityNamespace': capabilityNamespace,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/20200301/gateways/${Uri.encodeComponent(gatewayId)}/capability',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGatewayCapabilityConfigurationResponse.fromJson(response);
  }

  /// Updates an IoT SiteWise Monitor portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [portalContactEmail] :
  /// The Amazon Web Services administrator's contact email address.
  ///
  /// Parameter [portalId] :
  /// The ID of the portal to update.
  ///
  /// Parameter [portalName] :
  /// A new friendly name for the portal.
  ///
  /// Parameter [roleArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of a service role that allows the portal's users to access your IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for IoT SiteWise Monitor</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  ///
  /// Parameter [alarms] :
  /// Contains the configuration information of an alarm created in an IoT
  /// SiteWise Monitor portal. You can use the alarm to monitor an asset
  /// property and get notified when the asset property value is outside a
  /// specified range. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/appguide/monitor-alarms.html">Monitoring
  /// with alarms</a> in the <i>IoT SiteWise Application Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [notificationSenderEmail] :
  /// The email address that sends alarm notifications.
  ///
  /// Parameter [portalDescription] :
  /// A new description for the portal.
  Future<UpdatePortalResponse> updatePortal({
    required String portalContactEmail,
    required String portalId,
    required String portalName,
    required String roleArn,
    Alarms? alarms,
    String? clientToken,
    String? notificationSenderEmail,
    String? portalDescription,
    Image? portalLogoImage,
  }) async {
    final $payload = <String, dynamic>{
      'portalContactEmail': portalContactEmail,
      'portalName': portalName,
      'roleArn': roleArn,
      if (alarms != null) 'alarms': alarms,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (notificationSenderEmail != null)
        'notificationSenderEmail': notificationSenderEmail,
      if (portalDescription != null) 'portalDescription': portalDescription,
      if (portalLogoImage != null) 'portalLogoImage': portalLogoImage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/portals/${Uri.encodeComponent(portalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePortalResponse.fromJson(response);
  }

  /// Updates an IoT SiteWise Monitor project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project to update.
  ///
  /// Parameter [projectName] :
  /// A new friendly name for the project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [projectDescription] :
  /// A new description for the project.
  Future<void> updateProject({
    required String projectId,
    required String projectName,
    String? clientToken,
    String? projectDescription,
  }) async {
    final $payload = <String, dynamic>{
      'projectName': projectName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (projectDescription != null) 'projectDescription': projectDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Contains an access policy that defines an identity's access to an IoT
/// SiteWise Monitor resource.
class AccessPolicySummary {
  /// The ID of the access policy.
  final String id;

  /// The identity (an IAM Identity Center user, an IAM Identity Center group, or
  /// an IAM user).
  final Identity identity;

  /// The permissions for the access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  final Permission permission;

  /// The IoT SiteWise Monitor resource (a portal or project).
  final Resource resource;

  /// The date the access policy was created, in Unix epoch time.
  final DateTime? creationDate;

  /// The date the access policy was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  AccessPolicySummary({
    required this.id,
    required this.identity,
    required this.permission,
    required this.resource,
    this.creationDate,
    this.lastUpdateDate,
  });

  factory AccessPolicySummary.fromJson(Map<String, dynamic> json) {
    return AccessPolicySummary(
      id: json['id'] as String,
      identity: Identity.fromJson(json['identity'] as Map<String, dynamic>),
      permission: (json['permission'] as String).toPermission(),
      resource: Resource.fromJson(json['resource'] as Map<String, dynamic>),
      creationDate: timeStampFromJson(json['creationDate']),
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final identity = this.identity;
    final permission = this.permission;
    final resource = this.resource;
    final creationDate = this.creationDate;
    final lastUpdateDate = this.lastUpdateDate;
    return {
      'id': id,
      'identity': identity,
      'permission': permission.toValue(),
      'resource': resource,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (lastUpdateDate != null)
        'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
    };
  }
}

enum AggregateType {
  average,
  count,
  maximum,
  minimum,
  sum,
  standardDeviation,
}

extension AggregateTypeValueExtension on AggregateType {
  String toValue() {
    switch (this) {
      case AggregateType.average:
        return 'AVERAGE';
      case AggregateType.count:
        return 'COUNT';
      case AggregateType.maximum:
        return 'MAXIMUM';
      case AggregateType.minimum:
        return 'MINIMUM';
      case AggregateType.sum:
        return 'SUM';
      case AggregateType.standardDeviation:
        return 'STANDARD_DEVIATION';
    }
  }
}

extension AggregateTypeFromString on String {
  AggregateType toAggregateType() {
    switch (this) {
      case 'AVERAGE':
        return AggregateType.average;
      case 'COUNT':
        return AggregateType.count;
      case 'MAXIMUM':
        return AggregateType.maximum;
      case 'MINIMUM':
        return AggregateType.minimum;
      case 'SUM':
        return AggregateType.sum;
      case 'STANDARD_DEVIATION':
        return AggregateType.standardDeviation;
    }
    throw Exception('$this is not known in enum AggregateType');
  }
}

/// Contains aggregated asset property values (for example, average, minimum,
/// and maximum).
class AggregatedValue {
  /// The date the aggregating computations occurred, in Unix epoch time.
  final DateTime timestamp;

  /// The value of the aggregates.
  final Aggregates value;

  /// The quality of the aggregated data.
  final Quality? quality;

  AggregatedValue({
    required this.timestamp,
    required this.value,
    this.quality,
  });

  factory AggregatedValue.fromJson(Map<String, dynamic> json) {
    return AggregatedValue(
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] as Object),
      value: Aggregates.fromJson(json['value'] as Map<String, dynamic>),
      quality: (json['quality'] as String?)?.toQuality(),
    );
  }

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final value = this.value;
    final quality = this.quality;
    return {
      'timestamp': unixTimestampToJson(timestamp),
      'value': value,
      if (quality != null) 'quality': quality.toValue(),
    };
  }
}

/// Contains the (pre-calculated) aggregate values for an asset property.
class Aggregates {
  /// The average (mean) value of the time series over a time interval window.
  final double? average;

  /// The count of data points in the time series over a time interval window.
  final double? count;

  /// The maximum value of the time series over a time interval window.
  final double? maximum;

  /// The minimum value of the time series over a time interval window.
  final double? minimum;

  /// The standard deviation of the time series over a time interval window.
  final double? standardDeviation;

  /// The sum of the time series over a time interval window.
  final double? sum;

  Aggregates({
    this.average,
    this.count,
    this.maximum,
    this.minimum,
    this.standardDeviation,
    this.sum,
  });

  factory Aggregates.fromJson(Map<String, dynamic> json) {
    return Aggregates(
      average: json['average'] as double?,
      count: json['count'] as double?,
      maximum: json['maximum'] as double?,
      minimum: json['minimum'] as double?,
      standardDeviation: json['standardDeviation'] as double?,
      sum: json['sum'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final average = this.average;
    final count = this.count;
    final maximum = this.maximum;
    final minimum = this.minimum;
    final standardDeviation = this.standardDeviation;
    final sum = this.sum;
    return {
      if (average != null) 'average': average,
      if (count != null) 'count': count,
      if (maximum != null) 'maximum': maximum,
      if (minimum != null) 'minimum': minimum,
      if (standardDeviation != null) 'standardDeviation': standardDeviation,
      if (sum != null) 'sum': sum,
    };
  }
}

/// Contains the configuration information of an alarm created in an IoT
/// SiteWise Monitor portal. You can use the alarm to monitor an asset property
/// and get notified when the asset property value is outside a specified range.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/appguide/monitor-alarms.html">Monitoring
/// with alarms</a> in the <i>IoT SiteWise Application Guide</i>.
class Alarms {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the IAM role that allows the alarm to perform actions and access Amazon
  /// Web Services resources and services, such as IoT Events.
  final String alarmRoleArn;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the Lambda function that manages alarm notifications. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/lambda-support.html">Managing
  /// alarm notifications</a> in the <i>IoT Events Developer Guide</i>.
  final String? notificationLambdaArn;

  Alarms({
    required this.alarmRoleArn,
    this.notificationLambdaArn,
  });

  factory Alarms.fromJson(Map<String, dynamic> json) {
    return Alarms(
      alarmRoleArn: json['alarmRoleArn'] as String,
      notificationLambdaArn: json['notificationLambdaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmRoleArn = this.alarmRoleArn;
    final notificationLambdaArn = this.notificationLambdaArn;
    return {
      'alarmRoleArn': alarmRoleArn,
      if (notificationLambdaArn != null)
        'notificationLambdaArn': notificationLambdaArn,
    };
  }
}

/// Contains information about a composite model in an asset. This object
/// contains the asset's properties that you define in the composite model.
class AssetCompositeModel {
  /// The name of the composite model.
  final String name;

  /// The asset properties that this composite model defines.
  final List<AssetProperty> properties;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  final String type;

  /// The description of the composite model.
  final String? description;

  /// The ID of the asset composite model.
  final String? id;

  AssetCompositeModel({
    required this.name,
    required this.properties,
    required this.type,
    this.description,
    this.id,
  });

  factory AssetCompositeModel.fromJson(Map<String, dynamic> json) {
    return AssetCompositeModel(
      name: json['name'] as String,
      properties: (json['properties'] as List)
          .whereNotNull()
          .map((e) => AssetProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final properties = this.properties;
    final type = this.type;
    final description = this.description;
    final id = this.id;
    return {
      'name': name,
      'properties': properties,
      'type': type,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
    };
  }
}

enum AssetErrorCode {
  internalFailure,
}

extension AssetErrorCodeValueExtension on AssetErrorCode {
  String toValue() {
    switch (this) {
      case AssetErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension AssetErrorCodeFromString on String {
  AssetErrorCode toAssetErrorCode() {
    switch (this) {
      case 'INTERNAL_FAILURE':
        return AssetErrorCode.internalFailure;
    }
    throw Exception('$this is not known in enum AssetErrorCode');
  }
}

/// Contains error details for the requested associate project asset action.
class AssetErrorDetails {
  /// The ID of the asset.
  final String assetId;

  /// The error code.
  final AssetErrorCode code;

  /// The error message.
  final String message;

  AssetErrorDetails({
    required this.assetId,
    required this.code,
    required this.message,
  });

  factory AssetErrorDetails.fromJson(Map<String, dynamic> json) {
    return AssetErrorDetails(
      assetId: json['assetId'] as String,
      code: (json['code'] as String).toAssetErrorCode(),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final code = this.code;
    final message = this.message;
    return {
      'assetId': assetId,
      'code': code.toValue(),
      'message': message,
    };
  }
}

/// Describes an asset hierarchy that contains a hierarchy's name and ID.
class AssetHierarchy {
  /// The hierarchy name provided in the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation.
  final String name;

  /// The ID of the hierarchy. This ID is a <code>hierarchyId</code>.
  final String? id;

  AssetHierarchy({
    required this.name,
    this.id,
  });

  factory AssetHierarchy.fromJson(Map<String, dynamic> json) {
    return AssetHierarchy(
      name: json['name'] as String,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final id = this.id;
    return {
      'name': name,
      if (id != null) 'id': id,
    };
  }
}

/// Contains information about a parent asset and a child asset that are related
/// through an asset hierarchy.
class AssetHierarchyInfo {
  /// The ID of the child asset in this asset relationship.
  final String? childAssetId;

  /// The ID of the parent asset in this asset relationship.
  final String? parentAssetId;

  AssetHierarchyInfo({
    this.childAssetId,
    this.parentAssetId,
  });

  factory AssetHierarchyInfo.fromJson(Map<String, dynamic> json) {
    return AssetHierarchyInfo(
      childAssetId: json['childAssetId'] as String?,
      parentAssetId: json['parentAssetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final childAssetId = this.childAssetId;
    final parentAssetId = this.parentAssetId;
    return {
      if (childAssetId != null) 'childAssetId': childAssetId,
      if (parentAssetId != null) 'parentAssetId': parentAssetId,
    };
  }
}

/// Contains information about a composite model in an asset model. This object
/// contains the asset property definitions that you define in the composite
/// model.
class AssetModelCompositeModel {
  /// The name of the composite model.
  final String name;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  final String type;

  /// The description of the composite model.
  final String? description;

  /// The ID of the asset model composite model.
  final String? id;

  /// The asset property definitions for this composite model.
  final List<AssetModelProperty>? properties;

  AssetModelCompositeModel({
    required this.name,
    required this.type,
    this.description,
    this.id,
    this.properties,
  });

  factory AssetModelCompositeModel.fromJson(Map<String, dynamic> json) {
    return AssetModelCompositeModel(
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
      id: json['id'] as String?,
      properties: (json['properties'] as List?)
          ?.whereNotNull()
          .map((e) => AssetModelProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final description = this.description;
    final id = this.id;
    final properties = this.properties;
    return {
      'name': name,
      'type': type,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Contains a composite model definition in an asset model. This composite
/// model definition is applied to all assets created from the asset model.
class AssetModelCompositeModelDefinition {
  /// The name of the composite model.
  final String name;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  final String type;

  /// The description of the composite model.
  final String? description;

  /// The asset property definitions for this composite model.
  final List<AssetModelPropertyDefinition>? properties;

  AssetModelCompositeModelDefinition({
    required this.name,
    required this.type,
    this.description,
    this.properties,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final description = this.description;
    final properties = this.properties;
    return {
      'name': name,
      'type': type,
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Describes an asset hierarchy that contains a hierarchy's name, ID, and child
/// asset model ID that specifies the type of asset that can be in this
/// hierarchy.
class AssetModelHierarchy {
  /// The ID of the asset model. All assets in this hierarchy must be instances of
  /// the <code>childAssetModelId</code> asset model.
  final String childAssetModelId;

  /// The name of the asset model hierarchy that you specify by using the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation.
  final String name;

  /// The ID of the asset model hierarchy. This ID is a <code>hierarchyId</code>.
  final String? id;

  AssetModelHierarchy({
    required this.childAssetModelId,
    required this.name,
    this.id,
  });

  factory AssetModelHierarchy.fromJson(Map<String, dynamic> json) {
    return AssetModelHierarchy(
      childAssetModelId: json['childAssetModelId'] as String,
      name: json['name'] as String,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final childAssetModelId = this.childAssetModelId;
    final name = this.name;
    final id = this.id;
    return {
      'childAssetModelId': childAssetModelId,
      'name': name,
      if (id != null) 'id': id,
    };
  }
}

/// Contains an asset model hierarchy used in asset model creation. An asset
/// model hierarchy determines the kind (or type) of asset that can belong to a
/// hierarchy.
class AssetModelHierarchyDefinition {
  /// The ID of an asset model for this hierarchy.
  final String childAssetModelId;

  /// The name of the asset model hierarchy definition (as specified in the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation).
  final String name;

  AssetModelHierarchyDefinition({
    required this.childAssetModelId,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final childAssetModelId = this.childAssetModelId;
    final name = this.name;
    return {
      'childAssetModelId': childAssetModelId,
      'name': name,
    };
  }
}

/// Contains information about an asset model property.
class AssetModelProperty {
  /// The data type of the asset model property.
  final PropertyDataType dataType;

  /// The name of the asset model property.
  final String name;

  /// The property type (see <code>PropertyType</code>).
  final PropertyType type;

  /// The data type of the structure for this property. This parameter exists on
  /// properties that have the <code>STRUCT</code> data type.
  final String? dataTypeSpec;

  /// The ID of the asset model property.
  final String? id;

  /// The unit of the asset model property, such as <code>Newtons</code> or
  /// <code>RPM</code>.
  final String? unit;

  AssetModelProperty({
    required this.dataType,
    required this.name,
    required this.type,
    this.dataTypeSpec,
    this.id,
    this.unit,
  });

  factory AssetModelProperty.fromJson(Map<String, dynamic> json) {
    return AssetModelProperty(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      name: json['name'] as String,
      type: PropertyType.fromJson(json['type'] as Map<String, dynamic>),
      dataTypeSpec: json['dataTypeSpec'] as String?,
      id: json['id'] as String?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final name = this.name;
    final type = this.type;
    final dataTypeSpec = this.dataTypeSpec;
    final id = this.id;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'name': name,
      'type': type,
      if (dataTypeSpec != null) 'dataTypeSpec': dataTypeSpec,
      if (id != null) 'id': id,
      if (unit != null) 'unit': unit,
    };
  }
}

/// Contains an asset model property definition. This property definition is
/// applied to all assets created from the asset model.
class AssetModelPropertyDefinition {
  /// The data type of the property definition.
  ///
  /// If you specify <code>STRUCT</code>, you must also specify
  /// <code>dataTypeSpec</code> to identify the type of the structure for this
  /// property.
  final PropertyDataType dataType;

  /// The name of the property definition.
  final String name;

  /// The property definition type (see <code>PropertyType</code>). You can only
  /// specify one type in a property definition.
  final PropertyType type;

  /// The data type of the structure for this property. This parameter is required
  /// on properties that have the <code>STRUCT</code> data type.
  ///
  /// The options for this parameter depend on the type of the composite model in
  /// which you define this property. Use <code>AWS/ALARM_STATE</code> for alarm
  /// state in alarm composite models.
  final String? dataTypeSpec;

  /// The unit of the property definition, such as <code>Newtons</code> or
  /// <code>RPM</code>.
  final String? unit;

  AssetModelPropertyDefinition({
    required this.dataType,
    required this.name,
    required this.type,
    this.dataTypeSpec,
    this.unit,
  });

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final name = this.name;
    final type = this.type;
    final dataTypeSpec = this.dataTypeSpec;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'name': name,
      'type': type,
      if (dataTypeSpec != null) 'dataTypeSpec': dataTypeSpec,
      if (unit != null) 'unit': unit,
    };
  }
}

/// Contains a summary of a property associated with a model.
class AssetModelPropertySummary {
  /// The data type of the property.
  final PropertyDataType dataType;

  /// The name of the property.
  final String name;
  final PropertyType type;

  /// The ID of the composite model that contains the asset model property.
  final String? assetModelCompositeModelId;

  /// The data type of the structure for this property. This parameter exists on
  /// properties that have the <code>STRUCT</code> data type.
  final String? dataTypeSpec;

  /// The ID of the property.
  final String? id;

  /// The unit (such as <code>Newtons</code> or <code>RPM</code>) of the property.
  final String? unit;

  AssetModelPropertySummary({
    required this.dataType,
    required this.name,
    required this.type,
    this.assetModelCompositeModelId,
    this.dataTypeSpec,
    this.id,
    this.unit,
  });

  factory AssetModelPropertySummary.fromJson(Map<String, dynamic> json) {
    return AssetModelPropertySummary(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      name: json['name'] as String,
      type: PropertyType.fromJson(json['type'] as Map<String, dynamic>),
      assetModelCompositeModelId: json['assetModelCompositeModelId'] as String?,
      dataTypeSpec: json['dataTypeSpec'] as String?,
      id: json['id'] as String?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final name = this.name;
    final type = this.type;
    final assetModelCompositeModelId = this.assetModelCompositeModelId;
    final dataTypeSpec = this.dataTypeSpec;
    final id = this.id;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'name': name,
      'type': type,
      if (assetModelCompositeModelId != null)
        'assetModelCompositeModelId': assetModelCompositeModelId,
      if (dataTypeSpec != null) 'dataTypeSpec': dataTypeSpec,
      if (id != null) 'id': id,
      if (unit != null) 'unit': unit,
    };
  }
}

enum AssetModelState {
  creating,
  active,
  updating,
  propagating,
  deleting,
  failed,
}

extension AssetModelStateValueExtension on AssetModelState {
  String toValue() {
    switch (this) {
      case AssetModelState.creating:
        return 'CREATING';
      case AssetModelState.active:
        return 'ACTIVE';
      case AssetModelState.updating:
        return 'UPDATING';
      case AssetModelState.propagating:
        return 'PROPAGATING';
      case AssetModelState.deleting:
        return 'DELETING';
      case AssetModelState.failed:
        return 'FAILED';
    }
  }
}

extension AssetModelStateFromString on String {
  AssetModelState toAssetModelState() {
    switch (this) {
      case 'CREATING':
        return AssetModelState.creating;
      case 'ACTIVE':
        return AssetModelState.active;
      case 'UPDATING':
        return AssetModelState.updating;
      case 'PROPAGATING':
        return AssetModelState.propagating;
      case 'DELETING':
        return AssetModelState.deleting;
      case 'FAILED':
        return AssetModelState.failed;
    }
    throw Exception('$this is not known in enum AssetModelState');
  }
}

/// Contains current status information for an asset model. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset
/// and model states</a> in the <i>IoT SiteWise User Guide</i>.
class AssetModelStatus {
  /// The current state of the asset model.
  final AssetModelState state;

  /// Contains associated error information, if any.
  final ErrorDetails? error;

  AssetModelStatus({
    required this.state,
    this.error,
  });

  factory AssetModelStatus.fromJson(Map<String, dynamic> json) {
    return AssetModelStatus(
      state: (json['state'] as String).toAssetModelState(),
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final error = this.error;
    return {
      'state': state.toValue(),
      if (error != null) 'error': error,
    };
  }
}

/// Contains a summary of an asset model.
class AssetModelSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  final String arn;

  /// The date the asset model was created, in Unix epoch time.
  final DateTime creationDate;

  /// The asset model description.
  final String description;

  /// The ID of the asset model (used with IoT SiteWise APIs).
  final String id;

  /// The date the asset model was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// The name of the asset model.
  final String name;

  /// The current status of the asset model.
  final AssetModelStatus status;

  AssetModelSummary({
    required this.arn,
    required this.creationDate,
    required this.description,
    required this.id,
    required this.lastUpdateDate,
    required this.name,
    required this.status,
  });

  factory AssetModelSummary.fromJson(Map<String, dynamic> json) {
    return AssetModelSummary(
      arn: json['arn'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      name: json['name'] as String,
      status: AssetModelStatus.fromJson(json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final description = this.description;
    final id = this.id;
    final lastUpdateDate = this.lastUpdateDate;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'creationDate': unixTimestampToJson(creationDate),
      'description': description,
      'id': id,
      'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
      'name': name,
      'status': status,
    };
  }
}

/// Contains asset property information.
class AssetProperty {
  /// The data type of the asset property.
  final PropertyDataType dataType;

  /// The ID of the asset property.
  final String id;

  /// The name of the property.
  final String name;

  /// The alias that identifies the property, such as an OPC-UA server data stream
  /// path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>).
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? alias;

  /// The data type of the structure for this property. This parameter exists on
  /// properties that have the <code>STRUCT</code> data type.
  final String? dataTypeSpec;

  /// The asset property's notification topic and state. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  final PropertyNotification? notification;

  /// The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset
  /// property.
  final String? unit;

  AssetProperty({
    required this.dataType,
    required this.id,
    required this.name,
    this.alias,
    this.dataTypeSpec,
    this.notification,
    this.unit,
  });

  factory AssetProperty.fromJson(Map<String, dynamic> json) {
    return AssetProperty(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      id: json['id'] as String,
      name: json['name'] as String,
      alias: json['alias'] as String?,
      dataTypeSpec: json['dataTypeSpec'] as String?,
      notification: json['notification'] != null
          ? PropertyNotification.fromJson(
              json['notification'] as Map<String, dynamic>)
          : null,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final id = this.id;
    final name = this.name;
    final alias = this.alias;
    final dataTypeSpec = this.dataTypeSpec;
    final notification = this.notification;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'id': id,
      'name': name,
      if (alias != null) 'alias': alias,
      if (dataTypeSpec != null) 'dataTypeSpec': dataTypeSpec,
      if (notification != null) 'notification': notification,
      if (unit != null) 'unit': unit,
    };
  }
}

/// Contains a summary of a property associated with an asset.
class AssetPropertySummary {
  /// The alias that identifies the property, such as an OPC-UA server data stream
  /// path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>).
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? alias;

  /// The ID of the composite model that contains the asset property.
  final String? assetCompositeModelId;

  /// The ID of the property.
  final String? id;
  final PropertyNotification? notification;

  /// The unit of measure (such as Newtons or RPM) of the asset property.
  final String? unit;

  AssetPropertySummary({
    this.alias,
    this.assetCompositeModelId,
    this.id,
    this.notification,
    this.unit,
  });

  factory AssetPropertySummary.fromJson(Map<String, dynamic> json) {
    return AssetPropertySummary(
      alias: json['alias'] as String?,
      assetCompositeModelId: json['assetCompositeModelId'] as String?,
      id: json['id'] as String?,
      notification: json['notification'] != null
          ? PropertyNotification.fromJson(
              json['notification'] as Map<String, dynamic>)
          : null,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final assetCompositeModelId = this.assetCompositeModelId;
    final id = this.id;
    final notification = this.notification;
    final unit = this.unit;
    return {
      if (alias != null) 'alias': alias,
      if (assetCompositeModelId != null)
        'assetCompositeModelId': assetCompositeModelId,
      if (id != null) 'id': id,
      if (notification != null) 'notification': notification,
      if (unit != null) 'unit': unit,
    };
  }
}

/// Contains asset property value information.
class AssetPropertyValue {
  /// The timestamp of the asset property value.
  final TimeInNanos timestamp;

  /// The value of the asset property (see <code>Variant</code>).
  final Variant value;

  /// The quality of the asset property value.
  final Quality? quality;

  AssetPropertyValue({
    required this.timestamp,
    required this.value,
    this.quality,
  });

  factory AssetPropertyValue.fromJson(Map<String, dynamic> json) {
    return AssetPropertyValue(
      timestamp:
          TimeInNanos.fromJson(json['timestamp'] as Map<String, dynamic>),
      value: Variant.fromJson(json['value'] as Map<String, dynamic>),
      quality: (json['quality'] as String?)?.toQuality(),
    );
  }

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final value = this.value;
    final quality = this.quality;
    return {
      'timestamp': timestamp,
      'value': value,
      if (quality != null) 'quality': quality.toValue(),
    };
  }
}

/// Contains information about assets that are related to one another.
class AssetRelationshipSummary {
  /// The relationship type of the assets in this relationship. This value is one
  /// of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>HIERARCHY</code> – The assets are related through an asset hierarchy.
  /// If you specify this relationship type, this asset relationship includes the
  /// <code>hierarchyInfo</code> object.
  /// </li>
  /// </ul>
  final AssetRelationshipType relationshipType;

  /// The assets that are related through an asset hierarchy.
  ///
  /// This object is present if the <code>relationshipType</code> is
  /// <code>HIERARCHY</code>.
  final AssetHierarchyInfo? hierarchyInfo;

  AssetRelationshipSummary({
    required this.relationshipType,
    this.hierarchyInfo,
  });

  factory AssetRelationshipSummary.fromJson(Map<String, dynamic> json) {
    return AssetRelationshipSummary(
      relationshipType:
          (json['relationshipType'] as String).toAssetRelationshipType(),
      hierarchyInfo: json['hierarchyInfo'] != null
          ? AssetHierarchyInfo.fromJson(
              json['hierarchyInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final relationshipType = this.relationshipType;
    final hierarchyInfo = this.hierarchyInfo;
    return {
      'relationshipType': relationshipType.toValue(),
      if (hierarchyInfo != null) 'hierarchyInfo': hierarchyInfo,
    };
  }
}

enum AssetRelationshipType {
  hierarchy,
}

extension AssetRelationshipTypeValueExtension on AssetRelationshipType {
  String toValue() {
    switch (this) {
      case AssetRelationshipType.hierarchy:
        return 'HIERARCHY';
    }
  }
}

extension AssetRelationshipTypeFromString on String {
  AssetRelationshipType toAssetRelationshipType() {
    switch (this) {
      case 'HIERARCHY':
        return AssetRelationshipType.hierarchy;
    }
    throw Exception('$this is not known in enum AssetRelationshipType');
  }
}

enum AssetState {
  creating,
  active,
  updating,
  deleting,
  failed,
}

extension AssetStateValueExtension on AssetState {
  String toValue() {
    switch (this) {
      case AssetState.creating:
        return 'CREATING';
      case AssetState.active:
        return 'ACTIVE';
      case AssetState.updating:
        return 'UPDATING';
      case AssetState.deleting:
        return 'DELETING';
      case AssetState.failed:
        return 'FAILED';
    }
  }
}

extension AssetStateFromString on String {
  AssetState toAssetState() {
    switch (this) {
      case 'CREATING':
        return AssetState.creating;
      case 'ACTIVE':
        return AssetState.active;
      case 'UPDATING':
        return AssetState.updating;
      case 'DELETING':
        return AssetState.deleting;
      case 'FAILED':
        return AssetState.failed;
    }
    throw Exception('$this is not known in enum AssetState');
  }
}

/// Contains information about the current status of an asset. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset
/// and model states</a> in the <i>IoT SiteWise User Guide</i>.
class AssetStatus {
  /// The current status of the asset.
  final AssetState state;

  /// Contains associated error information, if any.
  final ErrorDetails? error;

  AssetStatus({
    required this.state,
    this.error,
  });

  factory AssetStatus.fromJson(Map<String, dynamic> json) {
    return AssetStatus(
      state: (json['state'] as String).toAssetState(),
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final error = this.error;
    return {
      'state': state.toValue(),
      if (error != null) 'error': error,
    };
  }
}

/// Contains a summary of an asset.
class AssetSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  final String arn;

  /// The ID of the asset model used to create this asset.
  final String assetModelId;

  /// The date the asset was created, in Unix epoch time.
  final DateTime creationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  final List<AssetHierarchy> hierarchies;

  /// The ID of the asset.
  final String id;

  /// The date the asset was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// The name of the asset.
  final String name;

  /// The current status of the asset.
  final AssetStatus status;

  /// A description for the asset.
  final String? description;

  AssetSummary({
    required this.arn,
    required this.assetModelId,
    required this.creationDate,
    required this.hierarchies,
    required this.id,
    required this.lastUpdateDate,
    required this.name,
    required this.status,
    this.description,
  });

  factory AssetSummary.fromJson(Map<String, dynamic> json) {
    return AssetSummary(
      arn: json['arn'] as String,
      assetModelId: json['assetModelId'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      hierarchies: (json['hierarchies'] as List)
          .whereNotNull()
          .map((e) => AssetHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      name: json['name'] as String,
      status: AssetStatus.fromJson(json['status'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetModelId = this.assetModelId;
    final creationDate = this.creationDate;
    final hierarchies = this.hierarchies;
    final id = this.id;
    final lastUpdateDate = this.lastUpdateDate;
    final name = this.name;
    final status = this.status;
    final description = this.description;
    return {
      'arn': arn,
      'assetModelId': assetModelId,
      'creationDate': unixTimestampToJson(creationDate),
      'hierarchies': hierarchies,
      'id': id,
      'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
      'name': name,
      'status': status,
      if (description != null) 'description': description,
    };
  }
}

/// Contains a summary of an associated asset.
class AssociatedAssetsSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  final String arn;

  /// The ID of the asset model used to create the asset.
  final String assetModelId;

  /// The date the asset was created, in Unix epoch time.
  final DateTime creationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  final List<AssetHierarchy> hierarchies;

  /// The ID of the asset.
  final String id;

  /// The date the asset was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// The name of the asset.
  final String name;

  /// The current status of the asset.
  final AssetStatus status;

  /// A description for the asset.
  final String? description;

  AssociatedAssetsSummary({
    required this.arn,
    required this.assetModelId,
    required this.creationDate,
    required this.hierarchies,
    required this.id,
    required this.lastUpdateDate,
    required this.name,
    required this.status,
    this.description,
  });

  factory AssociatedAssetsSummary.fromJson(Map<String, dynamic> json) {
    return AssociatedAssetsSummary(
      arn: json['arn'] as String,
      assetModelId: json['assetModelId'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      hierarchies: (json['hierarchies'] as List)
          .whereNotNull()
          .map((e) => AssetHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      name: json['name'] as String,
      status: AssetStatus.fromJson(json['status'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetModelId = this.assetModelId;
    final creationDate = this.creationDate;
    final hierarchies = this.hierarchies;
    final id = this.id;
    final lastUpdateDate = this.lastUpdateDate;
    final name = this.name;
    final status = this.status;
    final description = this.description;
    return {
      'arn': arn,
      'assetModelId': assetModelId,
      'creationDate': unixTimestampToJson(creationDate),
      'hierarchies': hierarchies,
      'id': id,
      'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
      'name': name,
      'status': status,
      if (description != null) 'description': description,
    };
  }
}

/// Contains an asset attribute property. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#attributes">Attributes</a>
/// in the <i>IoT SiteWise User Guide</i>.
class Attribute {
  /// The default value of the asset model property attribute. All assets that you
  /// create from the asset model contain this attribute value. You can update an
  /// attribute's value after you create an asset. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-attribute-values.html">Updating
  /// attribute values</a> in the <i>IoT SiteWise User Guide</i>.
  final String? defaultValue;

  Attribute({
    this.defaultValue,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      defaultValue: json['defaultValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    return {
      if (defaultValue != null) 'defaultValue': defaultValue,
    };
  }
}

enum AuthMode {
  iam,
  sso,
}

extension AuthModeValueExtension on AuthMode {
  String toValue() {
    switch (this) {
      case AuthMode.iam:
        return 'IAM';
      case AuthMode.sso:
        return 'SSO';
    }
  }
}

extension AuthModeFromString on String {
  AuthMode toAuthMode() {
    switch (this) {
      case 'IAM':
        return AuthMode.iam;
      case 'SSO':
        return AuthMode.sso;
    }
    throw Exception('$this is not known in enum AuthMode');
  }
}

class BatchAssociateProjectAssetsResponse {
  /// A list of associated error information, if any.
  final List<AssetErrorDetails>? errors;

  BatchAssociateProjectAssetsResponse({
    this.errors,
  });

  factory BatchAssociateProjectAssetsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateProjectAssetsResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => AssetErrorDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

class BatchDisassociateProjectAssetsResponse {
  /// A list of associated error information, if any.
  final List<AssetErrorDetails>? errors;

  BatchDisassociateProjectAssetsResponse({
    this.errors,
  });

  factory BatchDisassociateProjectAssetsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateProjectAssetsResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => AssetErrorDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

enum BatchEntryCompletionStatus {
  success,
  error,
}

extension BatchEntryCompletionStatusValueExtension
    on BatchEntryCompletionStatus {
  String toValue() {
    switch (this) {
      case BatchEntryCompletionStatus.success:
        return 'SUCCESS';
      case BatchEntryCompletionStatus.error:
        return 'ERROR';
    }
  }
}

extension BatchEntryCompletionStatusFromString on String {
  BatchEntryCompletionStatus toBatchEntryCompletionStatus() {
    switch (this) {
      case 'SUCCESS':
        return BatchEntryCompletionStatus.success;
      case 'ERROR':
        return BatchEntryCompletionStatus.error;
    }
    throw Exception('$this is not known in enum BatchEntryCompletionStatus');
  }
}

/// Contains information for an asset property aggregate entry that is
/// associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyAggregates.html">BatchGetAssetPropertyAggregates</a>
/// API.
///
/// To identify an asset property, you must specify one of the following:
///
/// <ul>
/// <li>
/// The <code>assetId</code> and <code>propertyId</code> of an asset property.
/// </li>
/// <li>
/// A <code>propertyAlias</code>, which is a data stream alias (for example,
/// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset
/// property's alias, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
/// </li>
/// </ul>
class BatchGetAssetPropertyAggregatesEntry {
  /// The data aggregating function.
  final List<AggregateType> aggregateTypes;

  /// The inclusive end of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  final DateTime endDate;

  /// The ID of the entry.
  final String entryId;

  /// The time interval over which to aggregate data.
  final String resolution;

  /// The exclusive start of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  final DateTime startDate;

  /// The ID of the asset in which the asset property was created.
  final String? assetId;

  /// The alias that identifies the property, such as an OPC-UA server data stream
  /// path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>).
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? propertyAlias;

  /// The ID of the asset property.
  final String? propertyId;

  /// The quality by which to filter asset data.
  final List<Quality>? qualities;

  /// The chronological sorting order of the requested information.
  ///
  /// Default: <code>ASCENDING</code>
  final TimeOrdering? timeOrdering;

  BatchGetAssetPropertyAggregatesEntry({
    required this.aggregateTypes,
    required this.endDate,
    required this.entryId,
    required this.resolution,
    required this.startDate,
    this.assetId,
    this.propertyAlias,
    this.propertyId,
    this.qualities,
    this.timeOrdering,
  });

  Map<String, dynamic> toJson() {
    final aggregateTypes = this.aggregateTypes;
    final endDate = this.endDate;
    final entryId = this.entryId;
    final resolution = this.resolution;
    final startDate = this.startDate;
    final assetId = this.assetId;
    final propertyAlias = this.propertyAlias;
    final propertyId = this.propertyId;
    final qualities = this.qualities;
    final timeOrdering = this.timeOrdering;
    return {
      'aggregateTypes': aggregateTypes.map((e) => e.toValue()).toList(),
      'endDate': unixTimestampToJson(endDate),
      'entryId': entryId,
      'resolution': resolution,
      'startDate': unixTimestampToJson(startDate),
      if (assetId != null) 'assetId': assetId,
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyId != null) 'propertyId': propertyId,
      if (qualities != null)
        'qualities': qualities.map((e) => e.toValue()).toList(),
      if (timeOrdering != null) 'timeOrdering': timeOrdering.toValue(),
    };
  }
}

enum BatchGetAssetPropertyAggregatesErrorCode {
  resourceNotFoundException,
  invalidRequestException,
  accessDeniedException,
}

extension BatchGetAssetPropertyAggregatesErrorCodeValueExtension
    on BatchGetAssetPropertyAggregatesErrorCode {
  String toValue() {
    switch (this) {
      case BatchGetAssetPropertyAggregatesErrorCode.resourceNotFoundException:
        return 'ResourceNotFoundException';
      case BatchGetAssetPropertyAggregatesErrorCode.invalidRequestException:
        return 'InvalidRequestException';
      case BatchGetAssetPropertyAggregatesErrorCode.accessDeniedException:
        return 'AccessDeniedException';
    }
  }
}

extension BatchGetAssetPropertyAggregatesErrorCodeFromString on String {
  BatchGetAssetPropertyAggregatesErrorCode
      toBatchGetAssetPropertyAggregatesErrorCode() {
    switch (this) {
      case 'ResourceNotFoundException':
        return BatchGetAssetPropertyAggregatesErrorCode
            .resourceNotFoundException;
      case 'InvalidRequestException':
        return BatchGetAssetPropertyAggregatesErrorCode.invalidRequestException;
      case 'AccessDeniedException':
        return BatchGetAssetPropertyAggregatesErrorCode.accessDeniedException;
    }
    throw Exception(
        '$this is not known in enum BatchGetAssetPropertyAggregatesErrorCode');
  }
}

/// Contains error information for an asset property aggregate entry that is
/// associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyAggregates.html">BatchGetAssetPropertyAggregates</a>
/// API.
class BatchGetAssetPropertyAggregatesErrorEntry {
  /// The ID of the entry.
  final String entryId;

  /// The error code.
  final BatchGetAssetPropertyAggregatesErrorCode errorCode;

  /// The associated error message.
  final String errorMessage;

  BatchGetAssetPropertyAggregatesErrorEntry({
    required this.entryId,
    required this.errorCode,
    required this.errorMessage,
  });

  factory BatchGetAssetPropertyAggregatesErrorEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyAggregatesErrorEntry(
      entryId: json['entryId'] as String,
      errorCode: (json['errorCode'] as String)
          .toBatchGetAssetPropertyAggregatesErrorCode(),
      errorMessage: json['errorMessage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      'entryId': entryId,
      'errorCode': errorCode.toValue(),
      'errorMessage': errorMessage,
    };
  }
}

/// Contains the error code and the timestamp for an asset property aggregate
/// entry that is associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyAggregates.html">BatchGetAssetPropertyAggregates</a>
/// API.
class BatchGetAssetPropertyAggregatesErrorInfo {
  /// The error code.
  final BatchGetAssetPropertyAggregatesErrorCode errorCode;

  /// The date the error occurred, in Unix epoch time.
  final DateTime errorTimestamp;

  BatchGetAssetPropertyAggregatesErrorInfo({
    required this.errorCode,
    required this.errorTimestamp,
  });

  factory BatchGetAssetPropertyAggregatesErrorInfo.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyAggregatesErrorInfo(
      errorCode: (json['errorCode'] as String)
          .toBatchGetAssetPropertyAggregatesErrorCode(),
      errorTimestamp:
          nonNullableTimeStampFromJson(json['errorTimestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorTimestamp = this.errorTimestamp;
    return {
      'errorCode': errorCode.toValue(),
      'errorTimestamp': unixTimestampToJson(errorTimestamp),
    };
  }
}

class BatchGetAssetPropertyAggregatesResponse {
  /// A list of the errors (if any) associated with the batch request. Each error
  /// entry contains the <code>entryId</code> of the entry that failed.
  final List<BatchGetAssetPropertyAggregatesErrorEntry> errorEntries;

  /// A list of entries that were not processed by this batch request. because
  /// these entries had been completely processed by previous paginated requests.
  /// Each skipped entry contains the <code>entryId</code> of the entry that
  /// skipped.
  final List<BatchGetAssetPropertyAggregatesSkippedEntry> skippedEntries;

  /// A list of entries that were processed successfully by this batch request.
  /// Each success entry contains the <code>entryId</code> of the entry that
  /// succeeded and the latest query result.
  final List<BatchGetAssetPropertyAggregatesSuccessEntry> successEntries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  BatchGetAssetPropertyAggregatesResponse({
    required this.errorEntries,
    required this.skippedEntries,
    required this.successEntries,
    this.nextToken,
  });

  factory BatchGetAssetPropertyAggregatesResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyAggregatesResponse(
      errorEntries: (json['errorEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyAggregatesErrorEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      skippedEntries: (json['skippedEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyAggregatesSkippedEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successEntries: (json['successEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyAggregatesSuccessEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    final skippedEntries = this.skippedEntries;
    final successEntries = this.successEntries;
    final nextToken = this.nextToken;
    return {
      'errorEntries': errorEntries,
      'skippedEntries': skippedEntries,
      'successEntries': successEntries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains information for an entry that has been processed by the previous <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyAggregates.html">BatchGetAssetPropertyAggregates</a>
/// request.
class BatchGetAssetPropertyAggregatesSkippedEntry {
  /// The completion status of each entry that is associated with the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyAggregates.html">BatchGetAssetPropertyAggregates</a>
  /// API.
  final BatchEntryCompletionStatus completionStatus;

  /// The ID of the entry.
  final String entryId;

  /// The error information, such as the error code and the timestamp.
  final BatchGetAssetPropertyAggregatesErrorInfo? errorInfo;

  BatchGetAssetPropertyAggregatesSkippedEntry({
    required this.completionStatus,
    required this.entryId,
    this.errorInfo,
  });

  factory BatchGetAssetPropertyAggregatesSkippedEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyAggregatesSkippedEntry(
      completionStatus:
          (json['completionStatus'] as String).toBatchEntryCompletionStatus(),
      entryId: json['entryId'] as String,
      errorInfo: json['errorInfo'] != null
          ? BatchGetAssetPropertyAggregatesErrorInfo.fromJson(
              json['errorInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final completionStatus = this.completionStatus;
    final entryId = this.entryId;
    final errorInfo = this.errorInfo;
    return {
      'completionStatus': completionStatus.toValue(),
      'entryId': entryId,
      if (errorInfo != null) 'errorInfo': errorInfo,
    };
  }
}

/// Contains success information for an entry that is associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyAggregates.html">BatchGetAssetPropertyAggregates</a>
/// API.
class BatchGetAssetPropertyAggregatesSuccessEntry {
  /// The requested aggregated asset property values (for example, average,
  /// minimum, and maximum).
  final List<AggregatedValue> aggregatedValues;

  /// The ID of the entry.
  final String entryId;

  BatchGetAssetPropertyAggregatesSuccessEntry({
    required this.aggregatedValues,
    required this.entryId,
  });

  factory BatchGetAssetPropertyAggregatesSuccessEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyAggregatesSuccessEntry(
      aggregatedValues: (json['aggregatedValues'] as List)
          .whereNotNull()
          .map((e) => AggregatedValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      entryId: json['entryId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedValues = this.aggregatedValues;
    final entryId = this.entryId;
    return {
      'aggregatedValues': aggregatedValues,
      'entryId': entryId,
    };
  }
}

/// Contains information for an asset property value entry that is associated
/// with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValue.html">BatchGetAssetPropertyValue</a>
/// API.
///
/// To identify an asset property, you must specify one of the following:
///
/// <ul>
/// <li>
/// The <code>assetId</code> and <code>propertyId</code> of an asset property.
/// </li>
/// <li>
/// A <code>propertyAlias</code>, which is a data stream alias (for example,
/// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset
/// property's alias, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
/// </li>
/// </ul>
class BatchGetAssetPropertyValueEntry {
  /// The ID of the entry.
  final String entryId;

  /// The ID of the asset in which the asset property was created.
  final String? assetId;

  /// The alias that identifies the property, such as an OPC-UA server data stream
  /// path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>).
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? propertyAlias;

  /// The ID of the asset property.
  final String? propertyId;

  BatchGetAssetPropertyValueEntry({
    required this.entryId,
    this.assetId,
    this.propertyAlias,
    this.propertyId,
  });

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final assetId = this.assetId;
    final propertyAlias = this.propertyAlias;
    final propertyId = this.propertyId;
    return {
      'entryId': entryId,
      if (assetId != null) 'assetId': assetId,
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyId != null) 'propertyId': propertyId,
    };
  }
}

enum BatchGetAssetPropertyValueErrorCode {
  resourceNotFoundException,
  invalidRequestException,
  accessDeniedException,
}

extension BatchGetAssetPropertyValueErrorCodeValueExtension
    on BatchGetAssetPropertyValueErrorCode {
  String toValue() {
    switch (this) {
      case BatchGetAssetPropertyValueErrorCode.resourceNotFoundException:
        return 'ResourceNotFoundException';
      case BatchGetAssetPropertyValueErrorCode.invalidRequestException:
        return 'InvalidRequestException';
      case BatchGetAssetPropertyValueErrorCode.accessDeniedException:
        return 'AccessDeniedException';
    }
  }
}

extension BatchGetAssetPropertyValueErrorCodeFromString on String {
  BatchGetAssetPropertyValueErrorCode toBatchGetAssetPropertyValueErrorCode() {
    switch (this) {
      case 'ResourceNotFoundException':
        return BatchGetAssetPropertyValueErrorCode.resourceNotFoundException;
      case 'InvalidRequestException':
        return BatchGetAssetPropertyValueErrorCode.invalidRequestException;
      case 'AccessDeniedException':
        return BatchGetAssetPropertyValueErrorCode.accessDeniedException;
    }
    throw Exception(
        '$this is not known in enum BatchGetAssetPropertyValueErrorCode');
  }
}

/// Contains error information for an asset property value entry that is
/// associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValue.html">BatchGetAssetPropertyValue</a>
/// API.
class BatchGetAssetPropertyValueErrorEntry {
  /// The ID of the entry.
  final String entryId;

  /// The error code.
  final BatchGetAssetPropertyValueErrorCode errorCode;

  /// The associated error message.
  final String errorMessage;

  BatchGetAssetPropertyValueErrorEntry({
    required this.entryId,
    required this.errorCode,
    required this.errorMessage,
  });

  factory BatchGetAssetPropertyValueErrorEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueErrorEntry(
      entryId: json['entryId'] as String,
      errorCode:
          (json['errorCode'] as String).toBatchGetAssetPropertyValueErrorCode(),
      errorMessage: json['errorMessage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      'entryId': entryId,
      'errorCode': errorCode.toValue(),
      'errorMessage': errorMessage,
    };
  }
}

/// The error information, such as the error code and the timestamp.
class BatchGetAssetPropertyValueErrorInfo {
  /// The error code.
  final BatchGetAssetPropertyValueErrorCode errorCode;

  /// The date the error occurred, in Unix epoch time.
  final DateTime errorTimestamp;

  BatchGetAssetPropertyValueErrorInfo({
    required this.errorCode,
    required this.errorTimestamp,
  });

  factory BatchGetAssetPropertyValueErrorInfo.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueErrorInfo(
      errorCode:
          (json['errorCode'] as String).toBatchGetAssetPropertyValueErrorCode(),
      errorTimestamp:
          nonNullableTimeStampFromJson(json['errorTimestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorTimestamp = this.errorTimestamp;
    return {
      'errorCode': errorCode.toValue(),
      'errorTimestamp': unixTimestampToJson(errorTimestamp),
    };
  }
}

/// Contains information for an asset property historical value entry that is
/// associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValue.html">BatchGetAssetPropertyValueHistory</a>
/// API.
///
/// To identify an asset property, you must specify one of the following:
///
/// <ul>
/// <li>
/// The <code>assetId</code> and <code>propertyId</code> of an asset property.
/// </li>
/// <li>
/// A <code>propertyAlias</code>, which is a data stream alias (for example,
/// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an asset
/// property's alias, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
/// </li>
/// </ul>
class BatchGetAssetPropertyValueHistoryEntry {
  /// The ID of the entry.
  final String entryId;

  /// The ID of the asset in which the asset property was created.
  final String? assetId;

  /// The inclusive end of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  final DateTime? endDate;

  /// The alias that identifies the property, such as an OPC-UA server data stream
  /// path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>).
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? propertyAlias;

  /// The ID of the asset property.
  final String? propertyId;

  /// The quality by which to filter asset data.
  final List<Quality>? qualities;

  /// The exclusive start of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  final DateTime? startDate;

  /// The chronological sorting order of the requested information.
  ///
  /// Default: <code>ASCENDING</code>
  final TimeOrdering? timeOrdering;

  BatchGetAssetPropertyValueHistoryEntry({
    required this.entryId,
    this.assetId,
    this.endDate,
    this.propertyAlias,
    this.propertyId,
    this.qualities,
    this.startDate,
    this.timeOrdering,
  });

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final assetId = this.assetId;
    final endDate = this.endDate;
    final propertyAlias = this.propertyAlias;
    final propertyId = this.propertyId;
    final qualities = this.qualities;
    final startDate = this.startDate;
    final timeOrdering = this.timeOrdering;
    return {
      'entryId': entryId,
      if (assetId != null) 'assetId': assetId,
      if (endDate != null) 'endDate': unixTimestampToJson(endDate),
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyId != null) 'propertyId': propertyId,
      if (qualities != null)
        'qualities': qualities.map((e) => e.toValue()).toList(),
      if (startDate != null) 'startDate': unixTimestampToJson(startDate),
      if (timeOrdering != null) 'timeOrdering': timeOrdering.toValue(),
    };
  }
}

enum BatchGetAssetPropertyValueHistoryErrorCode {
  resourceNotFoundException,
  invalidRequestException,
  accessDeniedException,
}

extension BatchGetAssetPropertyValueHistoryErrorCodeValueExtension
    on BatchGetAssetPropertyValueHistoryErrorCode {
  String toValue() {
    switch (this) {
      case BatchGetAssetPropertyValueHistoryErrorCode.resourceNotFoundException:
        return 'ResourceNotFoundException';
      case BatchGetAssetPropertyValueHistoryErrorCode.invalidRequestException:
        return 'InvalidRequestException';
      case BatchGetAssetPropertyValueHistoryErrorCode.accessDeniedException:
        return 'AccessDeniedException';
    }
  }
}

extension BatchGetAssetPropertyValueHistoryErrorCodeFromString on String {
  BatchGetAssetPropertyValueHistoryErrorCode
      toBatchGetAssetPropertyValueHistoryErrorCode() {
    switch (this) {
      case 'ResourceNotFoundException':
        return BatchGetAssetPropertyValueHistoryErrorCode
            .resourceNotFoundException;
      case 'InvalidRequestException':
        return BatchGetAssetPropertyValueHistoryErrorCode
            .invalidRequestException;
      case 'AccessDeniedException':
        return BatchGetAssetPropertyValueHistoryErrorCode.accessDeniedException;
    }
    throw Exception(
        '$this is not known in enum BatchGetAssetPropertyValueHistoryErrorCode');
  }
}

/// A list of the errors (if any) associated with the batch request. Each error
/// entry contains the <code>entryId</code> of the entry that failed.
class BatchGetAssetPropertyValueHistoryErrorEntry {
  /// The ID of the entry.
  final String entryId;

  /// The error code.
  final BatchGetAssetPropertyValueHistoryErrorCode errorCode;

  /// The associated error message.
  final String errorMessage;

  BatchGetAssetPropertyValueHistoryErrorEntry({
    required this.entryId,
    required this.errorCode,
    required this.errorMessage,
  });

  factory BatchGetAssetPropertyValueHistoryErrorEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueHistoryErrorEntry(
      entryId: json['entryId'] as String,
      errorCode: (json['errorCode'] as String)
          .toBatchGetAssetPropertyValueHistoryErrorCode(),
      errorMessage: json['errorMessage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      'entryId': entryId,
      'errorCode': errorCode.toValue(),
      'errorMessage': errorMessage,
    };
  }
}

/// The error information, such as the error code and the timestamp.
class BatchGetAssetPropertyValueHistoryErrorInfo {
  /// The error code.
  final BatchGetAssetPropertyValueHistoryErrorCode errorCode;

  /// The date the error occurred, in Unix epoch time.
  final DateTime errorTimestamp;

  BatchGetAssetPropertyValueHistoryErrorInfo({
    required this.errorCode,
    required this.errorTimestamp,
  });

  factory BatchGetAssetPropertyValueHistoryErrorInfo.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueHistoryErrorInfo(
      errorCode: (json['errorCode'] as String)
          .toBatchGetAssetPropertyValueHistoryErrorCode(),
      errorTimestamp:
          nonNullableTimeStampFromJson(json['errorTimestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorTimestamp = this.errorTimestamp;
    return {
      'errorCode': errorCode.toValue(),
      'errorTimestamp': unixTimestampToJson(errorTimestamp),
    };
  }
}

class BatchGetAssetPropertyValueHistoryResponse {
  /// A list of the errors (if any) associated with the batch request. Each error
  /// entry contains the <code>entryId</code> of the entry that failed.
  final List<BatchGetAssetPropertyValueHistoryErrorEntry> errorEntries;

  /// A list of entries that were not processed by this batch request. because
  /// these entries had been completely processed by previous paginated requests.
  /// Each skipped entry contains the <code>entryId</code> of the entry that
  /// skipped.
  final List<BatchGetAssetPropertyValueHistorySkippedEntry> skippedEntries;

  /// A list of entries that were processed successfully by this batch request.
  /// Each success entry contains the <code>entryId</code> of the entry that
  /// succeeded and the latest query result.
  final List<BatchGetAssetPropertyValueHistorySuccessEntry> successEntries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  BatchGetAssetPropertyValueHistoryResponse({
    required this.errorEntries,
    required this.skippedEntries,
    required this.successEntries,
    this.nextToken,
  });

  factory BatchGetAssetPropertyValueHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueHistoryResponse(
      errorEntries: (json['errorEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyValueHistoryErrorEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      skippedEntries: (json['skippedEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyValueHistorySkippedEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successEntries: (json['successEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyValueHistorySuccessEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    final skippedEntries = this.skippedEntries;
    final successEntries = this.successEntries;
    final nextToken = this.nextToken;
    return {
      'errorEntries': errorEntries,
      'skippedEntries': skippedEntries,
      'successEntries': successEntries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains information for an entry that has been processed by the previous <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValue.html">BatchGetAssetPropertyValueHistory</a>
/// request.
class BatchGetAssetPropertyValueHistorySkippedEntry {
  /// The completion status of each entry that is associated with the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValueHistory.html">BatchGetAssetPropertyValueHistory</a>
  /// API.
  final BatchEntryCompletionStatus completionStatus;

  /// The ID of the entry.
  final String entryId;

  /// The error information, such as the error code and the timestamp.
  final BatchGetAssetPropertyValueHistoryErrorInfo? errorInfo;

  BatchGetAssetPropertyValueHistorySkippedEntry({
    required this.completionStatus,
    required this.entryId,
    this.errorInfo,
  });

  factory BatchGetAssetPropertyValueHistorySkippedEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueHistorySkippedEntry(
      completionStatus:
          (json['completionStatus'] as String).toBatchEntryCompletionStatus(),
      entryId: json['entryId'] as String,
      errorInfo: json['errorInfo'] != null
          ? BatchGetAssetPropertyValueHistoryErrorInfo.fromJson(
              json['errorInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final completionStatus = this.completionStatus;
    final entryId = this.entryId;
    final errorInfo = this.errorInfo;
    return {
      'completionStatus': completionStatus.toValue(),
      'entryId': entryId,
      if (errorInfo != null) 'errorInfo': errorInfo,
    };
  }
}

/// Contains success information for an entry that is associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValue.html">BatchGetAssetPropertyValueHistory</a>
/// API.
class BatchGetAssetPropertyValueHistorySuccessEntry {
  /// The requested historical values for the specified asset property.
  final List<AssetPropertyValue> assetPropertyValueHistory;

  /// The ID of the entry.
  final String entryId;

  BatchGetAssetPropertyValueHistorySuccessEntry({
    required this.assetPropertyValueHistory,
    required this.entryId,
  });

  factory BatchGetAssetPropertyValueHistorySuccessEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueHistorySuccessEntry(
      assetPropertyValueHistory: (json['assetPropertyValueHistory'] as List)
          .whereNotNull()
          .map((e) => AssetPropertyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      entryId: json['entryId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetPropertyValueHistory = this.assetPropertyValueHistory;
    final entryId = this.entryId;
    return {
      'assetPropertyValueHistory': assetPropertyValueHistory,
      'entryId': entryId,
    };
  }
}

class BatchGetAssetPropertyValueResponse {
  /// A list of the errors (if any) associated with the batch request. Each error
  /// entry contains the <code>entryId</code> of the entry that failed.
  final List<BatchGetAssetPropertyValueErrorEntry> errorEntries;

  /// A list of entries that were not processed by this batch request. because
  /// these entries had been completely processed by previous paginated requests.
  /// Each skipped entry contains the <code>entryId</code> of the entry that
  /// skipped.
  final List<BatchGetAssetPropertyValueSkippedEntry> skippedEntries;

  /// A list of entries that were processed successfully by this batch request.
  /// Each success entry contains the <code>entryId</code> of the entry that
  /// succeeded and the latest query result.
  final List<BatchGetAssetPropertyValueSuccessEntry> successEntries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  BatchGetAssetPropertyValueResponse({
    required this.errorEntries,
    required this.skippedEntries,
    required this.successEntries,
    this.nextToken,
  });

  factory BatchGetAssetPropertyValueResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueResponse(
      errorEntries: (json['errorEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyValueErrorEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      skippedEntries: (json['skippedEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyValueSkippedEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successEntries: (json['successEntries'] as List)
          .whereNotNull()
          .map((e) => BatchGetAssetPropertyValueSuccessEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    final skippedEntries = this.skippedEntries;
    final successEntries = this.successEntries;
    final nextToken = this.nextToken;
    return {
      'errorEntries': errorEntries,
      'skippedEntries': skippedEntries,
      'successEntries': successEntries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains information for an entry that has been processed by the previous <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValue.html">BatchGetAssetPropertyValue</a>
/// request.
class BatchGetAssetPropertyValueSkippedEntry {
  /// The completion status of each entry that is associated with the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValue.html">BatchGetAssetPropertyValue</a>
  /// request.
  final BatchEntryCompletionStatus completionStatus;

  /// The ID of the entry.
  final String entryId;

  /// The error information, such as the error code and the timestamp.
  final BatchGetAssetPropertyValueErrorInfo? errorInfo;

  BatchGetAssetPropertyValueSkippedEntry({
    required this.completionStatus,
    required this.entryId,
    this.errorInfo,
  });

  factory BatchGetAssetPropertyValueSkippedEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueSkippedEntry(
      completionStatus:
          (json['completionStatus'] as String).toBatchEntryCompletionStatus(),
      entryId: json['entryId'] as String,
      errorInfo: json['errorInfo'] != null
          ? BatchGetAssetPropertyValueErrorInfo.fromJson(
              json['errorInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final completionStatus = this.completionStatus;
    final entryId = this.entryId;
    final errorInfo = this.errorInfo;
    return {
      'completionStatus': completionStatus.toValue(),
      'entryId': entryId,
      if (errorInfo != null) 'errorInfo': errorInfo,
    };
  }
}

/// Contains success information for an entry that is associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchGetAssetPropertyValue.html">BatchGetAssetPropertyValue</a>
/// API.
class BatchGetAssetPropertyValueSuccessEntry {
  /// The ID of the entry.
  final String entryId;
  final AssetPropertyValue? assetPropertyValue;

  BatchGetAssetPropertyValueSuccessEntry({
    required this.entryId,
    this.assetPropertyValue,
  });

  factory BatchGetAssetPropertyValueSuccessEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchGetAssetPropertyValueSuccessEntry(
      entryId: json['entryId'] as String,
      assetPropertyValue: json['assetPropertyValue'] != null
          ? AssetPropertyValue.fromJson(
              json['assetPropertyValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final assetPropertyValue = this.assetPropertyValue;
    return {
      'entryId': entryId,
      if (assetPropertyValue != null) 'assetPropertyValue': assetPropertyValue,
    };
  }
}

/// Contains error information from updating a batch of asset property values.
class BatchPutAssetPropertyError {
  /// The error code.
  final BatchPutAssetPropertyValueErrorCode errorCode;

  /// The associated error message.
  final String errorMessage;

  /// A list of timestamps for each error, if any.
  final List<TimeInNanos> timestamps;

  BatchPutAssetPropertyError({
    required this.errorCode,
    required this.errorMessage,
    required this.timestamps,
  });

  factory BatchPutAssetPropertyError.fromJson(Map<String, dynamic> json) {
    return BatchPutAssetPropertyError(
      errorCode:
          (json['errorCode'] as String).toBatchPutAssetPropertyValueErrorCode(),
      errorMessage: json['errorMessage'] as String,
      timestamps: (json['timestamps'] as List)
          .whereNotNull()
          .map((e) => TimeInNanos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final timestamps = this.timestamps;
    return {
      'errorCode': errorCode.toValue(),
      'errorMessage': errorMessage,
      'timestamps': timestamps,
    };
  }
}

/// Contains error information for asset property value entries that are
/// associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a>
/// API.
class BatchPutAssetPropertyErrorEntry {
  /// The ID of the failed entry.
  final String entryId;

  /// The list of update property value errors.
  final List<BatchPutAssetPropertyError> errors;

  BatchPutAssetPropertyErrorEntry({
    required this.entryId,
    required this.errors,
  });

  factory BatchPutAssetPropertyErrorEntry.fromJson(Map<String, dynamic> json) {
    return BatchPutAssetPropertyErrorEntry(
      entryId: json['entryId'] as String,
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchPutAssetPropertyError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final errors = this.errors;
    return {
      'entryId': entryId,
      'errors': errors,
    };
  }
}

enum BatchPutAssetPropertyValueErrorCode {
  resourceNotFoundException,
  invalidRequestException,
  internalFailureException,
  serviceUnavailableException,
  throttlingException,
  limitExceededException,
  conflictingOperationException,
  timestampOutOfRangeException,
  accessDeniedException,
}

extension BatchPutAssetPropertyValueErrorCodeValueExtension
    on BatchPutAssetPropertyValueErrorCode {
  String toValue() {
    switch (this) {
      case BatchPutAssetPropertyValueErrorCode.resourceNotFoundException:
        return 'ResourceNotFoundException';
      case BatchPutAssetPropertyValueErrorCode.invalidRequestException:
        return 'InvalidRequestException';
      case BatchPutAssetPropertyValueErrorCode.internalFailureException:
        return 'InternalFailureException';
      case BatchPutAssetPropertyValueErrorCode.serviceUnavailableException:
        return 'ServiceUnavailableException';
      case BatchPutAssetPropertyValueErrorCode.throttlingException:
        return 'ThrottlingException';
      case BatchPutAssetPropertyValueErrorCode.limitExceededException:
        return 'LimitExceededException';
      case BatchPutAssetPropertyValueErrorCode.conflictingOperationException:
        return 'ConflictingOperationException';
      case BatchPutAssetPropertyValueErrorCode.timestampOutOfRangeException:
        return 'TimestampOutOfRangeException';
      case BatchPutAssetPropertyValueErrorCode.accessDeniedException:
        return 'AccessDeniedException';
    }
  }
}

extension BatchPutAssetPropertyValueErrorCodeFromString on String {
  BatchPutAssetPropertyValueErrorCode toBatchPutAssetPropertyValueErrorCode() {
    switch (this) {
      case 'ResourceNotFoundException':
        return BatchPutAssetPropertyValueErrorCode.resourceNotFoundException;
      case 'InvalidRequestException':
        return BatchPutAssetPropertyValueErrorCode.invalidRequestException;
      case 'InternalFailureException':
        return BatchPutAssetPropertyValueErrorCode.internalFailureException;
      case 'ServiceUnavailableException':
        return BatchPutAssetPropertyValueErrorCode.serviceUnavailableException;
      case 'ThrottlingException':
        return BatchPutAssetPropertyValueErrorCode.throttlingException;
      case 'LimitExceededException':
        return BatchPutAssetPropertyValueErrorCode.limitExceededException;
      case 'ConflictingOperationException':
        return BatchPutAssetPropertyValueErrorCode
            .conflictingOperationException;
      case 'TimestampOutOfRangeException':
        return BatchPutAssetPropertyValueErrorCode.timestampOutOfRangeException;
      case 'AccessDeniedException':
        return BatchPutAssetPropertyValueErrorCode.accessDeniedException;
    }
    throw Exception(
        '$this is not known in enum BatchPutAssetPropertyValueErrorCode');
  }
}

class BatchPutAssetPropertyValueResponse {
  /// A list of the errors (if any) associated with the batch put request. Each
  /// error entry contains the <code>entryId</code> of the entry that failed.
  final List<BatchPutAssetPropertyErrorEntry> errorEntries;

  BatchPutAssetPropertyValueResponse({
    required this.errorEntries,
  });

  factory BatchPutAssetPropertyValueResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchPutAssetPropertyValueResponse(
      errorEntries: (json['errorEntries'] as List)
          .whereNotNull()
          .map((e) => BatchPutAssetPropertyErrorEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      'errorEntries': errorEntries,
    };
  }
}

enum CapabilitySyncStatus {
  inSync,
  outOfSync,
  syncFailed,
  unknown,
}

extension CapabilitySyncStatusValueExtension on CapabilitySyncStatus {
  String toValue() {
    switch (this) {
      case CapabilitySyncStatus.inSync:
        return 'IN_SYNC';
      case CapabilitySyncStatus.outOfSync:
        return 'OUT_OF_SYNC';
      case CapabilitySyncStatus.syncFailed:
        return 'SYNC_FAILED';
      case CapabilitySyncStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension CapabilitySyncStatusFromString on String {
  CapabilitySyncStatus toCapabilitySyncStatus() {
    switch (this) {
      case 'IN_SYNC':
        return CapabilitySyncStatus.inSync;
      case 'OUT_OF_SYNC':
        return CapabilitySyncStatus.outOfSync;
      case 'SYNC_FAILED':
        return CapabilitySyncStatus.syncFailed;
      case 'UNKNOWN':
        return CapabilitySyncStatus.unknown;
    }
    throw Exception('$this is not known in enum CapabilitySyncStatus');
  }
}

enum ColumnName {
  alias,
  assetId,
  propertyId,
  dataType,
  timestampSeconds,
  timestampNanoOffset,
  quality,
  value,
}

extension ColumnNameValueExtension on ColumnName {
  String toValue() {
    switch (this) {
      case ColumnName.alias:
        return 'ALIAS';
      case ColumnName.assetId:
        return 'ASSET_ID';
      case ColumnName.propertyId:
        return 'PROPERTY_ID';
      case ColumnName.dataType:
        return 'DATA_TYPE';
      case ColumnName.timestampSeconds:
        return 'TIMESTAMP_SECONDS';
      case ColumnName.timestampNanoOffset:
        return 'TIMESTAMP_NANO_OFFSET';
      case ColumnName.quality:
        return 'QUALITY';
      case ColumnName.value:
        return 'VALUE';
    }
  }
}

extension ColumnNameFromString on String {
  ColumnName toColumnName() {
    switch (this) {
      case 'ALIAS':
        return ColumnName.alias;
      case 'ASSET_ID':
        return ColumnName.assetId;
      case 'PROPERTY_ID':
        return ColumnName.propertyId;
      case 'DATA_TYPE':
        return ColumnName.dataType;
      case 'TIMESTAMP_SECONDS':
        return ColumnName.timestampSeconds;
      case 'TIMESTAMP_NANO_OFFSET':
        return ColumnName.timestampNanoOffset;
      case 'QUALITY':
        return ColumnName.quality;
      case 'VALUE':
        return ColumnName.value;
    }
    throw Exception('$this is not known in enum ColumnName');
  }
}

/// Contains information about a composite model property on an asset.
class CompositeModelProperty {
  final Property assetProperty;

  /// The name of the property.
  final String name;

  /// The type of the composite model that defines this property.
  final String type;

  /// The ID of the composite model that contains the property.
  final String? id;

  CompositeModelProperty({
    required this.assetProperty,
    required this.name,
    required this.type,
    this.id,
  });

  factory CompositeModelProperty.fromJson(Map<String, dynamic> json) {
    return CompositeModelProperty(
      assetProperty:
          Property.fromJson(json['assetProperty'] as Map<String, dynamic>),
      name: json['name'] as String,
      type: json['type'] as String,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetProperty = this.assetProperty;
    final name = this.name;
    final type = this.type;
    final id = this.id;
    return {
      'assetProperty': assetProperty,
      'name': name,
      'type': type,
      if (id != null) 'id': id,
    };
  }
}

enum ComputeLocation {
  edge,
  cloud,
}

extension ComputeLocationValueExtension on ComputeLocation {
  String toValue() {
    switch (this) {
      case ComputeLocation.edge:
        return 'EDGE';
      case ComputeLocation.cloud:
        return 'CLOUD';
    }
  }
}

extension ComputeLocationFromString on String {
  ComputeLocation toComputeLocation() {
    switch (this) {
      case 'EDGE':
        return ComputeLocation.edge;
      case 'CLOUD':
        return ComputeLocation.cloud;
    }
    throw Exception('$this is not known in enum ComputeLocation');
  }
}

/// Contains the details of an IoT SiteWise configuration error.
class ConfigurationErrorDetails {
  /// The error code.
  final ErrorCode code;

  /// The error message.
  final String message;

  ConfigurationErrorDetails({
    required this.code,
    required this.message,
  });

  factory ConfigurationErrorDetails.fromJson(Map<String, dynamic> json) {
    return ConfigurationErrorDetails(
      code: (json['code'] as String).toErrorCode(),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code.toValue(),
      'message': message,
    };
  }
}

enum ConfigurationState {
  active,
  updateInProgress,
  updateFailed,
}

extension ConfigurationStateValueExtension on ConfigurationState {
  String toValue() {
    switch (this) {
      case ConfigurationState.active:
        return 'ACTIVE';
      case ConfigurationState.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case ConfigurationState.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension ConfigurationStateFromString on String {
  ConfigurationState toConfigurationState() {
    switch (this) {
      case 'ACTIVE':
        return ConfigurationState.active;
      case 'UPDATE_IN_PROGRESS':
        return ConfigurationState.updateInProgress;
      case 'UPDATE_FAILED':
        return ConfigurationState.updateFailed;
    }
    throw Exception('$this is not known in enum ConfigurationState');
  }
}

/// Contains current status information for the configuration.
class ConfigurationStatus {
  /// The current state of the configuration.
  final ConfigurationState state;

  /// Contains associated error information, if any.
  final ConfigurationErrorDetails? error;

  ConfigurationStatus({
    required this.state,
    this.error,
  });

  factory ConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return ConfigurationStatus(
      state: (json['state'] as String).toConfigurationState(),
      error: json['error'] != null
          ? ConfigurationErrorDetails.fromJson(
              json['error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final error = this.error;
    return {
      'state': state.toValue(),
      if (error != null) 'error': error,
    };
  }
}

class CreateAccessPolicyResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the access policy, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}</code>
  final String accessPolicyArn;

  /// The ID of the access policy.
  final String accessPolicyId;

  CreateAccessPolicyResponse({
    required this.accessPolicyArn,
    required this.accessPolicyId,
  });

  factory CreateAccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessPolicyResponse(
      accessPolicyArn: json['accessPolicyArn'] as String,
      accessPolicyId: json['accessPolicyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicyArn = this.accessPolicyArn;
    final accessPolicyId = this.accessPolicyId;
    return {
      'accessPolicyArn': accessPolicyArn,
      'accessPolicyId': accessPolicyId,
    };
  }
}

class CreateAssetModelResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  final String assetModelArn;

  /// The ID of the asset model. You can use this ID when you call other IoT
  /// SiteWise APIs.
  final String assetModelId;

  /// The status of the asset model, which contains a state (<code>CREATING</code>
  /// after successfully calling this operation) and any error message.
  final AssetModelStatus assetModelStatus;

  CreateAssetModelResponse({
    required this.assetModelArn,
    required this.assetModelId,
    required this.assetModelStatus,
  });

  factory CreateAssetModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssetModelResponse(
      assetModelArn: json['assetModelArn'] as String,
      assetModelId: json['assetModelId'] as String,
      assetModelStatus: AssetModelStatus.fromJson(
          json['assetModelStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final assetModelArn = this.assetModelArn;
    final assetModelId = this.assetModelId;
    final assetModelStatus = this.assetModelStatus;
    return {
      'assetModelArn': assetModelArn,
      'assetModelId': assetModelId,
      'assetModelStatus': assetModelStatus,
    };
  }
}

class CreateAssetResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  final String assetArn;

  /// The ID of the asset. This ID uniquely identifies the asset within IoT
  /// SiteWise and can be used with other IoT SiteWise APIs.
  final String assetId;

  /// The status of the asset, which contains a state (<code>CREATING</code> after
  /// successfully calling this operation) and any error message.
  final AssetStatus assetStatus;

  CreateAssetResponse({
    required this.assetArn,
    required this.assetId,
    required this.assetStatus,
  });

  factory CreateAssetResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssetResponse(
      assetArn: json['assetArn'] as String,
      assetId: json['assetId'] as String,
      assetStatus:
          AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final assetArn = this.assetArn;
    final assetId = this.assetId;
    final assetStatus = this.assetStatus;
    return {
      'assetArn': assetArn,
      'assetId': assetId,
      'assetStatus': assetStatus,
    };
  }
}

class CreateBulkImportJobResponse {
  /// The ID of the job.
  final String jobId;

  /// The unique name that helps identify the job request.
  final String jobName;

  /// The status of the bulk import job can be one of following values.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – IoT SiteWise is waiting for the current bulk import
  /// job to finish.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – The bulk import job has been canceled.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> – IoT SiteWise is processing your request to import
  /// your data from Amazon S3.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> – IoT SiteWise successfully completed your request to
  /// import data from Amazon S3.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – IoT SiteWise couldn't process your request to import
  /// data from Amazon S3. You can use logs saved in the specified error report
  /// location in Amazon S3 to troubleshoot issues.
  /// </li>
  /// <li>
  /// <code>COMPLETED_WITH_FAILURES</code> – IoT SiteWise completed your request
  /// to import data from Amazon S3 with errors. You can use logs saved in the
  /// specified error report location in Amazon S3 to troubleshoot issues.
  /// </li>
  /// </ul>
  final JobStatus jobStatus;

  CreateBulkImportJobResponse({
    required this.jobId,
    required this.jobName,
    required this.jobStatus,
  });

  factory CreateBulkImportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateBulkImportJobResponse(
      jobId: json['jobId'] as String,
      jobName: json['jobName'] as String,
      jobStatus: (json['jobStatus'] as String).toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    return {
      'jobId': jobId,
      'jobName': jobName,
      'jobStatus': jobStatus.toValue(),
    };
  }
}

class CreateDashboardResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the dashboard, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}</code>
  final String dashboardArn;

  /// The ID of the dashboard.
  final String dashboardId;

  CreateDashboardResponse({
    required this.dashboardArn,
    required this.dashboardId,
  });

  factory CreateDashboardResponse.fromJson(Map<String, dynamic> json) {
    return CreateDashboardResponse(
      dashboardArn: json['dashboardArn'] as String,
      dashboardId: json['dashboardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final dashboardId = this.dashboardId;
    return {
      'dashboardArn': dashboardArn,
      'dashboardId': dashboardId,
    };
  }
}

class CreateGatewayResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the gateway, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}</code>
  final String gatewayArn;

  /// The ID of the gateway device. You can use this ID when you call other IoT
  /// SiteWise APIs.
  final String gatewayId;

  CreateGatewayResponse({
    required this.gatewayArn,
    required this.gatewayId,
  });

  factory CreateGatewayResponse.fromJson(Map<String, dynamic> json) {
    return CreateGatewayResponse(
      gatewayArn: json['gatewayArn'] as String,
      gatewayId: json['gatewayId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    final gatewayId = this.gatewayId;
    return {
      'gatewayArn': gatewayArn,
      'gatewayId': gatewayId,
    };
  }
}

class CreatePortalResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the portal, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}</code>
  final String portalArn;

  /// The ID of the created portal.
  final String portalId;

  /// The URL for the IoT SiteWise Monitor portal. You can use this URL to access
  /// portals that use IAM Identity Center for authentication. For portals that
  /// use IAM for authentication, you must use the IoT SiteWise console to get a
  /// URL that you can use to access the portal.
  final String portalStartUrl;

  /// The status of the portal, which contains a state (<code>CREATING</code>
  /// after successfully calling this operation) and any error message.
  final PortalStatus portalStatus;

  /// The associated IAM Identity Center application ID, if the portal uses IAM
  /// Identity Center.
  final String ssoApplicationId;

  CreatePortalResponse({
    required this.portalArn,
    required this.portalId,
    required this.portalStartUrl,
    required this.portalStatus,
    required this.ssoApplicationId,
  });

  factory CreatePortalResponse.fromJson(Map<String, dynamic> json) {
    return CreatePortalResponse(
      portalArn: json['portalArn'] as String,
      portalId: json['portalId'] as String,
      portalStartUrl: json['portalStartUrl'] as String,
      portalStatus:
          PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
      ssoApplicationId: json['ssoApplicationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final portalId = this.portalId;
    final portalStartUrl = this.portalStartUrl;
    final portalStatus = this.portalStatus;
    final ssoApplicationId = this.ssoApplicationId;
    return {
      'portalArn': portalArn,
      'portalId': portalId,
      'portalStartUrl': portalStartUrl,
      'portalStatus': portalStatus,
      'ssoApplicationId': ssoApplicationId,
    };
  }
}

class CreateProjectResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the project, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}</code>
  final String projectArn;

  /// The ID of the project.
  final String projectId;

  CreateProjectResponse({
    required this.projectArn,
    required this.projectId,
  });

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) {
    return CreateProjectResponse(
      projectArn: json['projectArn'] as String,
      projectId: json['projectId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    final projectId = this.projectId;
    return {
      'projectArn': projectArn,
      'projectId': projectId,
    };
  }
}

/// A .csv file.
class Csv {
  /// The column names specified in the .csv file.
  final List<ColumnName>? columnNames;

  Csv({
    this.columnNames,
  });

  factory Csv.fromJson(Map<String, dynamic> json) {
    return Csv(
      columnNames: (json['columnNames'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toColumnName())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnNames = this.columnNames;
    return {
      if (columnNames != null)
        'columnNames': columnNames.map((e) => e.toValue()).toList(),
    };
  }
}

/// Contains information about a customer managed Amazon S3 bucket.
class CustomerManagedS3Storage {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the Identity and Access Management role that allows IoT SiteWise to send
  /// data to Amazon S3.
  final String roleArn;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the Amazon S3 object. For more information about how to find the ARN for
  /// an Amazon S3 object, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-arn-format.html">Amazon
  /// S3 resources</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  final String s3ResourceArn;

  CustomerManagedS3Storage({
    required this.roleArn,
    required this.s3ResourceArn,
  });

  factory CustomerManagedS3Storage.fromJson(Map<String, dynamic> json) {
    return CustomerManagedS3Storage(
      roleArn: json['roleArn'] as String,
      s3ResourceArn: json['s3ResourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final s3ResourceArn = this.s3ResourceArn;
    return {
      'roleArn': roleArn,
      's3ResourceArn': s3ResourceArn,
    };
  }
}

/// Contains a dashboard summary.
class DashboardSummary {
  /// The ID of the dashboard.
  final String id;

  /// The name of the dashboard
  final String name;

  /// The date the dashboard was created, in Unix epoch time.
  final DateTime? creationDate;

  /// The dashboard's description.
  final String? description;

  /// The date the dashboard was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  DashboardSummary({
    required this.id,
    required this.name,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
  });

  factory DashboardSummary.fromJson(Map<String, dynamic> json) {
    return DashboardSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final creationDate = this.creationDate;
    final description = this.description;
    final lastUpdateDate = this.lastUpdateDate;
    return {
      'id': id,
      'name': name,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (description != null) 'description': description,
      if (lastUpdateDate != null)
        'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
    };
  }
}

class DeleteAccessPolicyResponse {
  DeleteAccessPolicyResponse();

  factory DeleteAccessPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccessPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAssetModelResponse {
  /// The status of the asset model, which contains a state (<code>DELETING</code>
  /// after successfully calling this operation) and any error message.
  final AssetModelStatus assetModelStatus;

  DeleteAssetModelResponse({
    required this.assetModelStatus,
  });

  factory DeleteAssetModelResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAssetModelResponse(
      assetModelStatus: AssetModelStatus.fromJson(
          json['assetModelStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final assetModelStatus = this.assetModelStatus;
    return {
      'assetModelStatus': assetModelStatus,
    };
  }
}

class DeleteAssetResponse {
  /// The status of the asset, which contains a state (<code>DELETING</code> after
  /// successfully calling this operation) and any error message.
  final AssetStatus assetStatus;

  DeleteAssetResponse({
    required this.assetStatus,
  });

  factory DeleteAssetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAssetResponse(
      assetStatus:
          AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final assetStatus = this.assetStatus;
    return {
      'assetStatus': assetStatus,
    };
  }
}

class DeleteDashboardResponse {
  DeleteDashboardResponse();

  factory DeleteDashboardResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDashboardResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePortalResponse {
  /// The status of the portal, which contains a state (<code>DELETING</code>
  /// after successfully calling this operation) and any error message.
  final PortalStatus portalStatus;

  DeletePortalResponse({
    required this.portalStatus,
  });

  factory DeletePortalResponse.fromJson(Map<String, dynamic> json) {
    return DeletePortalResponse(
      portalStatus:
          PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final portalStatus = this.portalStatus;
    return {
      'portalStatus': portalStatus,
    };
  }
}

class DeleteProjectResponse {
  DeleteProjectResponse();

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAccessPolicyResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the access policy, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}</code>
  final String accessPolicyArn;

  /// The date the access policy was created, in Unix epoch time.
  final DateTime accessPolicyCreationDate;

  /// The ID of the access policy.
  final String accessPolicyId;

  /// The identity (IAM Identity Center user, IAM Identity Center group, or IAM
  /// user) to which this access policy applies.
  final Identity accessPolicyIdentity;

  /// The date the access policy was last updated, in Unix epoch time.
  final DateTime accessPolicyLastUpdateDate;

  /// The access policy permission. Note that a project <code>ADMINISTRATOR</code>
  /// is also known as a project owner.
  final Permission accessPolicyPermission;

  /// The IoT SiteWise Monitor resource (portal or project) to which this access
  /// policy provides access.
  final Resource accessPolicyResource;

  DescribeAccessPolicyResponse({
    required this.accessPolicyArn,
    required this.accessPolicyCreationDate,
    required this.accessPolicyId,
    required this.accessPolicyIdentity,
    required this.accessPolicyLastUpdateDate,
    required this.accessPolicyPermission,
    required this.accessPolicyResource,
  });

  factory DescribeAccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccessPolicyResponse(
      accessPolicyArn: json['accessPolicyArn'] as String,
      accessPolicyCreationDate: nonNullableTimeStampFromJson(
          json['accessPolicyCreationDate'] as Object),
      accessPolicyId: json['accessPolicyId'] as String,
      accessPolicyIdentity: Identity.fromJson(
          json['accessPolicyIdentity'] as Map<String, dynamic>),
      accessPolicyLastUpdateDate: nonNullableTimeStampFromJson(
          json['accessPolicyLastUpdateDate'] as Object),
      accessPolicyPermission:
          (json['accessPolicyPermission'] as String).toPermission(),
      accessPolicyResource: Resource.fromJson(
          json['accessPolicyResource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicyArn = this.accessPolicyArn;
    final accessPolicyCreationDate = this.accessPolicyCreationDate;
    final accessPolicyId = this.accessPolicyId;
    final accessPolicyIdentity = this.accessPolicyIdentity;
    final accessPolicyLastUpdateDate = this.accessPolicyLastUpdateDate;
    final accessPolicyPermission = this.accessPolicyPermission;
    final accessPolicyResource = this.accessPolicyResource;
    return {
      'accessPolicyArn': accessPolicyArn,
      'accessPolicyCreationDate': unixTimestampToJson(accessPolicyCreationDate),
      'accessPolicyId': accessPolicyId,
      'accessPolicyIdentity': accessPolicyIdentity,
      'accessPolicyLastUpdateDate':
          unixTimestampToJson(accessPolicyLastUpdateDate),
      'accessPolicyPermission': accessPolicyPermission.toValue(),
      'accessPolicyResource': accessPolicyResource,
    };
  }
}

class DescribeAssetModelResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  final String assetModelArn;

  /// The date the asset model was created, in Unix epoch time.
  final DateTime assetModelCreationDate;

  /// The asset model's description.
  final String assetModelDescription;

  /// A list of asset model hierarchies that each contain a
  /// <code>childAssetModelId</code> and a <code>hierarchyId</code> (named
  /// <code>id</code>). A hierarchy specifies allowed parent/child asset
  /// relationships for an asset model.
  final List<AssetModelHierarchy> assetModelHierarchies;

  /// The ID of the asset model.
  final String assetModelId;

  /// The date the asset model was last updated, in Unix epoch time.
  final DateTime assetModelLastUpdateDate;

  /// The name of the asset model.
  final String assetModelName;

  /// The list of asset properties for the asset model.
  ///
  /// This object doesn't include properties that you define in composite models.
  /// You can find composite model properties in the
  /// <code>assetModelCompositeModels</code> object.
  final List<AssetModelProperty> assetModelProperties;

  /// The current status of the asset model, which contains a state and any error
  /// message.
  final AssetModelStatus assetModelStatus;

  /// The list of composite asset models for the asset model.
  final List<AssetModelCompositeModel>? assetModelCompositeModels;

  DescribeAssetModelResponse({
    required this.assetModelArn,
    required this.assetModelCreationDate,
    required this.assetModelDescription,
    required this.assetModelHierarchies,
    required this.assetModelId,
    required this.assetModelLastUpdateDate,
    required this.assetModelName,
    required this.assetModelProperties,
    required this.assetModelStatus,
    this.assetModelCompositeModels,
  });

  factory DescribeAssetModelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAssetModelResponse(
      assetModelArn: json['assetModelArn'] as String,
      assetModelCreationDate: nonNullableTimeStampFromJson(
          json['assetModelCreationDate'] as Object),
      assetModelDescription: json['assetModelDescription'] as String,
      assetModelHierarchies: (json['assetModelHierarchies'] as List)
          .whereNotNull()
          .map((e) => AssetModelHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetModelId: json['assetModelId'] as String,
      assetModelLastUpdateDate: nonNullableTimeStampFromJson(
          json['assetModelLastUpdateDate'] as Object),
      assetModelName: json['assetModelName'] as String,
      assetModelProperties: (json['assetModelProperties'] as List)
          .whereNotNull()
          .map((e) => AssetModelProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetModelStatus: AssetModelStatus.fromJson(
          json['assetModelStatus'] as Map<String, dynamic>),
      assetModelCompositeModels: (json['assetModelCompositeModels'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AssetModelCompositeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final assetModelArn = this.assetModelArn;
    final assetModelCreationDate = this.assetModelCreationDate;
    final assetModelDescription = this.assetModelDescription;
    final assetModelHierarchies = this.assetModelHierarchies;
    final assetModelId = this.assetModelId;
    final assetModelLastUpdateDate = this.assetModelLastUpdateDate;
    final assetModelName = this.assetModelName;
    final assetModelProperties = this.assetModelProperties;
    final assetModelStatus = this.assetModelStatus;
    final assetModelCompositeModels = this.assetModelCompositeModels;
    return {
      'assetModelArn': assetModelArn,
      'assetModelCreationDate': unixTimestampToJson(assetModelCreationDate),
      'assetModelDescription': assetModelDescription,
      'assetModelHierarchies': assetModelHierarchies,
      'assetModelId': assetModelId,
      'assetModelLastUpdateDate': unixTimestampToJson(assetModelLastUpdateDate),
      'assetModelName': assetModelName,
      'assetModelProperties': assetModelProperties,
      'assetModelStatus': assetModelStatus,
      if (assetModelCompositeModels != null)
        'assetModelCompositeModels': assetModelCompositeModels,
    };
  }
}

class DescribeAssetPropertyResponse {
  /// The ID of the asset.
  final String assetId;

  /// The ID of the asset model.
  final String assetModelId;

  /// The name of the asset.
  final String assetName;

  /// The asset property's definition, alias, and notification state.
  ///
  /// This response includes this object for normal asset properties. If you
  /// describe an asset property in a composite model, this response includes the
  /// asset property information in <code>compositeModel</code>.
  final Property? assetProperty;

  /// The composite asset model that declares this asset property, if this asset
  /// property exists in a composite model.
  final CompositeModelProperty? compositeModel;

  DescribeAssetPropertyResponse({
    required this.assetId,
    required this.assetModelId,
    required this.assetName,
    this.assetProperty,
    this.compositeModel,
  });

  factory DescribeAssetPropertyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAssetPropertyResponse(
      assetId: json['assetId'] as String,
      assetModelId: json['assetModelId'] as String,
      assetName: json['assetName'] as String,
      assetProperty: json['assetProperty'] != null
          ? Property.fromJson(json['assetProperty'] as Map<String, dynamic>)
          : null,
      compositeModel: json['compositeModel'] != null
          ? CompositeModelProperty.fromJson(
              json['compositeModel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final assetModelId = this.assetModelId;
    final assetName = this.assetName;
    final assetProperty = this.assetProperty;
    final compositeModel = this.compositeModel;
    return {
      'assetId': assetId,
      'assetModelId': assetModelId,
      'assetName': assetName,
      if (assetProperty != null) 'assetProperty': assetProperty,
      if (compositeModel != null) 'compositeModel': compositeModel,
    };
  }
}

class DescribeAssetResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  final String assetArn;

  /// The date the asset was created, in Unix epoch time.
  final DateTime assetCreationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  final List<AssetHierarchy> assetHierarchies;

  /// The ID of the asset.
  final String assetId;

  /// The date the asset was last updated, in Unix epoch time.
  final DateTime assetLastUpdateDate;

  /// The ID of the asset model that was used to create the asset.
  final String assetModelId;

  /// The name of the asset.
  final String assetName;

  /// The list of asset properties for the asset.
  ///
  /// This object doesn't include properties that you define in composite models.
  /// You can find composite model properties in the
  /// <code>assetCompositeModels</code> object.
  final List<AssetProperty> assetProperties;

  /// The current status of the asset, which contains a state and any error
  /// message.
  final AssetStatus assetStatus;

  /// The composite models for the asset.
  final List<AssetCompositeModel>? assetCompositeModels;

  /// A description for the asset.
  final String? assetDescription;

  DescribeAssetResponse({
    required this.assetArn,
    required this.assetCreationDate,
    required this.assetHierarchies,
    required this.assetId,
    required this.assetLastUpdateDate,
    required this.assetModelId,
    required this.assetName,
    required this.assetProperties,
    required this.assetStatus,
    this.assetCompositeModels,
    this.assetDescription,
  });

  factory DescribeAssetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAssetResponse(
      assetArn: json['assetArn'] as String,
      assetCreationDate:
          nonNullableTimeStampFromJson(json['assetCreationDate'] as Object),
      assetHierarchies: (json['assetHierarchies'] as List)
          .whereNotNull()
          .map((e) => AssetHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetId: json['assetId'] as String,
      assetLastUpdateDate:
          nonNullableTimeStampFromJson(json['assetLastUpdateDate'] as Object),
      assetModelId: json['assetModelId'] as String,
      assetName: json['assetName'] as String,
      assetProperties: (json['assetProperties'] as List)
          .whereNotNull()
          .map((e) => AssetProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetStatus:
          AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
      assetCompositeModels: (json['assetCompositeModels'] as List?)
          ?.whereNotNull()
          .map((e) => AssetCompositeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetDescription: json['assetDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetArn = this.assetArn;
    final assetCreationDate = this.assetCreationDate;
    final assetHierarchies = this.assetHierarchies;
    final assetId = this.assetId;
    final assetLastUpdateDate = this.assetLastUpdateDate;
    final assetModelId = this.assetModelId;
    final assetName = this.assetName;
    final assetProperties = this.assetProperties;
    final assetStatus = this.assetStatus;
    final assetCompositeModels = this.assetCompositeModels;
    final assetDescription = this.assetDescription;
    return {
      'assetArn': assetArn,
      'assetCreationDate': unixTimestampToJson(assetCreationDate),
      'assetHierarchies': assetHierarchies,
      'assetId': assetId,
      'assetLastUpdateDate': unixTimestampToJson(assetLastUpdateDate),
      'assetModelId': assetModelId,
      'assetName': assetName,
      'assetProperties': assetProperties,
      'assetStatus': assetStatus,
      if (assetCompositeModels != null)
        'assetCompositeModels': assetCompositeModels,
      if (assetDescription != null) 'assetDescription': assetDescription,
    };
  }
}

class DescribeBulkImportJobResponse {
  /// The Amazon S3 destination where errors associated with the job creation
  /// request are saved.
  final ErrorReportLocation errorReportLocation;

  /// The files in the specified Amazon S3 bucket that contain your data.
  final List<File> files;

  /// Contains the configuration information of a job, such as the file format
  /// used to save data in Amazon S3.
  final JobConfiguration jobConfiguration;

  /// The date the job was created, in Unix epoch TIME.
  final DateTime jobCreationDate;

  /// The ID of the job.
  final String jobId;

  /// The date the job was last updated, in Unix epoch time.
  final DateTime jobLastUpdateDate;

  /// The unique name that helps identify the job request.
  final String jobName;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the IAM role that allows IoT SiteWise to read Amazon S3 data.
  final String jobRoleArn;

  /// The status of the bulk import job can be one of following values.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – IoT SiteWise is waiting for the current bulk import
  /// job to finish.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – The bulk import job has been canceled.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> – IoT SiteWise is processing your request to import
  /// your data from Amazon S3.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> – IoT SiteWise successfully completed your request to
  /// import data from Amazon S3.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – IoT SiteWise couldn't process your request to import
  /// data from Amazon S3. You can use logs saved in the specified error report
  /// location in Amazon S3 to troubleshoot issues.
  /// </li>
  /// <li>
  /// <code>COMPLETED_WITH_FAILURES</code> – IoT SiteWise completed your request
  /// to import data from Amazon S3 with errors. You can use logs saved in the
  /// specified error report location in Amazon S3 to troubleshoot issues.
  /// </li>
  /// </ul>
  final JobStatus jobStatus;

  DescribeBulkImportJobResponse({
    required this.errorReportLocation,
    required this.files,
    required this.jobConfiguration,
    required this.jobCreationDate,
    required this.jobId,
    required this.jobLastUpdateDate,
    required this.jobName,
    required this.jobRoleArn,
    required this.jobStatus,
  });

  factory DescribeBulkImportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBulkImportJobResponse(
      errorReportLocation: ErrorReportLocation.fromJson(
          json['errorReportLocation'] as Map<String, dynamic>),
      files: (json['files'] as List)
          .whereNotNull()
          .map((e) => File.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobConfiguration: JobConfiguration.fromJson(
          json['jobConfiguration'] as Map<String, dynamic>),
      jobCreationDate:
          nonNullableTimeStampFromJson(json['jobCreationDate'] as Object),
      jobId: json['jobId'] as String,
      jobLastUpdateDate:
          nonNullableTimeStampFromJson(json['jobLastUpdateDate'] as Object),
      jobName: json['jobName'] as String,
      jobRoleArn: json['jobRoleArn'] as String,
      jobStatus: (json['jobStatus'] as String).toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorReportLocation = this.errorReportLocation;
    final files = this.files;
    final jobConfiguration = this.jobConfiguration;
    final jobCreationDate = this.jobCreationDate;
    final jobId = this.jobId;
    final jobLastUpdateDate = this.jobLastUpdateDate;
    final jobName = this.jobName;
    final jobRoleArn = this.jobRoleArn;
    final jobStatus = this.jobStatus;
    return {
      'errorReportLocation': errorReportLocation,
      'files': files,
      'jobConfiguration': jobConfiguration,
      'jobCreationDate': unixTimestampToJson(jobCreationDate),
      'jobId': jobId,
      'jobLastUpdateDate': unixTimestampToJson(jobLastUpdateDate),
      'jobName': jobName,
      'jobRoleArn': jobRoleArn,
      'jobStatus': jobStatus.toValue(),
    };
  }
}

class DescribeDashboardResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the dashboard, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}</code>
  final String dashboardArn;

  /// The date the dashboard was created, in Unix epoch time.
  final DateTime dashboardCreationDate;

  /// The dashboard's definition JSON literal. For detailed information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating
  /// dashboards (CLI)</a> in the <i>IoT SiteWise User Guide</i>.
  final String dashboardDefinition;

  /// The ID of the dashboard.
  final String dashboardId;

  /// The date the dashboard was last updated, in Unix epoch time.
  final DateTime dashboardLastUpdateDate;

  /// The name of the dashboard.
  final String dashboardName;

  /// The ID of the project that the dashboard is in.
  final String projectId;

  /// The dashboard's description.
  final String? dashboardDescription;

  DescribeDashboardResponse({
    required this.dashboardArn,
    required this.dashboardCreationDate,
    required this.dashboardDefinition,
    required this.dashboardId,
    required this.dashboardLastUpdateDate,
    required this.dashboardName,
    required this.projectId,
    this.dashboardDescription,
  });

  factory DescribeDashboardResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDashboardResponse(
      dashboardArn: json['dashboardArn'] as String,
      dashboardCreationDate:
          nonNullableTimeStampFromJson(json['dashboardCreationDate'] as Object),
      dashboardDefinition: json['dashboardDefinition'] as String,
      dashboardId: json['dashboardId'] as String,
      dashboardLastUpdateDate: nonNullableTimeStampFromJson(
          json['dashboardLastUpdateDate'] as Object),
      dashboardName: json['dashboardName'] as String,
      projectId: json['projectId'] as String,
      dashboardDescription: json['dashboardDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final dashboardCreationDate = this.dashboardCreationDate;
    final dashboardDefinition = this.dashboardDefinition;
    final dashboardId = this.dashboardId;
    final dashboardLastUpdateDate = this.dashboardLastUpdateDate;
    final dashboardName = this.dashboardName;
    final projectId = this.projectId;
    final dashboardDescription = this.dashboardDescription;
    return {
      'dashboardArn': dashboardArn,
      'dashboardCreationDate': unixTimestampToJson(dashboardCreationDate),
      'dashboardDefinition': dashboardDefinition,
      'dashboardId': dashboardId,
      'dashboardLastUpdateDate': unixTimestampToJson(dashboardLastUpdateDate),
      'dashboardName': dashboardName,
      'projectId': projectId,
      if (dashboardDescription != null)
        'dashboardDescription': dashboardDescription,
    };
  }
}

class DescribeDefaultEncryptionConfigurationResponse {
  /// The status of the account configuration. This contains the
  /// <code>ConfigurationState</code>. If there's an error, it also contains the
  /// <code>ErrorDetails</code>.
  final ConfigurationStatus configurationStatus;

  /// The type of encryption used for the encryption configuration.
  final EncryptionType encryptionType;

  /// The key ARN of the customer managed key used for KMS encryption if you use
  /// <code>KMS_BASED_ENCRYPTION</code>.
  final String? kmsKeyArn;

  DescribeDefaultEncryptionConfigurationResponse({
    required this.configurationStatus,
    required this.encryptionType,
    this.kmsKeyArn,
  });

  factory DescribeDefaultEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDefaultEncryptionConfigurationResponse(
      configurationStatus: ConfigurationStatus.fromJson(
          json['configurationStatus'] as Map<String, dynamic>),
      encryptionType: (json['encryptionType'] as String).toEncryptionType(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationStatus = this.configurationStatus;
    final encryptionType = this.encryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'configurationStatus': configurationStatus,
      'encryptionType': encryptionType.toValue(),
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

class DescribeGatewayCapabilityConfigurationResponse {
  /// The JSON document that defines the gateway capability's configuration. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/configure-sources.html#configure-source-cli">Configuring
  /// data sources (CLI)</a> in the <i>IoT SiteWise User Guide</i>.
  final String capabilityConfiguration;

  /// The namespace of the gateway capability.
  final String capabilityNamespace;

  /// The synchronization status of the capability configuration. The sync status
  /// can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_SYNC</code> – The gateway is running the capability configuration.
  /// </li>
  /// <li>
  /// <code>OUT_OF_SYNC</code> – The gateway hasn't received the capability
  /// configuration.
  /// </li>
  /// <li>
  /// <code>SYNC_FAILED</code> – The gateway rejected the capability
  /// configuration.
  /// </li>
  /// </ul>
  final CapabilitySyncStatus capabilitySyncStatus;

  /// The ID of the gateway that defines the capability configuration.
  final String gatewayId;

  DescribeGatewayCapabilityConfigurationResponse({
    required this.capabilityConfiguration,
    required this.capabilityNamespace,
    required this.capabilitySyncStatus,
    required this.gatewayId,
  });

  factory DescribeGatewayCapabilityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeGatewayCapabilityConfigurationResponse(
      capabilityConfiguration: json['capabilityConfiguration'] as String,
      capabilityNamespace: json['capabilityNamespace'] as String,
      capabilitySyncStatus:
          (json['capabilitySyncStatus'] as String).toCapabilitySyncStatus(),
      gatewayId: json['gatewayId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final capabilityConfiguration = this.capabilityConfiguration;
    final capabilityNamespace = this.capabilityNamespace;
    final capabilitySyncStatus = this.capabilitySyncStatus;
    final gatewayId = this.gatewayId;
    return {
      'capabilityConfiguration': capabilityConfiguration,
      'capabilityNamespace': capabilityNamespace,
      'capabilitySyncStatus': capabilitySyncStatus.toValue(),
      'gatewayId': gatewayId,
    };
  }
}

class DescribeGatewayResponse {
  /// The date the gateway was created, in Unix epoch time.
  final DateTime creationDate;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the gateway, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}</code>
  final String gatewayArn;

  /// A list of gateway capability summaries that each contain a namespace and
  /// status. Each gateway capability defines data sources for the gateway. To
  /// retrieve a capability configuration's definition, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.
  final List<GatewayCapabilitySummary> gatewayCapabilitySummaries;

  /// The ID of the gateway device.
  final String gatewayId;

  /// The name of the gateway.
  final String gatewayName;

  /// The date the gateway was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// The gateway's platform.
  final GatewayPlatform? gatewayPlatform;

  DescribeGatewayResponse({
    required this.creationDate,
    required this.gatewayArn,
    required this.gatewayCapabilitySummaries,
    required this.gatewayId,
    required this.gatewayName,
    required this.lastUpdateDate,
    this.gatewayPlatform,
  });

  factory DescribeGatewayResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGatewayResponse(
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      gatewayArn: json['gatewayArn'] as String,
      gatewayCapabilitySummaries: (json['gatewayCapabilitySummaries'] as List)
          .whereNotNull()
          .map((e) =>
              GatewayCapabilitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayId: json['gatewayId'] as String,
      gatewayName: json['gatewayName'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      gatewayPlatform: json['gatewayPlatform'] != null
          ? GatewayPlatform.fromJson(
              json['gatewayPlatform'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final gatewayArn = this.gatewayArn;
    final gatewayCapabilitySummaries = this.gatewayCapabilitySummaries;
    final gatewayId = this.gatewayId;
    final gatewayName = this.gatewayName;
    final lastUpdateDate = this.lastUpdateDate;
    final gatewayPlatform = this.gatewayPlatform;
    return {
      'creationDate': unixTimestampToJson(creationDate),
      'gatewayArn': gatewayArn,
      'gatewayCapabilitySummaries': gatewayCapabilitySummaries,
      'gatewayId': gatewayId,
      'gatewayName': gatewayName,
      'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
      if (gatewayPlatform != null) 'gatewayPlatform': gatewayPlatform,
    };
  }
}

class DescribeLoggingOptionsResponse {
  /// The current logging options.
  final LoggingOptions loggingOptions;

  DescribeLoggingOptionsResponse({
    required this.loggingOptions,
  });

  factory DescribeLoggingOptionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLoggingOptionsResponse(
      loggingOptions: LoggingOptions.fromJson(
          json['loggingOptions'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final loggingOptions = this.loggingOptions;
    return {
      'loggingOptions': loggingOptions,
    };
  }
}

class DescribePortalResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the portal, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}</code>
  final String portalArn;

  /// The IAM Identity Center application generated client ID (used with IAM
  /// Identity Center APIs). IoT SiteWise includes <code>portalClientId</code> for
  /// only portals that use IAM Identity Center to authenticate users.
  final String portalClientId;

  /// The Amazon Web Services administrator's contact email address.
  final String portalContactEmail;

  /// The date the portal was created, in Unix epoch time.
  final DateTime portalCreationDate;

  /// The ID of the portal.
  final String portalId;

  /// The date the portal was last updated, in Unix epoch time.
  final DateTime portalLastUpdateDate;

  /// The name of the portal.
  final String portalName;

  /// The URL for the IoT SiteWise Monitor portal. You can use this URL to access
  /// portals that use IAM Identity Center for authentication. For portals that
  /// use IAM for authentication, you must use the IoT SiteWise console to get a
  /// URL that you can use to access the portal.
  final String portalStartUrl;

  /// The current status of the portal, which contains a state and any error
  /// message.
  final PortalStatus portalStatus;

  /// Contains the configuration information of an alarm created in an IoT
  /// SiteWise Monitor portal.
  final Alarms? alarms;

  /// The email address that sends alarm notifications.
  final String? notificationSenderEmail;

  /// The service to use to authenticate users to the portal.
  final AuthMode? portalAuthMode;

  /// The portal's description.
  final String? portalDescription;

  /// The portal's logo image, which is available at a URL.
  final ImageLocation? portalLogoImageLocation;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the service role that allows the portal's users to access your IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for IoT SiteWise Monitor</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? roleArn;

  DescribePortalResponse({
    required this.portalArn,
    required this.portalClientId,
    required this.portalContactEmail,
    required this.portalCreationDate,
    required this.portalId,
    required this.portalLastUpdateDate,
    required this.portalName,
    required this.portalStartUrl,
    required this.portalStatus,
    this.alarms,
    this.notificationSenderEmail,
    this.portalAuthMode,
    this.portalDescription,
    this.portalLogoImageLocation,
    this.roleArn,
  });

  factory DescribePortalResponse.fromJson(Map<String, dynamic> json) {
    return DescribePortalResponse(
      portalArn: json['portalArn'] as String,
      portalClientId: json['portalClientId'] as String,
      portalContactEmail: json['portalContactEmail'] as String,
      portalCreationDate:
          nonNullableTimeStampFromJson(json['portalCreationDate'] as Object),
      portalId: json['portalId'] as String,
      portalLastUpdateDate:
          nonNullableTimeStampFromJson(json['portalLastUpdateDate'] as Object),
      portalName: json['portalName'] as String,
      portalStartUrl: json['portalStartUrl'] as String,
      portalStatus:
          PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
      alarms: json['alarms'] != null
          ? Alarms.fromJson(json['alarms'] as Map<String, dynamic>)
          : null,
      notificationSenderEmail: json['notificationSenderEmail'] as String?,
      portalAuthMode: (json['portalAuthMode'] as String?)?.toAuthMode(),
      portalDescription: json['portalDescription'] as String?,
      portalLogoImageLocation: json['portalLogoImageLocation'] != null
          ? ImageLocation.fromJson(
              json['portalLogoImageLocation'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final portalClientId = this.portalClientId;
    final portalContactEmail = this.portalContactEmail;
    final portalCreationDate = this.portalCreationDate;
    final portalId = this.portalId;
    final portalLastUpdateDate = this.portalLastUpdateDate;
    final portalName = this.portalName;
    final portalStartUrl = this.portalStartUrl;
    final portalStatus = this.portalStatus;
    final alarms = this.alarms;
    final notificationSenderEmail = this.notificationSenderEmail;
    final portalAuthMode = this.portalAuthMode;
    final portalDescription = this.portalDescription;
    final portalLogoImageLocation = this.portalLogoImageLocation;
    final roleArn = this.roleArn;
    return {
      'portalArn': portalArn,
      'portalClientId': portalClientId,
      'portalContactEmail': portalContactEmail,
      'portalCreationDate': unixTimestampToJson(portalCreationDate),
      'portalId': portalId,
      'portalLastUpdateDate': unixTimestampToJson(portalLastUpdateDate),
      'portalName': portalName,
      'portalStartUrl': portalStartUrl,
      'portalStatus': portalStatus,
      if (alarms != null) 'alarms': alarms,
      if (notificationSenderEmail != null)
        'notificationSenderEmail': notificationSenderEmail,
      if (portalAuthMode != null) 'portalAuthMode': portalAuthMode.toValue(),
      if (portalDescription != null) 'portalDescription': portalDescription,
      if (portalLogoImageLocation != null)
        'portalLogoImageLocation': portalLogoImageLocation,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

class DescribeProjectResponse {
  /// The ID of the portal that the project is in.
  final String portalId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the project, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}</code>
  final String projectArn;

  /// The date the project was created, in Unix epoch time.
  final DateTime projectCreationDate;

  /// The ID of the project.
  final String projectId;

  /// The date the project was last updated, in Unix epoch time.
  final DateTime projectLastUpdateDate;

  /// The name of the project.
  final String projectName;

  /// The project's description.
  final String? projectDescription;

  DescribeProjectResponse({
    required this.portalId,
    required this.projectArn,
    required this.projectCreationDate,
    required this.projectId,
    required this.projectLastUpdateDate,
    required this.projectName,
    this.projectDescription,
  });

  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProjectResponse(
      portalId: json['portalId'] as String,
      projectArn: json['projectArn'] as String,
      projectCreationDate:
          nonNullableTimeStampFromJson(json['projectCreationDate'] as Object),
      projectId: json['projectId'] as String,
      projectLastUpdateDate:
          nonNullableTimeStampFromJson(json['projectLastUpdateDate'] as Object),
      projectName: json['projectName'] as String,
      projectDescription: json['projectDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final portalId = this.portalId;
    final projectArn = this.projectArn;
    final projectCreationDate = this.projectCreationDate;
    final projectId = this.projectId;
    final projectLastUpdateDate = this.projectLastUpdateDate;
    final projectName = this.projectName;
    final projectDescription = this.projectDescription;
    return {
      'portalId': portalId,
      'projectArn': projectArn,
      'projectCreationDate': unixTimestampToJson(projectCreationDate),
      'projectId': projectId,
      'projectLastUpdateDate': unixTimestampToJson(projectLastUpdateDate),
      'projectName': projectName,
      if (projectDescription != null) 'projectDescription': projectDescription,
    };
  }
}

class DescribeStorageConfigurationResponse {
  final ConfigurationStatus configurationStatus;

  /// The storage tier that you specified for your data. The
  /// <code>storageType</code> parameter can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>SITEWISE_DEFAULT_STORAGE</code> – IoT SiteWise saves your data into
  /// the hot tier. The hot tier is a service-managed database.
  /// </li>
  /// <li>
  /// <code>MULTI_LAYER_STORAGE</code> – IoT SiteWise saves your data in both the
  /// cold tier and the hot tier. The cold tier is a customer-managed Amazon S3
  /// bucket.
  /// </li>
  /// </ul>
  final StorageType storageType;

  /// Contains the storage configuration for time series (data streams) that
  /// aren't associated with asset properties. The
  /// <code>disassociatedDataStorage</code> can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – IoT SiteWise accepts time series that aren't
  /// associated with asset properties.
  /// <important>
  /// After the <code>disassociatedDataStorage</code> is enabled, you can't
  /// disable it.
  /// </important> </li>
  /// <li>
  /// <code>DISABLED</code> – IoT SiteWise doesn't accept time series (data
  /// streams) that aren't associated with asset properties.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/data-streams.html">Data
  /// streams</a> in the <i>IoT SiteWise User Guide</i>.
  final DisassociatedDataStorageState? disassociatedDataStorage;

  /// The date the storage configuration was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  /// Contains information about the storage destination.
  final MultiLayerStorage? multiLayerStorage;

  /// How many days your data is kept in the hot tier. By default, your data is
  /// kept indefinitely in the hot tier.
  final RetentionPeriod? retentionPeriod;

  DescribeStorageConfigurationResponse({
    required this.configurationStatus,
    required this.storageType,
    this.disassociatedDataStorage,
    this.lastUpdateDate,
    this.multiLayerStorage,
    this.retentionPeriod,
  });

  factory DescribeStorageConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeStorageConfigurationResponse(
      configurationStatus: ConfigurationStatus.fromJson(
          json['configurationStatus'] as Map<String, dynamic>),
      storageType: (json['storageType'] as String).toStorageType(),
      disassociatedDataStorage: (json['disassociatedDataStorage'] as String?)
          ?.toDisassociatedDataStorageState(),
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
      multiLayerStorage: json['multiLayerStorage'] != null
          ? MultiLayerStorage.fromJson(
              json['multiLayerStorage'] as Map<String, dynamic>)
          : null,
      retentionPeriod: json['retentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['retentionPeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationStatus = this.configurationStatus;
    final storageType = this.storageType;
    final disassociatedDataStorage = this.disassociatedDataStorage;
    final lastUpdateDate = this.lastUpdateDate;
    final multiLayerStorage = this.multiLayerStorage;
    final retentionPeriod = this.retentionPeriod;
    return {
      'configurationStatus': configurationStatus,
      'storageType': storageType.toValue(),
      if (disassociatedDataStorage != null)
        'disassociatedDataStorage': disassociatedDataStorage.toValue(),
      if (lastUpdateDate != null)
        'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
      if (multiLayerStorage != null) 'multiLayerStorage': multiLayerStorage,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
    };
  }
}

class DescribeTimeSeriesResponse {
  /// The data type of the time series.
  ///
  /// If you specify <code>STRUCT</code>, you must also specify
  /// <code>dataTypeSpec</code> to identify the type of the structure for this
  /// time series.
  final PropertyDataType dataType;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the time series, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:time-series/${TimeSeriesId}</code>
  final String timeSeriesArn;

  /// The date that the time series was created, in Unix epoch time.
  final DateTime timeSeriesCreationDate;

  /// The ID of the time series.
  final String timeSeriesId;

  /// The date that the time series was last updated, in Unix epoch time.
  final DateTime timeSeriesLastUpdateDate;

  /// The alias that identifies the time series.
  final String? alias;

  /// The ID of the asset in which the asset property was created.
  final String? assetId;

  /// The data type of the structure for this time series. This parameter is
  /// required for time series that have the <code>STRUCT</code> data type.
  ///
  /// The options for this parameter depend on the type of the composite model in
  /// which you created the asset property that is associated with your time
  /// series. Use <code>AWS/ALARM_STATE</code> for alarm state in alarm composite
  /// models.
  final String? dataTypeSpec;

  /// The ID of the asset property.
  final String? propertyId;

  DescribeTimeSeriesResponse({
    required this.dataType,
    required this.timeSeriesArn,
    required this.timeSeriesCreationDate,
    required this.timeSeriesId,
    required this.timeSeriesLastUpdateDate,
    this.alias,
    this.assetId,
    this.dataTypeSpec,
    this.propertyId,
  });

  factory DescribeTimeSeriesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTimeSeriesResponse(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      timeSeriesArn: json['timeSeriesArn'] as String,
      timeSeriesCreationDate: nonNullableTimeStampFromJson(
          json['timeSeriesCreationDate'] as Object),
      timeSeriesId: json['timeSeriesId'] as String,
      timeSeriesLastUpdateDate: nonNullableTimeStampFromJson(
          json['timeSeriesLastUpdateDate'] as Object),
      alias: json['alias'] as String?,
      assetId: json['assetId'] as String?,
      dataTypeSpec: json['dataTypeSpec'] as String?,
      propertyId: json['propertyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final timeSeriesArn = this.timeSeriesArn;
    final timeSeriesCreationDate = this.timeSeriesCreationDate;
    final timeSeriesId = this.timeSeriesId;
    final timeSeriesLastUpdateDate = this.timeSeriesLastUpdateDate;
    final alias = this.alias;
    final assetId = this.assetId;
    final dataTypeSpec = this.dataTypeSpec;
    final propertyId = this.propertyId;
    return {
      'dataType': dataType.toValue(),
      'timeSeriesArn': timeSeriesArn,
      'timeSeriesCreationDate': unixTimestampToJson(timeSeriesCreationDate),
      'timeSeriesId': timeSeriesId,
      'timeSeriesLastUpdateDate': unixTimestampToJson(timeSeriesLastUpdateDate),
      if (alias != null) 'alias': alias,
      if (assetId != null) 'assetId': assetId,
      if (dataTypeSpec != null) 'dataTypeSpec': dataTypeSpec,
      if (propertyId != null) 'propertyId': propertyId,
    };
  }
}

/// Contains detailed error information.
class DetailedError {
  /// The error code.
  final DetailedErrorCode code;

  /// The error message.
  final String message;

  DetailedError({
    required this.code,
    required this.message,
  });

  factory DetailedError.fromJson(Map<String, dynamic> json) {
    return DetailedError(
      code: (json['code'] as String).toDetailedErrorCode(),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code.toValue(),
      'message': message,
    };
  }
}

enum DetailedErrorCode {
  incompatibleComputeLocation,
  incompatibleForwardingConfiguration,
}

extension DetailedErrorCodeValueExtension on DetailedErrorCode {
  String toValue() {
    switch (this) {
      case DetailedErrorCode.incompatibleComputeLocation:
        return 'INCOMPATIBLE_COMPUTE_LOCATION';
      case DetailedErrorCode.incompatibleForwardingConfiguration:
        return 'INCOMPATIBLE_FORWARDING_CONFIGURATION';
    }
  }
}

extension DetailedErrorCodeFromString on String {
  DetailedErrorCode toDetailedErrorCode() {
    switch (this) {
      case 'INCOMPATIBLE_COMPUTE_LOCATION':
        return DetailedErrorCode.incompatibleComputeLocation;
      case 'INCOMPATIBLE_FORWARDING_CONFIGURATION':
        return DetailedErrorCode.incompatibleForwardingConfiguration;
    }
    throw Exception('$this is not known in enum DetailedErrorCode');
  }
}

enum DisassociatedDataStorageState {
  enabled,
  disabled,
}

extension DisassociatedDataStorageStateValueExtension
    on DisassociatedDataStorageState {
  String toValue() {
    switch (this) {
      case DisassociatedDataStorageState.enabled:
        return 'ENABLED';
      case DisassociatedDataStorageState.disabled:
        return 'DISABLED';
    }
  }
}

extension DisassociatedDataStorageStateFromString on String {
  DisassociatedDataStorageState toDisassociatedDataStorageState() {
    switch (this) {
      case 'ENABLED':
        return DisassociatedDataStorageState.enabled;
      case 'DISABLED':
        return DisassociatedDataStorageState.disabled;
    }
    throw Exception('$this is not known in enum DisassociatedDataStorageState');
  }
}

enum EncryptionType {
  sitewiseDefaultEncryption,
  kmsBasedEncryption,
}

extension EncryptionTypeValueExtension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.sitewiseDefaultEncryption:
        return 'SITEWISE_DEFAULT_ENCRYPTION';
      case EncryptionType.kmsBasedEncryption:
        return 'KMS_BASED_ENCRYPTION';
    }
  }
}

extension EncryptionTypeFromString on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'SITEWISE_DEFAULT_ENCRYPTION':
        return EncryptionType.sitewiseDefaultEncryption;
      case 'KMS_BASED_ENCRYPTION':
        return EncryptionType.kmsBasedEncryption;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

enum ErrorCode {
  validationError,
  internalFailure,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.validationError:
        return 'VALIDATION_ERROR';
      case ErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'VALIDATION_ERROR':
        return ErrorCode.validationError;
      case 'INTERNAL_FAILURE':
        return ErrorCode.internalFailure;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Contains the details of an IoT SiteWise error.
class ErrorDetails {
  /// The error code.
  final ErrorCode code;

  /// The error message.
  final String message;

  /// A list of detailed errors.
  final List<DetailedError>? details;

  ErrorDetails({
    required this.code,
    required this.message,
    this.details,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      code: (json['code'] as String).toErrorCode(),
      message: json['message'] as String,
      details: (json['details'] as List?)
          ?.whereNotNull()
          .map((e) => DetailedError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final details = this.details;
    return {
      'code': code.toValue(),
      'message': message,
      if (details != null) 'details': details,
    };
  }
}

/// The Amazon S3 destination where errors associated with the job creation
/// request are saved.
class ErrorReportLocation {
  /// The name of the Amazon S3 bucket to which errors associated with the bulk
  /// import job are sent.
  final String bucket;

  /// Amazon S3 uses the prefix as a folder name to organize data in the bucket.
  /// Each Amazon S3 object has a key that is its unique identifier in the bucket.
  /// Each object in a bucket has exactly one key. The prefix must end with a
  /// forward slash (/). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html">Organizing
  /// objects using prefixes</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  final String prefix;

  ErrorReportLocation({
    required this.bucket,
    required this.prefix,
  });

  factory ErrorReportLocation.fromJson(Map<String, dynamic> json) {
    return ErrorReportLocation(
      bucket: json['bucket'] as String,
      prefix: json['prefix'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'bucket': bucket,
      'prefix': prefix,
    };
  }
}

/// Contains expression variable information.
class ExpressionVariable {
  /// The friendly name of the variable to be used in the expression.
  final String name;

  /// The variable that identifies an asset property from which to use values.
  final VariableValue value;

  ExpressionVariable({
    required this.name,
    required this.value,
  });

  factory ExpressionVariable.fromJson(Map<String, dynamic> json) {
    return ExpressionVariable(
      name: json['name'] as String,
      value: VariableValue.fromJson(json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// The file in Amazon S3 where your data is saved.
class File {
  /// The name of the Amazon S3 bucket from which data is imported.
  final String bucket;

  /// The key of the Amazon S3 object that contains your data. Each object has a
  /// key that is a unique identifier. Each object has exactly one key.
  final String key;

  /// The version ID to identify a specific version of the Amazon S3 object that
  /// contains your data.
  final String? versionId;

  File({
    required this.bucket,
    required this.key,
    this.versionId,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      bucket: json['bucket'] as String,
      key: json['key'] as String,
      versionId: json['versionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final versionId = this.versionId;
    return {
      'bucket': bucket,
      'key': key,
      if (versionId != null) 'versionId': versionId,
    };
  }
}

/// The file format of the data.
class FileFormat {
  /// The .csv file format.
  final Csv? csv;

  FileFormat({
    this.csv,
  });

  factory FileFormat.fromJson(Map<String, dynamic> json) {
    return FileFormat(
      csv: json['csv'] != null
          ? Csv.fromJson(json['csv'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final csv = this.csv;
    return {
      if (csv != null) 'csv': csv,
    };
  }
}

/// The forwarding configuration for a given property.
class ForwardingConfig {
  /// The forwarding state for the given property.
  final ForwardingConfigState state;

  ForwardingConfig({
    required this.state,
  });

  factory ForwardingConfig.fromJson(Map<String, dynamic> json) {
    return ForwardingConfig(
      state: (json['state'] as String).toForwardingConfigState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.toValue(),
    };
  }
}

enum ForwardingConfigState {
  disabled,
  enabled,
}

extension ForwardingConfigStateValueExtension on ForwardingConfigState {
  String toValue() {
    switch (this) {
      case ForwardingConfigState.disabled:
        return 'DISABLED';
      case ForwardingConfigState.enabled:
        return 'ENABLED';
    }
  }
}

extension ForwardingConfigStateFromString on String {
  ForwardingConfigState toForwardingConfigState() {
    switch (this) {
      case 'DISABLED':
        return ForwardingConfigState.disabled;
      case 'ENABLED':
        return ForwardingConfigState.enabled;
    }
    throw Exception('$this is not known in enum ForwardingConfigState');
  }
}

/// Contains a summary of a gateway capability configuration.
class GatewayCapabilitySummary {
  /// The namespace of the capability configuration. For example, if you configure
  /// OPC-UA sources from the IoT SiteWise console, your OPC-UA capability
  /// configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where <code>version</code>
  /// is a number such as <code>1</code>.
  final String capabilityNamespace;

  /// The synchronization status of the capability configuration. The sync status
  /// can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_SYNC</code> – The gateway is running the capability configuration.
  /// </li>
  /// <li>
  /// <code>OUT_OF_SYNC</code> – The gateway hasn't received the capability
  /// configuration.
  /// </li>
  /// <li>
  /// <code>SYNC_FAILED</code> – The gateway rejected the capability
  /// configuration.
  /// </li>
  /// </ul>
  final CapabilitySyncStatus capabilitySyncStatus;

  GatewayCapabilitySummary({
    required this.capabilityNamespace,
    required this.capabilitySyncStatus,
  });

  factory GatewayCapabilitySummary.fromJson(Map<String, dynamic> json) {
    return GatewayCapabilitySummary(
      capabilityNamespace: json['capabilityNamespace'] as String,
      capabilitySyncStatus:
          (json['capabilitySyncStatus'] as String).toCapabilitySyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilityNamespace = this.capabilityNamespace;
    final capabilitySyncStatus = this.capabilitySyncStatus;
    return {
      'capabilityNamespace': capabilityNamespace,
      'capabilitySyncStatus': capabilitySyncStatus.toValue(),
    };
  }
}

/// Contains a gateway's platform information.
class GatewayPlatform {
  /// A gateway that runs on IoT Greengrass.
  final Greengrass? greengrass;

  /// A gateway that runs on IoT Greengrass V2.
  final GreengrassV2? greengrassV2;

  GatewayPlatform({
    this.greengrass,
    this.greengrassV2,
  });

  factory GatewayPlatform.fromJson(Map<String, dynamic> json) {
    return GatewayPlatform(
      greengrass: json['greengrass'] != null
          ? Greengrass.fromJson(json['greengrass'] as Map<String, dynamic>)
          : null,
      greengrassV2: json['greengrassV2'] != null
          ? GreengrassV2.fromJson(json['greengrassV2'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final greengrass = this.greengrass;
    final greengrassV2 = this.greengrassV2;
    return {
      if (greengrass != null) 'greengrass': greengrass,
      if (greengrassV2 != null) 'greengrassV2': greengrassV2,
    };
  }
}

/// Contains a summary of a gateway.
class GatewaySummary {
  /// The date the gateway was created, in Unix epoch time.
  final DateTime creationDate;

  /// The ID of the gateway device.
  final String gatewayId;

  /// The name of the asset.
  final String gatewayName;

  /// The date the gateway was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// A list of gateway capability summaries that each contain a namespace and
  /// status. Each gateway capability defines data sources for the gateway. To
  /// retrieve a capability configuration's definition, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.
  final List<GatewayCapabilitySummary>? gatewayCapabilitySummaries;
  final GatewayPlatform? gatewayPlatform;

  GatewaySummary({
    required this.creationDate,
    required this.gatewayId,
    required this.gatewayName,
    required this.lastUpdateDate,
    this.gatewayCapabilitySummaries,
    this.gatewayPlatform,
  });

  factory GatewaySummary.fromJson(Map<String, dynamic> json) {
    return GatewaySummary(
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      gatewayId: json['gatewayId'] as String,
      gatewayName: json['gatewayName'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      gatewayCapabilitySummaries: (json['gatewayCapabilitySummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GatewayCapabilitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayPlatform: json['gatewayPlatform'] != null
          ? GatewayPlatform.fromJson(
              json['gatewayPlatform'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final gatewayId = this.gatewayId;
    final gatewayName = this.gatewayName;
    final lastUpdateDate = this.lastUpdateDate;
    final gatewayCapabilitySummaries = this.gatewayCapabilitySummaries;
    final gatewayPlatform = this.gatewayPlatform;
    return {
      'creationDate': unixTimestampToJson(creationDate),
      'gatewayId': gatewayId,
      'gatewayName': gatewayName,
      'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
      if (gatewayCapabilitySummaries != null)
        'gatewayCapabilitySummaries': gatewayCapabilitySummaries,
      if (gatewayPlatform != null) 'gatewayPlatform': gatewayPlatform,
    };
  }
}

class GetAssetPropertyAggregatesResponse {
  /// The requested aggregated values.
  final List<AggregatedValue> aggregatedValues;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  GetAssetPropertyAggregatesResponse({
    required this.aggregatedValues,
    this.nextToken,
  });

  factory GetAssetPropertyAggregatesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAssetPropertyAggregatesResponse(
      aggregatedValues: (json['aggregatedValues'] as List)
          .whereNotNull()
          .map((e) => AggregatedValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedValues = this.aggregatedValues;
    final nextToken = this.nextToken;
    return {
      'aggregatedValues': aggregatedValues,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetAssetPropertyValueHistoryResponse {
  /// The asset property's value history.
  final List<AssetPropertyValue> assetPropertyValueHistory;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  GetAssetPropertyValueHistoryResponse({
    required this.assetPropertyValueHistory,
    this.nextToken,
  });

  factory GetAssetPropertyValueHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAssetPropertyValueHistoryResponse(
      assetPropertyValueHistory: (json['assetPropertyValueHistory'] as List)
          .whereNotNull()
          .map((e) => AssetPropertyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetPropertyValueHistory = this.assetPropertyValueHistory;
    final nextToken = this.nextToken;
    return {
      'assetPropertyValueHistory': assetPropertyValueHistory,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetAssetPropertyValueResponse {
  /// The current asset property value.
  final AssetPropertyValue? propertyValue;

  GetAssetPropertyValueResponse({
    this.propertyValue,
  });

  factory GetAssetPropertyValueResponse.fromJson(Map<String, dynamic> json) {
    return GetAssetPropertyValueResponse(
      propertyValue: json['propertyValue'] != null
          ? AssetPropertyValue.fromJson(
              json['propertyValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final propertyValue = this.propertyValue;
    return {
      if (propertyValue != null) 'propertyValue': propertyValue,
    };
  }
}

class GetInterpolatedAssetPropertyValuesResponse {
  /// The requested interpolated values.
  final List<InterpolatedAssetPropertyValue> interpolatedAssetPropertyValues;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  GetInterpolatedAssetPropertyValuesResponse({
    required this.interpolatedAssetPropertyValues,
    this.nextToken,
  });

  factory GetInterpolatedAssetPropertyValuesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetInterpolatedAssetPropertyValuesResponse(
      interpolatedAssetPropertyValues:
          (json['interpolatedAssetPropertyValues'] as List)
              .whereNotNull()
              .map((e) => InterpolatedAssetPropertyValue.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final interpolatedAssetPropertyValues =
        this.interpolatedAssetPropertyValues;
    final nextToken = this.nextToken;
    return {
      'interpolatedAssetPropertyValues': interpolatedAssetPropertyValues,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains details for a gateway that runs on IoT Greengrass. To create a
/// gateway that runs on IoT Greengrass, you must add the IoT SiteWise connector
/// to a Greengrass group and deploy it. Your Greengrass group must also have
/// permissions to upload data to IoT SiteWise. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting
/// data using a gateway</a> in the <i>IoT SiteWise User Guide</i>.
class Greengrass {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the Greengrass group. For more information about how to find a group's
  /// ARN, see <a
  /// href="https://docs.aws.amazon.com/greengrass/latest/apireference/listgroups-get.html">ListGroups</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/greengrass/latest/apireference/getgroup-get.html">GetGroup</a>
  /// in the <i>IoT Greengrass API Reference</i>.
  final String groupArn;

  Greengrass({
    required this.groupArn,
  });

  factory Greengrass.fromJson(Map<String, dynamic> json) {
    return Greengrass(
      groupArn: json['groupArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final groupArn = this.groupArn;
    return {
      'groupArn': groupArn,
    };
  }
}

/// Contains details for a gateway that runs on IoT Greengrass V2. To create a
/// gateway that runs on IoT Greengrass V2, you must deploy the IoT SiteWise
/// Edge component to your gateway device. Your <a
/// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/device-service-role.html">Greengrass
/// device role</a> must use the <code>AWSIoTSiteWiseEdgeAccess</code> policy.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/sw-gateways.html">Using
/// IoT SiteWise at the edge</a> in the <i>IoT SiteWise User Guide</i>.
class GreengrassV2 {
  /// The name of the IoT thing for your IoT Greengrass V2 core device.
  final String coreDeviceThingName;

  GreengrassV2({
    required this.coreDeviceThingName,
  });

  factory GreengrassV2.fromJson(Map<String, dynamic> json) {
    return GreengrassV2(
      coreDeviceThingName: json['coreDeviceThingName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final coreDeviceThingName = this.coreDeviceThingName;
    return {
      'coreDeviceThingName': coreDeviceThingName,
    };
  }
}

/// Contains information for a group identity in an access policy.
class GroupIdentity {
  /// The IAM Identity Center ID of the group.
  final String id;

  GroupIdentity({
    required this.id,
  });

  factory GroupIdentity.fromJson(Map<String, dynamic> json) {
    return GroupIdentity(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Contains information about an Identity and Access Management role. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
/// roles</a> in the <i>IAM User Guide</i>.
class IAMRoleIdentity {
  /// The ARN of the IAM role. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// ARNs</a> in the <i>IAM User Guide</i>.
  final String arn;

  IAMRoleIdentity({
    required this.arn,
  });

  factory IAMRoleIdentity.fromJson(Map<String, dynamic> json) {
    return IAMRoleIdentity(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// Contains information about an Identity and Access Management user.
class IAMUserIdentity {
  /// The ARN of the IAM user. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// ARNs</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If you delete the IAM user, access policies that contain this identity
  /// include an empty <code>arn</code>. You can delete the access policy for the
  /// IAM user that no longer exists.
  /// </note>
  final String arn;

  IAMUserIdentity({
    required this.arn,
  });

  factory IAMUserIdentity.fromJson(Map<String, dynamic> json) {
    return IAMUserIdentity(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// Contains an identity that can access an IoT SiteWise Monitor resource.
/// <note>
/// Currently, you can't use Amazon Web Services APIs to retrieve IAM Identity
/// Center identity IDs. You can find the IAM Identity Center identity IDs in
/// the URL of user and group pages in the <a
/// href="https://console.aws.amazon.com/singlesignon">IAM Identity Center
/// console</a>.
/// </note>
class Identity {
  /// An IAM Identity Center group identity.
  final GroupIdentity? group;

  /// An IAM role identity.
  final IAMRoleIdentity? iamRole;

  /// An IAM user identity.
  final IAMUserIdentity? iamUser;

  /// An IAM Identity Center user identity.
  final UserIdentity? user;

  Identity({
    this.group,
    this.iamRole,
    this.iamUser,
    this.user,
  });

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      group: json['group'] != null
          ? GroupIdentity.fromJson(json['group'] as Map<String, dynamic>)
          : null,
      iamRole: json['iamRole'] != null
          ? IAMRoleIdentity.fromJson(json['iamRole'] as Map<String, dynamic>)
          : null,
      iamUser: json['iamUser'] != null
          ? IAMUserIdentity.fromJson(json['iamUser'] as Map<String, dynamic>)
          : null,
      user: json['user'] != null
          ? UserIdentity.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final iamRole = this.iamRole;
    final iamUser = this.iamUser;
    final user = this.user;
    return {
      if (group != null) 'group': group,
      if (iamRole != null) 'iamRole': iamRole,
      if (iamUser != null) 'iamUser': iamUser,
      if (user != null) 'user': user,
    };
  }
}

enum IdentityType {
  user,
  group,
  iam,
}

extension IdentityTypeValueExtension on IdentityType {
  String toValue() {
    switch (this) {
      case IdentityType.user:
        return 'USER';
      case IdentityType.group:
        return 'GROUP';
      case IdentityType.iam:
        return 'IAM';
    }
  }
}

extension IdentityTypeFromString on String {
  IdentityType toIdentityType() {
    switch (this) {
      case 'USER':
        return IdentityType.user;
      case 'GROUP':
        return IdentityType.group;
      case 'IAM':
        return IdentityType.iam;
    }
    throw Exception('$this is not known in enum IdentityType');
  }
}

/// Contains an image that is one of the following:
///
/// <ul>
/// <li>
/// An image file. Choose this option to upload a new image.
/// </li>
/// <li>
/// The ID of an existing image. Choose this option to keep an existing image.
/// </li>
/// </ul>
class Image {
  final ImageFile? file;

  /// The ID of an existing image. Specify this parameter to keep an existing
  /// image.
  final String? id;

  Image({
    this.file,
    this.id,
  });

  Map<String, dynamic> toJson() {
    final file = this.file;
    final id = this.id;
    return {
      if (file != null) 'file': file,
      if (id != null) 'id': id,
    };
  }
}

/// Contains an image file.
class ImageFile {
  /// The image file contents, represented as a base64-encoded string. The file
  /// size must be less than 1 MB.
  final Uint8List data;

  /// The file type of the image.
  final ImageFileType type;

  ImageFile({
    required this.data,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final type = this.type;
    return {
      'data': base64Encode(data),
      'type': type.toValue(),
    };
  }
}

enum ImageFileType {
  png,
}

extension ImageFileTypeValueExtension on ImageFileType {
  String toValue() {
    switch (this) {
      case ImageFileType.png:
        return 'PNG';
    }
  }
}

extension ImageFileTypeFromString on String {
  ImageFileType toImageFileType() {
    switch (this) {
      case 'PNG':
        return ImageFileType.png;
    }
    throw Exception('$this is not known in enum ImageFileType');
  }
}

/// Contains an image that is uploaded to IoT SiteWise and available at a URL.
class ImageLocation {
  /// The ID of the image.
  final String id;

  /// The URL where the image is available. The URL is valid for 15 minutes so
  /// that you can view and download the image
  final String url;

  ImageLocation({
    required this.id,
    required this.url,
  });

  factory ImageLocation.fromJson(Map<String, dynamic> json) {
    return ImageLocation(
      id: json['id'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final url = this.url;
    return {
      'id': id,
      'url': url,
    };
  }
}

/// Contains information about an interpolated asset property value.
class InterpolatedAssetPropertyValue {
  final TimeInNanos timestamp;
  final Variant value;

  InterpolatedAssetPropertyValue({
    required this.timestamp,
    required this.value,
  });

  factory InterpolatedAssetPropertyValue.fromJson(Map<String, dynamic> json) {
    return InterpolatedAssetPropertyValue(
      timestamp:
          TimeInNanos.fromJson(json['timestamp'] as Map<String, dynamic>),
      value: Variant.fromJson(json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final value = this.value;
    return {
      'timestamp': timestamp,
      'value': value,
    };
  }
}

/// Contains the configuration information of a job, such as the file format
/// used to save data in Amazon S3.
class JobConfiguration {
  /// The file format of the data in Amazon S3.
  final FileFormat fileFormat;

  JobConfiguration({
    required this.fileFormat,
  });

  factory JobConfiguration.fromJson(Map<String, dynamic> json) {
    return JobConfiguration(
      fileFormat:
          FileFormat.fromJson(json['fileFormat'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final fileFormat = this.fileFormat;
    return {
      'fileFormat': fileFormat,
    };
  }
}

enum JobStatus {
  pending,
  cancelled,
  running,
  completed,
  failed,
  completedWithFailures,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.pending:
        return 'PENDING';
      case JobStatus.cancelled:
        return 'CANCELLED';
      case JobStatus.running:
        return 'RUNNING';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.completedWithFailures:
        return 'COMPLETED_WITH_FAILURES';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'PENDING':
        return JobStatus.pending;
      case 'CANCELLED':
        return JobStatus.cancelled;
      case 'RUNNING':
        return JobStatus.running;
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILED':
        return JobStatus.failed;
      case 'COMPLETED_WITH_FAILURES':
        return JobStatus.completedWithFailures;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// Contains a job summary information.
class JobSummary {
  /// The ID of the job.
  final String id;

  /// The unique name that helps identify the job request.
  final String name;

  /// The status of the bulk import job can be one of following values.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – IoT SiteWise is waiting for the current bulk import
  /// job to finish.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – The bulk import job has been canceled.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> – IoT SiteWise is processing your request to import
  /// your data from Amazon S3.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> – IoT SiteWise successfully completed your request to
  /// import data from Amazon S3.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – IoT SiteWise couldn't process your request to import
  /// data from Amazon S3. You can use logs saved in the specified error report
  /// location in Amazon S3 to troubleshoot issues.
  /// </li>
  /// <li>
  /// <code>COMPLETED_WITH_FAILURES</code> – IoT SiteWise completed your request
  /// to import data from Amazon S3 with errors. You can use logs saved in the
  /// specified error report location in Amazon S3 to troubleshoot issues.
  /// </li>
  /// </ul>
  final JobStatus status;

  JobSummary({
    required this.id,
    required this.name,
    required this.status,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      'name': name,
      'status': status.toValue(),
    };
  }
}

class ListAccessPoliciesResponse {
  /// A list that summarizes each access policy.
  final List<AccessPolicySummary> accessPolicySummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAccessPoliciesResponse({
    required this.accessPolicySummaries,
    this.nextToken,
  });

  factory ListAccessPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessPoliciesResponse(
      accessPolicySummaries: (json['accessPolicySummaries'] as List)
          .whereNotNull()
          .map((e) => AccessPolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicySummaries = this.accessPolicySummaries;
    final nextToken = this.nextToken;
    return {
      'accessPolicySummaries': accessPolicySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum ListAssetModelPropertiesFilter {
  all,
  base,
}

extension ListAssetModelPropertiesFilterValueExtension
    on ListAssetModelPropertiesFilter {
  String toValue() {
    switch (this) {
      case ListAssetModelPropertiesFilter.all:
        return 'ALL';
      case ListAssetModelPropertiesFilter.base:
        return 'BASE';
    }
  }
}

extension ListAssetModelPropertiesFilterFromString on String {
  ListAssetModelPropertiesFilter toListAssetModelPropertiesFilter() {
    switch (this) {
      case 'ALL':
        return ListAssetModelPropertiesFilter.all;
      case 'BASE':
        return ListAssetModelPropertiesFilter.base;
    }
    throw Exception(
        '$this is not known in enum ListAssetModelPropertiesFilter');
  }
}

class ListAssetModelPropertiesResponse {
  /// A list that summarizes the properties associated with the specified asset
  /// model.
  final List<AssetModelPropertySummary> assetModelPropertySummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssetModelPropertiesResponse({
    required this.assetModelPropertySummaries,
    this.nextToken,
  });

  factory ListAssetModelPropertiesResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetModelPropertiesResponse(
      assetModelPropertySummaries: (json['assetModelPropertySummaries'] as List)
          .whereNotNull()
          .map((e) =>
              AssetModelPropertySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetModelPropertySummaries = this.assetModelPropertySummaries;
    final nextToken = this.nextToken;
    return {
      'assetModelPropertySummaries': assetModelPropertySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssetModelsResponse {
  /// A list that summarizes each asset model.
  final List<AssetModelSummary> assetModelSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssetModelsResponse({
    required this.assetModelSummaries,
    this.nextToken,
  });

  factory ListAssetModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetModelsResponse(
      assetModelSummaries: (json['assetModelSummaries'] as List)
          .whereNotNull()
          .map((e) => AssetModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetModelSummaries = this.assetModelSummaries;
    final nextToken = this.nextToken;
    return {
      'assetModelSummaries': assetModelSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum ListAssetPropertiesFilter {
  all,
  base,
}

extension ListAssetPropertiesFilterValueExtension on ListAssetPropertiesFilter {
  String toValue() {
    switch (this) {
      case ListAssetPropertiesFilter.all:
        return 'ALL';
      case ListAssetPropertiesFilter.base:
        return 'BASE';
    }
  }
}

extension ListAssetPropertiesFilterFromString on String {
  ListAssetPropertiesFilter toListAssetPropertiesFilter() {
    switch (this) {
      case 'ALL':
        return ListAssetPropertiesFilter.all;
      case 'BASE':
        return ListAssetPropertiesFilter.base;
    }
    throw Exception('$this is not known in enum ListAssetPropertiesFilter');
  }
}

class ListAssetPropertiesResponse {
  /// A list that summarizes the properties associated with the specified asset.
  final List<AssetPropertySummary> assetPropertySummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssetPropertiesResponse({
    required this.assetPropertySummaries,
    this.nextToken,
  });

  factory ListAssetPropertiesResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetPropertiesResponse(
      assetPropertySummaries: (json['assetPropertySummaries'] as List)
          .whereNotNull()
          .map((e) => AssetPropertySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetPropertySummaries = this.assetPropertySummaries;
    final nextToken = this.nextToken;
    return {
      'assetPropertySummaries': assetPropertySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssetRelationshipsResponse {
  /// A list that summarizes each asset relationship.
  final List<AssetRelationshipSummary> assetRelationshipSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssetRelationshipsResponse({
    required this.assetRelationshipSummaries,
    this.nextToken,
  });

  factory ListAssetRelationshipsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetRelationshipsResponse(
      assetRelationshipSummaries: (json['assetRelationshipSummaries'] as List)
          .whereNotNull()
          .map((e) =>
              AssetRelationshipSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetRelationshipSummaries = this.assetRelationshipSummaries;
    final nextToken = this.nextToken;
    return {
      'assetRelationshipSummaries': assetRelationshipSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum ListAssetsFilter {
  all,
  topLevel,
}

extension ListAssetsFilterValueExtension on ListAssetsFilter {
  String toValue() {
    switch (this) {
      case ListAssetsFilter.all:
        return 'ALL';
      case ListAssetsFilter.topLevel:
        return 'TOP_LEVEL';
    }
  }
}

extension ListAssetsFilterFromString on String {
  ListAssetsFilter toListAssetsFilter() {
    switch (this) {
      case 'ALL':
        return ListAssetsFilter.all;
      case 'TOP_LEVEL':
        return ListAssetsFilter.topLevel;
    }
    throw Exception('$this is not known in enum ListAssetsFilter');
  }
}

class ListAssetsResponse {
  /// A list that summarizes each asset.
  final List<AssetSummary> assetSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssetsResponse({
    required this.assetSummaries,
    this.nextToken,
  });

  factory ListAssetsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetsResponse(
      assetSummaries: (json['assetSummaries'] as List)
          .whereNotNull()
          .map((e) => AssetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetSummaries = this.assetSummaries;
    final nextToken = this.nextToken;
    return {
      'assetSummaries': assetSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssociatedAssetsResponse {
  /// A list that summarizes the associated assets.
  final List<AssociatedAssetsSummary> assetSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssociatedAssetsResponse({
    required this.assetSummaries,
    this.nextToken,
  });

  factory ListAssociatedAssetsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssociatedAssetsResponse(
      assetSummaries: (json['assetSummaries'] as List)
          .whereNotNull()
          .map((e) =>
              AssociatedAssetsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetSummaries = this.assetSummaries;
    final nextToken = this.nextToken;
    return {
      'assetSummaries': assetSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum ListBulkImportJobsFilter {
  all,
  pending,
  running,
  cancelled,
  failed,
  completedWithFailures,
  completed,
}

extension ListBulkImportJobsFilterValueExtension on ListBulkImportJobsFilter {
  String toValue() {
    switch (this) {
      case ListBulkImportJobsFilter.all:
        return 'ALL';
      case ListBulkImportJobsFilter.pending:
        return 'PENDING';
      case ListBulkImportJobsFilter.running:
        return 'RUNNING';
      case ListBulkImportJobsFilter.cancelled:
        return 'CANCELLED';
      case ListBulkImportJobsFilter.failed:
        return 'FAILED';
      case ListBulkImportJobsFilter.completedWithFailures:
        return 'COMPLETED_WITH_FAILURES';
      case ListBulkImportJobsFilter.completed:
        return 'COMPLETED';
    }
  }
}

extension ListBulkImportJobsFilterFromString on String {
  ListBulkImportJobsFilter toListBulkImportJobsFilter() {
    switch (this) {
      case 'ALL':
        return ListBulkImportJobsFilter.all;
      case 'PENDING':
        return ListBulkImportJobsFilter.pending;
      case 'RUNNING':
        return ListBulkImportJobsFilter.running;
      case 'CANCELLED':
        return ListBulkImportJobsFilter.cancelled;
      case 'FAILED':
        return ListBulkImportJobsFilter.failed;
      case 'COMPLETED_WITH_FAILURES':
        return ListBulkImportJobsFilter.completedWithFailures;
      case 'COMPLETED':
        return ListBulkImportJobsFilter.completed;
    }
    throw Exception('$this is not known in enum ListBulkImportJobsFilter');
  }
}

class ListBulkImportJobsResponse {
  /// One or more job summaries to list.
  final List<JobSummary> jobSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListBulkImportJobsResponse({
    required this.jobSummaries,
    this.nextToken,
  });

  factory ListBulkImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListBulkImportJobsResponse(
      jobSummaries: (json['jobSummaries'] as List)
          .whereNotNull()
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummaries = this.jobSummaries;
    final nextToken = this.nextToken;
    return {
      'jobSummaries': jobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDashboardsResponse {
  /// A list that summarizes each dashboard in the project.
  final List<DashboardSummary> dashboardSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListDashboardsResponse({
    required this.dashboardSummaries,
    this.nextToken,
  });

  factory ListDashboardsResponse.fromJson(Map<String, dynamic> json) {
    return ListDashboardsResponse(
      dashboardSummaries: (json['dashboardSummaries'] as List)
          .whereNotNull()
          .map((e) => DashboardSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardSummaries = this.dashboardSummaries;
    final nextToken = this.nextToken;
    return {
      'dashboardSummaries': dashboardSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListGatewaysResponse {
  /// A list that summarizes each gateway.
  final List<GatewaySummary> gatewaySummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListGatewaysResponse({
    required this.gatewaySummaries,
    this.nextToken,
  });

  factory ListGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListGatewaysResponse(
      gatewaySummaries: (json['gatewaySummaries'] as List)
          .whereNotNull()
          .map((e) => GatewaySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewaySummaries = this.gatewaySummaries;
    final nextToken = this.nextToken;
    return {
      'gatewaySummaries': gatewaySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPortalsResponse {
  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  /// A list that summarizes each portal.
  final List<PortalSummary>? portalSummaries;

  ListPortalsResponse({
    this.nextToken,
    this.portalSummaries,
  });

  factory ListPortalsResponse.fromJson(Map<String, dynamic> json) {
    return ListPortalsResponse(
      nextToken: json['nextToken'] as String?,
      portalSummaries: (json['portalSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => PortalSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final portalSummaries = this.portalSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (portalSummaries != null) 'portalSummaries': portalSummaries,
    };
  }
}

class ListProjectAssetsResponse {
  /// A list that contains the IDs of each asset associated with the project.
  final List<String> assetIds;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListProjectAssetsResponse({
    required this.assetIds,
    this.nextToken,
  });

  factory ListProjectAssetsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectAssetsResponse(
      assetIds: (json['assetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetIds = this.assetIds;
    final nextToken = this.nextToken;
    return {
      'assetIds': assetIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListProjectsResponse {
  /// A list that summarizes each project in the portal.
  final List<ProjectSummary> projectSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListProjectsResponse({
    required this.projectSummaries,
    this.nextToken,
  });

  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectsResponse(
      projectSummaries: (json['projectSummaries'] as List)
          .whereNotNull()
          .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectSummaries = this.projectSummaries;
    final nextToken = this.nextToken;
    return {
      'projectSummaries': projectSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your IoT SiteWise resources</a> in the <i>IoT SiteWise User Guide</i>.
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

class ListTimeSeriesResponse {
  /// One or more time series summaries to list.
  final List<TimeSeriesSummary> timeSeriesSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListTimeSeriesResponse({
    required this.timeSeriesSummaries,
    this.nextToken,
  });

  factory ListTimeSeriesResponse.fromJson(Map<String, dynamic> json) {
    return ListTimeSeriesResponse(
      timeSeriesSummaries: (json['TimeSeriesSummaries'] as List)
          .whereNotNull()
          .map((e) => TimeSeriesSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeSeriesSummaries = this.timeSeriesSummaries;
    final nextToken = this.nextToken;
    return {
      'TimeSeriesSummaries': timeSeriesSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum ListTimeSeriesType {
  associated,
  disassociated,
}

extension ListTimeSeriesTypeValueExtension on ListTimeSeriesType {
  String toValue() {
    switch (this) {
      case ListTimeSeriesType.associated:
        return 'ASSOCIATED';
      case ListTimeSeriesType.disassociated:
        return 'DISASSOCIATED';
    }
  }
}

extension ListTimeSeriesTypeFromString on String {
  ListTimeSeriesType toListTimeSeriesType() {
    switch (this) {
      case 'ASSOCIATED':
        return ListTimeSeriesType.associated;
      case 'DISASSOCIATED':
        return ListTimeSeriesType.disassociated;
    }
    throw Exception('$this is not known in enum ListTimeSeriesType');
  }
}

enum LoggingLevel {
  error,
  info,
  off,
}

extension LoggingLevelValueExtension on LoggingLevel {
  String toValue() {
    switch (this) {
      case LoggingLevel.error:
        return 'ERROR';
      case LoggingLevel.info:
        return 'INFO';
      case LoggingLevel.off:
        return 'OFF';
    }
  }
}

extension LoggingLevelFromString on String {
  LoggingLevel toLoggingLevel() {
    switch (this) {
      case 'ERROR':
        return LoggingLevel.error;
      case 'INFO':
        return LoggingLevel.info;
      case 'OFF':
        return LoggingLevel.off;
    }
    throw Exception('$this is not known in enum LoggingLevel');
  }
}

/// Contains logging options.
class LoggingOptions {
  /// The IoT SiteWise logging verbosity level.
  final LoggingLevel level;

  LoggingOptions({
    required this.level,
  });

  factory LoggingOptions.fromJson(Map<String, dynamic> json) {
    return LoggingOptions(
      level: (json['level'] as String).toLoggingLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final level = this.level;
    return {
      'level': level.toValue(),
    };
  }
}

/// Contains an asset measurement property. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#measurements">Measurements</a>
/// in the <i>IoT SiteWise User Guide</i>.
class Measurement {
  /// The processing configuration for the given measurement property. You can
  /// configure measurements to be kept at the edge or forwarded to the Amazon Web
  /// Services Cloud. By default, measurements are forwarded to the cloud.
  final MeasurementProcessingConfig? processingConfig;

  Measurement({
    this.processingConfig,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) {
    return Measurement(
      processingConfig: json['processingConfig'] != null
          ? MeasurementProcessingConfig.fromJson(
              json['processingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final processingConfig = this.processingConfig;
    return {
      if (processingConfig != null) 'processingConfig': processingConfig,
    };
  }
}

/// The processing configuration for the given measurement property. You can
/// configure measurements to be kept at the edge or forwarded to the Amazon Web
/// Services Cloud. By default, measurements are forwarded to the cloud.
class MeasurementProcessingConfig {
  /// The forwarding configuration for the given measurement property.
  final ForwardingConfig forwardingConfig;

  MeasurementProcessingConfig({
    required this.forwardingConfig,
  });

  factory MeasurementProcessingConfig.fromJson(Map<String, dynamic> json) {
    return MeasurementProcessingConfig(
      forwardingConfig: ForwardingConfig.fromJson(
          json['forwardingConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final forwardingConfig = this.forwardingConfig;
    return {
      'forwardingConfig': forwardingConfig,
    };
  }
}

/// Contains an asset metric property. With metrics, you can calculate aggregate
/// functions, such as an average, maximum, or minimum, as specified through an
/// expression. A metric maps several values to a single value (such as a sum).
///
/// The maximum number of dependent/cascading variables used in any one metric
/// calculation is 10. Therefore, a <i>root</i> metric can have up to 10
/// cascading metrics in its computational dependency tree. Additionally, a
/// metric can only have a data type of <code>DOUBLE</code> and consume
/// properties with data types of <code>INTEGER</code> or <code>DOUBLE</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#metrics">Metrics</a>
/// in the <i>IoT SiteWise User Guide</i>.
class Metric {
  /// The mathematical expression that defines the metric aggregation function.
  /// You can specify up to 10 variables per expression. You can specify up to 10
  /// functions per expression.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>IoT SiteWise User Guide</i>.
  final String expression;

  /// The list of variables used in the expression.
  final List<ExpressionVariable> variables;

  /// The window (time interval) over which IoT SiteWise computes the metric's
  /// aggregation expression. IoT SiteWise computes one data point per
  /// <code>window</code>.
  final MetricWindow window;

  /// The processing configuration for the given metric property. You can
  /// configure metrics to be computed at the edge or in the Amazon Web Services
  /// Cloud. By default, metrics are forwarded to the cloud.
  final MetricProcessingConfig? processingConfig;

  Metric({
    required this.expression,
    required this.variables,
    required this.window,
    this.processingConfig,
  });

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      expression: json['expression'] as String,
      variables: (json['variables'] as List)
          .whereNotNull()
          .map((e) => ExpressionVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      window: MetricWindow.fromJson(json['window'] as Map<String, dynamic>),
      processingConfig: json['processingConfig'] != null
          ? MetricProcessingConfig.fromJson(
              json['processingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final variables = this.variables;
    final window = this.window;
    final processingConfig = this.processingConfig;
    return {
      'expression': expression,
      'variables': variables,
      'window': window,
      if (processingConfig != null) 'processingConfig': processingConfig,
    };
  }
}

/// The processing configuration for the given metric property. You can
/// configure metrics to be computed at the edge or in the Amazon Web Services
/// Cloud. By default, metrics are forwarded to the cloud.
class MetricProcessingConfig {
  /// The compute location for the given metric property.
  final ComputeLocation computeLocation;

  MetricProcessingConfig({
    required this.computeLocation,
  });

  factory MetricProcessingConfig.fromJson(Map<String, dynamic> json) {
    return MetricProcessingConfig(
      computeLocation: (json['computeLocation'] as String).toComputeLocation(),
    );
  }

  Map<String, dynamic> toJson() {
    final computeLocation = this.computeLocation;
    return {
      'computeLocation': computeLocation.toValue(),
    };
  }
}

/// Contains a time interval window used for data aggregate computations (for
/// example, average, sum, count, and so on).
class MetricWindow {
  /// The tumbling time interval window.
  final TumblingWindow? tumbling;

  MetricWindow({
    this.tumbling,
  });

  factory MetricWindow.fromJson(Map<String, dynamic> json) {
    return MetricWindow(
      tumbling: json['tumbling'] != null
          ? TumblingWindow.fromJson(json['tumbling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tumbling = this.tumbling;
    return {
      if (tumbling != null) 'tumbling': tumbling,
    };
  }
}

enum MonitorErrorCode {
  internalFailure,
  validationError,
  limitExceeded,
}

extension MonitorErrorCodeValueExtension on MonitorErrorCode {
  String toValue() {
    switch (this) {
      case MonitorErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
      case MonitorErrorCode.validationError:
        return 'VALIDATION_ERROR';
      case MonitorErrorCode.limitExceeded:
        return 'LIMIT_EXCEEDED';
    }
  }
}

extension MonitorErrorCodeFromString on String {
  MonitorErrorCode toMonitorErrorCode() {
    switch (this) {
      case 'INTERNAL_FAILURE':
        return MonitorErrorCode.internalFailure;
      case 'VALIDATION_ERROR':
        return MonitorErrorCode.validationError;
      case 'LIMIT_EXCEEDED':
        return MonitorErrorCode.limitExceeded;
    }
    throw Exception('$this is not known in enum MonitorErrorCode');
  }
}

/// Contains IoT SiteWise Monitor error details.
class MonitorErrorDetails {
  /// The error code.
  final MonitorErrorCode? code;

  /// The error message.
  final String? message;

  MonitorErrorDetails({
    this.code,
    this.message,
  });

  factory MonitorErrorDetails.fromJson(Map<String, dynamic> json) {
    return MonitorErrorDetails(
      code: (json['code'] as String?)?.toMonitorErrorCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

/// Contains information about the storage destination.
class MultiLayerStorage {
  /// Contains information about a customer managed Amazon S3 bucket.
  final CustomerManagedS3Storage customerManagedS3Storage;

  MultiLayerStorage({
    required this.customerManagedS3Storage,
  });

  factory MultiLayerStorage.fromJson(Map<String, dynamic> json) {
    return MultiLayerStorage(
      customerManagedS3Storage: CustomerManagedS3Storage.fromJson(
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

enum Permission {
  administrator,
  viewer,
}

extension PermissionValueExtension on Permission {
  String toValue() {
    switch (this) {
      case Permission.administrator:
        return 'ADMINISTRATOR';
      case Permission.viewer:
        return 'VIEWER';
    }
  }
}

extension PermissionFromString on String {
  Permission toPermission() {
    switch (this) {
      case 'ADMINISTRATOR':
        return Permission.administrator;
      case 'VIEWER':
        return Permission.viewer;
    }
    throw Exception('$this is not known in enum Permission');
  }
}

/// Identifies an IoT SiteWise Monitor portal.
class PortalResource {
  /// The ID of the portal.
  final String id;

  PortalResource({
    required this.id,
  });

  factory PortalResource.fromJson(Map<String, dynamic> json) {
    return PortalResource(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

enum PortalState {
  creating,
  updating,
  deleting,
  active,
  failed,
}

extension PortalStateValueExtension on PortalState {
  String toValue() {
    switch (this) {
      case PortalState.creating:
        return 'CREATING';
      case PortalState.updating:
        return 'UPDATING';
      case PortalState.deleting:
        return 'DELETING';
      case PortalState.active:
        return 'ACTIVE';
      case PortalState.failed:
        return 'FAILED';
    }
  }
}

extension PortalStateFromString on String {
  PortalState toPortalState() {
    switch (this) {
      case 'CREATING':
        return PortalState.creating;
      case 'UPDATING':
        return PortalState.updating;
      case 'DELETING':
        return PortalState.deleting;
      case 'ACTIVE':
        return PortalState.active;
      case 'FAILED':
        return PortalState.failed;
    }
    throw Exception('$this is not known in enum PortalState');
  }
}

/// Contains information about the current status of a portal.
class PortalStatus {
  /// The current state of the portal.
  final PortalState state;

  /// Contains associated error information, if any.
  final MonitorErrorDetails? error;

  PortalStatus({
    required this.state,
    this.error,
  });

  factory PortalStatus.fromJson(Map<String, dynamic> json) {
    return PortalStatus(
      state: (json['state'] as String).toPortalState(),
      error: json['error'] != null
          ? MonitorErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final error = this.error;
    return {
      'state': state.toValue(),
      if (error != null) 'error': error,
    };
  }
}

/// Contains a portal summary.
class PortalSummary {
  /// The ID of the portal.
  final String id;

  /// The name of the portal.
  final String name;

  /// The URL for the IoT SiteWise Monitor portal. You can use this URL to access
  /// portals that use IAM Identity Center for authentication. For portals that
  /// use IAM for authentication, you must use the IoT SiteWise console to get a
  /// URL that you can use to access the portal.
  final String startUrl;
  final PortalStatus status;

  /// The date the portal was created, in Unix epoch time.
  final DateTime? creationDate;

  /// The portal's description.
  final String? description;

  /// The date the portal was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the service role that allows the portal's users to access your IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for IoT SiteWise Monitor</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? roleArn;

  PortalSummary({
    required this.id,
    required this.name,
    required this.startUrl,
    required this.status,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
    this.roleArn,
  });

  factory PortalSummary.fromJson(Map<String, dynamic> json) {
    return PortalSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      startUrl: json['startUrl'] as String,
      status: PortalStatus.fromJson(json['status'] as Map<String, dynamic>),
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final startUrl = this.startUrl;
    final status = this.status;
    final creationDate = this.creationDate;
    final description = this.description;
    final lastUpdateDate = this.lastUpdateDate;
    final roleArn = this.roleArn;
    return {
      'id': id,
      'name': name,
      'startUrl': startUrl,
      'status': status,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (description != null) 'description': description,
      if (lastUpdateDate != null)
        'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Identifies a specific IoT SiteWise Monitor project.
class ProjectResource {
  /// The ID of the project.
  final String id;

  ProjectResource({
    required this.id,
  });

  factory ProjectResource.fromJson(Map<String, dynamic> json) {
    return ProjectResource(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Contains project summary information.
class ProjectSummary {
  /// The ID of the project.
  final String id;

  /// The name of the project.
  final String name;

  /// The date the project was created, in Unix epoch time.
  final DateTime? creationDate;

  /// The project's description.
  final String? description;

  /// The date the project was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  ProjectSummary({
    required this.id,
    required this.name,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
  });

  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final creationDate = this.creationDate;
    final description = this.description;
    final lastUpdateDate = this.lastUpdateDate;
    return {
      'id': id,
      'name': name,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (description != null) 'description': description,
      if (lastUpdateDate != null)
        'lastUpdateDate': unixTimestampToJson(lastUpdateDate),
    };
  }
}

/// Contains asset property information.
class Property {
  /// The property data type.
  final PropertyDataType dataType;

  /// The ID of the asset property.
  final String id;

  /// The name of the property.
  final String name;

  /// The alias that identifies the property, such as an OPC-UA server data stream
  /// path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>).
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? alias;

  /// The asset property's notification topic and state. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  final PropertyNotification? notification;

  /// The property type (see <code>PropertyType</code>). A property contains one
  /// type.
  final PropertyType? type;

  /// The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset
  /// property.
  final String? unit;

  Property({
    required this.dataType,
    required this.id,
    required this.name,
    this.alias,
    this.notification,
    this.type,
    this.unit,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      id: json['id'] as String,
      name: json['name'] as String,
      alias: json['alias'] as String?,
      notification: json['notification'] != null
          ? PropertyNotification.fromJson(
              json['notification'] as Map<String, dynamic>)
          : null,
      type: json['type'] != null
          ? PropertyType.fromJson(json['type'] as Map<String, dynamic>)
          : null,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final id = this.id;
    final name = this.name;
    final alias = this.alias;
    final notification = this.notification;
    final type = this.type;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'id': id,
      'name': name,
      if (alias != null) 'alias': alias,
      if (notification != null) 'notification': notification,
      if (type != null) 'type': type,
      if (unit != null) 'unit': unit,
    };
  }
}

enum PropertyDataType {
  string,
  integer,
  double,
  boolean,
  struct,
}

extension PropertyDataTypeValueExtension on PropertyDataType {
  String toValue() {
    switch (this) {
      case PropertyDataType.string:
        return 'STRING';
      case PropertyDataType.integer:
        return 'INTEGER';
      case PropertyDataType.double:
        return 'DOUBLE';
      case PropertyDataType.boolean:
        return 'BOOLEAN';
      case PropertyDataType.struct:
        return 'STRUCT';
    }
  }
}

extension PropertyDataTypeFromString on String {
  PropertyDataType toPropertyDataType() {
    switch (this) {
      case 'STRING':
        return PropertyDataType.string;
      case 'INTEGER':
        return PropertyDataType.integer;
      case 'DOUBLE':
        return PropertyDataType.double;
      case 'BOOLEAN':
        return PropertyDataType.boolean;
      case 'STRUCT':
        return PropertyDataType.struct;
    }
    throw Exception('$this is not known in enum PropertyDataType');
  }
}

/// Contains asset property value notification information. When the
/// notification state is enabled, IoT SiteWise publishes property value updates
/// to a unique MQTT topic. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting
/// with other services</a> in the <i>IoT SiteWise User Guide</i>.
class PropertyNotification {
  /// The current notification state.
  final PropertyNotificationState state;

  /// The MQTT topic to which IoT SiteWise publishes property value update
  /// notifications.
  final String topic;

  PropertyNotification({
    required this.state,
    required this.topic,
  });

  factory PropertyNotification.fromJson(Map<String, dynamic> json) {
    return PropertyNotification(
      state: (json['state'] as String).toPropertyNotificationState(),
      topic: json['topic'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final topic = this.topic;
    return {
      'state': state.toValue(),
      'topic': topic,
    };
  }
}

enum PropertyNotificationState {
  enabled,
  disabled,
}

extension PropertyNotificationStateValueExtension on PropertyNotificationState {
  String toValue() {
    switch (this) {
      case PropertyNotificationState.enabled:
        return 'ENABLED';
      case PropertyNotificationState.disabled:
        return 'DISABLED';
    }
  }
}

extension PropertyNotificationStateFromString on String {
  PropertyNotificationState toPropertyNotificationState() {
    switch (this) {
      case 'ENABLED':
        return PropertyNotificationState.enabled;
      case 'DISABLED':
        return PropertyNotificationState.disabled;
    }
    throw Exception('$this is not known in enum PropertyNotificationState');
  }
}

/// Contains a property type, which can be one of <code>attribute</code>,
/// <code>measurement</code>, <code>metric</code>, or <code>transform</code>.
class PropertyType {
  /// Specifies an asset attribute property. An attribute generally contains
  /// static information, such as the serial number of an <a
  /// href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">IIoT</a>
  /// wind turbine.
  final Attribute? attribute;

  /// Specifies an asset measurement property. A measurement represents a device's
  /// raw sensor data stream, such as timestamped temperature values or
  /// timestamped power values.
  final Measurement? measurement;

  /// Specifies an asset metric property. A metric contains a mathematical
  /// expression that uses aggregate functions to process all input data points
  /// over a time interval and output a single data point, such as to calculate
  /// the average hourly temperature.
  final Metric? metric;

  /// Specifies an asset transform property. A transform contains a mathematical
  /// expression that maps a property's data points from one form to another, such
  /// as a unit conversion from Celsius to Fahrenheit.
  final Transform? transform;

  PropertyType({
    this.attribute,
    this.measurement,
    this.metric,
    this.transform,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) {
    return PropertyType(
      attribute: json['attribute'] != null
          ? Attribute.fromJson(json['attribute'] as Map<String, dynamic>)
          : null,
      measurement: json['measurement'] != null
          ? Measurement.fromJson(json['measurement'] as Map<String, dynamic>)
          : null,
      metric: json['metric'] != null
          ? Metric.fromJson(json['metric'] as Map<String, dynamic>)
          : null,
      transform: json['transform'] != null
          ? Transform.fromJson(json['transform'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final measurement = this.measurement;
    final metric = this.metric;
    final transform = this.transform;
    return {
      if (attribute != null) 'attribute': attribute,
      if (measurement != null) 'measurement': measurement,
      if (metric != null) 'metric': metric,
      if (transform != null) 'transform': transform,
    };
  }
}

/// Contains a list of value updates for an asset property in the list of asset
/// entries consumed by the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a>
/// API operation.
class PutAssetPropertyValueEntry {
  /// The user specified ID for the entry. You can use this ID to identify which
  /// entries failed.
  final String entryId;

  /// The list of property values to upload. You can specify up to 10
  /// <code>propertyValues</code> array elements.
  final List<AssetPropertyValue> propertyValues;

  /// The ID of the asset to update.
  final String? assetId;

  /// The alias that identifies the property, such as an OPC-UA server data stream
  /// path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>).
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>IoT SiteWise User
  /// Guide</i>.
  final String? propertyAlias;

  /// The ID of the asset property for this entry.
  final String? propertyId;

  PutAssetPropertyValueEntry({
    required this.entryId,
    required this.propertyValues,
    this.assetId,
    this.propertyAlias,
    this.propertyId,
  });

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final propertyValues = this.propertyValues;
    final assetId = this.assetId;
    final propertyAlias = this.propertyAlias;
    final propertyId = this.propertyId;
    return {
      'entryId': entryId,
      'propertyValues': propertyValues,
      if (assetId != null) 'assetId': assetId,
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyId != null) 'propertyId': propertyId,
    };
  }
}

class PutDefaultEncryptionConfigurationResponse {
  /// The status of the account configuration. This contains the
  /// <code>ConfigurationState</code>. If there is an error, it also contains the
  /// <code>ErrorDetails</code>.
  final ConfigurationStatus configurationStatus;

  /// The type of encryption used for the encryption configuration.
  final EncryptionType encryptionType;

  /// The Key ARN of the KMS key used for KMS encryption if you use
  /// <code>KMS_BASED_ENCRYPTION</code>.
  final String? kmsKeyArn;

  PutDefaultEncryptionConfigurationResponse({
    required this.configurationStatus,
    required this.encryptionType,
    this.kmsKeyArn,
  });

  factory PutDefaultEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutDefaultEncryptionConfigurationResponse(
      configurationStatus: ConfigurationStatus.fromJson(
          json['configurationStatus'] as Map<String, dynamic>),
      encryptionType: (json['encryptionType'] as String).toEncryptionType(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationStatus = this.configurationStatus;
    final encryptionType = this.encryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'configurationStatus': configurationStatus,
      'encryptionType': encryptionType.toValue(),
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

class PutLoggingOptionsResponse {
  PutLoggingOptionsResponse();

  factory PutLoggingOptionsResponse.fromJson(Map<String, dynamic> _) {
    return PutLoggingOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutStorageConfigurationResponse {
  final ConfigurationStatus configurationStatus;

  /// The storage tier that you specified for your data. The
  /// <code>storageType</code> parameter can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>SITEWISE_DEFAULT_STORAGE</code> – IoT SiteWise saves your data into
  /// the hot tier. The hot tier is a service-managed database.
  /// </li>
  /// <li>
  /// <code>MULTI_LAYER_STORAGE</code> – IoT SiteWise saves your data in both the
  /// cold tier and the hot tier. The cold tier is a customer-managed Amazon S3
  /// bucket.
  /// </li>
  /// </ul>
  final StorageType storageType;

  /// Contains the storage configuration for time series (data streams) that
  /// aren't associated with asset properties. The
  /// <code>disassociatedDataStorage</code> can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – IoT SiteWise accepts time series that aren't
  /// associated with asset properties.
  /// <important>
  /// After the <code>disassociatedDataStorage</code> is enabled, you can't
  /// disable it.
  /// </important> </li>
  /// <li>
  /// <code>DISABLED</code> – IoT SiteWise doesn't accept time series (data
  /// streams) that aren't associated with asset properties.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/data-streams.html">Data
  /// streams</a> in the <i>IoT SiteWise User Guide</i>.
  final DisassociatedDataStorageState? disassociatedDataStorage;

  /// Contains information about the storage destination.
  final MultiLayerStorage? multiLayerStorage;
  final RetentionPeriod? retentionPeriod;

  PutStorageConfigurationResponse({
    required this.configurationStatus,
    required this.storageType,
    this.disassociatedDataStorage,
    this.multiLayerStorage,
    this.retentionPeriod,
  });

  factory PutStorageConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return PutStorageConfigurationResponse(
      configurationStatus: ConfigurationStatus.fromJson(
          json['configurationStatus'] as Map<String, dynamic>),
      storageType: (json['storageType'] as String).toStorageType(),
      disassociatedDataStorage: (json['disassociatedDataStorage'] as String?)
          ?.toDisassociatedDataStorageState(),
      multiLayerStorage: json['multiLayerStorage'] != null
          ? MultiLayerStorage.fromJson(
              json['multiLayerStorage'] as Map<String, dynamic>)
          : null,
      retentionPeriod: json['retentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['retentionPeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationStatus = this.configurationStatus;
    final storageType = this.storageType;
    final disassociatedDataStorage = this.disassociatedDataStorage;
    final multiLayerStorage = this.multiLayerStorage;
    final retentionPeriod = this.retentionPeriod;
    return {
      'configurationStatus': configurationStatus,
      'storageType': storageType.toValue(),
      if (disassociatedDataStorage != null)
        'disassociatedDataStorage': disassociatedDataStorage.toValue(),
      if (multiLayerStorage != null) 'multiLayerStorage': multiLayerStorage,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
    };
  }
}

enum Quality {
  good,
  bad,
  uncertain,
}

extension QualityValueExtension on Quality {
  String toValue() {
    switch (this) {
      case Quality.good:
        return 'GOOD';
      case Quality.bad:
        return 'BAD';
      case Quality.uncertain:
        return 'UNCERTAIN';
    }
  }
}

extension QualityFromString on String {
  Quality toQuality() {
    switch (this) {
      case 'GOOD':
        return Quality.good;
      case 'BAD':
        return Quality.bad;
      case 'UNCERTAIN':
        return Quality.uncertain;
    }
    throw Exception('$this is not known in enum Quality');
  }
}

/// Contains an IoT SiteWise Monitor resource ID for a portal or project.
class Resource {
  /// A portal resource.
  final PortalResource? portal;

  /// A project resource.
  final ProjectResource? project;

  Resource({
    this.portal,
    this.project,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      portal: json['portal'] != null
          ? PortalResource.fromJson(json['portal'] as Map<String, dynamic>)
          : null,
      project: json['project'] != null
          ? ProjectResource.fromJson(json['project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final portal = this.portal;
    final project = this.project;
    return {
      if (portal != null) 'portal': portal,
      if (project != null) 'project': project,
    };
  }
}

enum ResourceType {
  portal,
  project,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.portal:
        return 'PORTAL';
      case ResourceType.project:
        return 'PROJECT';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'PORTAL':
        return ResourceType.portal;
      case 'PROJECT':
        return ResourceType.project;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// How many days your data is kept in the hot tier. By default, your data is
/// kept indefinitely in the hot tier.
class RetentionPeriod {
  /// The number of days that your data is kept.
  /// <note>
  /// If you specified a value for this parameter, the <code>unlimited</code>
  /// parameter must be <code>false</code>.
  /// </note>
  final int? numberOfDays;

  /// If true, your data is kept indefinitely.
  /// <note>
  /// If configured to <code>true</code>, you must not specify a value for the
  /// <code>numberOfDays</code> parameter.
  /// </note>
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

enum StorageType {
  sitewiseDefaultStorage,
  multiLayerStorage,
}

extension StorageTypeValueExtension on StorageType {
  String toValue() {
    switch (this) {
      case StorageType.sitewiseDefaultStorage:
        return 'SITEWISE_DEFAULT_STORAGE';
      case StorageType.multiLayerStorage:
        return 'MULTI_LAYER_STORAGE';
    }
  }
}

extension StorageTypeFromString on String {
  StorageType toStorageType() {
    switch (this) {
      case 'SITEWISE_DEFAULT_STORAGE':
        return StorageType.sitewiseDefaultStorage;
      case 'MULTI_LAYER_STORAGE':
        return StorageType.multiLayerStorage;
    }
    throw Exception('$this is not known in enum StorageType');
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

/// Contains a timestamp with optional nanosecond granularity.
class TimeInNanos {
  /// The timestamp date, in seconds, in the Unix epoch format. Fractional
  /// nanosecond data is provided by <code>offsetInNanos</code>.
  final int timeInSeconds;

  /// The nanosecond offset from <code>timeInSeconds</code>.
  final int? offsetInNanos;

  TimeInNanos({
    required this.timeInSeconds,
    this.offsetInNanos,
  });

  factory TimeInNanos.fromJson(Map<String, dynamic> json) {
    return TimeInNanos(
      timeInSeconds: json['timeInSeconds'] as int,
      offsetInNanos: json['offsetInNanos'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeInSeconds = this.timeInSeconds;
    final offsetInNanos = this.offsetInNanos;
    return {
      'timeInSeconds': timeInSeconds,
      if (offsetInNanos != null) 'offsetInNanos': offsetInNanos,
    };
  }
}

enum TimeOrdering {
  ascending,
  descending,
}

extension TimeOrderingValueExtension on TimeOrdering {
  String toValue() {
    switch (this) {
      case TimeOrdering.ascending:
        return 'ASCENDING';
      case TimeOrdering.descending:
        return 'DESCENDING';
    }
  }
}

extension TimeOrderingFromString on String {
  TimeOrdering toTimeOrdering() {
    switch (this) {
      case 'ASCENDING':
        return TimeOrdering.ascending;
      case 'DESCENDING':
        return TimeOrdering.descending;
    }
    throw Exception('$this is not known in enum TimeOrdering');
  }
}

/// Contains a summary of a time series (data stream).
class TimeSeriesSummary {
  /// The data type of the time series.
  ///
  /// If you specify <code>STRUCT</code>, you must also specify
  /// <code>dataTypeSpec</code> to identify the type of the structure for this
  /// time series.
  final PropertyDataType dataType;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the time series, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:time-series/${TimeSeriesId}</code>
  final String timeSeriesArn;

  /// The date that the time series was created, in Unix epoch time.
  final DateTime timeSeriesCreationDate;

  /// The ID of the time series.
  final String timeSeriesId;

  /// The date that the time series was last updated, in Unix epoch time.
  final DateTime timeSeriesLastUpdateDate;

  /// The alias that identifies the time series.
  final String? alias;

  /// The ID of the asset in which the asset property was created.
  final String? assetId;

  /// The data type of the structure for this time series. This parameter is
  /// required for time series that have the <code>STRUCT</code> data type.
  ///
  /// The options for this parameter depend on the type of the composite model in
  /// which you created the asset property that is associated with your time
  /// series. Use <code>AWS/ALARM_STATE</code> for alarm state in alarm composite
  /// models.
  final String? dataTypeSpec;

  /// The ID of the asset property.
  final String? propertyId;

  TimeSeriesSummary({
    required this.dataType,
    required this.timeSeriesArn,
    required this.timeSeriesCreationDate,
    required this.timeSeriesId,
    required this.timeSeriesLastUpdateDate,
    this.alias,
    this.assetId,
    this.dataTypeSpec,
    this.propertyId,
  });

  factory TimeSeriesSummary.fromJson(Map<String, dynamic> json) {
    return TimeSeriesSummary(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      timeSeriesArn: json['timeSeriesArn'] as String,
      timeSeriesCreationDate: nonNullableTimeStampFromJson(
          json['timeSeriesCreationDate'] as Object),
      timeSeriesId: json['timeSeriesId'] as String,
      timeSeriesLastUpdateDate: nonNullableTimeStampFromJson(
          json['timeSeriesLastUpdateDate'] as Object),
      alias: json['alias'] as String?,
      assetId: json['assetId'] as String?,
      dataTypeSpec: json['dataTypeSpec'] as String?,
      propertyId: json['propertyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final timeSeriesArn = this.timeSeriesArn;
    final timeSeriesCreationDate = this.timeSeriesCreationDate;
    final timeSeriesId = this.timeSeriesId;
    final timeSeriesLastUpdateDate = this.timeSeriesLastUpdateDate;
    final alias = this.alias;
    final assetId = this.assetId;
    final dataTypeSpec = this.dataTypeSpec;
    final propertyId = this.propertyId;
    return {
      'dataType': dataType.toValue(),
      'timeSeriesArn': timeSeriesArn,
      'timeSeriesCreationDate': unixTimestampToJson(timeSeriesCreationDate),
      'timeSeriesId': timeSeriesId,
      'timeSeriesLastUpdateDate': unixTimestampToJson(timeSeriesLastUpdateDate),
      if (alias != null) 'alias': alias,
      if (assetId != null) 'assetId': assetId,
      if (dataTypeSpec != null) 'dataTypeSpec': dataTypeSpec,
      if (propertyId != null) 'propertyId': propertyId,
    };
  }
}

/// Contains an asset transform property. A transform is a one-to-one mapping of
/// a property's data points from one form to another. For example, you can use
/// a transform to convert a Celsius data stream to Fahrenheit by applying the
/// transformation expression to each data point of the Celsius stream. A
/// transform can only have a data type of <code>DOUBLE</code> and consume
/// properties with data types of <code>INTEGER</code> or <code>DOUBLE</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#transforms">Transforms</a>
/// in the <i>IoT SiteWise User Guide</i>.
class Transform {
  /// The mathematical expression that defines the transformation function. You
  /// can specify up to 10 variables per expression. You can specify up to 10
  /// functions per expression.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>IoT SiteWise User Guide</i>.
  final String expression;

  /// The list of variables used in the expression.
  final List<ExpressionVariable> variables;

  /// The processing configuration for the given transform property. You can
  /// configure transforms to be kept at the edge or forwarded to the Amazon Web
  /// Services Cloud. You can also configure transforms to be computed at the edge
  /// or in the cloud.
  final TransformProcessingConfig? processingConfig;

  Transform({
    required this.expression,
    required this.variables,
    this.processingConfig,
  });

  factory Transform.fromJson(Map<String, dynamic> json) {
    return Transform(
      expression: json['expression'] as String,
      variables: (json['variables'] as List)
          .whereNotNull()
          .map((e) => ExpressionVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      processingConfig: json['processingConfig'] != null
          ? TransformProcessingConfig.fromJson(
              json['processingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final variables = this.variables;
    final processingConfig = this.processingConfig;
    return {
      'expression': expression,
      'variables': variables,
      if (processingConfig != null) 'processingConfig': processingConfig,
    };
  }
}

/// The processing configuration for the given transform property. You can
/// configure transforms to be kept at the edge or forwarded to the Amazon Web
/// Services Cloud. You can also configure transforms to be computed at the edge
/// or in the cloud.
class TransformProcessingConfig {
  /// The compute location for the given transform property.
  final ComputeLocation computeLocation;
  final ForwardingConfig? forwardingConfig;

  TransformProcessingConfig({
    required this.computeLocation,
    this.forwardingConfig,
  });

  factory TransformProcessingConfig.fromJson(Map<String, dynamic> json) {
    return TransformProcessingConfig(
      computeLocation: (json['computeLocation'] as String).toComputeLocation(),
      forwardingConfig: json['forwardingConfig'] != null
          ? ForwardingConfig.fromJson(
              json['forwardingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computeLocation = this.computeLocation;
    final forwardingConfig = this.forwardingConfig;
    return {
      'computeLocation': computeLocation.toValue(),
      if (forwardingConfig != null) 'forwardingConfig': forwardingConfig,
    };
  }
}

enum TraversalDirection {
  parent,
  child,
}

extension TraversalDirectionValueExtension on TraversalDirection {
  String toValue() {
    switch (this) {
      case TraversalDirection.parent:
        return 'PARENT';
      case TraversalDirection.child:
        return 'CHILD';
    }
  }
}

extension TraversalDirectionFromString on String {
  TraversalDirection toTraversalDirection() {
    switch (this) {
      case 'PARENT':
        return TraversalDirection.parent;
      case 'CHILD':
        return TraversalDirection.child;
    }
    throw Exception('$this is not known in enum TraversalDirection');
  }
}

enum TraversalType {
  pathToRoot,
}

extension TraversalTypeValueExtension on TraversalType {
  String toValue() {
    switch (this) {
      case TraversalType.pathToRoot:
        return 'PATH_TO_ROOT';
    }
  }
}

extension TraversalTypeFromString on String {
  TraversalType toTraversalType() {
    switch (this) {
      case 'PATH_TO_ROOT':
        return TraversalType.pathToRoot;
    }
    throw Exception('$this is not known in enum TraversalType');
  }
}

/// Contains a tumbling window, which is a repeating fixed-sized,
/// non-overlapping, and contiguous time window. You can use this window in
/// metrics to aggregate data from properties and other assets.
///
/// You can use <code>m</code>, <code>h</code>, <code>d</code>, and
/// <code>w</code> when you specify an interval or offset. Note that
/// <code>m</code> represents minutes, <code>h</code> represents hours,
/// <code>d</code> represents days, and <code>w</code> represents weeks. You can
/// also use <code>s</code> to represent seconds in <code>offset</code>.
///
/// The <code>interval</code> and <code>offset</code> parameters support the <a
/// href="https://en.wikipedia.org/wiki/ISO_8601">ISO 8601 format</a>. For
/// example, <code>PT5S</code> represents 5 seconds, <code>PT5M</code>
/// represents 5 minutes, and <code>PT5H</code> represents 5 hours.
class TumblingWindow {
  /// The time interval for the tumbling window. The interval time must be between
  /// 1 minute and 1 week.
  ///
  /// IoT SiteWise computes the <code>1w</code> interval the end of Sunday at
  /// midnight each week (UTC), the <code>1d</code> interval at the end of each
  /// day at midnight (UTC), the <code>1h</code> interval at the end of each hour,
  /// and so on.
  ///
  /// When IoT SiteWise aggregates data points for metric computations, the start
  /// of each interval is exclusive and the end of each interval is inclusive. IoT
  /// SiteWise places the computed data point at the end of the interval.
  final String interval;

  /// The offset for the tumbling window. The <code>offset</code> parameter
  /// accepts the following:
  ///
  /// <ul>
  /// <li>
  /// The offset time.
  ///
  /// For example, if you specify <code>18h</code> for <code>offset</code> and
  /// <code>1d</code> for <code>interval</code>, IoT SiteWise aggregates data in
  /// one of the following ways:
  ///
  /// <ul>
  /// <li>
  /// If you create the metric before or at 6 PM (UTC), you get the first
  /// aggregation result at 6 PM (UTC) on the day when you create the metric.
  /// </li>
  /// <li>
  /// If you create the metric after 6 PM (UTC), you get the first aggregation
  /// result at 6 PM (UTC) the next day.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// The ISO 8601 format.
  ///
  /// For example, if you specify <code>PT18H</code> for <code>offset</code> and
  /// <code>1d</code> for <code>interval</code>, IoT SiteWise aggregates data in
  /// one of the following ways:
  ///
  /// <ul>
  /// <li>
  /// If you create the metric before or at 6 PM (UTC), you get the first
  /// aggregation result at 6 PM (UTC) on the day when you create the metric.
  /// </li>
  /// <li>
  /// If you create the metric after 6 PM (UTC), you get the first aggregation
  /// result at 6 PM (UTC) the next day.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// The 24-hour clock.
  ///
  /// For example, if you specify <code>00:03:00</code> for <code>offset</code>,
  /// <code>5m</code> for <code>interval</code>, and you create the metric at 2 PM
  /// (UTC), you get the first aggregation result at 2:03 PM (UTC). You get the
  /// second aggregation result at 2:08 PM (UTC).
  /// </li>
  /// <li>
  /// The offset time zone.
  ///
  /// For example, if you specify <code>2021-07-23T18:00-08</code> for
  /// <code>offset</code> and <code>1d</code> for <code>interval</code>, IoT
  /// SiteWise aggregates data in one of the following ways:
  ///
  /// <ul>
  /// <li>
  /// If you create the metric before or at 6 PM (PST), you get the first
  /// aggregation result at 6 PM (PST) on the day when you create the metric.
  /// </li>
  /// <li>
  /// If you create the metric after 6 PM (PST), you get the first aggregation
  /// result at 6 PM (PST) the next day.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? offset;

  TumblingWindow({
    required this.interval,
    this.offset,
  });

  factory TumblingWindow.fromJson(Map<String, dynamic> json) {
    return TumblingWindow(
      interval: json['interval'] as String,
      offset: json['offset'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final interval = this.interval;
    final offset = this.offset;
    return {
      'interval': interval,
      if (offset != null) 'offset': offset,
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

class UpdateAccessPolicyResponse {
  UpdateAccessPolicyResponse();

  factory UpdateAccessPolicyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAccessPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAssetModelResponse {
  /// The status of the asset model, which contains a state (<code>UPDATING</code>
  /// after successfully calling this operation) and any error message.
  final AssetModelStatus assetModelStatus;

  UpdateAssetModelResponse({
    required this.assetModelStatus,
  });

  factory UpdateAssetModelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssetModelResponse(
      assetModelStatus: AssetModelStatus.fromJson(
          json['assetModelStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final assetModelStatus = this.assetModelStatus;
    return {
      'assetModelStatus': assetModelStatus,
    };
  }
}

class UpdateAssetResponse {
  /// The status of the asset, which contains a state (<code>UPDATING</code> after
  /// successfully calling this operation) and any error message.
  final AssetStatus assetStatus;

  UpdateAssetResponse({
    required this.assetStatus,
  });

  factory UpdateAssetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssetResponse(
      assetStatus:
          AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final assetStatus = this.assetStatus;
    return {
      'assetStatus': assetStatus,
    };
  }
}

class UpdateDashboardResponse {
  UpdateDashboardResponse();

  factory UpdateDashboardResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDashboardResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateGatewayCapabilityConfigurationResponse {
  /// The namespace of the gateway capability.
  final String capabilityNamespace;

  /// The synchronization status of the capability configuration. The sync status
  /// can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_SYNC</code> – The gateway is running the capability configuration.
  /// </li>
  /// <li>
  /// <code>OUT_OF_SYNC</code> – The gateway hasn't received the capability
  /// configuration.
  /// </li>
  /// <li>
  /// <code>SYNC_FAILED</code> – The gateway rejected the capability
  /// configuration.
  /// </li>
  /// </ul>
  /// After you update a capability configuration, its sync status is
  /// <code>OUT_OF_SYNC</code> until the gateway receives and applies or rejects
  /// the updated configuration.
  final CapabilitySyncStatus capabilitySyncStatus;

  UpdateGatewayCapabilityConfigurationResponse({
    required this.capabilityNamespace,
    required this.capabilitySyncStatus,
  });

  factory UpdateGatewayCapabilityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateGatewayCapabilityConfigurationResponse(
      capabilityNamespace: json['capabilityNamespace'] as String,
      capabilitySyncStatus:
          (json['capabilitySyncStatus'] as String).toCapabilitySyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilityNamespace = this.capabilityNamespace;
    final capabilitySyncStatus = this.capabilitySyncStatus;
    return {
      'capabilityNamespace': capabilityNamespace,
      'capabilitySyncStatus': capabilitySyncStatus.toValue(),
    };
  }
}

class UpdatePortalResponse {
  /// The status of the portal, which contains a state (<code>UPDATING</code>
  /// after successfully calling this operation) and any error message.
  final PortalStatus portalStatus;

  UpdatePortalResponse({
    required this.portalStatus,
  });

  factory UpdatePortalResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePortalResponse(
      portalStatus:
          PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final portalStatus = this.portalStatus;
    return {
      'portalStatus': portalStatus,
    };
  }
}

class UpdateProjectResponse {
  UpdateProjectResponse();

  factory UpdateProjectResponse.fromJson(Map<String, dynamic> _) {
    return UpdateProjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information for a user identity in an access policy.
class UserIdentity {
  /// The IAM Identity Center ID of the user.
  final String id;

  UserIdentity({
    required this.id,
  });

  factory UserIdentity.fromJson(Map<String, dynamic> json) {
    return UserIdentity(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Identifies a property value used in an expression.
class VariableValue {
  /// The ID of the property to use as the variable. You can use the property
  /// <code>name</code> if it's from the same asset model.
  final String propertyId;

  /// The ID of the hierarchy to query for the property ID. You can use the
  /// hierarchy's name instead of the hierarchy's ID.
  ///
  /// You use a hierarchy ID instead of a model ID because you can have several
  /// hierarchies using the same model and therefore the same
  /// <code>propertyId</code>. For example, you might have separately grouped
  /// assets that come from the same asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>IoT SiteWise User Guide</i>.
  final String? hierarchyId;

  VariableValue({
    required this.propertyId,
    this.hierarchyId,
  });

  factory VariableValue.fromJson(Map<String, dynamic> json) {
    return VariableValue(
      propertyId: json['propertyId'] as String,
      hierarchyId: json['hierarchyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final propertyId = this.propertyId;
    final hierarchyId = this.hierarchyId;
    return {
      'propertyId': propertyId,
      if (hierarchyId != null) 'hierarchyId': hierarchyId,
    };
  }
}

/// Contains an asset property value (of a single type only).
class Variant {
  /// Asset property data of type Boolean (true or false).
  final bool? booleanValue;

  /// Asset property data of type double (floating point number).
  final double? doubleValue;

  /// Asset property data of type integer (whole number).
  final int? integerValue;

  /// Asset property data of type string (sequence of characters).
  final String? stringValue;

  Variant({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      integerValue: json['integerValue'] as int?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final integerValue = this.integerValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

class ConflictingOperationException extends _s.GenericAwsException {
  ConflictingOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConflictingOperationException',
            message: message);
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictingOperationException': (type, message) =>
      ConflictingOperationException(type: type, message: message),
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
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
