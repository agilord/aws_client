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

part '2019-12-02.g.dart';

/// Welcome to the AWS IoT SiteWise API Reference. AWS IoT SiteWise is an AWS
/// service that connects <a
/// href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">Industrial
/// Internet of Things (IIoT)</a> devices to the power of the AWS Cloud. For
/// more information, see the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/">AWS IoT
/// SiteWise User Guide</a>. For information about AWS IoT SiteWise quotas, see
/// <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
/// in the <i>AWS IoT SiteWise User Guide</i>.
class IoTSiteWise {
  final _s.RestJsonProtocol _protocol;
  IoTSiteWise({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotsitewise',
            signingName: 'iotsitewise',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates a child asset with the given parent asset through a hierarchy
  /// defined in the parent asset's model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/add-associated-assets.html">Associating
  /// assets</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
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
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> associateAssets({
    @_s.required String assetId,
    @_s.required String childAssetId,
    @_s.required String hierarchyId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(childAssetId, 'childAssetId');
    _s.validateStringLength(
      'childAssetId',
      childAssetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'childAssetId',
      childAssetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(hierarchyId, 'hierarchyId');
    _s.validateStringLength(
      'hierarchyId',
      hierarchyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'hierarchyId',
      hierarchyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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

  /// Associates a group (batch) of assets with an AWS IoT SiteWise Monitor
  /// project.
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
    @_s.required List<String> assetIds,
    @_s.required String projectId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(assetIds, 'assetIds');
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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

  /// Disassociates a group (batch) of assets from an AWS IoT SiteWise Monitor
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
    @_s.required List<String> assetIds,
    @_s.required String projectId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(assetIds, 'assetIds');
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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

  /// Sends a list of asset property values to AWS IoT SiteWise. Each value is a
  /// timestamp-quality-value (TQV) data point. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ingest-api.html">Ingesting
  /// data using the API</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// With respect to Unix epoch time, AWS IoT SiteWise accepts only TQVs that
  /// have a timestamp of no more than 7 days in the past and no more than 5
  /// minutes in the future. AWS IoT SiteWise rejects timestamps outside of the
  /// inclusive range of [-7 days, +5 minutes] and returns a
  /// <code>TimestampOutOfRangeException</code> error.
  ///
  /// For each asset property, AWS IoT SiteWise overwrites TQVs with duplicate
  /// timestamps unless the newer TQV has a different quality. For example, if
  /// you store a TQV <code>{T1, GOOD, V1}</code>, then storing <code>{T1, GOOD,
  /// V2}</code> replaces the existing TQV.
  /// </important>
  /// AWS IoT SiteWise authorizes access to each
  /// <code>BatchPutAssetPropertyValue</code> entry individually. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-batchputassetpropertyvalue-action">BatchPutAssetPropertyValue
  /// authorization</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
    @_s.required List<PutAssetPropertyValueEntry> entries,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
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

  /// Creates an access policy that grants the specified identity (AWS SSO user,
  /// AWS SSO group, or IAM user) access to the specified AWS IoT SiteWise
  /// Monitor portal or project resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accessPolicyIdentity] :
  /// The identity for this access policy. Choose an AWS SSO user, an AWS SSO
  /// group, or an IAM user.
  ///
  /// Parameter [accessPolicyPermission] :
  /// The permission level for this access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  ///
  /// Parameter [accessPolicyResource] :
  /// The AWS IoT SiteWise Monitor resource for this access policy. Choose
  /// either a portal or a project.
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
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateAccessPolicyResponse> createAccessPolicy({
    @_s.required Identity accessPolicyIdentity,
    @_s.required Permission accessPolicyPermission,
    @_s.required Resource accessPolicyResource,
    String clientToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(accessPolicyIdentity, 'accessPolicyIdentity');
    ArgumentError.checkNotNull(
        accessPolicyPermission, 'accessPolicyPermission');
    ArgumentError.checkNotNull(accessPolicyResource, 'accessPolicyResource');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    final $payload = <String, dynamic>{
      'accessPolicyIdentity': accessPolicyIdentity,
      'accessPolicyPermission': accessPolicyPermission?.toValue() ?? '',
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
  /// assets</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// A unique, friendly name for the asset.
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
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateAssetResponse> createAsset({
    @_s.required String assetModelId,
    @_s.required String assetName,
    String clientToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(assetModelId, 'assetModelId');
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetModelId',
      assetModelId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(assetName, 'assetName');
    _s.validateStringLength(
      'assetName',
      assetName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetName',
      assetName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    final $payload = <String, dynamic>{
      'assetModelId': assetModelId,
      'assetName': assetName,
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
  /// asset models</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 10 hierarchies per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [assetModelProperties] :
  /// The property definitions of the asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset
  /// properties</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 200 properties per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateAssetModelResponse> createAssetModel({
    @_s.required String assetModelName,
    List<AssetModelCompositeModelDefinition> assetModelCompositeModels,
    String assetModelDescription,
    List<AssetModelHierarchyDefinition> assetModelHierarchies,
    List<AssetModelPropertyDefinition> assetModelProperties,
    String clientToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(assetModelName, 'assetModelName');
    _s.validateStringLength(
      'assetModelName',
      assetModelName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetModelName',
      assetModelName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'assetModelDescription',
      assetModelDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'assetModelDescription',
      assetModelDescription,
      r'''[^\u0000-\u001F\u007F]+''',
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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

  /// Creates a dashboard in an AWS IoT SiteWise Monitor project.
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
  /// dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateDashboardResponse> createDashboard({
    @_s.required String dashboardDefinition,
    @_s.required String dashboardName,
    @_s.required String projectId,
    String clientToken,
    String dashboardDescription,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(dashboardDefinition, 'dashboardDefinition');
    _s.validateStringLength(
      'dashboardDefinition',
      dashboardDefinition,
      0,
      204800,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardDefinition',
      dashboardDefinition,
      r'''.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardName, 'dashboardName');
    _s.validateStringLength(
      'dashboardName',
      dashboardName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardName',
      dashboardName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    _s.validateStringLength(
      'dashboardDescription',
      dashboardDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'dashboardDescription',
      dashboardDescription,
      r'''[^\u0000-\u001F\u007F]+''',
    );
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
  /// industrial data streams from local servers to AWS IoT SiteWise. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting
  /// data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateGatewayResponse> createGateway({
    @_s.required String gatewayName,
    @_s.required GatewayPlatform gatewayPlatform,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(gatewayName, 'gatewayName');
    _s.validateStringLength(
      'gatewayName',
      gatewayName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gatewayName',
      gatewayName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayPlatform, 'gatewayPlatform');
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

  /// Creates a portal, which can contain projects and dashboards. AWS IoT
  /// SiteWise Monitor uses AWS SSO or IAM to authenticate portal users and
  /// manage user permissions.
  /// <note>
  /// Before you can sign in to a new portal, you must add at least one identity
  /// to that portal. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/administer-portals.html#portal-change-admins">Adding
  /// or removing portal administrators</a> in the <i>AWS IoT SiteWise User
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
  /// The AWS administrator's contact email address.
  ///
  /// Parameter [portalName] :
  /// A friendly name for the portal.
  ///
  /// Parameter [roleArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of a service role that allows the portal's users to access your AWS IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [portalAuthMode] :
  /// The service to use to authenticate users to the portal. Choose from the
  /// following options:
  ///
  /// <ul>
  /// <li>
  /// <code>SSO</code> – The portal uses AWS Single Sign-On to authenticate
  /// users and manage user permissions. Before you can create a portal that
  /// uses AWS SSO, you must enable AWS SSO. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-get-started.html#mon-gs-sso">Enabling
  /// AWS SSO</a> in the <i>AWS IoT SiteWise User Guide</i>. This option is only
  /// available in AWS Regions other than the China Regions.
  /// </li>
  /// <li>
  /// <code>IAM</code> – The portal uses AWS Identity and Access Management
  /// (IAM) to authenticate users and manage user permissions. This option is
  /// only available in the China Regions.
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
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreatePortalResponse> createPortal({
    @_s.required String portalContactEmail,
    @_s.required String portalName,
    @_s.required String roleArn,
    String clientToken,
    AuthMode portalAuthMode,
    String portalDescription,
    ImageFile portalLogoImageFile,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(portalContactEmail, 'portalContactEmail');
    _s.validateStringLength(
      'portalContactEmail',
      portalContactEmail,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalContactEmail',
      portalContactEmail,
      r'''[^@]+@[^@]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(portalName, 'portalName');
    _s.validateStringLength(
      'portalName',
      portalName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalName',
      portalName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    _s.validateStringLength(
      'portalDescription',
      portalDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'portalDescription',
      portalDescription,
      r'''[^\u0000-\u001F\u007F]+''',
    );
    final $payload = <String, dynamic>{
      'portalContactEmail': portalContactEmail,
      'portalName': portalName,
      'roleArn': roleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateProjectResponse> createProject({
    @_s.required String portalId,
    @_s.required String projectName,
    String clientToken,
    String projectDescription,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalId',
      portalId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    _s.validateStringLength(
      'projectDescription',
      projectDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'projectDescription',
      projectDescription,
      r'''[^\u0000-\u001F\u007F]+''',
    );
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
  /// specified AWS IoT SiteWise Monitor resource. You can use this operation to
  /// revoke access to an AWS IoT SiteWise Monitor resource.
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
    @_s.required String accessPolicyId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(accessPolicyId, 'accessPolicyId');
    _s.validateStringLength(
      'accessPolicyId',
      accessPolicyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessPolicyId',
      accessPolicyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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
    return DeleteAccessPolicyResponse.fromJson(response);
  }

  /// Deletes an asset. This action can't be undone. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting
  /// assets and models</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
    @_s.required String assetId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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
  /// assets and models</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
    @_s.required String assetModelId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(assetModelId, 'assetModelId');
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetModelId',
      assetModelId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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

  /// Deletes a dashboard from AWS IoT SiteWise Monitor.
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
    @_s.required String dashboardId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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
    return DeleteDashboardResponse.fromJson(response);
  }

  /// Deletes a gateway from AWS IoT SiteWise. When you delete a gateway, some
  /// of the gateway's files remain in your gateway's file system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway to delete.
  Future<void> deleteGateway({
    @_s.required String gatewayId,
  }) async {
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gatewayId',
      gatewayId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/20200301/gateways/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a portal from AWS IoT SiteWise Monitor.
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
    @_s.required String portalId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalId',
      portalId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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

  /// Deletes a project from AWS IoT SiteWise Monitor.
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
    @_s.required String projectId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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
    return DeleteProjectResponse.fromJson(response);
  }

  /// Describes an access policy, which specifies an identity's access to an AWS
  /// IoT SiteWise Monitor portal or project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessPolicyId] :
  /// The ID of the access policy.
  Future<DescribeAccessPolicyResponse> describeAccessPolicy({
    @_s.required String accessPolicyId,
  }) async {
    ArgumentError.checkNotNull(accessPolicyId, 'accessPolicyId');
    _s.validateStringLength(
      'accessPolicyId',
      accessPolicyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessPolicyId',
      accessPolicyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
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
  Future<DescribeAssetResponse> describeAsset({
    @_s.required String assetId,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}',
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
  Future<DescribeAssetModelResponse> describeAssetModel({
    @_s.required String assetModelId,
  }) async {
    ArgumentError.checkNotNull(assetModelId, 'assetModelId');
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetModelId',
      assetModelId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/asset-models/${Uri.encodeComponent(assetModelId)}',
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
    @_s.required String assetId,
    @_s.required String propertyId,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(propertyId, 'propertyId');
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'propertyId',
      propertyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assets/${Uri.encodeComponent(assetId)}/properties/${Uri.encodeComponent(propertyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAssetPropertyResponse.fromJson(response);
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
    @_s.required String dashboardId,
  }) async {
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dashboards/${Uri.encodeComponent(dashboardId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDashboardResponse.fromJson(response);
  }

  /// Retrieves information about the default encryption configuration for the
  /// AWS account in the default or specified region. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html">Key
  /// management</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
    @_s.required String gatewayId,
  }) async {
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gatewayId',
      gatewayId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
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
  /// define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all
  /// of your OPC-UA sources are stored in one capability configuration. To list
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
  /// configure OPC-UA sources from the AWS IoT SiteWise console, your OPC-UA
  /// capability configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where
  /// <code>version</code> is a number such as <code>1</code>.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway that defines the capability configuration.
  Future<DescribeGatewayCapabilityConfigurationResponse>
      describeGatewayCapabilityConfiguration({
    @_s.required String capabilityNamespace,
    @_s.required String gatewayId,
  }) async {
    ArgumentError.checkNotNull(capabilityNamespace, 'capabilityNamespace');
    _s.validateStringLength(
      'capabilityNamespace',
      capabilityNamespace,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'capabilityNamespace',
      capabilityNamespace,
      r'''^[a-zA-Z]+:[a-zA-Z]+:[0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gatewayId',
      gatewayId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/20200301/gateways/${Uri.encodeComponent(gatewayId)}/capability/${Uri.encodeComponent(capabilityNamespace)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGatewayCapabilityConfigurationResponse.fromJson(response);
  }

  /// Retrieves the current AWS IoT SiteWise logging options.
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
    @_s.required String portalId,
  }) async {
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalId',
      portalId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
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
    @_s.required String projectId,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProjectResponse.fromJson(response);
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
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> disassociateAssets({
    @_s.required String assetId,
    @_s.required String childAssetId,
    @_s.required String hierarchyId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(childAssetId, 'childAssetId');
    _s.validateStringLength(
      'childAssetId',
      childAssetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'childAssetId',
      childAssetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(hierarchyId, 'hierarchyId');
    _s.validateStringLength(
      'hierarchyId',
      hierarchyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'hierarchyId',
      hierarchyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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

  /// Gets aggregated values for an asset property. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates">Querying
  /// aggregates</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 100
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [propertyAlias] :
  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
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
    @_s.required List<AggregateType> aggregateTypes,
    @_s.required DateTime endDate,
    @_s.required String resolution,
    @_s.required DateTime startDate,
    String assetId,
    int maxResults,
    String nextToken,
    String propertyAlias,
    String propertyId,
    List<Quality> qualities,
    TimeOrdering timeOrdering,
  }) async {
    ArgumentError.checkNotNull(aggregateTypes, 'aggregateTypes');
    ArgumentError.checkNotNull(endDate, 'endDate');
    ArgumentError.checkNotNull(resolution, 'resolution');
    _s.validateStringLength(
      'resolution',
      resolution,
      2,
      2,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resolution',
      resolution,
      r'''1m|1h|1d''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(startDate, 'startDate');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
    );
    _s.validateStringLength(
      'propertyAlias',
      propertyAlias,
      1,
      2048,
    );
    _s.validateStringPattern(
      'propertyAlias',
      propertyAlias,
      r'''[^\u0000-\u001F\u007F]+''',
    );
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
    );
    _s.validateStringPattern(
      'propertyId',
      propertyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
    );
    final $query = <String, List<String>>{
      if (aggregateTypes != null)
        'aggregateTypes':
            aggregateTypes.map((e) => e?.toValue() ?? '').toList(),
      if (endDate != null) 'endDate': [_s.iso8601ToJson(endDate).toString()],
      if (resolution != null) 'resolution': [resolution],
      if (startDate != null)
        'startDate': [_s.iso8601ToJson(startDate).toString()],
      if (assetId != null) 'assetId': [assetId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
      if (qualities != null)
        'qualities': qualities.map((e) => e?.toValue() ?? '').toList(),
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
  /// current values</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  Future<GetAssetPropertyValueResponse> getAssetPropertyValue({
    String assetId,
    String propertyAlias,
    String propertyId,
  }) async {
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
    );
    _s.validateStringLength(
      'propertyAlias',
      propertyAlias,
      1,
      2048,
    );
    _s.validateStringPattern(
      'propertyAlias',
      propertyAlias,
      r'''[^\u0000-\u001F\u007F]+''',
    );
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
    );
    _s.validateStringPattern(
      'propertyId',
      propertyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
    );
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
  /// historical values</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 100
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [propertyAlias] :
  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
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
    String assetId,
    DateTime endDate,
    int maxResults,
    String nextToken,
    String propertyAlias,
    String propertyId,
    List<Quality> qualities,
    DateTime startDate,
    TimeOrdering timeOrdering,
  }) async {
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
    );
    _s.validateStringLength(
      'propertyAlias',
      propertyAlias,
      1,
      2048,
    );
    _s.validateStringPattern(
      'propertyAlias',
      propertyAlias,
      r'''[^\u0000-\u001F\u007F]+''',
    );
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
    );
    _s.validateStringPattern(
      'propertyId',
      propertyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
    );
    final $query = <String, List<String>>{
      if (assetId != null) 'assetId': [assetId],
      if (endDate != null) 'endDate': [_s.iso8601ToJson(endDate).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
      if (qualities != null)
        'qualities': qualities.map((e) => e?.toValue() ?? '').toList(),
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

  /// Retrieves a paginated list of access policies for an identity (an AWS SSO
  /// user, an AWS SSO group, or an IAM user) or an AWS IoT SiteWise Monitor
  /// resource (a portal or project).
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
  /// The type of identity (AWS SSO user, AWS SSO group, or IAM user). This
  /// parameter is required if you specify <code>identityId</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
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
    String iamArn,
    String identityId,
    IdentityType identityType,
    int maxResults,
    String nextToken,
    String resourceId,
    ResourceType resourceType,
  }) async {
    _s.validateStringLength(
      'iamArn',
      iamArn,
      1,
      1600,
    );
    _s.validateStringPattern(
      'iamArn',
      iamArn,
      r'''.*''',
    );
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      256,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''\S+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
    );
    _s.validateStringLength(
      'resourceId',
      resourceId,
      36,
      36,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
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

  /// Retrieves a paginated list of summaries of all asset models.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetModelsResponse> listAssetModels({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
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
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetRelationshipsResponse> listAssetRelationships({
    @_s.required String assetId,
    @_s.required TraversalType traversalType,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(traversalType, 'traversalType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
    );
    final $query = <String, List<String>>{
      if (traversalType != null) 'traversalType': [traversalType.toValue()],
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
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetsResponse> listAssets({
    String assetModelId,
    ListAssetsFilter filter,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
    );
    _s.validateStringPattern(
      'assetModelId',
      assetModelId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
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
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
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
    @_s.required String assetId,
    String hierarchyId,
    int maxResults,
    String nextToken,
    TraversalDirection traversalDirection,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'hierarchyId',
      hierarchyId,
      36,
      36,
    );
    _s.validateStringPattern(
      'hierarchyId',
      hierarchyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
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

  /// Retrieves a paginated list of dashboards for an AWS IoT SiteWise Monitor
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
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListDashboardsResponse> listDashboards({
    @_s.required String projectId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
    );
    final $query = <String, List<String>>{
      if (projectId != null) 'projectId': [projectId],
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
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListGatewaysResponse> listGateways({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
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

  /// Retrieves a paginated list of AWS IoT SiteWise Monitor portals.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListPortalsResponse> listPortals({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
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

  /// Retrieves a paginated list of assets associated with an AWS IoT SiteWise
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
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListProjectAssetsResponse> listProjectAssets({
    @_s.required String projectId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
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

  /// Retrieves a paginated list of projects for an AWS IoT SiteWise Monitor
  /// portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListProjectsResponse> listProjects({
    @_s.required String portalId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalId',
      portalId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9+/=]+''',
    );
    final $query = <String, List<String>>{
      if (portalId != null) 'portalId': [portalId],
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

  /// Retrieves the list of tags for an AWS IoT SiteWise resource.
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
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

  /// Sets the default encryption configuration for the AWS account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html">Key
  /// management</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// The Key ID of the customer managed customer master key (CMK) used for AWS
  /// KMS encryption. This is required if you use
  /// <code>KMS_BASED_ENCRYPTION</code>.
  Future<PutDefaultEncryptionConfigurationResponse>
      putDefaultEncryptionConfiguration({
    @_s.required EncryptionType encryptionType,
    String kmsKeyId,
  }) async {
    ArgumentError.checkNotNull(encryptionType, 'encryptionType');
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'encryptionType': encryptionType?.toValue() ?? '',
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

  /// Sets logging options for AWS IoT SiteWise.
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
    @_s.required LoggingOptions loggingOptions,
  }) async {
    ArgumentError.checkNotNull(loggingOptions, 'loggingOptions');
    final $payload = <String, dynamic>{
      'loggingOptions': loggingOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
    return PutLoggingOptionsResponse.fromJson(response);
  }

  /// Adds tags to an AWS IoT SiteWise resource. If a tag already exists for the
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
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
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

  /// Removes a tag from an AWS IoT SiteWise resource.
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
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

  /// Updates an existing access policy that specifies an identity's access to
  /// an AWS IoT SiteWise Monitor portal or project resource.
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
  /// The identity for this access policy. Choose an AWS SSO user, an AWS SSO
  /// group, or an IAM user.
  ///
  /// Parameter [accessPolicyPermission] :
  /// The permission level for this access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  ///
  /// Parameter [accessPolicyResource] :
  /// The AWS IoT SiteWise Monitor resource for this access policy. Choose
  /// either a portal or a project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> updateAccessPolicy({
    @_s.required String accessPolicyId,
    @_s.required Identity accessPolicyIdentity,
    @_s.required Permission accessPolicyPermission,
    @_s.required Resource accessPolicyResource,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(accessPolicyId, 'accessPolicyId');
    _s.validateStringLength(
      'accessPolicyId',
      accessPolicyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessPolicyId',
      accessPolicyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(accessPolicyIdentity, 'accessPolicyIdentity');
    ArgumentError.checkNotNull(
        accessPolicyPermission, 'accessPolicyPermission');
    ArgumentError.checkNotNull(accessPolicyResource, 'accessPolicyResource');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    final $payload = <String, dynamic>{
      'accessPolicyIdentity': accessPolicyIdentity,
      'accessPolicyPermission': accessPolicyPermission?.toValue() ?? '',
      'accessPolicyResource': accessPolicyResource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/access-policies/${Uri.encodeComponent(accessPolicyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccessPolicyResponse.fromJson(response);
  }

  /// Updates an asset's name. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating
  /// assets and models</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
  /// A unique, friendly name for the asset.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<UpdateAssetResponse> updateAsset({
    @_s.required String assetId,
    @_s.required String assetName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(assetName, 'assetName');
    _s.validateStringLength(
      'assetName',
      assetName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetName',
      assetName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    final $payload = <String, dynamic>{
      'assetName': assetName,
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
  /// assets and models</a> in the <i>AWS IoT SiteWise User Guide</i>.
  /// <important>
  /// This operation overwrites the existing model with the provided model. To
  /// avoid deleting your asset model's properties or hierarchies, you must
  /// include their IDs and definitions in the updated asset model payload. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>.
  ///
  /// If you remove a property from an asset model, AWS IoT SiteWise deletes all
  /// previous data for that property. If you remove a hierarchy definition from
  /// an asset model, AWS IoT SiteWise disassociates every asset associated with
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
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 10 hierarchies per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [assetModelProperties] :
  /// The updated property definitions of the asset model. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset
  /// properties</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 200 properties per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<UpdateAssetModelResponse> updateAssetModel({
    @_s.required String assetModelId,
    @_s.required String assetModelName,
    List<AssetModelCompositeModel> assetModelCompositeModels,
    String assetModelDescription,
    List<AssetModelHierarchy> assetModelHierarchies,
    List<AssetModelProperty> assetModelProperties,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(assetModelId, 'assetModelId');
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetModelId',
      assetModelId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(assetModelName, 'assetModelName');
    _s.validateStringLength(
      'assetModelName',
      assetModelName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetModelName',
      assetModelName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'assetModelDescription',
      assetModelDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'assetModelDescription',
      assetModelDescription,
      r'''[^\u0000-\u001F\u007F]+''',
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
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
  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// If you omit this parameter, the alias is removed from the property.
  ///
  /// Parameter [propertyNotificationState] :
  /// The MQTT notification state (enabled or disabled) for this asset property.
  /// When the notification state is enabled, AWS IoT SiteWise publishes
  /// property value updates to a unique MQTT topic. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting
  /// with other services</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// If you omit this parameter, the notification state is set to
  /// <code>DISABLED</code>.
  Future<void> updateAssetProperty({
    @_s.required String assetId,
    @_s.required String propertyId,
    String clientToken,
    String propertyAlias,
    PropertyNotificationState propertyNotificationState,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assetId',
      assetId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(propertyId, 'propertyId');
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'propertyId',
      propertyId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    _s.validateStringLength(
      'propertyAlias',
      propertyAlias,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'propertyAlias',
      propertyAlias,
      r'''[^\u0000-\u001F\u007F]+''',
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyNotificationState != null)
        'propertyNotificationState': propertyNotificationState.toValue(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assets/${Uri.encodeComponent(assetId)}/properties/${Uri.encodeComponent(propertyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an AWS IoT SiteWise Monitor dashboard.
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
  /// dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
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
    @_s.required String dashboardDefinition,
    @_s.required String dashboardId,
    @_s.required String dashboardName,
    String clientToken,
    String dashboardDescription,
  }) async {
    ArgumentError.checkNotNull(dashboardDefinition, 'dashboardDefinition');
    _s.validateStringLength(
      'dashboardDefinition',
      dashboardDefinition,
      0,
      204800,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardDefinition',
      dashboardDefinition,
      r'''.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardName, 'dashboardName');
    _s.validateStringLength(
      'dashboardName',
      dashboardName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardName',
      dashboardName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    _s.validateStringLength(
      'dashboardDescription',
      dashboardDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'dashboardDescription',
      dashboardDescription,
      r'''[^\u0000-\u001F\u007F]+''',
    );
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
    return UpdateDashboardResponse.fromJson(response);
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
    @_s.required String gatewayId,
    @_s.required String gatewayName,
  }) async {
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gatewayId',
      gatewayId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayName, 'gatewayName');
    _s.validateStringLength(
      'gatewayName',
      gatewayName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gatewayName',
      gatewayName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
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
  /// configurations. If you define OPC-UA sources for a gateway in the AWS IoT
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
  /// data sources (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [capabilityNamespace] :
  /// The namespace of the gateway capability configuration to be updated. For
  /// example, if you configure OPC-UA sources from the AWS IoT SiteWise
  /// console, your OPC-UA capability configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where
  /// <code>version</code> is a number such as <code>1</code>.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway to be updated.
  Future<UpdateGatewayCapabilityConfigurationResponse>
      updateGatewayCapabilityConfiguration({
    @_s.required String capabilityConfiguration,
    @_s.required String capabilityNamespace,
    @_s.required String gatewayId,
  }) async {
    ArgumentError.checkNotNull(
        capabilityConfiguration, 'capabilityConfiguration');
    _s.validateStringLength(
      'capabilityConfiguration',
      capabilityConfiguration,
      1,
      104857600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(capabilityNamespace, 'capabilityNamespace');
    _s.validateStringLength(
      'capabilityNamespace',
      capabilityNamespace,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'capabilityNamespace',
      capabilityNamespace,
      r'''^[a-zA-Z]+:[a-zA-Z]+:[0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'gatewayId',
      gatewayId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
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

  /// Updates an AWS IoT SiteWise Monitor portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [portalContactEmail] :
  /// The AWS administrator's contact email address.
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
  /// of a service role that allows the portal's users to access your AWS IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [portalDescription] :
  /// A new description for the portal.
  Future<UpdatePortalResponse> updatePortal({
    @_s.required String portalContactEmail,
    @_s.required String portalId,
    @_s.required String portalName,
    @_s.required String roleArn,
    String clientToken,
    String portalDescription,
    Image portalLogoImage,
  }) async {
    ArgumentError.checkNotNull(portalContactEmail, 'portalContactEmail');
    _s.validateStringLength(
      'portalContactEmail',
      portalContactEmail,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalContactEmail',
      portalContactEmail,
      r'''[^@]+@[^@]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalId',
      portalId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(portalName, 'portalName');
    _s.validateStringLength(
      'portalName',
      portalName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'portalName',
      portalName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    _s.validateStringLength(
      'portalDescription',
      portalDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'portalDescription',
      portalDescription,
      r'''[^\u0000-\u001F\u007F]+''',
    );
    final $payload = <String, dynamic>{
      'portalContactEmail': portalContactEmail,
      'portalName': portalName,
      'roleArn': roleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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

  /// Updates an AWS IoT SiteWise Monitor project.
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
    @_s.required String projectId,
    @_s.required String projectName,
    String clientToken,
    String projectDescription,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectId',
      projectId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[^\u0000-\u001F\u007F]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''\S{36,64}''',
    );
    _s.validateStringLength(
      'projectDescription',
      projectDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'projectDescription',
      projectDescription,
      r'''[^\u0000-\u001F\u007F]+''',
    );
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
    return UpdateProjectResponse.fromJson(response);
  }
}

/// Contains an access policy that defines an identity's access to an AWS IoT
/// SiteWise Monitor resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessPolicySummary {
  /// The ID of the access policy.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The identity (an AWS SSO user, an AWS SSO group, or an IAM user).
  @_s.JsonKey(name: 'identity')
  final Identity identity;

  /// The permissions for the access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  @_s.JsonKey(name: 'permission')
  final Permission permission;

  /// The AWS IoT SiteWise Monitor resource (a portal or project).
  @_s.JsonKey(name: 'resource')
  final Resource resource;

  /// The date the access policy was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The date the access policy was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  AccessPolicySummary({
    @_s.required this.id,
    @_s.required this.identity,
    @_s.required this.permission,
    @_s.required this.resource,
    this.creationDate,
    this.lastUpdateDate,
  });
  factory AccessPolicySummary.fromJson(Map<String, dynamic> json) =>
      _$AccessPolicySummaryFromJson(json);
}

enum AggregateType {
  @_s.JsonValue('AVERAGE')
  average,
  @_s.JsonValue('COUNT')
  count,
  @_s.JsonValue('MAXIMUM')
  maximum,
  @_s.JsonValue('MINIMUM')
  minimum,
  @_s.JsonValue('SUM')
  sum,
  @_s.JsonValue('STANDARD_DEVIATION')
  standardDeviation,
}

extension on AggregateType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains aggregated asset property values (for example, average, minimum,
/// and maximum).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AggregatedValue {
  /// The date the aggregating computations occurred, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'timestamp')
  final DateTime timestamp;

  /// The value of the aggregates.
  @_s.JsonKey(name: 'value')
  final Aggregates value;

  /// The quality of the aggregated data.
  @_s.JsonKey(name: 'quality')
  final Quality quality;

  AggregatedValue({
    @_s.required this.timestamp,
    @_s.required this.value,
    this.quality,
  });
  factory AggregatedValue.fromJson(Map<String, dynamic> json) =>
      _$AggregatedValueFromJson(json);
}

/// Contains the (pre-calculated) aggregate values for an asset property.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Aggregates {
  /// The average (mean) value of the time series over a time interval window.
  @_s.JsonKey(name: 'average')
  final double average;

  /// The count of data points in the time series over a time interval window.
  @_s.JsonKey(name: 'count')
  final double count;

  /// The maximum value of the time series over a time interval window.
  @_s.JsonKey(name: 'maximum')
  final double maximum;

  /// The minimum value of the time series over a time interval window.
  @_s.JsonKey(name: 'minimum')
  final double minimum;

  /// The standard deviation of the time series over a time interval window.
  @_s.JsonKey(name: 'standardDeviation')
  final double standardDeviation;

  /// The sum of the time series over a time interval window.
  @_s.JsonKey(name: 'sum')
  final double sum;

  Aggregates({
    this.average,
    this.count,
    this.maximum,
    this.minimum,
    this.standardDeviation,
    this.sum,
  });
  factory Aggregates.fromJson(Map<String, dynamic> json) =>
      _$AggregatesFromJson(json);
}

/// Contains information about a composite model in an asset. This object
/// contains the asset's properties that you define in the composite model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetCompositeModel {
  /// The name of the composite model.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The asset properties that this composite model defines.
  @_s.JsonKey(name: 'properties')
  final List<AssetProperty> properties;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The description of the composite model.
  @_s.JsonKey(name: 'description')
  final String description;

  AssetCompositeModel({
    @_s.required this.name,
    @_s.required this.properties,
    @_s.required this.type,
    this.description,
  });
  factory AssetCompositeModel.fromJson(Map<String, dynamic> json) =>
      _$AssetCompositeModelFromJson(json);
}

enum AssetErrorCode {
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
}

/// Contains error details for the requested associate project asset action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetErrorDetails {
  /// The ID of the asset.
  @_s.JsonKey(name: 'assetId')
  final String assetId;

  /// The error code.
  @_s.JsonKey(name: 'code')
  final AssetErrorCode code;

  /// The error message.
  @_s.JsonKey(name: 'message')
  final String message;

  AssetErrorDetails({
    @_s.required this.assetId,
    @_s.required this.code,
    @_s.required this.message,
  });
  factory AssetErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$AssetErrorDetailsFromJson(json);
}

/// Describes an asset hierarchy that contains a hierarchy's name and ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetHierarchy {
  /// The hierarchy name provided in the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ID of the hierarchy. This ID is a <code>hierarchyId</code>.
  @_s.JsonKey(name: 'id')
  final String id;

  AssetHierarchy({
    @_s.required this.name,
    this.id,
  });
  factory AssetHierarchy.fromJson(Map<String, dynamic> json) =>
      _$AssetHierarchyFromJson(json);
}

/// Contains information about a parent asset and a child asset that are related
/// through an asset hierarchy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetHierarchyInfo {
  /// The ID of the child asset in this asset relationship.
  @_s.JsonKey(name: 'childAssetId')
  final String childAssetId;

  /// The ID of the parent asset in this asset relationship.
  @_s.JsonKey(name: 'parentAssetId')
  final String parentAssetId;

  AssetHierarchyInfo({
    this.childAssetId,
    this.parentAssetId,
  });
  factory AssetHierarchyInfo.fromJson(Map<String, dynamic> json) =>
      _$AssetHierarchyInfoFromJson(json);
}

/// Contains information about a composite model in an asset model. This object
/// contains the asset property definitions that you define in the composite
/// model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetModelCompositeModel {
  /// The name of the composite model.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The description of the composite model.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The asset property definitions for this composite model.
  @_s.JsonKey(name: 'properties')
  final List<AssetModelProperty> properties;

  AssetModelCompositeModel({
    @_s.required this.name,
    @_s.required this.type,
    this.description,
    this.properties,
  });
  factory AssetModelCompositeModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelCompositeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetModelCompositeModelToJson(this);
}

/// Contains a composite model definition in an asset model. This composite
/// model definition is applied to all assets created from the asset model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AssetModelCompositeModelDefinition {
  /// The name of the composite model.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The description of the composite model.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The asset property definitions for this composite model.
  @_s.JsonKey(name: 'properties')
  final List<AssetModelPropertyDefinition> properties;

  AssetModelCompositeModelDefinition({
    @_s.required this.name,
    @_s.required this.type,
    this.description,
    this.properties,
  });
  Map<String, dynamic> toJson() =>
      _$AssetModelCompositeModelDefinitionToJson(this);
}

/// Describes an asset hierarchy that contains a hierarchy's name, ID, and child
/// asset model ID that specifies the type of asset that can be in this
/// hierarchy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetModelHierarchy {
  /// The ID of the asset model. All assets in this hierarchy must be instances of
  /// the <code>childAssetModelId</code> asset model.
  @_s.JsonKey(name: 'childAssetModelId')
  final String childAssetModelId;

  /// The name of the asset model hierarchy that you specify by using the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ID of the asset model hierarchy. This ID is a <code>hierarchyId</code>.
  @_s.JsonKey(name: 'id')
  final String id;

  AssetModelHierarchy({
    @_s.required this.childAssetModelId,
    @_s.required this.name,
    this.id,
  });
  factory AssetModelHierarchy.fromJson(Map<String, dynamic> json) =>
      _$AssetModelHierarchyFromJson(json);

  Map<String, dynamic> toJson() => _$AssetModelHierarchyToJson(this);
}

/// Contains an asset model hierarchy used in asset model creation. An asset
/// model hierarchy determines the kind (or type) of asset that can belong to a
/// hierarchy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AssetModelHierarchyDefinition {
  /// The ID of an asset model for this hierarchy.
  @_s.JsonKey(name: 'childAssetModelId')
  final String childAssetModelId;

  /// The name of the asset model hierarchy definition (as specified in the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation).
  @_s.JsonKey(name: 'name')
  final String name;

  AssetModelHierarchyDefinition({
    @_s.required this.childAssetModelId,
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$AssetModelHierarchyDefinitionToJson(this);
}

/// Contains information about an asset model property.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetModelProperty {
  /// The data type of the asset model property.
  @_s.JsonKey(name: 'dataType')
  final PropertyDataType dataType;

  /// The name of the asset model property.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The property type (see <code>PropertyType</code>).
  @_s.JsonKey(name: 'type')
  final PropertyType type;

  /// The data type of the structure for this property. This parameter exists on
  /// properties that have the <code>STRUCT</code> data type.
  @_s.JsonKey(name: 'dataTypeSpec')
  final String dataTypeSpec;

  /// The ID of the asset model property.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The unit of the asset model property, such as <code>Newtons</code> or
  /// <code>RPM</code>.
  @_s.JsonKey(name: 'unit')
  final String unit;

  AssetModelProperty({
    @_s.required this.dataType,
    @_s.required this.name,
    @_s.required this.type,
    this.dataTypeSpec,
    this.id,
    this.unit,
  });
  factory AssetModelProperty.fromJson(Map<String, dynamic> json) =>
      _$AssetModelPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$AssetModelPropertyToJson(this);
}

/// Contains an asset model property definition. This property definition is
/// applied to all assets created from the asset model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AssetModelPropertyDefinition {
  /// The data type of the property definition.
  ///
  /// If you specify <code>STRUCT</code>, you must also specify
  /// <code>dataTypeSpec</code> to identify the type of the structure for this
  /// property.
  @_s.JsonKey(name: 'dataType')
  final PropertyDataType dataType;

  /// The name of the property definition.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The property definition type (see <code>PropertyType</code>). You can only
  /// specify one type in a property definition.
  @_s.JsonKey(name: 'type')
  final PropertyType type;

  /// The data type of the structure for this property. This parameter is required
  /// on properties that have the <code>STRUCT</code> data type.
  ///
  /// The options for this parameter depend on the type of the composite model in
  /// which you define this property. Use <code>AWS/ALARM_STATE</code> for alarm
  /// state in alarm composite models.
  @_s.JsonKey(name: 'dataTypeSpec')
  final String dataTypeSpec;

  /// The unit of the property definition, such as <code>Newtons</code> or
  /// <code>RPM</code>.
  @_s.JsonKey(name: 'unit')
  final String unit;

  AssetModelPropertyDefinition({
    @_s.required this.dataType,
    @_s.required this.name,
    @_s.required this.type,
    this.dataTypeSpec,
    this.unit,
  });
  Map<String, dynamic> toJson() => _$AssetModelPropertyDefinitionToJson(this);
}

enum AssetModelState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('PROPAGATING')
  propagating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
}

/// Contains current status information for an asset model. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset
/// and model states</a> in the <i>AWS IoT SiteWise User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetModelStatus {
  /// The current state of the asset model.
  @_s.JsonKey(name: 'state')
  final AssetModelState state;

  /// Contains associated error information, if any.
  @_s.JsonKey(name: 'error')
  final ErrorDetails error;

  AssetModelStatus({
    @_s.required this.state,
    this.error,
  });
  factory AssetModelStatus.fromJson(Map<String, dynamic> json) =>
      _$AssetModelStatusFromJson(json);
}

/// Contains a summary of an asset model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetModelSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date the asset model was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The asset model description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ID of the asset model (used with AWS IoT SiteWise APIs).
  @_s.JsonKey(name: 'id')
  final String id;

  /// The date the asset model was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  /// The name of the asset model.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The current status of the asset model.
  @_s.JsonKey(name: 'status')
  final AssetModelStatus status;

  AssetModelSummary({
    @_s.required this.arn,
    @_s.required this.creationDate,
    @_s.required this.description,
    @_s.required this.id,
    @_s.required this.lastUpdateDate,
    @_s.required this.name,
    @_s.required this.status,
  });
  factory AssetModelSummary.fromJson(Map<String, dynamic> json) =>
      _$AssetModelSummaryFromJson(json);
}

/// Contains asset property information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetProperty {
  /// The data type of the asset property.
  @_s.JsonKey(name: 'dataType')
  final PropertyDataType dataType;

  /// The ID of the asset property.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the property.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  @_s.JsonKey(name: 'alias')
  final String alias;

  /// The data type of the structure for this property. This parameter exists on
  /// properties that have the <code>STRUCT</code> data type.
  @_s.JsonKey(name: 'dataTypeSpec')
  final String dataTypeSpec;

  /// The asset property's notification topic and state. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  @_s.JsonKey(name: 'notification')
  final PropertyNotification notification;

  /// The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset
  /// property.
  @_s.JsonKey(name: 'unit')
  final String unit;

  AssetProperty({
    @_s.required this.dataType,
    @_s.required this.id,
    @_s.required this.name,
    this.alias,
    this.dataTypeSpec,
    this.notification,
    this.unit,
  });
  factory AssetProperty.fromJson(Map<String, dynamic> json) =>
      _$AssetPropertyFromJson(json);
}

/// Contains asset property value information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetPropertyValue {
  /// The timestamp of the asset property value.
  @_s.JsonKey(name: 'timestamp')
  final TimeInNanos timestamp;

  /// The value of the asset property (see <code>Variant</code>).
  @_s.JsonKey(name: 'value')
  final Variant value;

  /// The quality of the asset property value.
  @_s.JsonKey(name: 'quality')
  final Quality quality;

  AssetPropertyValue({
    @_s.required this.timestamp,
    @_s.required this.value,
    this.quality,
  });
  factory AssetPropertyValue.fromJson(Map<String, dynamic> json) =>
      _$AssetPropertyValueFromJson(json);

  Map<String, dynamic> toJson() => _$AssetPropertyValueToJson(this);
}

/// Contains information about assets that are related to one another.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'relationshipType')
  final AssetRelationshipType relationshipType;

  /// The assets that are related through an asset hierarchy.
  ///
  /// This object is present if the <code>relationshipType</code> is
  /// <code>HIERARCHY</code>.
  @_s.JsonKey(name: 'hierarchyInfo')
  final AssetHierarchyInfo hierarchyInfo;

  AssetRelationshipSummary({
    @_s.required this.relationshipType,
    this.hierarchyInfo,
  });
  factory AssetRelationshipSummary.fromJson(Map<String, dynamic> json) =>
      _$AssetRelationshipSummaryFromJson(json);
}

enum AssetRelationshipType {
  @_s.JsonValue('HIERARCHY')
  hierarchy,
}

enum AssetState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
}

/// Contains information about the current status of an asset. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset
/// and model states</a> in the <i>AWS IoT SiteWise User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetStatus {
  /// The current status of the asset.
  @_s.JsonKey(name: 'state')
  final AssetState state;

  /// Contains associated error information, if any.
  @_s.JsonKey(name: 'error')
  final ErrorDetails error;

  AssetStatus({
    @_s.required this.state,
    this.error,
  });
  factory AssetStatus.fromJson(Map<String, dynamic> json) =>
      _$AssetStatusFromJson(json);
}

/// Contains a summary of an asset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The ID of the asset model used to create this asset.
  @_s.JsonKey(name: 'assetModelId')
  final String assetModelId;

  /// The date the asset was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  @_s.JsonKey(name: 'hierarchies')
  final List<AssetHierarchy> hierarchies;

  /// The ID of the asset.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The date the asset was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  /// The name of the asset.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The current status of the asset.
  @_s.JsonKey(name: 'status')
  final AssetStatus status;

  AssetSummary({
    @_s.required this.arn,
    @_s.required this.assetModelId,
    @_s.required this.creationDate,
    @_s.required this.hierarchies,
    @_s.required this.id,
    @_s.required this.lastUpdateDate,
    @_s.required this.name,
    @_s.required this.status,
  });
  factory AssetSummary.fromJson(Map<String, dynamic> json) =>
      _$AssetSummaryFromJson(json);
}

/// Contains a summary of an associated asset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociatedAssetsSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The ID of the asset model used to create the asset.
  @_s.JsonKey(name: 'assetModelId')
  final String assetModelId;

  /// The date the asset was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  @_s.JsonKey(name: 'hierarchies')
  final List<AssetHierarchy> hierarchies;

  /// The ID of the asset.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The date the asset was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  /// The name of the asset.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The current status of the asset.
  @_s.JsonKey(name: 'status')
  final AssetStatus status;

  AssociatedAssetsSummary({
    @_s.required this.arn,
    @_s.required this.assetModelId,
    @_s.required this.creationDate,
    @_s.required this.hierarchies,
    @_s.required this.id,
    @_s.required this.lastUpdateDate,
    @_s.required this.name,
    @_s.required this.status,
  });
  factory AssociatedAssetsSummary.fromJson(Map<String, dynamic> json) =>
      _$AssociatedAssetsSummaryFromJson(json);
}

/// Contains an asset attribute property. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#attributes">Attributes</a>
/// in the <i>AWS IoT SiteWise User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Attribute {
  /// The default value of the asset model property attribute. All assets that you
  /// create from the asset model contain this attribute value. You can update an
  /// attribute's value after you create an asset. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-attribute-values.html">Updating
  /// attribute values</a> in the <i>AWS IoT SiteWise User Guide</i>.
  @_s.JsonKey(name: 'defaultValue')
  final String defaultValue;

  Attribute({
    this.defaultValue,
  });
  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

enum AuthMode {
  @_s.JsonValue('IAM')
  iam,
  @_s.JsonValue('SSO')
  sso,
}

extension on AuthMode {
  String toValue() {
    switch (this) {
      case AuthMode.iam:
        return 'IAM';
      case AuthMode.sso:
        return 'SSO';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAssociateProjectAssetsResponse {
  /// A list of associated error information, if any.
  @_s.JsonKey(name: 'errors')
  final List<AssetErrorDetails> errors;

  BatchAssociateProjectAssetsResponse({
    this.errors,
  });
  factory BatchAssociateProjectAssetsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchAssociateProjectAssetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDisassociateProjectAssetsResponse {
  /// A list of associated error information, if any.
  @_s.JsonKey(name: 'errors')
  final List<AssetErrorDetails> errors;

  BatchDisassociateProjectAssetsResponse({
    this.errors,
  });
  factory BatchDisassociateProjectAssetsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDisassociateProjectAssetsResponseFromJson(json);
}

/// Contains error information from updating a batch of asset property values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutAssetPropertyError {
  /// The error code.
  @_s.JsonKey(name: 'errorCode')
  final BatchPutAssetPropertyValueErrorCode errorCode;

  /// The associated error message.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// A list of timestamps for each error, if any.
  @_s.JsonKey(name: 'timestamps')
  final List<TimeInNanos> timestamps;

  BatchPutAssetPropertyError({
    @_s.required this.errorCode,
    @_s.required this.errorMessage,
    @_s.required this.timestamps,
  });
  factory BatchPutAssetPropertyError.fromJson(Map<String, dynamic> json) =>
      _$BatchPutAssetPropertyErrorFromJson(json);
}

/// Contains error information for asset property value entries that are
/// associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a>
/// API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutAssetPropertyErrorEntry {
  /// The ID of the failed entry.
  @_s.JsonKey(name: 'entryId')
  final String entryId;

  /// The list of update property value errors.
  @_s.JsonKey(name: 'errors')
  final List<BatchPutAssetPropertyError> errors;

  BatchPutAssetPropertyErrorEntry({
    @_s.required this.entryId,
    @_s.required this.errors,
  });
  factory BatchPutAssetPropertyErrorEntry.fromJson(Map<String, dynamic> json) =>
      _$BatchPutAssetPropertyErrorEntryFromJson(json);
}

enum BatchPutAssetPropertyValueErrorCode {
  @_s.JsonValue('ResourceNotFoundException')
  resourceNotFoundException,
  @_s.JsonValue('InvalidRequestException')
  invalidRequestException,
  @_s.JsonValue('InternalFailureException')
  internalFailureException,
  @_s.JsonValue('ServiceUnavailableException')
  serviceUnavailableException,
  @_s.JsonValue('ThrottlingException')
  throttlingException,
  @_s.JsonValue('LimitExceededException')
  limitExceededException,
  @_s.JsonValue('ConflictingOperationException')
  conflictingOperationException,
  @_s.JsonValue('TimestampOutOfRangeException')
  timestampOutOfRangeException,
  @_s.JsonValue('AccessDeniedException')
  accessDeniedException,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutAssetPropertyValueResponse {
  /// A list of the errors (if any) associated with the batch put request. Each
  /// error entry contains the <code>entryId</code> of the entry that failed.
  @_s.JsonKey(name: 'errorEntries')
  final List<BatchPutAssetPropertyErrorEntry> errorEntries;

  BatchPutAssetPropertyValueResponse({
    @_s.required this.errorEntries,
  });
  factory BatchPutAssetPropertyValueResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchPutAssetPropertyValueResponseFromJson(json);
}

enum CapabilitySyncStatus {
  @_s.JsonValue('IN_SYNC')
  inSync,
  @_s.JsonValue('OUT_OF_SYNC')
  outOfSync,
  @_s.JsonValue('SYNC_FAILED')
  syncFailed,
}

/// Contains information about a composite model property on an asset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompositeModelProperty {
  @_s.JsonKey(name: 'assetProperty')
  final Property assetProperty;

  /// The name of the property.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of the composite model that defines this property.
  @_s.JsonKey(name: 'type')
  final String type;

  CompositeModelProperty({
    @_s.required this.assetProperty,
    @_s.required this.name,
    @_s.required this.type,
  });
  factory CompositeModelProperty.fromJson(Map<String, dynamic> json) =>
      _$CompositeModelPropertyFromJson(json);
}

/// Contains the details of an AWS IoT SiteWise configuration error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationErrorDetails {
  /// The error code.
  @_s.JsonKey(name: 'code')
  final ErrorCode code;

  /// The error message.
  @_s.JsonKey(name: 'message')
  final String message;

  ConfigurationErrorDetails({
    @_s.required this.code,
    @_s.required this.message,
  });
  factory ConfigurationErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationErrorDetailsFromJson(json);
}

enum ConfigurationState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
}

/// Contains current status information for the configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationStatus {
  /// The current state of the configuration.
  @_s.JsonKey(name: 'state')
  final ConfigurationState state;

  /// Contains associated error information, if any.
  @_s.JsonKey(name: 'error')
  final ConfigurationErrorDetails error;

  ConfigurationStatus({
    @_s.required this.state,
    this.error,
  });
  factory ConfigurationStatus.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationStatusFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAccessPolicyResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the access policy, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}</code>
  @_s.JsonKey(name: 'accessPolicyArn')
  final String accessPolicyArn;

  /// The ID of the access policy.
  @_s.JsonKey(name: 'accessPolicyId')
  final String accessPolicyId;

  CreateAccessPolicyResponse({
    @_s.required this.accessPolicyArn,
    @_s.required this.accessPolicyId,
  });
  factory CreateAccessPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAccessPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAssetModelResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  @_s.JsonKey(name: 'assetModelArn')
  final String assetModelArn;

  /// The ID of the asset model. You can use this ID when you call other AWS IoT
  /// SiteWise APIs.
  @_s.JsonKey(name: 'assetModelId')
  final String assetModelId;

  /// The status of the asset model, which contains a state (<code>CREATING</code>
  /// after successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'assetModelStatus')
  final AssetModelStatus assetModelStatus;

  CreateAssetModelResponse({
    @_s.required this.assetModelArn,
    @_s.required this.assetModelId,
    @_s.required this.assetModelStatus,
  });
  factory CreateAssetModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAssetModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAssetResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  @_s.JsonKey(name: 'assetArn')
  final String assetArn;

  /// The ID of the asset. This ID uniquely identifies the asset within AWS IoT
  /// SiteWise and can be used with other AWS IoT SiteWise APIs.
  @_s.JsonKey(name: 'assetId')
  final String assetId;

  /// The status of the asset, which contains a state (<code>CREATING</code> after
  /// successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'assetStatus')
  final AssetStatus assetStatus;

  CreateAssetResponse({
    @_s.required this.assetArn,
    @_s.required this.assetId,
    @_s.required this.assetStatus,
  });
  factory CreateAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDashboardResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the dashboard, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}</code>
  @_s.JsonKey(name: 'dashboardArn')
  final String dashboardArn;

  /// The ID of the dashboard.
  @_s.JsonKey(name: 'dashboardId')
  final String dashboardId;

  CreateDashboardResponse({
    @_s.required this.dashboardArn,
    @_s.required this.dashboardId,
  });
  factory CreateDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDashboardResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGatewayResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the gateway, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}</code>
  @_s.JsonKey(name: 'gatewayArn')
  final String gatewayArn;

  /// The ID of the gateway device. You can use this ID when you call other AWS
  /// IoT SiteWise APIs.
  @_s.JsonKey(name: 'gatewayId')
  final String gatewayId;

  CreateGatewayResponse({
    @_s.required this.gatewayArn,
    @_s.required this.gatewayId,
  });
  factory CreateGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePortalResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the portal, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}</code>
  @_s.JsonKey(name: 'portalArn')
  final String portalArn;

  /// The ID of the created portal.
  @_s.JsonKey(name: 'portalId')
  final String portalId;

  /// The URL for the AWS IoT SiteWise Monitor portal. You can use this URL to
  /// access portals that use AWS SSO for authentication. For portals that use IAM
  /// for authentication, you must use the AWS IoT SiteWise console to get a URL
  /// that you can use to access the portal.
  @_s.JsonKey(name: 'portalStartUrl')
  final String portalStartUrl;

  /// The status of the portal, which contains a state (<code>CREATING</code>
  /// after successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'portalStatus')
  final PortalStatus portalStatus;

  /// The associated AWS SSO application ID, if the portal uses AWS SSO.
  @_s.JsonKey(name: 'ssoApplicationId')
  final String ssoApplicationId;

  CreatePortalResponse({
    @_s.required this.portalArn,
    @_s.required this.portalId,
    @_s.required this.portalStartUrl,
    @_s.required this.portalStatus,
    @_s.required this.ssoApplicationId,
  });
  factory CreatePortalResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePortalResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the project, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}</code>
  @_s.JsonKey(name: 'projectArn')
  final String projectArn;

  /// The ID of the project.
  @_s.JsonKey(name: 'projectId')
  final String projectId;

  CreateProjectResponse({
    @_s.required this.projectArn,
    @_s.required this.projectId,
  });
  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResponseFromJson(json);
}

/// Contains a dashboard summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DashboardSummary {
  /// The ID of the dashboard.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the dashboard
  @_s.JsonKey(name: 'name')
  final String name;

  /// The date the dashboard was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The dashboard's description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date the dashboard was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  DashboardSummary({
    @_s.required this.id,
    @_s.required this.name,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
  });
  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAccessPolicyResponse {
  DeleteAccessPolicyResponse();
  factory DeleteAccessPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccessPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAssetModelResponse {
  /// The status of the asset model, which contains a state (<code>DELETING</code>
  /// after successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'assetModelStatus')
  final AssetModelStatus assetModelStatus;

  DeleteAssetModelResponse({
    @_s.required this.assetModelStatus,
  });
  factory DeleteAssetModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssetModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAssetResponse {
  /// The status of the asset, which contains a state (<code>DELETING</code> after
  /// successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'assetStatus')
  final AssetStatus assetStatus;

  DeleteAssetResponse({
    @_s.required this.assetStatus,
  });
  factory DeleteAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDashboardResponse {
  DeleteDashboardResponse();
  factory DeleteDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDashboardResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePortalResponse {
  /// The status of the portal, which contains a state (<code>DELETING</code>
  /// after successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'portalStatus')
  final PortalStatus portalStatus;

  DeletePortalResponse({
    @_s.required this.portalStatus,
  });
  factory DeletePortalResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePortalResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectResponse {
  DeleteProjectResponse();
  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccessPolicyResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the access policy, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}</code>
  @_s.JsonKey(name: 'accessPolicyArn')
  final String accessPolicyArn;

  /// The date the access policy was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'accessPolicyCreationDate')
  final DateTime accessPolicyCreationDate;

  /// The ID of the access policy.
  @_s.JsonKey(name: 'accessPolicyId')
  final String accessPolicyId;

  /// The identity (AWS SSO user, AWS SSO group, or IAM user) to which this access
  /// policy applies.
  @_s.JsonKey(name: 'accessPolicyIdentity')
  final Identity accessPolicyIdentity;

  /// The date the access policy was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'accessPolicyLastUpdateDate')
  final DateTime accessPolicyLastUpdateDate;

  /// The access policy permission. Note that a project <code>ADMINISTRATOR</code>
  /// is also known as a project owner.
  @_s.JsonKey(name: 'accessPolicyPermission')
  final Permission accessPolicyPermission;

  /// The AWS IoT SiteWise Monitor resource (portal or project) to which this
  /// access policy provides access.
  @_s.JsonKey(name: 'accessPolicyResource')
  final Resource accessPolicyResource;

  DescribeAccessPolicyResponse({
    @_s.required this.accessPolicyArn,
    @_s.required this.accessPolicyCreationDate,
    @_s.required this.accessPolicyId,
    @_s.required this.accessPolicyIdentity,
    @_s.required this.accessPolicyLastUpdateDate,
    @_s.required this.accessPolicyPermission,
    @_s.required this.accessPolicyResource,
  });
  factory DescribeAccessPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAccessPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAssetModelResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  @_s.JsonKey(name: 'assetModelArn')
  final String assetModelArn;

  /// The date the asset model was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'assetModelCreationDate')
  final DateTime assetModelCreationDate;

  /// The asset model's description.
  @_s.JsonKey(name: 'assetModelDescription')
  final String assetModelDescription;

  /// A list of asset model hierarchies that each contain a
  /// <code>childAssetModelId</code> and a <code>hierarchyId</code> (named
  /// <code>id</code>). A hierarchy specifies allowed parent/child asset
  /// relationships for an asset model.
  @_s.JsonKey(name: 'assetModelHierarchies')
  final List<AssetModelHierarchy> assetModelHierarchies;

  /// The ID of the asset model.
  @_s.JsonKey(name: 'assetModelId')
  final String assetModelId;

  /// The date the asset model was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'assetModelLastUpdateDate')
  final DateTime assetModelLastUpdateDate;

  /// The name of the asset model.
  @_s.JsonKey(name: 'assetModelName')
  final String assetModelName;

  /// The list of asset properties for the asset model.
  ///
  /// This object doesn't include properties that you define in composite models.
  /// You can find composite model properties in the
  /// <code>assetModelCompositeModels</code> object.
  @_s.JsonKey(name: 'assetModelProperties')
  final List<AssetModelProperty> assetModelProperties;

  /// The current status of the asset model, which contains a state and any error
  /// message.
  @_s.JsonKey(name: 'assetModelStatus')
  final AssetModelStatus assetModelStatus;

  /// The list of composite asset models for the asset model.
  @_s.JsonKey(name: 'assetModelCompositeModels')
  final List<AssetModelCompositeModel> assetModelCompositeModels;

  DescribeAssetModelResponse({
    @_s.required this.assetModelArn,
    @_s.required this.assetModelCreationDate,
    @_s.required this.assetModelDescription,
    @_s.required this.assetModelHierarchies,
    @_s.required this.assetModelId,
    @_s.required this.assetModelLastUpdateDate,
    @_s.required this.assetModelName,
    @_s.required this.assetModelProperties,
    @_s.required this.assetModelStatus,
    this.assetModelCompositeModels,
  });
  factory DescribeAssetModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAssetModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAssetPropertyResponse {
  /// The ID of the asset.
  @_s.JsonKey(name: 'assetId')
  final String assetId;

  /// The ID of the asset model.
  @_s.JsonKey(name: 'assetModelId')
  final String assetModelId;

  /// The name of the asset.
  @_s.JsonKey(name: 'assetName')
  final String assetName;

  /// The asset property's definition, alias, and notification state.
  ///
  /// This response includes this object for normal asset properties. If you
  /// describe an asset property in a composite model, this response includes the
  /// asset property information in <code>compositeModel</code>.
  @_s.JsonKey(name: 'assetProperty')
  final Property assetProperty;

  /// The composite asset model that declares this asset property, if this asset
  /// property exists in a composite model.
  @_s.JsonKey(name: 'compositeModel')
  final CompositeModelProperty compositeModel;

  DescribeAssetPropertyResponse({
    @_s.required this.assetId,
    @_s.required this.assetModelId,
    @_s.required this.assetName,
    this.assetProperty,
    this.compositeModel,
  });
  factory DescribeAssetPropertyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAssetPropertyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAssetResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  @_s.JsonKey(name: 'assetArn')
  final String assetArn;

  /// The date the asset was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'assetCreationDate')
  final DateTime assetCreationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  @_s.JsonKey(name: 'assetHierarchies')
  final List<AssetHierarchy> assetHierarchies;

  /// The ID of the asset.
  @_s.JsonKey(name: 'assetId')
  final String assetId;

  /// The date the asset was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'assetLastUpdateDate')
  final DateTime assetLastUpdateDate;

  /// The ID of the asset model that was used to create the asset.
  @_s.JsonKey(name: 'assetModelId')
  final String assetModelId;

  /// The name of the asset.
  @_s.JsonKey(name: 'assetName')
  final String assetName;

  /// The list of asset properties for the asset.
  ///
  /// This object doesn't include properties that you define in composite models.
  /// You can find composite model properties in the
  /// <code>assetCompositeModels</code> object.
  @_s.JsonKey(name: 'assetProperties')
  final List<AssetProperty> assetProperties;

  /// The current status of the asset, which contains a state and any error
  /// message.
  @_s.JsonKey(name: 'assetStatus')
  final AssetStatus assetStatus;

  /// The composite models for the asset.
  @_s.JsonKey(name: 'assetCompositeModels')
  final List<AssetCompositeModel> assetCompositeModels;

  DescribeAssetResponse({
    @_s.required this.assetArn,
    @_s.required this.assetCreationDate,
    @_s.required this.assetHierarchies,
    @_s.required this.assetId,
    @_s.required this.assetLastUpdateDate,
    @_s.required this.assetModelId,
    @_s.required this.assetName,
    @_s.required this.assetProperties,
    @_s.required this.assetStatus,
    this.assetCompositeModels,
  });
  factory DescribeAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDashboardResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the dashboard, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}</code>
  @_s.JsonKey(name: 'dashboardArn')
  final String dashboardArn;

  /// The date the dashboard was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'dashboardCreationDate')
  final DateTime dashboardCreationDate;

  /// The dashboard's definition JSON literal. For detailed information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating
  /// dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
  @_s.JsonKey(name: 'dashboardDefinition')
  final String dashboardDefinition;

  /// The ID of the dashboard.
  @_s.JsonKey(name: 'dashboardId')
  final String dashboardId;

  /// The date the dashboard was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'dashboardLastUpdateDate')
  final DateTime dashboardLastUpdateDate;

  /// The name of the dashboard.
  @_s.JsonKey(name: 'dashboardName')
  final String dashboardName;

  /// The ID of the project that the dashboard is in.
  @_s.JsonKey(name: 'projectId')
  final String projectId;

  /// The dashboard's description.
  @_s.JsonKey(name: 'dashboardDescription')
  final String dashboardDescription;

  DescribeDashboardResponse({
    @_s.required this.dashboardArn,
    @_s.required this.dashboardCreationDate,
    @_s.required this.dashboardDefinition,
    @_s.required this.dashboardId,
    @_s.required this.dashboardLastUpdateDate,
    @_s.required this.dashboardName,
    @_s.required this.projectId,
    this.dashboardDescription,
  });
  factory DescribeDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDashboardResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDefaultEncryptionConfigurationResponse {
  /// The status of the account configuration. This contains the
  /// <code>ConfigurationState</code>. If there's an error, it also contains the
  /// <code>ErrorDetails</code>.
  @_s.JsonKey(name: 'configurationStatus')
  final ConfigurationStatus configurationStatus;

  /// The type of encryption used for the encryption configuration.
  @_s.JsonKey(name: 'encryptionType')
  final EncryptionType encryptionType;

  /// The key ARN of the customer managed customer master key (CMK) used for AWS
  /// KMS encryption if you use <code>KMS_BASED_ENCRYPTION</code>.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  DescribeDefaultEncryptionConfigurationResponse({
    @_s.required this.configurationStatus,
    @_s.required this.encryptionType,
    this.kmsKeyArn,
  });
  factory DescribeDefaultEncryptionConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDefaultEncryptionConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGatewayCapabilityConfigurationResponse {
  /// The JSON document that defines the gateway capability's configuration. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/configure-sources.html#configure-source-cli">Configuring
  /// data sources (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
  @_s.JsonKey(name: 'capabilityConfiguration')
  final String capabilityConfiguration;

  /// The namespace of the gateway capability.
  @_s.JsonKey(name: 'capabilityNamespace')
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
  @_s.JsonKey(name: 'capabilitySyncStatus')
  final CapabilitySyncStatus capabilitySyncStatus;

  /// The ID of the gateway that defines the capability configuration.
  @_s.JsonKey(name: 'gatewayId')
  final String gatewayId;

  DescribeGatewayCapabilityConfigurationResponse({
    @_s.required this.capabilityConfiguration,
    @_s.required this.capabilityNamespace,
    @_s.required this.capabilitySyncStatus,
    @_s.required this.gatewayId,
  });
  factory DescribeGatewayCapabilityConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGatewayCapabilityConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGatewayResponse {
  /// The date the gateway was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the gateway, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}</code>
  @_s.JsonKey(name: 'gatewayArn')
  final String gatewayArn;

  /// A list of gateway capability summaries that each contain a namespace and
  /// status. Each gateway capability defines data sources for the gateway. To
  /// retrieve a capability configuration's definition, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.
  @_s.JsonKey(name: 'gatewayCapabilitySummaries')
  final List<GatewayCapabilitySummary> gatewayCapabilitySummaries;

  /// The ID of the gateway device.
  @_s.JsonKey(name: 'gatewayId')
  final String gatewayId;

  /// The name of the gateway.
  @_s.JsonKey(name: 'gatewayName')
  final String gatewayName;

  /// The date the gateway was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  /// The gateway's platform.
  @_s.JsonKey(name: 'gatewayPlatform')
  final GatewayPlatform gatewayPlatform;

  DescribeGatewayResponse({
    @_s.required this.creationDate,
    @_s.required this.gatewayArn,
    @_s.required this.gatewayCapabilitySummaries,
    @_s.required this.gatewayId,
    @_s.required this.gatewayName,
    @_s.required this.lastUpdateDate,
    this.gatewayPlatform,
  });
  factory DescribeGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLoggingOptionsResponse {
  /// The current logging options.
  @_s.JsonKey(name: 'loggingOptions')
  final LoggingOptions loggingOptions;

  DescribeLoggingOptionsResponse({
    @_s.required this.loggingOptions,
  });
  factory DescribeLoggingOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLoggingOptionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePortalResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the portal, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}</code>
  @_s.JsonKey(name: 'portalArn')
  final String portalArn;

  /// The AWS SSO application generated client ID (used with AWS SSO APIs). AWS
  /// IoT SiteWise includes <code>portalClientId</code> for only portals that use
  /// AWS SSO to authenticate users.
  @_s.JsonKey(name: 'portalClientId')
  final String portalClientId;

  /// The AWS administrator's contact email address.
  @_s.JsonKey(name: 'portalContactEmail')
  final String portalContactEmail;

  /// The date the portal was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'portalCreationDate')
  final DateTime portalCreationDate;

  /// The ID of the portal.
  @_s.JsonKey(name: 'portalId')
  final String portalId;

  /// The date the portal was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'portalLastUpdateDate')
  final DateTime portalLastUpdateDate;

  /// The name of the portal.
  @_s.JsonKey(name: 'portalName')
  final String portalName;

  /// The URL for the AWS IoT SiteWise Monitor portal. You can use this URL to
  /// access portals that use AWS SSO for authentication. For portals that use IAM
  /// for authentication, you must use the AWS IoT SiteWise console to get a URL
  /// that you can use to access the portal.
  @_s.JsonKey(name: 'portalStartUrl')
  final String portalStartUrl;

  /// The current status of the portal, which contains a state and any error
  /// message.
  @_s.JsonKey(name: 'portalStatus')
  final PortalStatus portalStatus;

  /// The service to use to authenticate users to the portal.
  @_s.JsonKey(name: 'portalAuthMode')
  final AuthMode portalAuthMode;

  /// The portal's description.
  @_s.JsonKey(name: 'portalDescription')
  final String portalDescription;

  /// The portal's logo image, which is available at a URL.
  @_s.JsonKey(name: 'portalLogoImageLocation')
  final ImageLocation portalLogoImageLocation;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the service role that allows the portal's users to access your AWS IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  DescribePortalResponse({
    @_s.required this.portalArn,
    @_s.required this.portalClientId,
    @_s.required this.portalContactEmail,
    @_s.required this.portalCreationDate,
    @_s.required this.portalId,
    @_s.required this.portalLastUpdateDate,
    @_s.required this.portalName,
    @_s.required this.portalStartUrl,
    @_s.required this.portalStatus,
    this.portalAuthMode,
    this.portalDescription,
    this.portalLogoImageLocation,
    this.roleArn,
  });
  factory DescribePortalResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePortalResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProjectResponse {
  /// The ID of the portal that the project is in.
  @_s.JsonKey(name: 'portalId')
  final String portalId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the project, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}</code>
  @_s.JsonKey(name: 'projectArn')
  final String projectArn;

  /// The date the project was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'projectCreationDate')
  final DateTime projectCreationDate;

  /// The ID of the project.
  @_s.JsonKey(name: 'projectId')
  final String projectId;

  /// The date the project was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'projectLastUpdateDate')
  final DateTime projectLastUpdateDate;

  /// The name of the project.
  @_s.JsonKey(name: 'projectName')
  final String projectName;

  /// The project's description.
  @_s.JsonKey(name: 'projectDescription')
  final String projectDescription;

  DescribeProjectResponse({
    @_s.required this.portalId,
    @_s.required this.projectArn,
    @_s.required this.projectCreationDate,
    @_s.required this.projectId,
    @_s.required this.projectLastUpdateDate,
    @_s.required this.projectName,
    this.projectDescription,
  });
  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProjectResponseFromJson(json);
}

enum EncryptionType {
  @_s.JsonValue('SITEWISE_DEFAULT_ENCRYPTION')
  sitewiseDefaultEncryption,
  @_s.JsonValue('KMS_BASED_ENCRYPTION')
  kmsBasedEncryption,
}

extension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.sitewiseDefaultEncryption:
        return 'SITEWISE_DEFAULT_ENCRYPTION';
      case EncryptionType.kmsBasedEncryption:
        return 'KMS_BASED_ENCRYPTION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ErrorCode {
  @_s.JsonValue('VALIDATION_ERROR')
  validationError,
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
}

/// Contains the details of an AWS IoT SiteWise error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorDetails {
  /// The error code.
  @_s.JsonKey(name: 'code')
  final ErrorCode code;

  /// The error message.
  @_s.JsonKey(name: 'message')
  final String message;

  ErrorDetails({
    @_s.required this.code,
    @_s.required this.message,
  });
  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsFromJson(json);
}

/// Contains expression variable information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExpressionVariable {
  /// The friendly name of the variable to be used in the expression.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The variable that identifies an asset property from which to use values.
  @_s.JsonKey(name: 'value')
  final VariableValue value;

  ExpressionVariable({
    @_s.required this.name,
    @_s.required this.value,
  });
  factory ExpressionVariable.fromJson(Map<String, dynamic> json) =>
      _$ExpressionVariableFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionVariableToJson(this);
}

/// Contains a summary of a gateway capability configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayCapabilitySummary {
  /// The namespace of the capability configuration. For example, if you configure
  /// OPC-UA sources from the AWS IoT SiteWise console, your OPC-UA capability
  /// configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where <code>version</code>
  /// is a number such as <code>1</code>.
  @_s.JsonKey(name: 'capabilityNamespace')
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
  @_s.JsonKey(name: 'capabilitySyncStatus')
  final CapabilitySyncStatus capabilitySyncStatus;

  GatewayCapabilitySummary({
    @_s.required this.capabilityNamespace,
    @_s.required this.capabilitySyncStatus,
  });
  factory GatewayCapabilitySummary.fromJson(Map<String, dynamic> json) =>
      _$GatewayCapabilitySummaryFromJson(json);
}

/// Contains a gateway's platform information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GatewayPlatform {
  /// A gateway that runs on AWS IoT Greengrass.
  @_s.JsonKey(name: 'greengrass')
  final Greengrass greengrass;

  GatewayPlatform({
    @_s.required this.greengrass,
  });
  factory GatewayPlatform.fromJson(Map<String, dynamic> json) =>
      _$GatewayPlatformFromJson(json);

  Map<String, dynamic> toJson() => _$GatewayPlatformToJson(this);
}

/// Contains a summary of a gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewaySummary {
  /// The date the gateway was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The ID of the gateway device.
  @_s.JsonKey(name: 'gatewayId')
  final String gatewayId;

  /// The name of the asset.
  @_s.JsonKey(name: 'gatewayName')
  final String gatewayName;

  /// The date the gateway was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  /// A list of gateway capability summaries that each contain a namespace and
  /// status. Each gateway capability defines data sources for the gateway. To
  /// retrieve a capability configuration's definition, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.
  @_s.JsonKey(name: 'gatewayCapabilitySummaries')
  final List<GatewayCapabilitySummary> gatewayCapabilitySummaries;

  GatewaySummary({
    @_s.required this.creationDate,
    @_s.required this.gatewayId,
    @_s.required this.gatewayName,
    @_s.required this.lastUpdateDate,
    this.gatewayCapabilitySummaries,
  });
  factory GatewaySummary.fromJson(Map<String, dynamic> json) =>
      _$GatewaySummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssetPropertyAggregatesResponse {
  /// The requested aggregated values.
  @_s.JsonKey(name: 'aggregatedValues')
  final List<AggregatedValue> aggregatedValues;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetAssetPropertyAggregatesResponse({
    @_s.required this.aggregatedValues,
    this.nextToken,
  });
  factory GetAssetPropertyAggregatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAssetPropertyAggregatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssetPropertyValueHistoryResponse {
  /// The asset property's value history.
  @_s.JsonKey(name: 'assetPropertyValueHistory')
  final List<AssetPropertyValue> assetPropertyValueHistory;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetAssetPropertyValueHistoryResponse({
    @_s.required this.assetPropertyValueHistory,
    this.nextToken,
  });
  factory GetAssetPropertyValueHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAssetPropertyValueHistoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssetPropertyValueResponse {
  /// The current asset property value.
  @_s.JsonKey(name: 'propertyValue')
  final AssetPropertyValue propertyValue;

  GetAssetPropertyValueResponse({
    this.propertyValue,
  });
  factory GetAssetPropertyValueResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAssetPropertyValueResponseFromJson(json);
}

/// Contains details for a gateway that runs on AWS IoT Greengrass. To create a
/// gateway that runs on AWS IoT Greengrass, you must add the IoT SiteWise
/// connector to a Greengrass group and deploy it. Your Greengrass group must
/// also have permissions to upload data to AWS IoT SiteWise. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting
/// data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Greengrass {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the Greengrass group. For more information about how to find a group's
  /// ARN, see <a
  /// href="https://docs.aws.amazon.com/greengrass/latest/apireference/listgroups-get.html">ListGroups</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/greengrass/latest/apireference/getgroup-get.html">GetGroup</a>
  /// in the <i>AWS IoT Greengrass API Reference</i>.
  @_s.JsonKey(name: 'groupArn')
  final String groupArn;

  Greengrass({
    @_s.required this.groupArn,
  });
  factory Greengrass.fromJson(Map<String, dynamic> json) =>
      _$GreengrassFromJson(json);

  Map<String, dynamic> toJson() => _$GreengrassToJson(this);
}

/// Contains information for a group identity in an access policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GroupIdentity {
  /// The AWS SSO ID of the group.
  @_s.JsonKey(name: 'id')
  final String id;

  GroupIdentity({
    @_s.required this.id,
  });
  factory GroupIdentity.fromJson(Map<String, dynamic> json) =>
      _$GroupIdentityFromJson(json);

  Map<String, dynamic> toJson() => _$GroupIdentityToJson(this);
}

/// Contains information about an AWS Identity and Access Management (IAM) user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IAMUserIdentity {
  /// The ARN of the IAM user. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// ARNs</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If you delete the IAM user, access policies that contain this identity
  /// include an empty <code>arn</code>. You can delete the access policy for the
  /// IAM user that no longer exists.
  /// </note>
  @_s.JsonKey(name: 'arn')
  final String arn;

  IAMUserIdentity({
    @_s.required this.arn,
  });
  factory IAMUserIdentity.fromJson(Map<String, dynamic> json) =>
      _$IAMUserIdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IAMUserIdentityToJson(this);
}

/// Contains an identity that can access an AWS IoT SiteWise Monitor resource.
/// <note>
/// Currently, you can't use AWS APIs to retrieve AWS SSO identity IDs. You can
/// find the AWS SSO identity IDs in the URL of user and group pages in the <a
/// href="https://console.aws.amazon.com/singlesignon">AWS SSO console</a>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Identity {
  /// An AWS SSO group identity.
  @_s.JsonKey(name: 'group')
  final GroupIdentity group;

  /// An IAM user identity.
  @_s.JsonKey(name: 'iamUser')
  final IAMUserIdentity iamUser;

  /// An AWS SSO user identity.
  @_s.JsonKey(name: 'user')
  final UserIdentity user;

  Identity({
    this.group,
    this.iamUser,
    this.user,
  });
  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}

enum IdentityType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('GROUP')
  group,
  @_s.JsonValue('IAM')
  iam,
}

extension on IdentityType {
  String toValue() {
    switch (this) {
      case IdentityType.user:
        return 'USER';
      case IdentityType.group:
        return 'GROUP';
      case IdentityType.iam:
        return 'IAM';
    }
    throw Exception('Unknown enum value: $this');
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Image {
  @_s.JsonKey(name: 'file')
  final ImageFile file;

  /// The ID of an existing image. Specify this parameter to keep an existing
  /// image.
  @_s.JsonKey(name: 'id')
  final String id;

  Image({
    this.file,
    this.id,
  });
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

/// Contains an image file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ImageFile {
  /// The image file contents, represented as a base64-encoded string. The file
  /// size must be less than 1 MB.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'data')
  final Uint8List data;

  /// The file type of the image.
  @_s.JsonKey(name: 'type')
  final ImageFileType type;

  ImageFile({
    @_s.required this.data,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$ImageFileToJson(this);
}

enum ImageFileType {
  @_s.JsonValue('PNG')
  png,
}

/// Contains an image that is uploaded to AWS IoT SiteWise and available at a
/// URL.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageLocation {
  /// The ID of the image.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The URL where the image is available. The URL is valid for 15 minutes so
  /// that you can view and download the image
  @_s.JsonKey(name: 'url')
  final String url;

  ImageLocation({
    @_s.required this.id,
    @_s.required this.url,
  });
  factory ImageLocation.fromJson(Map<String, dynamic> json) =>
      _$ImageLocationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccessPoliciesResponse {
  /// A list that summarizes each access policy.
  @_s.JsonKey(name: 'accessPolicySummaries')
  final List<AccessPolicySummary> accessPolicySummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAccessPoliciesResponse({
    @_s.required this.accessPolicySummaries,
    this.nextToken,
  });
  factory ListAccessPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccessPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssetModelsResponse {
  /// A list that summarizes each asset model.
  @_s.JsonKey(name: 'assetModelSummaries')
  final List<AssetModelSummary> assetModelSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssetModelsResponse({
    @_s.required this.assetModelSummaries,
    this.nextToken,
  });
  factory ListAssetModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAssetModelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssetRelationshipsResponse {
  /// A list that summarizes each asset relationship.
  @_s.JsonKey(name: 'assetRelationshipSummaries')
  final List<AssetRelationshipSummary> assetRelationshipSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssetRelationshipsResponse({
    @_s.required this.assetRelationshipSummaries,
    this.nextToken,
  });
  factory ListAssetRelationshipsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAssetRelationshipsResponseFromJson(json);
}

enum ListAssetsFilter {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('TOP_LEVEL')
  topLevel,
}

extension on ListAssetsFilter {
  String toValue() {
    switch (this) {
      case ListAssetsFilter.all:
        return 'ALL';
      case ListAssetsFilter.topLevel:
        return 'TOP_LEVEL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssetsResponse {
  /// A list that summarizes each asset.
  @_s.JsonKey(name: 'assetSummaries')
  final List<AssetSummary> assetSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssetsResponse({
    @_s.required this.assetSummaries,
    this.nextToken,
  });
  factory ListAssetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAssetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssociatedAssetsResponse {
  /// A list that summarizes the associated assets.
  @_s.JsonKey(name: 'assetSummaries')
  final List<AssociatedAssetsSummary> assetSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssociatedAssetsResponse({
    @_s.required this.assetSummaries,
    this.nextToken,
  });
  factory ListAssociatedAssetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAssociatedAssetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDashboardsResponse {
  /// A list that summarizes each dashboard in the project.
  @_s.JsonKey(name: 'dashboardSummaries')
  final List<DashboardSummary> dashboardSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDashboardsResponse({
    @_s.required this.dashboardSummaries,
    this.nextToken,
  });
  factory ListDashboardsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDashboardsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGatewaysResponse {
  /// A list that summarizes each gateway.
  @_s.JsonKey(name: 'gatewaySummaries')
  final List<GatewaySummary> gatewaySummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListGatewaysResponse({
    @_s.required this.gatewaySummaries,
    this.nextToken,
  });
  factory ListGatewaysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGatewaysResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPortalsResponse {
  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list that summarizes each portal.
  @_s.JsonKey(name: 'portalSummaries')
  final List<PortalSummary> portalSummaries;

  ListPortalsResponse({
    this.nextToken,
    this.portalSummaries,
  });
  factory ListPortalsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPortalsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectAssetsResponse {
  /// A list that contains the IDs of each asset associated with the project.
  @_s.JsonKey(name: 'assetIds')
  final List<String> assetIds;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListProjectAssetsResponse({
    @_s.required this.assetIds,
    this.nextToken,
  });
  factory ListProjectAssetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProjectAssetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectsResponse {
  /// A list that summarizes each project in the portal.
  @_s.JsonKey(name: 'projectSummaries')
  final List<ProjectSummary> projectSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListProjectsResponse({
    @_s.required this.projectSummaries,
    this.nextToken,
  });
  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProjectsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum LoggingLevel {
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('OFF')
  off,
}

/// Contains logging options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingOptions {
  /// The AWS IoT SiteWise logging verbosity level.
  @_s.JsonKey(name: 'level')
  final LoggingLevel level;

  LoggingOptions({
    @_s.required this.level,
  });
  factory LoggingOptions.fromJson(Map<String, dynamic> json) =>
      _$LoggingOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingOptionsToJson(this);
}

/// Contains an asset measurement property. This structure is empty. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#measurements">Measurements</a>
/// in the <i>AWS IoT SiteWise User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Measurement {
  Measurement();
  factory Measurement.fromJson(Map<String, dynamic> json) =>
      _$MeasurementFromJson(json);

  Map<String, dynamic> toJson() => _$MeasurementToJson(this);
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
/// in the <i>AWS IoT SiteWise User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Metric {
  /// The mathematical expression that defines the metric aggregation function.
  /// You can specify up to 10 variables per expression. You can specify up to 10
  /// functions per expression.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  @_s.JsonKey(name: 'expression')
  final String expression;

  /// The list of variables used in the expression.
  @_s.JsonKey(name: 'variables')
  final List<ExpressionVariable> variables;

  /// The window (time interval) over which AWS IoT SiteWise computes the metric's
  /// aggregation expression. AWS IoT SiteWise computes one data point per
  /// <code>window</code>.
  @_s.JsonKey(name: 'window')
  final MetricWindow window;

  Metric({
    @_s.required this.expression,
    @_s.required this.variables,
    @_s.required this.window,
  });
  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);

  Map<String, dynamic> toJson() => _$MetricToJson(this);
}

/// Contains a time interval window used for data aggregate computations (for
/// example, average, sum, count, and so on).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricWindow {
  /// The tumbling time interval window.
  @_s.JsonKey(name: 'tumbling')
  final TumblingWindow tumbling;

  MetricWindow({
    this.tumbling,
  });
  factory MetricWindow.fromJson(Map<String, dynamic> json) =>
      _$MetricWindowFromJson(json);

  Map<String, dynamic> toJson() => _$MetricWindowToJson(this);
}

enum MonitorErrorCode {
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
  @_s.JsonValue('VALIDATION_ERROR')
  validationError,
  @_s.JsonValue('LIMIT_EXCEEDED')
  limitExceeded,
}

/// Contains AWS IoT SiteWise Monitor error details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MonitorErrorDetails {
  /// The error code.
  @_s.JsonKey(name: 'code')
  final MonitorErrorCode code;

  /// The error message.
  @_s.JsonKey(name: 'message')
  final String message;

  MonitorErrorDetails({
    this.code,
    this.message,
  });
  factory MonitorErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$MonitorErrorDetailsFromJson(json);
}

enum Permission {
  @_s.JsonValue('ADMINISTRATOR')
  administrator,
  @_s.JsonValue('VIEWER')
  viewer,
}

extension on Permission {
  String toValue() {
    switch (this) {
      case Permission.administrator:
        return 'ADMINISTRATOR';
      case Permission.viewer:
        return 'VIEWER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Identifies an AWS IoT SiteWise Monitor portal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortalResource {
  /// The ID of the portal.
  @_s.JsonKey(name: 'id')
  final String id;

  PortalResource({
    @_s.required this.id,
  });
  factory PortalResource.fromJson(Map<String, dynamic> json) =>
      _$PortalResourceFromJson(json);

  Map<String, dynamic> toJson() => _$PortalResourceToJson(this);
}

enum PortalState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('FAILED')
  failed,
}

/// Contains information about the current status of a portal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PortalStatus {
  /// The current state of the portal.
  @_s.JsonKey(name: 'state')
  final PortalState state;

  /// Contains associated error information, if any.
  @_s.JsonKey(name: 'error')
  final MonitorErrorDetails error;

  PortalStatus({
    @_s.required this.state,
    this.error,
  });
  factory PortalStatus.fromJson(Map<String, dynamic> json) =>
      _$PortalStatusFromJson(json);
}

/// Contains a portal summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PortalSummary {
  /// The ID of the portal.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the portal.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The URL for the AWS IoT SiteWise Monitor portal. You can use this URL to
  /// access portals that use AWS SSO for authentication. For portals that use IAM
  /// for authentication, you must use the AWS IoT SiteWise console to get a URL
  /// that you can use to access the portal.
  @_s.JsonKey(name: 'startUrl')
  final String startUrl;
  @_s.JsonKey(name: 'status')
  final PortalStatus status;

  /// The date the portal was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The portal's description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date the portal was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the service role that allows the portal's users to access your AWS IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  PortalSummary({
    @_s.required this.id,
    @_s.required this.name,
    @_s.required this.startUrl,
    @_s.required this.status,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
    this.roleArn,
  });
  factory PortalSummary.fromJson(Map<String, dynamic> json) =>
      _$PortalSummaryFromJson(json);
}

/// Identifies a specific AWS IoT SiteWise Monitor project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProjectResource {
  /// The ID of the project.
  @_s.JsonKey(name: 'id')
  final String id;

  ProjectResource({
    @_s.required this.id,
  });
  factory ProjectResource.fromJson(Map<String, dynamic> json) =>
      _$ProjectResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResourceToJson(this);
}

/// Contains project summary information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectSummary {
  /// The ID of the project.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the project.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The date the project was created, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The project's description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date the project was last updated, in Unix epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateDate')
  final DateTime lastUpdateDate;

  ProjectSummary({
    @_s.required this.id,
    @_s.required this.name,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
  });
  factory ProjectSummary.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryFromJson(json);
}

/// Contains asset property information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Property {
  /// The property data type.
  @_s.JsonKey(name: 'dataType')
  final PropertyDataType dataType;

  /// The ID of the asset property.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the property.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  @_s.JsonKey(name: 'alias')
  final String alias;

  /// The asset property's notification topic and state. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  @_s.JsonKey(name: 'notification')
  final PropertyNotification notification;

  /// The property type (see <code>PropertyType</code>). A property contains one
  /// type.
  @_s.JsonKey(name: 'type')
  final PropertyType type;

  /// The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset
  /// property.
  @_s.JsonKey(name: 'unit')
  final String unit;

  Property({
    @_s.required this.dataType,
    @_s.required this.id,
    @_s.required this.name,
    this.alias,
    this.notification,
    this.type,
    this.unit,
  });
  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}

enum PropertyDataType {
  @_s.JsonValue('STRING')
  string,
  @_s.JsonValue('INTEGER')
  integer,
  @_s.JsonValue('DOUBLE')
  double,
  @_s.JsonValue('BOOLEAN')
  boolean,
  @_s.JsonValue('STRUCT')
  struct,
}

/// Contains asset property value notification information. When the
/// notification state is enabled, AWS IoT SiteWise publishes property value
/// updates to a unique MQTT topic. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting
/// with other services</a> in the <i>AWS IoT SiteWise User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PropertyNotification {
  /// The current notification state.
  @_s.JsonKey(name: 'state')
  final PropertyNotificationState state;

  /// The MQTT topic to which AWS IoT SiteWise publishes property value update
  /// notifications.
  @_s.JsonKey(name: 'topic')
  final String topic;

  PropertyNotification({
    @_s.required this.state,
    @_s.required this.topic,
  });
  factory PropertyNotification.fromJson(Map<String, dynamic> json) =>
      _$PropertyNotificationFromJson(json);
}

enum PropertyNotificationState {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on PropertyNotificationState {
  String toValue() {
    switch (this) {
      case PropertyNotificationState.enabled:
        return 'ENABLED';
      case PropertyNotificationState.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains a property type, which can be one of <code>attribute</code>,
/// <code>measurement</code>, <code>metric</code>, or <code>transform</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PropertyType {
  /// Specifies an asset attribute property. An attribute generally contains
  /// static information, such as the serial number of an <a
  /// href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">IIoT</a>
  /// wind turbine.
  @_s.JsonKey(name: 'attribute')
  final Attribute attribute;

  /// Specifies an asset measurement property. A measurement represents a device's
  /// raw sensor data stream, such as timestamped temperature values or
  /// timestamped power values.
  @_s.JsonKey(name: 'measurement')
  final Measurement measurement;

  /// Specifies an asset metric property. A metric contains a mathematical
  /// expression that uses aggregate functions to process all input data points
  /// over a time interval and output a single data point, such as to calculate
  /// the average hourly temperature.
  @_s.JsonKey(name: 'metric')
  final Metric metric;

  /// Specifies an asset transform property. A transform contains a mathematical
  /// expression that maps a property's data points from one form to another, such
  /// as a unit conversion from Celsius to Fahrenheit.
  @_s.JsonKey(name: 'transform')
  final Transform transform;

  PropertyType({
    this.attribute,
    this.measurement,
    this.metric,
    this.transform,
  });
  factory PropertyType.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyTypeToJson(this);
}

/// Contains a list of value updates for an asset property in the list of asset
/// entries consumed by the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a>
/// API operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PutAssetPropertyValueEntry {
  /// The user specified ID for the entry. You can use this ID to identify which
  /// entries failed.
  @_s.JsonKey(name: 'entryId')
  final String entryId;

  /// The list of property values to upload. You can specify up to 10
  /// <code>propertyValues</code> array elements.
  @_s.JsonKey(name: 'propertyValues')
  final List<AssetPropertyValue> propertyValues;

  /// The ID of the asset to update.
  @_s.JsonKey(name: 'assetId')
  final String assetId;

  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  @_s.JsonKey(name: 'propertyAlias')
  final String propertyAlias;

  /// The ID of the asset property for this entry.
  @_s.JsonKey(name: 'propertyId')
  final String propertyId;

  PutAssetPropertyValueEntry({
    @_s.required this.entryId,
    @_s.required this.propertyValues,
    this.assetId,
    this.propertyAlias,
    this.propertyId,
  });
  Map<String, dynamic> toJson() => _$PutAssetPropertyValueEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutDefaultEncryptionConfigurationResponse {
  /// The status of the account configuration. This contains the
  /// <code>ConfigurationState</code>. If there is an error, it also contains the
  /// <code>ErrorDetails</code>.
  @_s.JsonKey(name: 'configurationStatus')
  final ConfigurationStatus configurationStatus;

  /// The type of encryption used for the encryption configuration.
  @_s.JsonKey(name: 'encryptionType')
  final EncryptionType encryptionType;

  /// The Key ARN of the AWS KMS CMK used for AWS KMS encryption if you use
  /// <code>KMS_BASED_ENCRYPTION</code>.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  PutDefaultEncryptionConfigurationResponse({
    @_s.required this.configurationStatus,
    @_s.required this.encryptionType,
    this.kmsKeyArn,
  });
  factory PutDefaultEncryptionConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutDefaultEncryptionConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutLoggingOptionsResponse {
  PutLoggingOptionsResponse();
  factory PutLoggingOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutLoggingOptionsResponseFromJson(json);
}

enum Quality {
  @_s.JsonValue('GOOD')
  good,
  @_s.JsonValue('BAD')
  bad,
  @_s.JsonValue('UNCERTAIN')
  uncertain,
}

extension on Quality {
  String toValue() {
    switch (this) {
      case Quality.good:
        return 'GOOD';
      case Quality.bad:
        return 'BAD';
      case Quality.uncertain:
        return 'UNCERTAIN';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains an AWS IoT SiteWise Monitor resource ID for a portal or project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Resource {
  /// A portal resource.
  @_s.JsonKey(name: 'portal')
  final PortalResource portal;

  /// A project resource.
  @_s.JsonKey(name: 'project')
  final ProjectResource project;

  Resource({
    this.portal,
    this.project,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

enum ResourceType {
  @_s.JsonValue('PORTAL')
  portal,
  @_s.JsonValue('PROJECT')
  project,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.portal:
        return 'PORTAL';
      case ResourceType.project:
        return 'PROJECT';
    }
    throw Exception('Unknown enum value: $this');
  }
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

/// Contains a timestamp with optional nanosecond granularity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeInNanos {
  /// The timestamp date, in seconds, in the Unix epoch format. Fractional
  /// nanosecond data is provided by <code>offsetInNanos</code>.
  @_s.JsonKey(name: 'timeInSeconds')
  final int timeInSeconds;

  /// The nanosecond offset from <code>timeInSeconds</code>.
  @_s.JsonKey(name: 'offsetInNanos')
  final int offsetInNanos;

  TimeInNanos({
    @_s.required this.timeInSeconds,
    this.offsetInNanos,
  });
  factory TimeInNanos.fromJson(Map<String, dynamic> json) =>
      _$TimeInNanosFromJson(json);

  Map<String, dynamic> toJson() => _$TimeInNanosToJson(this);
}

enum TimeOrdering {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
  descending,
}

extension on TimeOrdering {
  String toValue() {
    switch (this) {
      case TimeOrdering.ascending:
        return 'ASCENDING';
      case TimeOrdering.descending:
        return 'DESCENDING';
    }
    throw Exception('Unknown enum value: $this');
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
/// in the <i>AWS IoT SiteWise User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Transform {
  /// The mathematical expression that defines the transformation function. You
  /// can specify up to 10 variables per expression. You can specify up to 10
  /// functions per expression.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  @_s.JsonKey(name: 'expression')
  final String expression;

  /// The list of variables used in the expression.
  @_s.JsonKey(name: 'variables')
  final List<ExpressionVariable> variables;

  Transform({
    @_s.required this.expression,
    @_s.required this.variables,
  });
  factory Transform.fromJson(Map<String, dynamic> json) =>
      _$TransformFromJson(json);

  Map<String, dynamic> toJson() => _$TransformToJson(this);
}

enum TraversalDirection {
  @_s.JsonValue('PARENT')
  parent,
  @_s.JsonValue('CHILD')
  child,
}

extension on TraversalDirection {
  String toValue() {
    switch (this) {
      case TraversalDirection.parent:
        return 'PARENT';
      case TraversalDirection.child:
        return 'CHILD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum TraversalType {
  @_s.JsonValue('PATH_TO_ROOT')
  pathToRoot,
}

extension on TraversalType {
  String toValue() {
    switch (this) {
      case TraversalType.pathToRoot:
        return 'PATH_TO_ROOT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains a tumbling window, which is a repeating fixed-sized,
/// non-overlapping, and contiguous time interval. This window is used in metric
/// and aggregation computations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TumblingWindow {
  /// The time interval for the tumbling window. Note that <code>w</code>
  /// represents weeks, <code>d</code> represents days, <code>h</code> represents
  /// hours, and <code>m</code> represents minutes. AWS IoT SiteWise computes the
  /// <code>1w</code> interval the end of Sunday at midnight each week (UTC), the
  /// <code>1d</code> interval at the end of each day at midnight (UTC), the
  /// <code>1h</code> interval at the end of each hour, and so on.
  ///
  /// When AWS IoT SiteWise aggregates data points for metric computations, the
  /// start of each interval is exclusive and the end of each interval is
  /// inclusive. AWS IoT SiteWise places the computed data point at the end of the
  /// interval.
  @_s.JsonKey(name: 'interval')
  final String interval;

  TumblingWindow({
    @_s.required this.interval,
  });
  factory TumblingWindow.fromJson(Map<String, dynamic> json) =>
      _$TumblingWindowFromJson(json);

  Map<String, dynamic> toJson() => _$TumblingWindowToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAccessPolicyResponse {
  UpdateAccessPolicyResponse();
  factory UpdateAccessPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccessPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssetModelResponse {
  /// The status of the asset model, which contains a state (<code>UPDATING</code>
  /// after successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'assetModelStatus')
  final AssetModelStatus assetModelStatus;

  UpdateAssetModelResponse({
    @_s.required this.assetModelStatus,
  });
  factory UpdateAssetModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssetModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssetResponse {
  /// The status of the asset, which contains a state (<code>UPDATING</code> after
  /// successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'assetStatus')
  final AssetStatus assetStatus;

  UpdateAssetResponse({
    @_s.required this.assetStatus,
  });
  factory UpdateAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDashboardResponse {
  UpdateDashboardResponse();
  factory UpdateDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDashboardResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGatewayCapabilityConfigurationResponse {
  /// The namespace of the gateway capability.
  @_s.JsonKey(name: 'capabilityNamespace')
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
  @_s.JsonKey(name: 'capabilitySyncStatus')
  final CapabilitySyncStatus capabilitySyncStatus;

  UpdateGatewayCapabilityConfigurationResponse({
    @_s.required this.capabilityNamespace,
    @_s.required this.capabilitySyncStatus,
  });
  factory UpdateGatewayCapabilityConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateGatewayCapabilityConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePortalResponse {
  /// The status of the portal, which contains a state (<code>UPDATING</code>
  /// after successfully calling this operation) and any error message.
  @_s.JsonKey(name: 'portalStatus')
  final PortalStatus portalStatus;

  UpdatePortalResponse({
    @_s.required this.portalStatus,
  });
  factory UpdatePortalResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePortalResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProjectResponse {
  UpdateProjectResponse();
  factory UpdateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectResponseFromJson(json);
}

/// Contains information for a user identity in an access policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserIdentity {
  /// The AWS SSO ID of the user.
  @_s.JsonKey(name: 'id')
  final String id;

  UserIdentity({
    @_s.required this.id,
  });
  factory UserIdentity.fromJson(Map<String, dynamic> json) =>
      _$UserIdentityFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdentityToJson(this);
}

/// Identifies a property value used in an expression.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VariableValue {
  /// The ID of the property to use as the variable. You can use the property
  /// <code>name</code> if it's from the same asset model.
  @_s.JsonKey(name: 'propertyId')
  final String propertyId;

  /// The ID of the hierarchy to query for the property ID. You can use the
  /// hierarchy's name instead of the hierarchy's ID.
  ///
  /// You use a hierarchy ID instead of a model ID because you can have several
  /// hierarchies using the same model and therefore the same
  /// <code>propertyId</code>. For example, you might have separately grouped
  /// assets that come from the same asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  @_s.JsonKey(name: 'hierarchyId')
  final String hierarchyId;

  VariableValue({
    @_s.required this.propertyId,
    this.hierarchyId,
  });
  factory VariableValue.fromJson(Map<String, dynamic> json) =>
      _$VariableValueFromJson(json);

  Map<String, dynamic> toJson() => _$VariableValueToJson(this);
}

/// Contains an asset property value (of a single type only).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Variant {
  /// Asset property data of type Boolean (true or false).
  @_s.JsonKey(name: 'booleanValue')
  final bool booleanValue;

  /// Asset property data of type double (floating point number).
  @_s.JsonKey(name: 'doubleValue')
  final double doubleValue;

  /// Asset property data of type integer (whole number).
  @_s.JsonKey(name: 'integerValue')
  final int integerValue;

  /// Asset property data of type string (sequence of characters).
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  Variant({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });
  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}

class ConflictingOperationException extends _s.GenericAwsException {
  ConflictingOperationException({String type, String message})
      : super(
            type: type,
            code: 'ConflictingOperationException',
            message: message);
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
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
