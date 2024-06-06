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

/// Amazon DataZone is a data management service that enables you to catalog,
/// discover, govern, share, and analyze your data. With Amazon DataZone, you
/// can share and access your data across accounts and supported regions. Amazon
/// DataZone simplifies your experience across Amazon Web Services services,
/// including, but not limited to, Amazon Redshift, Amazon Athena, Amazon Web
/// Services Glue, and Amazon Web Services Lake Formation.
class DataZone {
  final _s.RestJsonProtocol _protocol;
  DataZone({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'datazone',
            signingName: 'datazone',
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

  /// Accepts automatically generated business-friendly metadata for your Amazon
  /// DataZone assets.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [identifier] :
  /// The identifier of the asset.
  ///
  /// Parameter [acceptChoices] :
  /// Specifies the prediction (aka, the automatically generated piece of
  /// metadata) and the target (for example, a column name) that can be
  /// accepted.
  ///
  /// Parameter [acceptRule] :
  /// Specifies the rule (or the conditions) under which a prediction can be
  /// accepted.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  /// This field is automatically populated if not provided.
  ///
  /// Parameter [revision] :
  /// The revision that is to be made to the asset.
  Future<AcceptPredictionsOutput> acceptPredictions({
    required String domainIdentifier,
    required String identifier,
    List<AcceptChoice>? acceptChoices,
    AcceptRule? acceptRule,
    String? clientToken,
    String? revision,
  }) async {
    final $query = <String, List<String>>{
      if (revision != null) 'revision': [revision],
    };
    final $payload = <String, dynamic>{
      if (acceptChoices != null) 'acceptChoices': acceptChoices,
      if (acceptRule != null) 'acceptRule': acceptRule,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/assets/${Uri.encodeComponent(identifier)}/accept-predictions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AcceptPredictionsOutput.fromJson(response);
  }

  /// Accepts a subscription request to a specific asset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The Amazon DataZone domain where the specified subscription request is
  /// being accepted.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the subscription request that is to be accepted.
  ///
  /// Parameter [decisionComment] :
  /// A description that specifies the reason for accepting the specified
  /// subscription request.
  Future<AcceptSubscriptionRequestOutput> acceptSubscriptionRequest({
    required String domainIdentifier,
    required String identifier,
    String? decisionComment,
  }) async {
    final $payload = <String, dynamic>{
      if (decisionComment != null) 'decisionComment': decisionComment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-requests/${Uri.encodeComponent(identifier)}/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptSubscriptionRequestOutput.fromJson(response);
  }

  /// Cancels the metadata generation run.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the metadata generation run
  /// is to be cancelled.
  ///
  /// Parameter [identifier] :
  /// The ID of the metadata generation run.
  Future<void> cancelMetadataGenerationRun({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/metadata-generation-runs/${Uri.encodeComponent(identifier)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels the subscription to the specified asset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The unique identifier of the Amazon DataZone domain where the subscription
  /// request is being cancelled.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the subscription that is being cancelled.
  Future<CancelSubscriptionOutput> cancelSubscription({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscriptions/${Uri.encodeComponent(identifier)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelSubscriptionOutput.fromJson(response);
  }

  /// Creates an asset in Amazon DataZone catalog.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// Amazon DataZone domain where the asset is created.
  ///
  /// Parameter [name] :
  /// Asset name.
  ///
  /// Parameter [owningProjectIdentifier] :
  /// The unique identifier of the project that owns this asset.
  ///
  /// Parameter [typeIdentifier] :
  /// The unique identifier of this asset's type.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// Asset description.
  ///
  /// Parameter [externalIdentifier] :
  /// The external identifier of the asset.
  ///
  /// Parameter [formsInput] :
  /// Metadata forms attached to the asset.
  ///
  /// Parameter [glossaryTerms] :
  /// Glossary terms attached to the asset.
  ///
  /// Parameter [predictionConfiguration] :
  /// The configuration of the automatically generated business-friendly
  /// metadata for the asset.
  ///
  /// Parameter [typeRevision] :
  /// The revision of this asset's type.
  Future<CreateAssetOutput> createAsset({
    required String domainIdentifier,
    required String name,
    required String owningProjectIdentifier,
    required String typeIdentifier,
    String? clientToken,
    String? description,
    String? externalIdentifier,
    List<FormInput>? formsInput,
    List<String>? glossaryTerms,
    PredictionConfiguration? predictionConfiguration,
    String? typeRevision,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'owningProjectIdentifier': owningProjectIdentifier,
      'typeIdentifier': typeIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (externalIdentifier != null) 'externalIdentifier': externalIdentifier,
      if (formsInput != null) 'formsInput': formsInput,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (predictionConfiguration != null)
        'predictionConfiguration': predictionConfiguration,
      if (typeRevision != null) 'typeRevision': typeRevision,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/assets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssetOutput.fromJson(response);
  }

  /// Creates a revision of the asset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The unique identifier of the domain where the asset is being revised.
  ///
  /// Parameter [identifier] :
  /// The identifier of the asset.
  ///
  /// Parameter [name] :
  /// Te revised name of the asset.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The revised description of the asset.
  ///
  /// Parameter [formsInput] :
  /// The metadata forms to be attached to the asset as part of asset revision.
  ///
  /// Parameter [glossaryTerms] :
  /// The glossary terms to be attached to the asset as part of asset revision.
  ///
  /// Parameter [predictionConfiguration] :
  /// The configuration of the automatically generated business-friendly
  /// metadata for the asset.
  ///
  /// Parameter [typeRevision] :
  /// The revision type of the asset.
  Future<CreateAssetRevisionOutput> createAssetRevision({
    required String domainIdentifier,
    required String identifier,
    required String name,
    String? clientToken,
    String? description,
    List<FormInput>? formsInput,
    List<String>? glossaryTerms,
    PredictionConfiguration? predictionConfiguration,
    String? typeRevision,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (formsInput != null) 'formsInput': formsInput,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (predictionConfiguration != null)
        'predictionConfiguration': predictionConfiguration,
      if (typeRevision != null) 'typeRevision': typeRevision,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/assets/${Uri.encodeComponent(identifier)}/revisions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssetRevisionOutput.fromJson(response);
  }

  /// Creates a custom asset type.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The unique identifier of the Amazon DataZone domain where the custom asset
  /// type is being created.
  ///
  /// Parameter [formsInput] :
  /// The metadata forms that are to be attached to the custom asset type.
  ///
  /// Parameter [name] :
  /// The name of the custom asset type.
  ///
  /// Parameter [owningProjectIdentifier] :
  /// The identifier of the Amazon DataZone project that is to own the custom
  /// asset type.
  ///
  /// Parameter [description] :
  /// The descripton of the custom asset type.
  Future<CreateAssetTypeOutput> createAssetType({
    required String domainIdentifier,
    required Map<String, FormEntryInput> formsInput,
    required String name,
    required String owningProjectIdentifier,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'formsInput': formsInput,
      'name': name,
      'owningProjectIdentifier': owningProjectIdentifier,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/asset-types',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssetTypeOutput.fromJson(response);
  }

  /// Creates an Amazon DataZone data source.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain where the data source is created.
  ///
  /// Parameter [environmentIdentifier] :
  /// The unique identifier of the Amazon DataZone environment to which the data
  /// source publishes assets.
  ///
  /// Parameter [name] :
  /// The name of the data source.
  ///
  /// Parameter [projectIdentifier] :
  /// The identifier of the Amazon DataZone project in which you want to add
  /// this data source.
  ///
  /// Parameter [type] :
  /// The type of the data source.
  ///
  /// Parameter [assetFormsInput] :
  /// The metadata forms that are to be attached to the assets that this data
  /// source works with.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [configuration] :
  /// Specifies the configuration of the data source. It can be set to either
  /// <code>glueRunConfiguration</code> or
  /// <code>redshiftRunConfiguration</code>.
  ///
  /// Parameter [description] :
  /// The description of the data source.
  ///
  /// Parameter [enableSetting] :
  /// Specifies whether the data source is enabled.
  ///
  /// Parameter [publishOnImport] :
  /// Specifies whether the assets that this data source creates in the
  /// inventory are to be also automatically published to the catalog.
  ///
  /// Parameter [recommendation] :
  /// Specifies whether the business name generation is to be enabled for this
  /// data source.
  ///
  /// Parameter [schedule] :
  /// The schedule of the data source runs.
  Future<CreateDataSourceOutput> createDataSource({
    required String domainIdentifier,
    required String environmentIdentifier,
    required String name,
    required String projectIdentifier,
    required String type,
    List<FormInput>? assetFormsInput,
    String? clientToken,
    DataSourceConfigurationInput? configuration,
    String? description,
    EnableSetting? enableSetting,
    bool? publishOnImport,
    RecommendationConfiguration? recommendation,
    ScheduleConfiguration? schedule,
  }) async {
    final $payload = <String, dynamic>{
      'environmentIdentifier': environmentIdentifier,
      'name': name,
      'projectIdentifier': projectIdentifier,
      'type': type,
      if (assetFormsInput != null) 'assetFormsInput': assetFormsInput,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
      if (enableSetting != null) 'enableSetting': enableSetting.toValue(),
      if (publishOnImport != null) 'publishOnImport': publishOnImport,
      if (recommendation != null) 'recommendation': recommendation,
      if (schedule != null) 'schedule': schedule,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-sources',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataSourceOutput.fromJson(response);
  }

  /// Creates an Amazon DataZone domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainExecutionRole] :
  /// The domain execution role that is created when an Amazon DataZone domain
  /// is created. The domain execution role is created in the Amazon Web
  /// Services account that houses the Amazon DataZone domain.
  ///
  /// Parameter [name] :
  /// The name of the Amazon DataZone domain.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description of the Amazon DataZone domain.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier of the Amazon Web Services Key Management Service (KMS) key
  /// that is used to encrypt the Amazon DataZone domain, metadata, and
  /// reporting data.
  ///
  /// Parameter [singleSignOn] :
  /// The single-sign on configuration of the Amazon DataZone domain.
  ///
  /// Parameter [tags] :
  /// The tags specified for the Amazon DataZone domain.
  Future<CreateDomainOutput> createDomain({
    required String domainExecutionRole,
    required String name,
    String? clientToken,
    String? description,
    String? kmsKeyIdentifier,
    SingleSignOn? singleSignOn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'domainExecutionRole': domainExecutionRole,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (singleSignOn != null) 'singleSignOn': singleSignOn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/domains',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainOutput.fromJson(response);
  }

  /// Create an Amazon DataZone environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which the environment is
  /// created.
  ///
  /// Parameter [environmentProfileIdentifier] :
  /// The identifier of the environment profile that is used to create this
  /// Amazon DataZone environment.
  ///
  /// Parameter [name] :
  /// The name of the Amazon DataZone environment.
  ///
  /// Parameter [projectIdentifier] :
  /// The identifier of the Amazon DataZone project in which this environment is
  /// created.
  ///
  /// Parameter [description] :
  /// The description of the Amazon DataZone environment.
  ///
  /// Parameter [glossaryTerms] :
  /// The glossary terms that can be used in this Amazon DataZone environment.
  ///
  /// Parameter [userParameters] :
  /// The user parameters of this Amazon DataZone environment.
  Future<CreateEnvironmentOutput> createEnvironment({
    required String domainIdentifier,
    required String environmentProfileIdentifier,
    required String name,
    required String projectIdentifier,
    String? description,
    List<String>? glossaryTerms,
    List<EnvironmentParameter>? userParameters,
  }) async {
    final $payload = <String, dynamic>{
      'environmentProfileIdentifier': environmentProfileIdentifier,
      'name': name,
      'projectIdentifier': projectIdentifier,
      if (description != null) 'description': description,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (userParameters != null) 'userParameters': userParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEnvironmentOutput.fromJson(response);
  }

  /// Creates an Amazon DataZone environment profile.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this environment profile is
  /// created.
  ///
  /// Parameter [environmentBlueprintIdentifier] :
  /// The ID of the blueprint with which this environment profile is created.
  ///
  /// Parameter [name] :
  /// The name of this Amazon DataZone environment profile.
  ///
  /// Parameter [projectIdentifier] :
  /// The identifier of the project in which to create the environment profile.
  ///
  /// Parameter [awsAccountId] :
  /// The Amazon Web Services account in which the Amazon DataZone environment
  /// is created.
  ///
  /// Parameter [awsAccountRegion] :
  /// The Amazon Web Services region in which this environment profile is
  /// created.
  ///
  /// Parameter [description] :
  /// The description of this Amazon DataZone environment profile.
  ///
  /// Parameter [userParameters] :
  /// The user parameters of this Amazon DataZone environment profile.
  Future<CreateEnvironmentProfileOutput> createEnvironmentProfile({
    required String domainIdentifier,
    required String environmentBlueprintIdentifier,
    required String name,
    required String projectIdentifier,
    String? awsAccountId,
    String? awsAccountRegion,
    String? description,
    List<EnvironmentParameter>? userParameters,
  }) async {
    final $payload = <String, dynamic>{
      'environmentBlueprintIdentifier': environmentBlueprintIdentifier,
      'name': name,
      'projectIdentifier': projectIdentifier,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (description != null) 'description': description,
      if (userParameters != null) 'userParameters': userParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEnvironmentProfileOutput.fromJson(response);
  }

  /// Creates a metadata form type.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this metadata form type is
  /// created.
  ///
  /// Parameter [model] :
  /// The model of this Amazon DataZone metadata form type.
  ///
  /// Parameter [name] :
  /// The name of this Amazon DataZone metadata form type.
  ///
  /// Parameter [owningProjectIdentifier] :
  /// The ID of the Amazon DataZone project that owns this metadata form type.
  ///
  /// Parameter [description] :
  /// The description of this Amazon DataZone metadata form type.
  ///
  /// Parameter [status] :
  /// The status of this Amazon DataZone metadata form type.
  Future<CreateFormTypeOutput> createFormType({
    required String domainIdentifier,
    required Model model,
    required String name,
    required String owningProjectIdentifier,
    String? description,
    FormTypeStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'model': model,
      'name': name,
      'owningProjectIdentifier': owningProjectIdentifier,
      if (description != null) 'description': description,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/form-types',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFormTypeOutput.fromJson(response);
  }

  /// Creates an Amazon DataZone business glossary.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this business glossary is
  /// created.
  ///
  /// Parameter [name] :
  /// The name of this business glossary.
  ///
  /// Parameter [owningProjectIdentifier] :
  /// The ID of the project that currently owns business glossary.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description of this business glossary.
  ///
  /// Parameter [status] :
  /// The status of this business glossary.
  Future<CreateGlossaryOutput> createGlossary({
    required String domainIdentifier,
    required String name,
    required String owningProjectIdentifier,
    String? clientToken,
    String? description,
    GlossaryStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'owningProjectIdentifier': owningProjectIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/glossaries',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGlossaryOutput.fromJson(response);
  }

  /// Creates a business glossary term.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this business glossary term
  /// is created.
  ///
  /// Parameter [glossaryIdentifier] :
  /// The ID of the business glossary in which this term is created.
  ///
  /// Parameter [name] :
  /// The name of this business glossary term.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [longDescription] :
  /// The long description of this business glossary term.
  ///
  /// Parameter [shortDescription] :
  /// The short description of this business glossary term.
  ///
  /// Parameter [status] :
  /// The status of this business glossary term.
  ///
  /// Parameter [termRelations] :
  /// The term relations of this business glossary term.
  Future<CreateGlossaryTermOutput> createGlossaryTerm({
    required String domainIdentifier,
    required String glossaryIdentifier,
    required String name,
    String? clientToken,
    String? longDescription,
    String? shortDescription,
    GlossaryTermStatus? status,
    TermRelations? termRelations,
  }) async {
    final $payload = <String, dynamic>{
      'glossaryIdentifier': glossaryIdentifier,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (longDescription != null) 'longDescription': longDescription,
      if (shortDescription != null) 'shortDescription': shortDescription,
      if (status != null) 'status': status.toValue(),
      if (termRelations != null) 'termRelations': termRelations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/glossary-terms',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGlossaryTermOutput.fromJson(response);
  }

  /// Creates a group profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which the group profile is
  /// created.
  ///
  /// Parameter [groupIdentifier] :
  /// The identifier of the group for which the group profile is created.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  Future<CreateGroupProfileOutput> createGroupProfile({
    required String domainIdentifier,
    required String groupIdentifier,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'groupIdentifier': groupIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/group-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupProfileOutput.fromJson(response);
  }

  /// Publishes a listing (a record of an asset at a given time) or removes a
  /// listing from the catalog.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [action] :
  /// Specifies whether to publish or unpublish a listing.
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain.
  ///
  /// Parameter [entityIdentifier] :
  /// The ID of the asset.
  ///
  /// Parameter [entityType] :
  /// The type of an entity.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [entityRevision] :
  /// The revision of an asset.
  Future<CreateListingChangeSetOutput> createListingChangeSet({
    required ChangeAction action,
    required String domainIdentifier,
    required String entityIdentifier,
    required EntityType entityType,
    String? clientToken,
    String? entityRevision,
  }) async {
    final $payload = <String, dynamic>{
      'action': action.toValue(),
      'entityIdentifier': entityIdentifier,
      'entityType': entityType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (entityRevision != null) 'entityRevision': entityRevision,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/listings/change-set',
      exceptionFnMap: _exceptionFns,
    );
    return CreateListingChangeSetOutput.fromJson(response);
  }

  /// Creates an Amazon DataZone project.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this project is created.
  ///
  /// Parameter [name] :
  /// The name of the Amazon DataZone project.
  ///
  /// Parameter [description] :
  /// The description of the Amazon DataZone project.
  ///
  /// Parameter [glossaryTerms] :
  /// The glossary terms that can be used in this Amazon DataZone project.
  Future<CreateProjectOutput> createProject({
    required String domainIdentifier,
    required String name,
    String? description,
    List<String>? glossaryTerms,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (description != null) 'description': description,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/projects',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProjectOutput.fromJson(response);
  }

  /// Creates a project membership in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [designation] :
  /// The designation of the project membership.
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which project membership is
  /// created.
  ///
  /// Parameter [member] :
  /// The project member whose project membership was created.
  ///
  /// Parameter [projectIdentifier] :
  /// The ID of the project for which this project membership was created.
  Future<void> createProjectMembership({
    required UserDesignation designation,
    required String domainIdentifier,
    required Member member,
    required String projectIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'designation': designation.toValue(),
      'member': member,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/projects/${Uri.encodeComponent(projectIdentifier)}/createMembership',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a subsscription grant in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the subscription grant is
  /// created.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment in which the subscription grant is created.
  ///
  /// Parameter [grantedEntity] :
  /// The entity to which the subscription is to be granted.
  ///
  /// Parameter [subscriptionTargetIdentifier] :
  /// The ID of the subscription target for which the subscription grant is
  /// created.
  ///
  /// Parameter [assetTargetNames] :
  /// The names of the assets for which the subscription grant is created.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  Future<CreateSubscriptionGrantOutput> createSubscriptionGrant({
    required String domainIdentifier,
    required String environmentIdentifier,
    required GrantedEntityInput grantedEntity,
    required String subscriptionTargetIdentifier,
    List<AssetTargetNameMap>? assetTargetNames,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'environmentIdentifier': environmentIdentifier,
      'grantedEntity': grantedEntity,
      'subscriptionTargetIdentifier': subscriptionTargetIdentifier,
      if (assetTargetNames != null) 'assetTargetNames': assetTargetNames,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-grants',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriptionGrantOutput.fromJson(response);
  }

  /// Creates a subscription request in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the subscription request is
  /// created.
  ///
  /// Parameter [requestReason] :
  /// The reason for the subscription request.
  ///
  /// Parameter [subscribedListings] :
  /// The published asset for which the subscription grant is to be created.
  ///
  /// Parameter [subscribedPrincipals] :
  /// The Amazon DataZone principals for whom the subscription request is
  /// created.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  Future<CreateSubscriptionRequestOutput> createSubscriptionRequest({
    required String domainIdentifier,
    required String requestReason,
    required List<SubscribedListingInput> subscribedListings,
    required List<SubscribedPrincipalInput> subscribedPrincipals,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'requestReason': requestReason,
      'subscribedListings': subscribedListings,
      'subscribedPrincipals': subscribedPrincipals,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-requests',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriptionRequestOutput.fromJson(response);
  }

  /// Creates a subscription target in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [applicableAssetTypes] :
  /// The asset types that can be included in the subscription target.
  ///
  /// Parameter [authorizedPrincipals] :
  /// The authorized principals of the subscription target.
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which subscription target is
  /// created.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment in which subscription target is created.
  ///
  /// Parameter [manageAccessRole] :
  /// The manage access role that is used to create the subscription target.
  ///
  /// Parameter [name] :
  /// The name of the subscription target.
  ///
  /// Parameter [subscriptionTargetConfig] :
  /// The configuration of the subscription target.
  ///
  /// Parameter [type] :
  /// The type of the subscription target.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [provider] :
  /// The provider of the subscription target.
  Future<CreateSubscriptionTargetOutput> createSubscriptionTarget({
    required List<String> applicableAssetTypes,
    required List<String> authorizedPrincipals,
    required String domainIdentifier,
    required String environmentIdentifier,
    required String manageAccessRole,
    required String name,
    required List<SubscriptionTargetForm> subscriptionTargetConfig,
    required String type,
    String? clientToken,
    String? provider,
  }) async {
    final $payload = <String, dynamic>{
      'applicableAssetTypes': applicableAssetTypes,
      'authorizedPrincipals': authorizedPrincipals,
      'manageAccessRole': manageAccessRole,
      'name': name,
      'subscriptionTargetConfig': subscriptionTargetConfig,
      'type': type,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (provider != null) 'provider': provider,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments/${Uri.encodeComponent(environmentIdentifier)}/subscription-targets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriptionTargetOutput.fromJson(response);
  }

  /// Creates a user profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a user profile is
  /// created.
  ///
  /// Parameter [userIdentifier] :
  /// The identifier of the user for which the user profile is created.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [userType] :
  /// The user type of the user for which the user profile is created.
  Future<CreateUserProfileOutput> createUserProfile({
    required String domainIdentifier,
    required String userIdentifier,
    String? clientToken,
    UserType? userType,
  }) async {
    final $payload = <String, dynamic>{
      'userIdentifier': userIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (userType != null) 'userType': userType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/user-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserProfileOutput.fromJson(response);
  }

  /// Delets an asset in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the asset is deleted.
  ///
  /// Parameter [identifier] :
  /// The identifier of the asset that is deleted.
  Future<void> deleteAsset({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/assets/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an asset type in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the asset type is deleted.
  ///
  /// Parameter [identifier] :
  /// The identifier of the asset type that is deleted.
  Future<void> deleteAssetType({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/asset-types/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a data source in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the data source is deleted.
  ///
  /// Parameter [identifier] :
  /// The identifier of the data source that is deleted.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  Future<DeleteDataSourceOutput> deleteDataSource({
    required String domainIdentifier,
    required String identifier,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-sources/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataSourceOutput.fromJson(response);
  }

  /// Deletes a Amazon DataZone domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the Amazon Web Services domain that is to be deleted.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [skipDeletionCheck] :
  /// Specifies the optional flag to delete all child entities within the
  /// domain.
  Future<DeleteDomainOutput> deleteDomain({
    required String identifier,
    String? clientToken,
    bool? skipDeletionCheck,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
      if (skipDeletionCheck != null)
        'skipDeletionCheck': [skipDeletionCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/domains/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainOutput.fromJson(response);
  }

  /// Deletes an environment in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the environment is deleted.
  ///
  /// Parameter [identifier] :
  /// The identifier of the environment that is to be deleted.
  Future<void> deleteEnvironment({
    required String domainIdentifier,
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the blueprint configuration in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the blueprint configuration
  /// is deleted.
  ///
  /// Parameter [environmentBlueprintIdentifier] :
  /// The ID of the blueprint the configuration of which is deleted.
  Future<void> deleteEnvironmentBlueprintConfiguration({
    required String domainIdentifier,
    required String environmentBlueprintIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-blueprint-configurations/${Uri.encodeComponent(environmentBlueprintIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an environment profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the environment profile is
  /// deleted.
  ///
  /// Parameter [identifier] :
  /// The ID of the environment profile that is deleted.
  Future<void> deleteEnvironmentProfile({
    required String domainIdentifier,
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-profiles/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delets and metadata form type in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the metadata form type is
  /// deleted.
  ///
  /// Parameter [formTypeIdentifier] :
  /// The ID of the metadata form type that is deleted.
  Future<void> deleteFormType({
    required String domainIdentifier,
    required String formTypeIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/form-types/${Uri.encodeComponent(formTypeIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a business glossary in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the business glossary is
  /// deleted.
  ///
  /// Parameter [identifier] :
  /// The ID of the business glossary that is deleted.
  Future<void> deleteGlossary({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/glossaries/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a business glossary term in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the business glossary term
  /// is deleted.
  ///
  /// Parameter [identifier] :
  /// The ID of the business glossary term that is deleted.
  Future<void> deleteGlossaryTerm({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/glossary-terms/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a listing (a record of an asset at a given time).
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain.
  ///
  /// Parameter [identifier] :
  /// The ID of the listing to be deleted.
  Future<void> deleteListing({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/listings/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a project in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the project is deleted.
  ///
  /// Parameter [identifier] :
  /// The identifier of the project that is to be deleted.
  ///
  /// Parameter [skipDeletionCheck] :
  /// Specifies the optional flag to delete all child entities within the
  /// project.
  Future<void> deleteProject({
    required String domainIdentifier,
    required String identifier,
    bool? skipDeletionCheck,
  }) async {
    final $query = <String, List<String>>{
      if (skipDeletionCheck != null)
        'skipDeletionCheck': [skipDeletionCheck.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/projects/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes project membership in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain where project membership is deleted.
  ///
  /// Parameter [member] :
  /// The project member whose project membership is deleted.
  ///
  /// Parameter [projectIdentifier] :
  /// The ID of the Amazon DataZone project the membership to which is deleted.
  Future<void> deleteProjectMembership({
    required String domainIdentifier,
    required Member member,
    required String projectIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'member': member,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/projects/${Uri.encodeComponent(projectIdentifier)}/deleteMembership',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes and subscription grant in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain where the subscription grant is
  /// deleted.
  ///
  /// Parameter [identifier] :
  /// The ID of the subscription grant that is deleted.
  Future<DeleteSubscriptionGrantOutput> deleteSubscriptionGrant({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-grants/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSubscriptionGrantOutput.fromJson(response);
  }

  /// Deletes a subscription request in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the subscription request is
  /// deleted.
  ///
  /// Parameter [identifier] :
  /// The ID of the subscription request that is deleted.
  Future<void> deleteSubscriptionRequest({
    required String domainIdentifier,
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-requests/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a subscription target in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the subscription target is
  /// deleted.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the Amazon DataZone environment in which the subscription target
  /// is deleted.
  ///
  /// Parameter [identifier] :
  /// The ID of the subscription target that is deleted.
  Future<void> deleteSubscriptionTarget({
    required String domainIdentifier,
    required String environmentIdentifier,
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments/${Uri.encodeComponent(environmentIdentifier)}/subscription-targets/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified time series form for the specified asset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain that houses the asset for which you
  /// want to delete a time series form.
  ///
  /// Parameter [entityIdentifier] :
  /// The ID of the asset for which you want to delete a time series form.
  ///
  /// Parameter [entityType] :
  /// The type of the asset for which you want to delete a time series form.
  ///
  /// Parameter [formName] :
  /// The name of the time series form that you want to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  /// This field is automatically populated if not provided.
  Future<void> deleteTimeSeriesDataPoints({
    required String domainIdentifier,
    required String entityIdentifier,
    required TimeSeriesEntityType entityType,
    required String formName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'formName': [formName],
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/entities/${Uri.encodeComponent(entityType.toValue())}/${Uri.encodeComponent(entityIdentifier)}/time-series-data-points',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets an Amazon DataZone asset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain to which the asset belongs.
  ///
  /// Parameter [identifier] :
  /// The ID of the Amazon DataZone asset.
  ///
  /// Parameter [revision] :
  /// The revision of the Amazon DataZone asset.
  Future<GetAssetOutput> getAsset({
    required String domainIdentifier,
    required String identifier,
    String? revision,
  }) async {
    final $query = <String, List<String>>{
      if (revision != null) 'revision': [revision],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/assets/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetOutput.fromJson(response);
  }

  /// Gets an Amazon DataZone asset type.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the asset type exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the asset type.
  ///
  /// Parameter [revision] :
  /// The revision of the asset type.
  Future<GetAssetTypeOutput> getAssetType({
    required String domainIdentifier,
    required String identifier,
    String? revision,
  }) async {
    final $query = <String, List<String>>{
      if (revision != null) 'revision': [revision],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/asset-types/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetTypeOutput.fromJson(response);
  }

  /// Gets an Amazon DataZone data source.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the data source exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the Amazon DataZone data source.
  Future<GetDataSourceOutput> getDataSource({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-sources/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSourceOutput.fromJson(response);
  }

  /// Gets an Amazon DataZone data source run.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the domain in which this data source run was performed.
  ///
  /// Parameter [identifier] :
  /// The ID of the data source run.
  Future<GetDataSourceRunOutput> getDataSourceRun({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-source-runs/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSourceRunOutput.fromJson(response);
  }

  /// Gets an Amazon DataZone domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the specified Amazon DataZone domain.
  Future<GetDomainOutput> getDomain({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/domains/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainOutput.fromJson(response);
  }

  /// Gets an Amazon DataZone environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain where the environment exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the Amazon DataZone environment.
  Future<GetEnvironmentOutput> getEnvironment({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentOutput.fromJson(response);
  }

  /// Gets an Amazon DataZone blueprint.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the domain in which this blueprint exists.
  ///
  /// Parameter [identifier] :
  /// The ID of this Amazon DataZone blueprint.
  Future<GetEnvironmentBlueprintOutput> getEnvironmentBlueprint({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-blueprints/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentBlueprintOutput.fromJson(response);
  }

  /// Gets the blueprint configuration in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain where this blueprint exists.
  ///
  /// Parameter [environmentBlueprintIdentifier] :
  /// He ID of the blueprint.
  Future<GetEnvironmentBlueprintConfigurationOutput>
      getEnvironmentBlueprintConfiguration({
    required String domainIdentifier,
    required String environmentBlueprintIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-blueprint-configurations/${Uri.encodeComponent(environmentBlueprintIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentBlueprintConfigurationOutput.fromJson(response);
  }

  /// Gets an evinronment profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this environment profile
  /// exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the environment profile.
  Future<GetEnvironmentProfileOutput> getEnvironmentProfile({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-profiles/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentProfileOutput.fromJson(response);
  }

  /// Gets a metadata form type in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this metadata form type
  /// exists.
  ///
  /// Parameter [formTypeIdentifier] :
  /// The ID of the metadata form type.
  ///
  /// Parameter [revision] :
  /// The revision of this metadata form type.
  Future<GetFormTypeOutput> getFormType({
    required String domainIdentifier,
    required String formTypeIdentifier,
    String? revision,
  }) async {
    final $query = <String, List<String>>{
      if (revision != null) 'revision': [revision],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/form-types/${Uri.encodeComponent(formTypeIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFormTypeOutput.fromJson(response);
  }

  /// Gets a business glossary in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this business glossary
  /// exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the business glossary.
  Future<GetGlossaryOutput> getGlossary({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/glossaries/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGlossaryOutput.fromJson(response);
  }

  /// Gets a business glossary term in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which this business glossary term
  /// exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the business glossary term.
  Future<GetGlossaryTermOutput> getGlossaryTerm({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/glossary-terms/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGlossaryTermOutput.fromJson(response);
  }

  /// Gets a group profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which the group profile
  /// exists.
  ///
  /// Parameter [groupIdentifier] :
  /// The identifier of the group profile.
  Future<GetGroupProfileOutput> getGroupProfile({
    required String domainIdentifier,
    required String groupIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/group-profiles/${Uri.encodeComponent(groupIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupProfileOutput.fromJson(response);
  }

  /// Gets the data portal URL for the specified Amazon DataZone domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// the ID of the Amazon DataZone domain the data portal of which you want to
  /// get.
  Future<GetIamPortalLoginUrlOutput> getIamPortalLoginUrl({
    required String domainIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/get-portal-login-url',
      exceptionFnMap: _exceptionFns,
    );
    return GetIamPortalLoginUrlOutput.fromJson(response);
  }

  /// Gets a listing (a record of an asset at a given time).
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain.
  ///
  /// Parameter [identifier] :
  /// The ID of the listing.
  ///
  /// Parameter [listingRevision] :
  /// The revision of the listing.
  Future<GetListingOutput> getListing({
    required String domainIdentifier,
    required String identifier,
    String? listingRevision,
  }) async {
    final $query = <String, List<String>>{
      if (listingRevision != null) 'listingRevision': [listingRevision],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/listings/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetListingOutput.fromJson(response);
  }

  /// Gets a metadata generation run in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain the metadata generation run of which
  /// you want to get.
  ///
  /// Parameter [identifier] :
  /// The identifier of the metadata generation run.
  Future<GetMetadataGenerationRunOutput> getMetadataGenerationRun({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/metadata-generation-runs/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMetadataGenerationRunOutput.fromJson(response);
  }

  /// Gets a project in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the project exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the project.
  Future<GetProjectOutput> getProject({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/projects/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProjectOutput.fromJson(response);
  }

  /// Gets a subscription in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the subscription exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the subscription.
  Future<GetSubscriptionOutput> getSubscription({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscriptions/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriptionOutput.fromJson(response);
  }

  /// Gets the subscription grant in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the subscription grant
  /// exists.
  ///
  /// Parameter [identifier] :
  /// The ID of the subscription grant.
  Future<GetSubscriptionGrantOutput> getSubscriptionGrant({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-grants/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriptionGrantOutput.fromJson(response);
  }

  /// Gets the details of the specified subscription request.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which to get the
  /// subscription request details.
  ///
  /// Parameter [identifier] :
  /// The identifier of the subscription request the details of which to get.
  Future<GetSubscriptionRequestDetailsOutput> getSubscriptionRequestDetails({
    required String domainIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-requests/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriptionRequestDetailsOutput.fromJson(response);
  }

  /// Gets the subscription target in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which the subscription target
  /// exists.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment associated with the subscription target.
  ///
  /// Parameter [identifier] :
  /// The ID of the subscription target.
  Future<GetSubscriptionTargetOutput> getSubscriptionTarget({
    required String domainIdentifier,
    required String environmentIdentifier,
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments/${Uri.encodeComponent(environmentIdentifier)}/subscription-targets/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriptionTargetOutput.fromJson(response);
  }

  /// Gets the existing data point for the asset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain that houses the asset for which you
  /// want to get the data point.
  ///
  /// Parameter [entityIdentifier] :
  /// The ID of the asset for which you want to get the data point.
  ///
  /// Parameter [entityType] :
  /// The type of the asset for which you want to get the data point.
  ///
  /// Parameter [formName] :
  /// The name of the time series form that houses the data point that you want
  /// to get.
  ///
  /// Parameter [identifier] :
  /// The ID of the data point that you want to get.
  Future<GetTimeSeriesDataPointOutput> getTimeSeriesDataPoint({
    required String domainIdentifier,
    required String entityIdentifier,
    required TimeSeriesEntityType entityType,
    required String formName,
    required String identifier,
  }) async {
    final $query = <String, List<String>>{
      'formName': [formName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/entities/${Uri.encodeComponent(entityType.toValue())}/${Uri.encodeComponent(entityIdentifier)}/time-series-data-points/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTimeSeriesDataPointOutput.fromJson(response);
  }

  /// Gets a user profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// the ID of the Amazon DataZone domain the data portal of which you want to
  /// get.
  ///
  /// Parameter [userIdentifier] :
  /// The identifier of the user for which you want to get the user profile.
  ///
  /// Parameter [type] :
  /// The type of the user profile.
  Future<GetUserProfileOutput> getUserProfile({
    required String domainIdentifier,
    required String userIdentifier,
    UserProfileType? type,
  }) async {
    final $query = <String, List<String>>{
      if (type != null) 'type': [type.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/user-profiles/${Uri.encodeComponent(userIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetUserProfileOutput.fromJson(response);
  }

  /// Lists the revisions for the asset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the domain.
  ///
  /// Parameter [identifier] :
  /// The identifier of the asset.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of revisions to return in a single call to
  /// <code>ListAssetRevisions</code>. When the number of revisions to be listed
  /// is greater than the value of <code>MaxResults</code>, the response
  /// contains a <code>NextToken</code> value that you can use in a subsequent
  /// call to <code>ListAssetRevisions</code> to list the next set of revisions.
  ///
  /// Parameter [nextToken] :
  /// When the number of revisions is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of revisions, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListAssetRevisions</code> to list the next set of revisions.
  Future<ListAssetRevisionsOutput> listAssetRevisions({
    required String domainIdentifier,
    required String identifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/assets/${Uri.encodeComponent(identifier)}/revisions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetRevisionsOutput.fromJson(response);
  }

  /// Lists data source run activities.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which to list data source
  /// run activities.
  ///
  /// Parameter [identifier] :
  /// The identifier of the data source run.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of activities to return in a single call to
  /// <code>ListDataSourceRunActivities</code>. When the number of activities to
  /// be listed is greater than the value of <code>MaxResults</code>, the
  /// response contains a <code>NextToken</code> value that you can use in a
  /// subsequent call to <code>ListDataSourceRunActivities</code> to list the
  /// next set of activities.
  ///
  /// Parameter [nextToken] :
  /// When the number of activities is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of activities,
  /// the response includes a pagination token named <code>NextToken</code>. You
  /// can specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListDataSourceRunActivities</code> to list the next set of
  /// activities.
  ///
  /// Parameter [status] :
  /// The status of the data source run.
  Future<ListDataSourceRunActivitiesOutput> listDataSourceRunActivities({
    required String domainIdentifier,
    required String identifier,
    int? maxResults,
    String? nextToken,
    DataAssetActivityStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-source-runs/${Uri.encodeComponent(identifier)}/activities',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourceRunActivitiesOutput.fromJson(response);
  }

  /// Lists data source runs in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [dataSourceIdentifier] :
  /// The identifier of the data source.
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which to invoke the
  /// <code>ListDataSourceRuns</code> action.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of runs to return in a single call to
  /// <code>ListDataSourceRuns</code>. When the number of runs to be listed is
  /// greater than the value of <code>MaxResults</code>, the response contains a
  /// <code>NextToken</code> value that you can use in a subsequent call to
  /// <code>ListDataSourceRuns</code> to list the next set of runs.
  ///
  /// Parameter [nextToken] :
  /// When the number of runs is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of runs, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListDataSourceRuns</code> to list the next set of runs.
  ///
  /// Parameter [status] :
  /// The status of the data source.
  Future<ListDataSourceRunsOutput> listDataSourceRuns({
    required String dataSourceIdentifier,
    required String domainIdentifier,
    int? maxResults,
    String? nextToken,
    DataSourceRunStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-sources/${Uri.encodeComponent(dataSourceIdentifier)}/runs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourceRunsOutput.fromJson(response);
  }

  /// Lists data sources in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which to list the data
  /// sources.
  ///
  /// Parameter [projectIdentifier] :
  /// The identifier of the project in which to list data sources.
  ///
  /// Parameter [environmentIdentifier] :
  /// The identifier of the environment in which to list the data sources.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data sources to return in a single call to
  /// <code>ListDataSources</code>. When the number of data sources to be listed
  /// is greater than the value of <code>MaxResults</code>, the response
  /// contains a <code>NextToken</code> value that you can use in a subsequent
  /// call to <code>ListDataSources</code> to list the next set of data sources.
  ///
  /// Parameter [name] :
  /// The name of the data source.
  ///
  /// Parameter [nextToken] :
  /// When the number of data sources is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of data sources,
  /// the response includes a pagination token named <code>NextToken</code>. You
  /// can specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListDataSources</code> to list the next set of data sources.
  ///
  /// Parameter [status] :
  /// The status of the data source.
  ///
  /// Parameter [type] :
  /// The type of the data source.
  Future<ListDataSourcesOutput> listDataSources({
    required String domainIdentifier,
    required String projectIdentifier,
    String? environmentIdentifier,
    int? maxResults,
    String? name,
    String? nextToken,
    DataSourceStatus? status,
    String? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      'projectIdentifier': [projectIdentifier],
      if (environmentIdentifier != null)
        'environmentIdentifier': [environmentIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
      if (type != null) 'type': [type],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-sources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourcesOutput.fromJson(response);
  }

  /// Lists Amazon DataZone domains.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of domains to return in a single call to
  /// <code>ListDomains</code>. When the number of domains to be listed is
  /// greater than the value of <code>MaxResults</code>, the response contains a
  /// <code>NextToken</code> value that you can use in a subsequent call to
  /// <code>ListDomains</code> to list the next set of domains.
  ///
  /// Parameter [nextToken] :
  /// When the number of domains is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of domains, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListDomains</code> to list the next set of domains.
  ///
  /// Parameter [status] :
  /// The status of the data source.
  Future<ListDomainsOutput> listDomains({
    int? maxResults,
    String? nextToken,
    DomainStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsOutput.fromJson(response);
  }

  /// Lists blueprint configurations for a Amazon DataZone environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of blueprint configurations to return in a single call
  /// to <code>ListEnvironmentBlueprintConfigurations</code>. When the number of
  /// configurations to be listed is greater than the value of
  /// <code>MaxResults</code>, the response contains a <code>NextToken</code>
  /// value that you can use in a subsequent call to
  /// <code>ListEnvironmentBlueprintConfigurations</code> to list the next set
  /// of configurations.
  ///
  /// Parameter [nextToken] :
  /// When the number of blueprint configurations is greater than the default
  /// value for the <code>MaxResults</code> parameter, or if you explicitly
  /// specify a value for <code>MaxResults</code> that is less than the number
  /// of configurations, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value
  /// in a subsequent call to
  /// <code>ListEnvironmentBlueprintConfigurations</code> to list the next set
  /// of configurations.
  Future<ListEnvironmentBlueprintConfigurationsOutput>
      listEnvironmentBlueprintConfigurations({
    required String domainIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-blueprint-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentBlueprintConfigurationsOutput.fromJson(response);
  }

  /// Lists blueprints in an Amazon DataZone environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [managed] :
  /// Specifies whether the environment blueprint is managed by Amazon DataZone.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of blueprints to return in a single call to
  /// <code>ListEnvironmentBlueprints</code>. When the number of blueprints to
  /// be listed is greater than the value of <code>MaxResults</code>, the
  /// response contains a <code>NextToken</code> value that you can use in a
  /// subsequent call to <code>ListEnvironmentBlueprints</code> to list the next
  /// set of blueprints.
  ///
  /// Parameter [name] :
  /// The name of the Amazon DataZone environment.
  ///
  /// Parameter [nextToken] :
  /// When the number of blueprints in the environment is greater than the
  /// default value for the <code>MaxResults</code> parameter, or if you
  /// explicitly specify a value for <code>MaxResults</code> that is less than
  /// the number of blueprints in the environment, the response includes a
  /// pagination token named <code>NextToken</code>. You can specify this
  /// <code>NextToken</code> value in a subsequent call to
  /// <code>ListEnvironmentBlueprints</code>to list the next set of blueprints.
  Future<ListEnvironmentBlueprintsOutput> listEnvironmentBlueprints({
    required String domainIdentifier,
    bool? managed,
    int? maxResults,
    String? name,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (managed != null) 'managed': [managed.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-blueprints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentBlueprintsOutput.fromJson(response);
  }

  /// Lists Amazon DataZone environment profiles.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [awsAccountId] :
  /// The identifier of the Amazon Web Services account where you want to list
  /// environment profiles.
  ///
  /// Parameter [awsAccountRegion] :
  /// The Amazon Web Services region where you want to list environment
  /// profiles.
  ///
  /// Parameter [environmentBlueprintIdentifier] :
  /// The identifier of the blueprint that was used to create the environment
  /// profiles that you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of environment profiles to return in a single call to
  /// <code>ListEnvironmentProfiles</code>. When the number of environment
  /// profiles to be listed is greater than the value of
  /// <code>MaxResults</code>, the response contains a <code>NextToken</code>
  /// value that you can use in a subsequent call to
  /// <code>ListEnvironmentProfiles</code> to list the next set of environment
  /// profiles.
  ///
  /// Parameter [name] :
  /// <p/>
  ///
  /// Parameter [nextToken] :
  /// When the number of environment profiles is greater than the default value
  /// for the <code>MaxResults</code> parameter, or if you explicitly specify a
  /// value for <code>MaxResults</code> that is less than the number of
  /// environment profiles, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value
  /// in a subsequent call to <code>ListEnvironmentProfiles</code> to list the
  /// next set of environment profiles.
  ///
  /// Parameter [projectIdentifier] :
  /// The identifier of the Amazon DataZone project.
  Future<ListEnvironmentProfilesOutput> listEnvironmentProfiles({
    required String domainIdentifier,
    String? awsAccountId,
    String? awsAccountRegion,
    String? environmentBlueprintIdentifier,
    int? maxResults,
    String? name,
    String? nextToken,
    String? projectIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (awsAccountId != null) 'awsAccountId': [awsAccountId],
      if (awsAccountRegion != null) 'awsAccountRegion': [awsAccountRegion],
      if (environmentBlueprintIdentifier != null)
        'environmentBlueprintIdentifier': [environmentBlueprintIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (projectIdentifier != null) 'projectIdentifier': [projectIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentProfilesOutput.fromJson(response);
  }

  /// Lists Amazon DataZone environments.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [projectIdentifier] :
  /// The identifier of the Amazon DataZone project.
  ///
  /// Parameter [awsAccountId] :
  /// The identifier of the Amazon Web Services account where you want to list
  /// environments.
  ///
  /// Parameter [awsAccountRegion] :
  /// The Amazon Web Services region where you want to list environments.
  ///
  /// Parameter [environmentBlueprintIdentifier] :
  /// The identifier of the Amazon DataZone blueprint.
  ///
  /// Parameter [environmentProfileIdentifier] :
  /// The identifier of the environment profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of environments to return in a single call to
  /// <code>ListEnvironments</code>. When the number of environments to be
  /// listed is greater than the value of <code>MaxResults</code>, the response
  /// contains a <code>NextToken</code> value that you can use in a subsequent
  /// call to <code>ListEnvironments</code> to list the next set of
  /// environments.
  ///
  /// Parameter [name] :
  /// The name of the environment.
  ///
  /// Parameter [nextToken] :
  /// When the number of environments is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of environments,
  /// the response includes a pagination token named <code>NextToken</code>. You
  /// can specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListEnvironments</code> to list the next set of environments.
  ///
  /// Parameter [provider] :
  /// The provider of the environment.
  ///
  /// Parameter [status] :
  /// The status of the environments that you want to list.
  Future<ListEnvironmentsOutput> listEnvironments({
    required String domainIdentifier,
    required String projectIdentifier,
    String? awsAccountId,
    String? awsAccountRegion,
    String? environmentBlueprintIdentifier,
    String? environmentProfileIdentifier,
    int? maxResults,
    String? name,
    String? nextToken,
    String? provider,
    EnvironmentStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      'projectIdentifier': [projectIdentifier],
      if (awsAccountId != null) 'awsAccountId': [awsAccountId],
      if (awsAccountRegion != null) 'awsAccountRegion': [awsAccountRegion],
      if (environmentBlueprintIdentifier != null)
        'environmentBlueprintIdentifier': [environmentBlueprintIdentifier],
      if (environmentProfileIdentifier != null)
        'environmentProfileIdentifier': [environmentProfileIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (provider != null) 'provider': [provider],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentsOutput.fromJson(response);
  }

  /// Lists all metadata generation runs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain where you want to list metadata
  /// generation runs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of metadata generation runs to return in a single call
  /// to ListMetadataGenerationRuns. When the number of metadata generation runs
  /// to be listed is greater than the value of MaxResults, the response
  /// contains a NextToken value that you can use in a subsequent call to
  /// ListMetadataGenerationRuns to list the next set of revisions.
  ///
  /// Parameter [nextToken] :
  /// When the number of metadata generation runs is greater than the default
  /// value for the MaxResults parameter, or if you explicitly specify a value
  /// for MaxResults that is less than the number of metadata generation runs,
  /// the response includes a pagination token named NextToken. You can specify
  /// this NextToken value in a subsequent call to ListMetadataGenerationRuns to
  /// list the next set of revisions.
  ///
  /// Parameter [status] :
  /// The status of the metadata generation runs.
  ///
  /// Parameter [type] :
  /// The type of the metadata generation runs.
  Future<ListMetadataGenerationRunsOutput> listMetadataGenerationRuns({
    required String domainIdentifier,
    int? maxResults,
    String? nextToken,
    MetadataGenerationRunStatus? status,
    MetadataGenerationRunType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
      if (type != null) 'type': [type.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/metadata-generation-runs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMetadataGenerationRunsOutput.fromJson(response);
  }

  /// Lists all Amazon DataZone notifications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [type] :
  /// The type of notifications.
  ///
  /// Parameter [afterTimestamp] :
  /// The time after which you want to list notifications.
  ///
  /// Parameter [beforeTimestamp] :
  /// The time before which you want to list notifications.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of notifications to return in a single call to
  /// <code>ListNotifications</code>. When the number of notifications to be
  /// listed is greater than the value of <code>MaxResults</code>, the response
  /// contains a <code>NextToken</code> value that you can use in a subsequent
  /// call to <code>ListNotifications</code> to list the next set of
  /// notifications.
  ///
  /// Parameter [nextToken] :
  /// When the number of notifications is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of notifications,
  /// the response includes a pagination token named <code>NextToken</code>. You
  /// can specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListNotifications</code> to list the next set of notifications.
  ///
  /// Parameter [subjects] :
  /// The subjects of notifications.
  ///
  /// Parameter [taskStatus] :
  /// The task status of notifications.
  Future<ListNotificationsOutput> listNotifications({
    required String domainIdentifier,
    required NotificationType type,
    DateTime? afterTimestamp,
    DateTime? beforeTimestamp,
    int? maxResults,
    String? nextToken,
    List<String>? subjects,
    TaskStatus? taskStatus,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      'type': [type.toValue()],
      if (afterTimestamp != null)
        'afterTimestamp': [_s.iso8601ToJson(afterTimestamp).toString()],
      if (beforeTimestamp != null)
        'beforeTimestamp': [_s.iso8601ToJson(beforeTimestamp).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (subjects != null) 'subjects': subjects,
      if (taskStatus != null) 'taskStatus': [taskStatus.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/notifications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationsOutput.fromJson(response);
  }

  /// Lists all members of the specified project.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which you want to list
  /// project memberships.
  ///
  /// Parameter [projectIdentifier] :
  /// The identifier of the project whose memberships you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of memberships to return in a single call to
  /// <code>ListProjectMemberships</code>. When the number of memberships to be
  /// listed is greater than the value of <code>MaxResults</code>, the response
  /// contains a <code>NextToken</code> value that you can use in a subsequent
  /// call to <code>ListProjectMemberships</code> to list the next set of
  /// memberships.
  ///
  /// Parameter [nextToken] :
  /// When the number of memberships is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of memberships,
  /// the response includes a pagination token named <code>NextToken</code>. You
  /// can specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListProjectMemberships</code> to list the next set of memberships.
  ///
  /// Parameter [sortBy] :
  /// The method by which you want to sort the project memberships.
  ///
  /// Parameter [sortOrder] :
  /// The sort order of the project memberships.
  Future<ListProjectMembershipsOutput> listProjectMemberships({
    required String domainIdentifier,
    required String projectIdentifier,
    int? maxResults,
    String? nextToken,
    SortFieldProject? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/projects/${Uri.encodeComponent(projectIdentifier)}/memberships',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectMembershipsOutput.fromJson(response);
  }

  /// Lists Amazon DataZone projects.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [groupIdentifier] :
  /// The identifier of a group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of projects to return in a single call to
  /// <code>ListProjects</code>. When the number of projects to be listed is
  /// greater than the value of <code>MaxResults</code>, the response contains a
  /// <code>NextToken</code> value that you can use in a subsequent call to
  /// <code>ListProjects</code> to list the next set of projects.
  ///
  /// Parameter [name] :
  /// The name of the project.
  ///
  /// Parameter [nextToken] :
  /// When the number of projects is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of projects, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListProjects</code> to list the next set of projects.
  ///
  /// Parameter [userIdentifier] :
  /// The identifier of the Amazon DataZone user.
  Future<ListProjectsOutput> listProjects({
    required String domainIdentifier,
    String? groupIdentifier,
    int? maxResults,
    String? name,
    String? nextToken,
    String? userIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (groupIdentifier != null) 'groupIdentifier': [groupIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (userIdentifier != null) 'userIdentifier': [userIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsOutput.fromJson(response);
  }

  /// Lists subscription grants.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [environmentId] :
  /// The identifier of the Amazon DataZone environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of subscription grants to return in a single call to
  /// <code>ListSubscriptionGrants</code>. When the number of subscription
  /// grants to be listed is greater than the value of <code>MaxResults</code>,
  /// the response contains a <code>NextToken</code> value that you can use in a
  /// subsequent call to <code>ListSubscriptionGrants</code> to list the next
  /// set of subscription grants.
  ///
  /// Parameter [nextToken] :
  /// When the number of subscription grants is greater than the default value
  /// for the <code>MaxResults</code> parameter, or if you explicitly specify a
  /// value for <code>MaxResults</code> that is less than the number of
  /// subscription grants, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value
  /// in a subsequent call to <code>ListSubscriptionGrants</code> to list the
  /// next set of subscription grants.
  ///
  /// Parameter [sortBy] :
  /// Specifies the way of sorting the results of this action.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the sort order of this action.
  ///
  /// Parameter [subscribedListingId] :
  /// The identifier of the subscribed listing.
  ///
  /// Parameter [subscriptionId] :
  /// The identifier of the subscription.
  ///
  /// Parameter [subscriptionTargetId] :
  /// The identifier of the subscription target.
  Future<ListSubscriptionGrantsOutput> listSubscriptionGrants({
    required String domainIdentifier,
    String? environmentId,
    int? maxResults,
    String? nextToken,
    SortKey? sortBy,
    SortOrder? sortOrder,
    String? subscribedListingId,
    String? subscriptionId,
    String? subscriptionTargetId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (environmentId != null) 'environmentId': [environmentId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
      if (subscribedListingId != null)
        'subscribedListingId': [subscribedListingId],
      if (subscriptionId != null) 'subscriptionId': [subscriptionId],
      if (subscriptionTargetId != null)
        'subscriptionTargetId': [subscriptionTargetId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-grants',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionGrantsOutput.fromJson(response);
  }

  /// Lists Amazon DataZone subscription requests.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [approverProjectId] :
  /// The identifier of the subscription request approver's project.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of subscription requests to return in a single call to
  /// <code>ListSubscriptionRequests</code>. When the number of subscription
  /// requests to be listed is greater than the value of
  /// <code>MaxResults</code>, the response contains a <code>NextToken</code>
  /// value that you can use in a subsequent call to
  /// <code>ListSubscriptionRequests</code> to list the next set of subscription
  /// requests.
  ///
  /// Parameter [nextToken] :
  /// When the number of subscription requests is greater than the default value
  /// for the <code>MaxResults</code> parameter, or if you explicitly specify a
  /// value for <code>MaxResults</code> that is less than the number of
  /// subscription requests, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value
  /// in a subsequent call to <code>ListSubscriptionRequests</code> to list the
  /// next set of subscription requests.
  ///
  /// Parameter [owningProjectId] :
  /// The identifier of the project for the subscription requests.
  ///
  /// Parameter [sortBy] :
  /// Specifies the way to sort the results of this action.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the sort order for the results of this action.
  ///
  /// Parameter [status] :
  /// Specifies the status of the subscription requests.
  ///
  /// Parameter [subscribedListingId] :
  /// The identifier of the subscribed listing.
  Future<ListSubscriptionRequestsOutput> listSubscriptionRequests({
    required String domainIdentifier,
    String? approverProjectId,
    int? maxResults,
    String? nextToken,
    String? owningProjectId,
    SortKey? sortBy,
    SortOrder? sortOrder,
    SubscriptionRequestStatus? status,
    String? subscribedListingId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (approverProjectId != null) 'approverProjectId': [approverProjectId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (owningProjectId != null) 'owningProjectId': [owningProjectId],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
      if (status != null) 'status': [status.toValue()],
      if (subscribedListingId != null)
        'subscribedListingId': [subscribedListingId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-requests',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionRequestsOutput.fromJson(response);
  }

  /// Lists subscription targets in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain where you want to list
  /// subscription targets.
  ///
  /// Parameter [environmentIdentifier] :
  /// The identifier of the environment where you want to list subscription
  /// targets.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of subscription targets to return in a single call to
  /// <code>ListSubscriptionTargets</code>. When the number of subscription
  /// targets to be listed is greater than the value of <code>MaxResults</code>,
  /// the response contains a <code>NextToken</code> value that you can use in a
  /// subsequent call to <code>ListSubscriptionTargets</code> to list the next
  /// set of subscription targets.
  ///
  /// Parameter [nextToken] :
  /// When the number of subscription targets is greater than the default value
  /// for the <code>MaxResults</code> parameter, or if you explicitly specify a
  /// value for <code>MaxResults</code> that is less than the number of
  /// subscription targets, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value
  /// in a subsequent call to <code>ListSubscriptionTargets</code> to list the
  /// next set of subscription targets.
  ///
  /// Parameter [sortBy] :
  /// Specifies the way in which the results of this action are to be sorted.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the sort order for the results of this action.
  Future<ListSubscriptionTargetsOutput> listSubscriptionTargets({
    required String domainIdentifier,
    required String environmentIdentifier,
    int? maxResults,
    String? nextToken,
    SortKey? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments/${Uri.encodeComponent(environmentIdentifier)}/subscription-targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionTargetsOutput.fromJson(response);
  }

  /// Lists subscriptions in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [approverProjectId] :
  /// The identifier of the project for the subscription's approver.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of subscriptions to return in a single call to
  /// <code>ListSubscriptions</code>. When the number of subscriptions to be
  /// listed is greater than the value of <code>MaxResults</code>, the response
  /// contains a <code>NextToken</code> value that you can use in a subsequent
  /// call to <code>ListSubscriptions</code> to list the next set of
  /// Subscriptions.
  ///
  /// Parameter [nextToken] :
  /// When the number of subscriptions is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of subscriptions,
  /// the response includes a pagination token named <code>NextToken</code>. You
  /// can specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListSubscriptions</code> to list the next set of subscriptions.
  ///
  /// Parameter [owningProjectId] :
  /// The identifier of the owning project.
  ///
  /// Parameter [sortBy] :
  /// Specifies the way in which the results of this action are to be sorted.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the sort order for the results of this action.
  ///
  /// Parameter [status] :
  /// The status of the subscriptions that you want to list.
  ///
  /// Parameter [subscribedListingId] :
  /// The identifier of the subscribed listing for the subscriptions that you
  /// want to list.
  ///
  /// Parameter [subscriptionRequestIdentifier] :
  /// The identifier of the subscription request for the subscriptions that you
  /// want to list.
  Future<ListSubscriptionsOutput> listSubscriptions({
    required String domainIdentifier,
    String? approverProjectId,
    int? maxResults,
    String? nextToken,
    String? owningProjectId,
    SortKey? sortBy,
    SortOrder? sortOrder,
    SubscriptionStatus? status,
    String? subscribedListingId,
    String? subscriptionRequestIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (approverProjectId != null) 'approverProjectId': [approverProjectId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (owningProjectId != null) 'owningProjectId': [owningProjectId],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
      if (status != null) 'status': [status.toValue()],
      if (subscribedListingId != null)
        'subscribedListingId': [subscribedListingId],
      if (subscriptionRequestIdentifier != null)
        'subscriptionRequestIdentifier': [subscriptionRequestIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionsOutput.fromJson(response);
  }

  /// Lists tags for the specified resource in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource whose tags you want to list.
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

  /// Lists time series data points.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain that houses the assets for which you
  /// want to list time series data points.
  ///
  /// Parameter [entityIdentifier] :
  /// The ID of the asset for which you want to list data points.
  ///
  /// Parameter [entityType] :
  /// The type of the asset for which you want to list data points.
  ///
  /// Parameter [formName] :
  /// The name of the time series data points form.
  ///
  /// Parameter [endedAt] :
  /// The timestamp at which the data points that you wanted to list ended.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data points to return in a single call to
  /// ListTimeSeriesDataPoints. When the number of data points to be listed is
  /// greater than the value of MaxResults, the response contains a NextToken
  /// value that you can use in a subsequent call to ListTimeSeriesDataPoints to
  /// list the next set of data points.
  ///
  /// Parameter [nextToken] :
  /// When the number of data points is greater than the default value for the
  /// MaxResults parameter, or if you explicitly specify a value for MaxResults
  /// that is less than the number of data points, the response includes a
  /// pagination token named NextToken. You can specify this NextToken value in
  /// a subsequent call to ListTimeSeriesDataPoints to list the next set of data
  /// points.
  ///
  /// Parameter [startedAt] :
  /// The timestamp at which the data points that you want to list started.
  Future<ListTimeSeriesDataPointsOutput> listTimeSeriesDataPoints({
    required String domainIdentifier,
    required String entityIdentifier,
    required TimeSeriesEntityType entityType,
    required String formName,
    DateTime? endedAt,
    int? maxResults,
    String? nextToken,
    DateTime? startedAt,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      'formName': [formName],
      if (endedAt != null) 'endedAt': [_s.iso8601ToJson(endedAt).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (startedAt != null)
        'startedAt': [_s.iso8601ToJson(startedAt).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/entities/${Uri.encodeComponent(entityType.toValue())}/${Uri.encodeComponent(entityIdentifier)}/time-series-data-points',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTimeSeriesDataPointsOutput.fromJson(response);
  }

  /// Posts time series data points to Amazon DataZone for the specified asset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain in which you want to post time series
  /// data points.
  ///
  /// Parameter [entityIdentifier] :
  /// The ID of the asset for which you want to post time series data points.
  ///
  /// Parameter [entityType] :
  /// The type of the asset for which you want to post data points.
  ///
  /// Parameter [forms] :
  /// The forms that contain the data points that you want to post.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  Future<PostTimeSeriesDataPointsOutput> postTimeSeriesDataPoints({
    required String domainIdentifier,
    required String entityIdentifier,
    required TimeSeriesEntityType entityType,
    required List<TimeSeriesDataPointFormInput> forms,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'forms': forms,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/entities/${Uri.encodeComponent(entityType.toValue())}/${Uri.encodeComponent(entityIdentifier)}/time-series-data-points',
      exceptionFnMap: _exceptionFns,
    );
    return PostTimeSeriesDataPointsOutput.fromJson(response);
  }

  /// Writes the configuration for the specified environment blueprint in Amazon
  /// DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [enabledRegions] :
  /// Specifies the enabled Amazon Web Services Regions.
  ///
  /// Parameter [environmentBlueprintIdentifier] :
  /// The identifier of the environment blueprint.
  ///
  /// Parameter [manageAccessRoleArn] :
  /// The ARN of the manage access role.
  ///
  /// Parameter [provisioningRoleArn] :
  /// The ARN of the provisioning role.
  ///
  /// Parameter [regionalParameters] :
  /// The regional parameters in the environment blueprint.
  Future<PutEnvironmentBlueprintConfigurationOutput>
      putEnvironmentBlueprintConfiguration({
    required String domainIdentifier,
    required List<String> enabledRegions,
    required String environmentBlueprintIdentifier,
    String? manageAccessRoleArn,
    String? provisioningRoleArn,
    Map<String, Map<String, String>>? regionalParameters,
  }) async {
    final $payload = <String, dynamic>{
      'enabledRegions': enabledRegions,
      if (manageAccessRoleArn != null)
        'manageAccessRoleArn': manageAccessRoleArn,
      if (provisioningRoleArn != null)
        'provisioningRoleArn': provisioningRoleArn,
      if (regionalParameters != null) 'regionalParameters': regionalParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-blueprint-configurations/${Uri.encodeComponent(environmentBlueprintIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutEnvironmentBlueprintConfigurationOutput.fromJson(response);
  }

  /// Rejects automatically generated business-friendly metadata for your Amazon
  /// DataZone assets.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [identifier] :
  /// The identifier of the prediction.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [rejectChoices] :
  /// Specifies the prediction (aka, the automatically generated piece of
  /// metadata) and the target (for example, a column name) that can be
  /// rejected.
  ///
  /// Parameter [rejectRule] :
  /// Specifies the rule (or the conditions) under which a prediction can be
  /// rejected.
  ///
  /// Parameter [revision] :
  /// The revision that is to be made to the asset.
  Future<RejectPredictionsOutput> rejectPredictions({
    required String domainIdentifier,
    required String identifier,
    String? clientToken,
    List<RejectChoice>? rejectChoices,
    RejectRule? rejectRule,
    String? revision,
  }) async {
    final $query = <String, List<String>>{
      if (revision != null) 'revision': [revision],
    };
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (rejectChoices != null) 'rejectChoices': rejectChoices,
      if (rejectRule != null) 'rejectRule': rejectRule,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/assets/${Uri.encodeComponent(identifier)}/reject-predictions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RejectPredictionsOutput.fromJson(response);
  }

  /// Rejects the specified subscription request.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which the subscription
  /// request was rejected.
  ///
  /// Parameter [identifier] :
  /// The identifier of the subscription request that was rejected.
  ///
  /// Parameter [decisionComment] :
  /// The decision comment of the rejected subscription request.
  Future<RejectSubscriptionRequestOutput> rejectSubscriptionRequest({
    required String domainIdentifier,
    required String identifier,
    String? decisionComment,
  }) async {
    final $payload = <String, dynamic>{
      if (decisionComment != null) 'decisionComment': decisionComment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-requests/${Uri.encodeComponent(identifier)}/reject',
      exceptionFnMap: _exceptionFns,
    );
    return RejectSubscriptionRequestOutput.fromJson(response);
  }

  /// Revokes a specified subscription in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain where you want to revoke a
  /// subscription.
  ///
  /// Parameter [identifier] :
  /// The identifier of the revoked subscription.
  ///
  /// Parameter [retainPermissions] :
  /// Specifies whether permissions are retained when the subscription is
  /// revoked.
  Future<RevokeSubscriptionOutput> revokeSubscription({
    required String domainIdentifier,
    required String identifier,
    bool? retainPermissions,
  }) async {
    final $payload = <String, dynamic>{
      if (retainPermissions != null) 'retainPermissions': retainPermissions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscriptions/${Uri.encodeComponent(identifier)}/revoke',
      exceptionFnMap: _exceptionFns,
    );
    return RevokeSubscriptionOutput.fromJson(response);
  }

  /// Searches for assets in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain.
  ///
  /// Parameter [searchScope] :
  /// The scope of the search.
  ///
  /// Parameter [additionalAttributes] :
  /// Specifies additional attributes for the <code>Search</code> action.
  ///
  /// Parameter [filters] :
  /// Specifies the search filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call to
  /// <code>Search</code>. When the number of results to be listed is greater
  /// than the value of <code>MaxResults</code>, the response contains a
  /// <code>NextToken</code> value that you can use in a subsequent call to
  /// <code>Search</code> to list the next set of results.
  ///
  /// Parameter [nextToken] :
  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>Search</code> to list the next set of results.
  ///
  /// Parameter [owningProjectIdentifier] :
  /// The identifier of the owning project specified for the search.
  ///
  /// Parameter [searchIn] :
  /// The details of the search.
  ///
  /// Parameter [searchText] :
  /// Specifies the text for which to search.
  ///
  /// Parameter [sort] :
  /// Specifies the way in which the search results are to be sorted.
  Future<SearchOutput> search({
    required String domainIdentifier,
    required InventorySearchScope searchScope,
    List<SearchOutputAdditionalAttribute>? additionalAttributes,
    FilterClause? filters,
    int? maxResults,
    String? nextToken,
    String? owningProjectIdentifier,
    List<SearchInItem>? searchIn,
    String? searchText,
    SearchSort? sort,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'searchScope': searchScope.toValue(),
      if (additionalAttributes != null)
        'additionalAttributes':
            additionalAttributes.map((e) => e.toValue()).toList(),
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (owningProjectIdentifier != null)
        'owningProjectIdentifier': owningProjectIdentifier,
      if (searchIn != null) 'searchIn': searchIn,
      if (searchText != null) 'searchText': searchText,
      if (sort != null) 'sort': sort,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchOutput.fromJson(response);
  }

  /// Searches group profiles in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which you want to search
  /// group profiles.
  ///
  /// Parameter [groupType] :
  /// The group type for which to search.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call to
  /// <code>SearchGroupProfiles</code>. When the number of results to be listed
  /// is greater than the value of <code>MaxResults</code>, the response
  /// contains a <code>NextToken</code> value that you can use in a subsequent
  /// call to <code>SearchGroupProfiles</code> to list the next set of results.
  ///
  /// Parameter [nextToken] :
  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>SearchGroupProfiles</code> to list the next set of results.
  ///
  /// Parameter [searchText] :
  /// Specifies the text for which to search.
  Future<SearchGroupProfilesOutput> searchGroupProfiles({
    required String domainIdentifier,
    required GroupSearchType groupType,
    int? maxResults,
    String? nextToken,
    String? searchText,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'groupType': groupType.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (searchText != null) 'searchText': searchText,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/search-group-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return SearchGroupProfilesOutput.fromJson(response);
  }

  /// Searches listings (records of an asset at a given time) in Amazon
  /// DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the domain in which to search listings.
  ///
  /// Parameter [additionalAttributes] :
  /// Specifies additional attributes for the search.
  ///
  /// Parameter [filters] :
  /// Specifies the filters for the search of listings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call to
  /// <code>SearchListings</code>. When the number of results to be listed is
  /// greater than the value of <code>MaxResults</code>, the response contains a
  /// <code>NextToken</code> value that you can use in a subsequent call to
  /// <code>SearchListings</code> to list the next set of results.
  ///
  /// Parameter [nextToken] :
  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>SearchListings</code> to list the next set of results.
  ///
  /// Parameter [searchIn] :
  /// The details of the search.
  ///
  /// Parameter [searchText] :
  /// Specifies the text for which to search.
  ///
  /// Parameter [sort] :
  /// Specifies the way for sorting the search results.
  Future<SearchListingsOutput> searchListings({
    required String domainIdentifier,
    List<SearchOutputAdditionalAttribute>? additionalAttributes,
    FilterClause? filters,
    int? maxResults,
    String? nextToken,
    List<SearchInItem>? searchIn,
    String? searchText,
    SearchSort? sort,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (additionalAttributes != null)
        'additionalAttributes':
            additionalAttributes.map((e) => e.toValue()).toList(),
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (searchIn != null) 'searchIn': searchIn,
      if (searchText != null) 'searchText': searchText,
      if (sort != null) 'sort': sort,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/listings/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchListingsOutput.fromJson(response);
  }

  /// Searches for types in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which to invoke the
  /// <code>SearchTypes</code> action.
  ///
  /// Parameter [managed] :
  /// Specifies whether the search is managed.
  ///
  /// Parameter [searchScope] :
  /// Specifies the scope of the search for types.
  ///
  /// Parameter [filters] :
  /// The filters for the <code>SearchTypes</code> action.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call to
  /// <code>SearchTypes</code>. When the number of results to be listed is
  /// greater than the value of <code>MaxResults</code>, the response contains a
  /// <code>NextToken</code> value that you can use in a subsequent call to
  /// <code>SearchTypes</code> to list the next set of results.
  ///
  /// Parameter [nextToken] :
  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>SearchTypes</code> to list the next set of results.
  ///
  /// Parameter [searchIn] :
  /// The details of the search.
  ///
  /// Parameter [searchText] :
  /// Specifies the text for which to search.
  ///
  /// Parameter [sort] :
  /// The specifies the way to sort the <code>SearchTypes</code> results.
  Future<SearchTypesOutput> searchTypes({
    required String domainIdentifier,
    required bool managed,
    required TypesSearchScope searchScope,
    FilterClause? filters,
    int? maxResults,
    String? nextToken,
    List<SearchInItem>? searchIn,
    String? searchText,
    SearchSort? sort,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'managed': managed,
      'searchScope': searchScope.toValue(),
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (searchIn != null) 'searchIn': searchIn,
      if (searchText != null) 'searchText': searchText,
      if (sort != null) 'sort': sort,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/types-search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchTypesOutput.fromJson(response);
  }

  /// Searches user profiles in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which you want to search
  /// user profiles.
  ///
  /// Parameter [userType] :
  /// Specifies the user type for the <code>SearchUserProfiles</code> action.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call to
  /// <code>SearchUserProfiles</code>. When the number of results to be listed
  /// is greater than the value of <code>MaxResults</code>, the response
  /// contains a <code>NextToken</code> value that you can use in a subsequent
  /// call to <code>SearchUserProfiles</code> to list the next set of results.
  ///
  /// Parameter [nextToken] :
  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>SearchUserProfiles</code> to list the next set of results.
  ///
  /// Parameter [searchText] :
  /// Specifies the text for which to search.
  Future<SearchUserProfilesOutput> searchUserProfiles({
    required String domainIdentifier,
    required UserSearchType userType,
    int? maxResults,
    String? nextToken,
    String? searchText,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'userType': userType.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (searchText != null) 'searchText': searchText,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/search-user-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return SearchUserProfilesOutput.fromJson(response);
  }

  /// Start the run of the specified data source in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [dataSourceIdentifier] :
  /// The identifier of the data source.
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which to start a data
  /// source run.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  Future<StartDataSourceRunOutput> startDataSourceRun({
    required String dataSourceIdentifier,
    required String domainIdentifier,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-sources/${Uri.encodeComponent(dataSourceIdentifier)}/runs',
      exceptionFnMap: _exceptionFns,
    );
    return StartDataSourceRunOutput.fromJson(response);
  }

  /// Starts the metadata generation run.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The ID of the Amazon DataZone domain where you want to start a metadata
  /// generation run.
  ///
  /// Parameter [owningProjectIdentifier] :
  /// The ID of the project that owns the asset for which you want to start a
  /// metadata generation run.
  ///
  /// Parameter [target] :
  /// The asset for which you want to start a metadata generation run.
  ///
  /// Parameter [type] :
  /// The type of the metadata generation run.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  /// This field is automatically populated if not provided.
  Future<StartMetadataGenerationRunOutput> startMetadataGenerationRun({
    required String domainIdentifier,
    required String owningProjectIdentifier,
    required MetadataGenerationRunTarget target,
    required MetadataGenerationRunType type,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'owningProjectIdentifier': owningProjectIdentifier,
      'target': target,
      'type': type.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/metadata-generation-runs',
      exceptionFnMap: _exceptionFns,
    );
    return StartMetadataGenerationRunOutput.fromJson(response);
  }

  /// Tags a resource in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be tagged in Amazon DataZone.
  ///
  /// Parameter [tags] :
  /// Specifies the tags for the <code>TagResource</code> action.
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

  /// Untags a resource in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be untagged in Amazon DataZone.
  ///
  /// Parameter [tagKeys] :
  /// Specifies the tag keys for the <code>UntagResource</code> action.
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

  /// Updates the specified data source in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the domain in which to update a data source.
  ///
  /// Parameter [identifier] :
  /// The identifier of the data source to be updated.
  ///
  /// Parameter [assetFormsInput] :
  /// The asset forms to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  ///
  /// Parameter [configuration] :
  /// The configuration to be updated as part of the
  /// <code>UpdateDataSource</code> action.
  ///
  /// Parameter [description] :
  /// The description to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  ///
  /// Parameter [enableSetting] :
  /// The enable setting to be updated as part of the
  /// <code>UpdateDataSource</code> action.
  ///
  /// Parameter [name] :
  /// The name to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  ///
  /// Parameter [publishOnImport] :
  /// The publish on import setting to be updated as part of the
  /// <code>UpdateDataSource</code> action.
  ///
  /// Parameter [recommendation] :
  /// The recommendation to be updated as part of the
  /// <code>UpdateDataSource</code> action.
  ///
  /// Parameter [schedule] :
  /// The schedule to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  Future<UpdateDataSourceOutput> updateDataSource({
    required String domainIdentifier,
    required String identifier,
    List<FormInput>? assetFormsInput,
    DataSourceConfigurationInput? configuration,
    String? description,
    EnableSetting? enableSetting,
    String? name,
    bool? publishOnImport,
    RecommendationConfiguration? recommendation,
    ScheduleConfiguration? schedule,
  }) async {
    final $payload = <String, dynamic>{
      if (assetFormsInput != null) 'assetFormsInput': assetFormsInput,
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
      if (enableSetting != null) 'enableSetting': enableSetting.toValue(),
      if (name != null) 'name': name,
      if (publishOnImport != null) 'publishOnImport': publishOnImport,
      if (recommendation != null) 'recommendation': recommendation,
      if (schedule != null) 'schedule': schedule,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/data-sources/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSourceOutput.fromJson(response);
  }

  /// Updates a Amazon DataZone domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [identifier] :
  /// The ID of the Amazon Web Services domain that is to be updated.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description to be updated as part of the <code>UpdateDomain</code>
  /// action.
  ///
  /// Parameter [domainExecutionRole] :
  /// The domain execution role to be updated as part of the
  /// <code>UpdateDomain</code> action.
  ///
  /// Parameter [name] :
  /// The name to be updated as part of the <code>UpdateDomain</code> action.
  ///
  /// Parameter [singleSignOn] :
  /// The single sign-on option to be updated as part of the
  /// <code>UpdateDomain</code> action.
  Future<UpdateDomainOutput> updateDomain({
    required String identifier,
    String? clientToken,
    String? description,
    String? domainExecutionRole,
    String? name,
    SingleSignOn? singleSignOn,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (domainExecutionRole != null)
        'domainExecutionRole': domainExecutionRole,
      if (name != null) 'name': name,
      if (singleSignOn != null) 'singleSignOn': singleSignOn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/domains/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainOutput.fromJson(response);
  }

  /// Updates the specified environment in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the domain in which the environment is to be updated.
  ///
  /// Parameter [identifier] :
  /// The identifier of the environment that is to be updated.
  ///
  /// Parameter [description] :
  /// The description to be updated as part of the
  /// <code>UpdateEnvironment</code> action.
  ///
  /// Parameter [glossaryTerms] :
  /// The glossary terms to be updated as part of the
  /// <code>UpdateEnvironment</code> action.
  ///
  /// Parameter [name] :
  /// The name to be updated as part of the <code>UpdateEnvironment</code>
  /// action.
  Future<UpdateEnvironmentOutput> updateEnvironment({
    required String domainIdentifier,
    required String identifier,
    String? description,
    List<String>? glossaryTerms,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnvironmentOutput.fromJson(response);
  }

  /// Updates the specified environment profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which an environment
  /// profile is to be updated.
  ///
  /// Parameter [identifier] :
  /// The identifier of the environment profile that is to be updated.
  ///
  /// Parameter [awsAccountId] :
  /// The Amazon Web Services account in which a specified environment profile
  /// is to be udpated.
  ///
  /// Parameter [awsAccountRegion] :
  /// The Amazon Web Services Region in which a specified environment profile is
  /// to be updated.
  ///
  /// Parameter [description] :
  /// The description to be updated as part of the
  /// <code>UpdateEnvironmentProfile</code> action.
  ///
  /// Parameter [name] :
  /// The name to be updated as part of the
  /// <code>UpdateEnvironmentProfile</code> action.
  ///
  /// Parameter [userParameters] :
  /// The user parameters to be updated as part of the
  /// <code>UpdateEnvironmentProfile</code> action.
  Future<UpdateEnvironmentProfileOutput> updateEnvironmentProfile({
    required String domainIdentifier,
    required String identifier,
    String? awsAccountId,
    String? awsAccountRegion,
    String? description,
    String? name,
    List<EnvironmentParameter>? userParameters,
  }) async {
    final $payload = <String, dynamic>{
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (userParameters != null) 'userParameters': userParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environment-profiles/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnvironmentProfileOutput.fromJson(response);
  }

  /// Updates the business glossary in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a business glossary
  /// is to be updated.
  ///
  /// Parameter [identifier] :
  /// The identifier of the business glossary to be updated.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that is provided to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description to be updated as part of the <code>UpdateGlossary</code>
  /// action.
  ///
  /// Parameter [name] :
  /// The name to be updated as part of the <code>UpdateGlossary</code> action.
  ///
  /// Parameter [status] :
  /// The status to be updated as part of the <code>UpdateGlossary</code>
  /// action.
  Future<UpdateGlossaryOutput> updateGlossary({
    required String domainIdentifier,
    required String identifier,
    String? clientToken,
    String? description,
    String? name,
    GlossaryStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/glossaries/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGlossaryOutput.fromJson(response);
  }

  /// Updates a business glossary term in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a business glossary
  /// term is to be updated.
  ///
  /// Parameter [identifier] :
  /// The identifier of the business glossary term that is to be updated.
  ///
  /// Parameter [glossaryIdentifier] :
  /// The identifier of the business glossary in which a term is to be updated.
  ///
  /// Parameter [longDescription] :
  /// The long description to be updated as part of the
  /// <code>UpdateGlossaryTerm</code> action.
  ///
  /// Parameter [name] :
  /// The name to be updated as part of the <code>UpdateGlossaryTerm</code>
  /// action.
  ///
  /// Parameter [shortDescription] :
  /// The short description to be updated as part of the
  /// <code>UpdateGlossaryTerm</code> action.
  ///
  /// Parameter [status] :
  /// The status to be updated as part of the <code>UpdateGlossaryTerm</code>
  /// action.
  ///
  /// Parameter [termRelations] :
  /// The term relations to be updated as part of the
  /// <code>UpdateGlossaryTerm</code> action.
  Future<UpdateGlossaryTermOutput> updateGlossaryTerm({
    required String domainIdentifier,
    required String identifier,
    String? glossaryIdentifier,
    String? longDescription,
    String? name,
    String? shortDescription,
    GlossaryTermStatus? status,
    TermRelations? termRelations,
  }) async {
    final $payload = <String, dynamic>{
      if (glossaryIdentifier != null) 'glossaryIdentifier': glossaryIdentifier,
      if (longDescription != null) 'longDescription': longDescription,
      if (name != null) 'name': name,
      if (shortDescription != null) 'shortDescription': shortDescription,
      if (status != null) 'status': status.toValue(),
      if (termRelations != null) 'termRelations': termRelations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/glossary-terms/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGlossaryTermOutput.fromJson(response);
  }

  /// Updates the specified group profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a group profile is
  /// updated.
  ///
  /// Parameter [groupIdentifier] :
  /// The identifier of the group profile that is updated.
  ///
  /// Parameter [status] :
  /// The status of the group profile that is updated.
  Future<UpdateGroupProfileOutput> updateGroupProfile({
    required String domainIdentifier,
    required String groupIdentifier,
    required GroupProfileStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/group-profiles/${Uri.encodeComponent(groupIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupProfileOutput.fromJson(response);
  }

  /// Updates the specified project in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a project is to be
  /// updated.
  ///
  /// Parameter [identifier] :
  /// The identifier of the project that is to be updated.
  ///
  /// Parameter [description] :
  /// The description to be updated as part of the <code>UpdateProject</code>
  /// action.
  ///
  /// Parameter [glossaryTerms] :
  /// The glossary terms to be updated as part of the <code>UpdateProject</code>
  /// action.
  ///
  /// Parameter [name] :
  /// The name to be updated as part of the <code>UpdateProject</code> action.
  Future<UpdateProjectOutput> updateProject({
    required String domainIdentifier,
    required String identifier,
    String? description,
    List<String>? glossaryTerms,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/projects/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProjectOutput.fromJson(response);
  }

  /// Updates the status of the specified subscription grant status in Amazon
  /// DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [assetIdentifier] :
  /// The identifier of the asset the subscription grant status of which is to
  /// be updated.
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a subscription grant
  /// status is to be updated.
  ///
  /// Parameter [identifier] :
  /// The identifier of the subscription grant the status of which is to be
  /// updated.
  ///
  /// Parameter [status] :
  /// The status to be updated as part of the
  /// <code>UpdateSubscriptionGrantStatus</code> action.
  ///
  /// Parameter [failureCause] :
  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  ///
  /// Parameter [targetName] :
  /// The target name to be updated as part of the
  /// <code>UpdateSubscriptionGrantStatus</code> action.
  Future<UpdateSubscriptionGrantStatusOutput> updateSubscriptionGrantStatus({
    required String assetIdentifier,
    required String domainIdentifier,
    required String identifier,
    required SubscriptionGrantStatus status,
    FailureCause? failureCause,
    String? targetName,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.toValue(),
      if (failureCause != null) 'failureCause': failureCause,
      if (targetName != null) 'targetName': targetName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-grants/${Uri.encodeComponent(identifier)}/status/${Uri.encodeComponent(assetIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSubscriptionGrantStatusOutput.fromJson(response);
  }

  /// Updates a specified subscription request in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a subscription
  /// request is to be updated.
  ///
  /// Parameter [identifier] :
  /// The identifier of the subscription request that is to be updated.
  ///
  /// Parameter [requestReason] :
  /// The reason for the <code>UpdateSubscriptionRequest</code> action.
  Future<UpdateSubscriptionRequestOutput> updateSubscriptionRequest({
    required String domainIdentifier,
    required String identifier,
    required String requestReason,
  }) async {
    final $payload = <String, dynamic>{
      'requestReason': requestReason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/subscription-requests/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSubscriptionRequestOutput.fromJson(response);
  }

  /// Updates the specified subscription target in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a subscription
  /// target is to be updated.
  ///
  /// Parameter [environmentIdentifier] :
  /// The identifier of the environment in which a subscription target is to be
  /// updated.
  ///
  /// Parameter [identifier] :
  /// Identifier of the subscription target that is to be updated.
  ///
  /// Parameter [applicableAssetTypes] :
  /// The applicable asset types to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  ///
  /// Parameter [authorizedPrincipals] :
  /// The authorized principals to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  ///
  /// Parameter [manageAccessRole] :
  /// The manage access role to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  ///
  /// Parameter [name] :
  /// The name to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  ///
  /// Parameter [provider] :
  /// The provider to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  ///
  /// Parameter [subscriptionTargetConfig] :
  /// The configuration to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  Future<UpdateSubscriptionTargetOutput> updateSubscriptionTarget({
    required String domainIdentifier,
    required String environmentIdentifier,
    required String identifier,
    List<String>? applicableAssetTypes,
    List<String>? authorizedPrincipals,
    String? manageAccessRole,
    String? name,
    String? provider,
    List<SubscriptionTargetForm>? subscriptionTargetConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (applicableAssetTypes != null)
        'applicableAssetTypes': applicableAssetTypes,
      if (authorizedPrincipals != null)
        'authorizedPrincipals': authorizedPrincipals,
      if (manageAccessRole != null) 'manageAccessRole': manageAccessRole,
      if (name != null) 'name': name,
      if (provider != null) 'provider': provider,
      if (subscriptionTargetConfig != null)
        'subscriptionTargetConfig': subscriptionTargetConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/environments/${Uri.encodeComponent(environmentIdentifier)}/subscription-targets/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSubscriptionTargetOutput.fromJson(response);
  }

  /// Updates the specified user profile in Amazon DataZone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [domainIdentifier] :
  /// The identifier of the Amazon DataZone domain in which a user profile is
  /// updated.
  ///
  /// Parameter [status] :
  /// The status of the user profile that are to be updated.
  ///
  /// Parameter [userIdentifier] :
  /// The identifier of the user whose user profile is to be updated.
  ///
  /// Parameter [type] :
  /// The type of the user profile that are to be updated.
  Future<UpdateUserProfileOutput> updateUserProfile({
    required String domainIdentifier,
    required UserProfileStatus status,
    required String userIdentifier,
    UserProfileType? type,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domains/${Uri.encodeComponent(domainIdentifier)}/user-profiles/${Uri.encodeComponent(userIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserProfileOutput.fromJson(response);
  }
}

/// Specifies the prediction (aka, the automatically generated piece of
/// metadata) and the target (for example, a column name) that can be accepted.
class AcceptChoice {
  /// Specifies the target (for example, a column name) where a prediction can be
  /// accepted.
  final String predictionTarget;

  /// The edit of the prediction.
  final String? editedValue;

  /// Specifies the prediction (aka, the automatically generated piece of
  /// metadata) that can be accepted.
  final int? predictionChoice;

  AcceptChoice({
    required this.predictionTarget,
    this.editedValue,
    this.predictionChoice,
  });

  Map<String, dynamic> toJson() {
    final predictionTarget = this.predictionTarget;
    final editedValue = this.editedValue;
    final predictionChoice = this.predictionChoice;
    return {
      'predictionTarget': predictionTarget,
      if (editedValue != null) 'editedValue': editedValue,
      if (predictionChoice != null) 'predictionChoice': predictionChoice,
    };
  }
}

class AcceptPredictionsOutput {
  /// The ID of the asset.
  final String assetId;

  /// The identifier of the Amazon DataZone domain.
  final String domainId;

  /// The revision that is to be made to the asset.
  final String revision;

  AcceptPredictionsOutput({
    required this.assetId,
    required this.domainId,
    required this.revision,
  });

  factory AcceptPredictionsOutput.fromJson(Map<String, dynamic> json) {
    return AcceptPredictionsOutput(
      assetId: json['assetId'] as String,
      domainId: json['domainId'] as String,
      revision: json['revision'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final domainId = this.domainId;
    final revision = this.revision;
    return {
      'assetId': assetId,
      'domainId': domainId,
      'revision': revision,
    };
  }
}

/// Specifies the rule and the threshold under which a prediction can be
/// accepted.
class AcceptRule {
  /// Specifies whether you want to accept the top prediction for all targets or
  /// none.
  final AcceptRuleBehavior? rule;

  /// The confidence score that specifies the condition at which a prediction can
  /// be accepted.
  final double? threshold;

  AcceptRule({
    this.rule,
    this.threshold,
  });

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    final threshold = this.threshold;
    return {
      if (rule != null) 'rule': rule.toValue(),
      if (threshold != null) 'threshold': threshold,
    };
  }
}

enum AcceptRuleBehavior {
  all,
  none,
}

extension AcceptRuleBehaviorValueExtension on AcceptRuleBehavior {
  String toValue() {
    switch (this) {
      case AcceptRuleBehavior.all:
        return 'ALL';
      case AcceptRuleBehavior.none:
        return 'NONE';
    }
  }
}

extension AcceptRuleBehaviorFromString on String {
  AcceptRuleBehavior toAcceptRuleBehavior() {
    switch (this) {
      case 'ALL':
        return AcceptRuleBehavior.all;
      case 'NONE':
        return AcceptRuleBehavior.none;
    }
    throw Exception('$this is not known in enum AcceptRuleBehavior');
  }
}

class AcceptSubscriptionRequestOutput {
  /// The timestamp that specifies when the subscription request was accepted.
  final DateTime createdAt;

  /// Specifies the Amazon DataZone user that accepted the specified subscription
  /// request.
  final String createdBy;

  /// The unique identifier of the Amazon DataZone domain where the specified
  /// subscription request was accepted.
  final String domainId;

  /// The identifier of the subscription request.
  final String id;

  /// Specifies the reason for requesting a subscription to the asset.
  final String requestReason;

  /// Specifies the status of the subscription request.
  final SubscriptionRequestStatus status;

  /// Specifies the asset for which the subscription request was created.
  final List<SubscribedListing> subscribedListings;

  /// Specifies the Amazon DataZone users who are subscribed to the asset
  /// specified in the subscription request.
  final List<SubscribedPrincipal> subscribedPrincipals;

  /// Specifies the timestamp when subscription request was updated.
  final DateTime updatedAt;

  /// Specifies the reason for accepting the subscription request.
  final String? decisionComment;

  /// Specifes the ID of the Amazon DataZone user who reviewed the subscription
  /// request.
  final String? reviewerId;

  /// Specifies the Amazon DataZone user who updated the subscription request.
  final String? updatedBy;

  AcceptSubscriptionRequestOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.requestReason,
    required this.status,
    required this.subscribedListings,
    required this.subscribedPrincipals,
    required this.updatedAt,
    this.decisionComment,
    this.reviewerId,
    this.updatedBy,
  });

  factory AcceptSubscriptionRequestOutput.fromJson(Map<String, dynamic> json) {
    return AcceptSubscriptionRequestOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      requestReason: json['requestReason'] as String,
      status: (json['status'] as String).toSubscriptionRequestStatus(),
      subscribedListings: (json['subscribedListings'] as List)
          .whereNotNull()
          .map((e) => SubscribedListing.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscribedPrincipals: (json['subscribedPrincipals'] as List)
          .whereNotNull()
          .map((e) => SubscribedPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      decisionComment: json['decisionComment'] as String?,
      reviewerId: json['reviewerId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final requestReason = this.requestReason;
    final status = this.status;
    final subscribedListings = this.subscribedListings;
    final subscribedPrincipals = this.subscribedPrincipals;
    final updatedAt = this.updatedAt;
    final decisionComment = this.decisionComment;
    final reviewerId = this.reviewerId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'requestReason': requestReason,
      'status': status.toValue(),
      'subscribedListings': subscribedListings,
      'subscribedPrincipals': subscribedPrincipals,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (decisionComment != null) 'decisionComment': decisionComment,
      if (reviewerId != null) 'reviewerId': reviewerId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// A Amazon DataZone inventory asset.
class AssetItem {
  /// The identifier of the Amazon DataZone domain in which the inventory asset
  /// exists.
  final String domainId;

  /// the identifier of the Amazon DataZone inventory asset.
  final String identifier;

  /// The name of the Amazon DataZone inventory asset.
  final String name;

  /// The identifier of the Amazon DataZone project that owns the inventory asset.
  final String owningProjectId;

  /// The identifier of the asset type of the specified Amazon DataZone inventory
  /// asset.
  final String typeIdentifier;

  /// The revision of the inventory asset type.
  final String typeRevision;

  /// The additional attributes of a Amazon DataZone inventory asset.
  final AssetItemAdditionalAttributes? additionalAttributes;

  /// The timestamp of when the Amazon DataZone inventory asset was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the inventory asset.
  final String? createdBy;

  /// The description of an Amazon DataZone inventory asset.
  final String? description;

  /// The external identifier of the Amazon DataZone inventory asset.
  final String? externalIdentifier;

  /// The timestamp of when the first revision of the inventory asset was created.
  final DateTime? firstRevisionCreatedAt;

  /// The Amazon DataZone user who created the first revision of the inventory
  /// asset.
  final String? firstRevisionCreatedBy;

  /// The glossary terms attached to the Amazon DataZone inventory asset.
  final List<String>? glossaryTerms;

  AssetItem({
    required this.domainId,
    required this.identifier,
    required this.name,
    required this.owningProjectId,
    required this.typeIdentifier,
    required this.typeRevision,
    this.additionalAttributes,
    this.createdAt,
    this.createdBy,
    this.description,
    this.externalIdentifier,
    this.firstRevisionCreatedAt,
    this.firstRevisionCreatedBy,
    this.glossaryTerms,
  });

  factory AssetItem.fromJson(Map<String, dynamic> json) {
    return AssetItem(
      domainId: json['domainId'] as String,
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      typeIdentifier: json['typeIdentifier'] as String,
      typeRevision: json['typeRevision'] as String,
      additionalAttributes: json['additionalAttributes'] != null
          ? AssetItemAdditionalAttributes.fromJson(
              json['additionalAttributes'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      externalIdentifier: json['externalIdentifier'] as String?,
      firstRevisionCreatedAt: timeStampFromJson(json['firstRevisionCreatedAt']),
      firstRevisionCreatedBy: json['firstRevisionCreatedBy'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final identifier = this.identifier;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final typeIdentifier = this.typeIdentifier;
    final typeRevision = this.typeRevision;
    final additionalAttributes = this.additionalAttributes;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final externalIdentifier = this.externalIdentifier;
    final firstRevisionCreatedAt = this.firstRevisionCreatedAt;
    final firstRevisionCreatedBy = this.firstRevisionCreatedBy;
    final glossaryTerms = this.glossaryTerms;
    return {
      'domainId': domainId,
      'identifier': identifier,
      'name': name,
      'owningProjectId': owningProjectId,
      'typeIdentifier': typeIdentifier,
      'typeRevision': typeRevision,
      if (additionalAttributes != null)
        'additionalAttributes': additionalAttributes,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (externalIdentifier != null) 'externalIdentifier': externalIdentifier,
      if (firstRevisionCreatedAt != null)
        'firstRevisionCreatedAt': unixTimestampToJson(firstRevisionCreatedAt),
      if (firstRevisionCreatedBy != null)
        'firstRevisionCreatedBy': firstRevisionCreatedBy,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
    };
  }
}

/// The additional attributes of an inventory asset.
class AssetItemAdditionalAttributes {
  /// The forms included in the additional attributes of an inventory asset.
  final List<FormOutput>? formsOutput;

  /// The latest time series data points forms included in the additional
  /// attributes of an asset.
  final List<TimeSeriesDataPointSummaryFormOutput>?
      latestTimeSeriesDataPointFormsOutput;

  /// The read-only forms included in the additional attributes of an inventory
  /// asset.
  final List<FormOutput>? readOnlyFormsOutput;

  AssetItemAdditionalAttributes({
    this.formsOutput,
    this.latestTimeSeriesDataPointFormsOutput,
    this.readOnlyFormsOutput,
  });

  factory AssetItemAdditionalAttributes.fromJson(Map<String, dynamic> json) {
    return AssetItemAdditionalAttributes(
      formsOutput: (json['formsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestTimeSeriesDataPointFormsOutput:
          (json['latestTimeSeriesDataPointFormsOutput'] as List?)
              ?.whereNotNull()
              .map((e) => TimeSeriesDataPointSummaryFormOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      readOnlyFormsOutput: (json['readOnlyFormsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final formsOutput = this.formsOutput;
    final latestTimeSeriesDataPointFormsOutput =
        this.latestTimeSeriesDataPointFormsOutput;
    final readOnlyFormsOutput = this.readOnlyFormsOutput;
    return {
      if (formsOutput != null) 'formsOutput': formsOutput,
      if (latestTimeSeriesDataPointFormsOutput != null)
        'latestTimeSeriesDataPointFormsOutput':
            latestTimeSeriesDataPointFormsOutput,
      if (readOnlyFormsOutput != null)
        'readOnlyFormsOutput': readOnlyFormsOutput,
    };
  }
}

/// An asset published in an Amazon DataZone catalog.
class AssetListing {
  /// The identifier of an asset published in an Amazon DataZone catalog.
  final String? assetId;

  /// The revision of an asset published in an Amazon DataZone catalog.
  final String? assetRevision;

  /// The type of an asset published in an Amazon DataZone catalog.
  final String? assetType;

  /// The timestamp of when an asset published in an Amazon DataZone catalog was
  /// created.
  final DateTime? createdAt;

  /// The metadata forms attached to an asset published in an Amazon DataZone
  /// catalog.
  final String? forms;

  /// The glossary terms attached to an asset published in an Amazon DataZone
  /// catalog.
  final List<DetailedGlossaryTerm>? glossaryTerms;

  /// The latest time series data points forms included in the additional
  /// attributes of an asset.
  final List<TimeSeriesDataPointSummaryFormOutput>?
      latestTimeSeriesDataPointForms;

  /// The identifier of the project where an asset published in an Amazon DataZone
  /// catalog exists.
  final String? owningProjectId;

  AssetListing({
    this.assetId,
    this.assetRevision,
    this.assetType,
    this.createdAt,
    this.forms,
    this.glossaryTerms,
    this.latestTimeSeriesDataPointForms,
    this.owningProjectId,
  });

  factory AssetListing.fromJson(Map<String, dynamic> json) {
    return AssetListing(
      assetId: json['assetId'] as String?,
      assetRevision: json['assetRevision'] as String?,
      assetType: json['assetType'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      forms: json['forms'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => DetailedGlossaryTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestTimeSeriesDataPointForms:
          (json['latestTimeSeriesDataPointForms'] as List?)
              ?.whereNotNull()
              .map((e) => TimeSeriesDataPointSummaryFormOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      owningProjectId: json['owningProjectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final assetRevision = this.assetRevision;
    final assetType = this.assetType;
    final createdAt = this.createdAt;
    final forms = this.forms;
    final glossaryTerms = this.glossaryTerms;
    final latestTimeSeriesDataPointForms = this.latestTimeSeriesDataPointForms;
    final owningProjectId = this.owningProjectId;
    return {
      if (assetId != null) 'assetId': assetId,
      if (assetRevision != null) 'assetRevision': assetRevision,
      if (assetType != null) 'assetType': assetType,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (forms != null) 'forms': forms,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (latestTimeSeriesDataPointForms != null)
        'latestTimeSeriesDataPointForms': latestTimeSeriesDataPointForms,
      if (owningProjectId != null) 'owningProjectId': owningProjectId,
    };
  }
}

/// The details of an asset published in an Amazon DataZone catalog.
class AssetListingDetails {
  /// The identifier of an asset published in an Amazon DataZone catalog.
  final String listingId;

  /// The status of an asset published in an Amazon DataZone catalog.
  final ListingStatus listingStatus;

  AssetListingDetails({
    required this.listingId,
    required this.listingStatus,
  });

  factory AssetListingDetails.fromJson(Map<String, dynamic> json) {
    return AssetListingDetails(
      listingId: json['listingId'] as String,
      listingStatus: (json['listingStatus'] as String).toListingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final listingId = this.listingId;
    final listingStatus = this.listingStatus;
    return {
      'listingId': listingId,
      'listingStatus': listingStatus.toValue(),
    };
  }
}

/// The details of an asset published in an Amazon DataZone catalog.
class AssetListingItem {
  /// The additional attributes of an asset published in an Amazon DataZone
  /// catalog.
  final AssetListingItemAdditionalAttributes? additionalAttributes;

  /// The timestamp of when an asset published in an Amazon DataZone catalog was
  /// created.
  final DateTime? createdAt;

  /// The description of an asset published in an Amazon DataZone catalog.
  final String? description;

  /// The identifier of the inventory asset.
  final String? entityId;

  /// The revision of the inventory asset.
  final String? entityRevision;

  /// The type of the inventory asset.
  final String? entityType;

  /// Glossary terms attached to the inventory asset.
  final List<DetailedGlossaryTerm>? glossaryTerms;

  /// The Amazon DataZone user who created the listing.
  final String? listingCreatedBy;

  /// The identifier of the listing (asset published in Amazon DataZone catalog).
  final String? listingId;

  /// The revision of the listing (asset published in Amazon DataZone catalog).
  final String? listingRevision;

  /// The Amazon DataZone user who updated the listing.
  final String? listingUpdatedBy;

  /// The name of the inventory asset.
  final String? name;

  /// The identifier of the project that owns the inventory asset.
  final String? owningProjectId;

  AssetListingItem({
    this.additionalAttributes,
    this.createdAt,
    this.description,
    this.entityId,
    this.entityRevision,
    this.entityType,
    this.glossaryTerms,
    this.listingCreatedBy,
    this.listingId,
    this.listingRevision,
    this.listingUpdatedBy,
    this.name,
    this.owningProjectId,
  });

  factory AssetListingItem.fromJson(Map<String, dynamic> json) {
    return AssetListingItem(
      additionalAttributes: json['additionalAttributes'] != null
          ? AssetListingItemAdditionalAttributes.fromJson(
              json['additionalAttributes'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      entityId: json['entityId'] as String?,
      entityRevision: json['entityRevision'] as String?,
      entityType: json['entityType'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => DetailedGlossaryTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
      listingCreatedBy: json['listingCreatedBy'] as String?,
      listingId: json['listingId'] as String?,
      listingRevision: json['listingRevision'] as String?,
      listingUpdatedBy: json['listingUpdatedBy'] as String?,
      name: json['name'] as String?,
      owningProjectId: json['owningProjectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalAttributes = this.additionalAttributes;
    final createdAt = this.createdAt;
    final description = this.description;
    final entityId = this.entityId;
    final entityRevision = this.entityRevision;
    final entityType = this.entityType;
    final glossaryTerms = this.glossaryTerms;
    final listingCreatedBy = this.listingCreatedBy;
    final listingId = this.listingId;
    final listingRevision = this.listingRevision;
    final listingUpdatedBy = this.listingUpdatedBy;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    return {
      if (additionalAttributes != null)
        'additionalAttributes': additionalAttributes,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (entityId != null) 'entityId': entityId,
      if (entityRevision != null) 'entityRevision': entityRevision,
      if (entityType != null) 'entityType': entityType,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (listingCreatedBy != null) 'listingCreatedBy': listingCreatedBy,
      if (listingId != null) 'listingId': listingId,
      if (listingRevision != null) 'listingRevision': listingRevision,
      if (listingUpdatedBy != null) 'listingUpdatedBy': listingUpdatedBy,
      if (name != null) 'name': name,
      if (owningProjectId != null) 'owningProjectId': owningProjectId,
    };
  }
}

/// Additional attributes of an inventory asset.
class AssetListingItemAdditionalAttributes {
  /// The metadata forms that form additional attributes of the metadata asset.
  final String? forms;

  /// The latest time series data points forms included in the additional
  /// attributes of an asset.
  final List<TimeSeriesDataPointSummaryFormOutput>?
      latestTimeSeriesDataPointForms;

  AssetListingItemAdditionalAttributes({
    this.forms,
    this.latestTimeSeriesDataPointForms,
  });

  factory AssetListingItemAdditionalAttributes.fromJson(
      Map<String, dynamic> json) {
    return AssetListingItemAdditionalAttributes(
      forms: json['forms'] as String?,
      latestTimeSeriesDataPointForms:
          (json['latestTimeSeriesDataPointForms'] as List?)
              ?.whereNotNull()
              .map((e) => TimeSeriesDataPointSummaryFormOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final forms = this.forms;
    final latestTimeSeriesDataPointForms = this.latestTimeSeriesDataPointForms;
    return {
      if (forms != null) 'forms': forms,
      if (latestTimeSeriesDataPointForms != null)
        'latestTimeSeriesDataPointForms': latestTimeSeriesDataPointForms,
    };
  }
}

/// The revision of an inventory asset.
class AssetRevision {
  /// The timestamp of when an inventory asset revison was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the asset revision.
  final String? createdBy;

  /// The Amazon DataZone user who created the inventory asset.
  final String? domainId;

  /// The identifier of the inventory asset revision.
  final String? id;

  /// The revision details of the inventory asset.
  final String? revision;

  AssetRevision({
    this.createdAt,
    this.createdBy,
    this.domainId,
    this.id,
    this.revision,
  });

  factory AssetRevision.fromJson(Map<String, dynamic> json) {
    return AssetRevision(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      domainId: json['domainId'] as String?,
      id: json['id'] as String?,
      revision: json['revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final revision = this.revision;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (domainId != null) 'domainId': domainId,
      if (id != null) 'id': id,
      if (revision != null) 'revision': revision,
    };
  }
}

/// The name map for assets.
class AssetTargetNameMap {
  /// The identifier of the inventory asset.
  final String assetId;

  /// The target name in the asset target name map.
  final String targetName;

  AssetTargetNameMap({
    required this.assetId,
    required this.targetName,
  });

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final targetName = this.targetName;
    return {
      'assetId': assetId,
      'targetName': targetName,
    };
  }
}

/// The details of the asset type.
class AssetTypeItem {
  /// The identifier of the Amazon DataZone domain where the asset type exists.
  final String domainId;

  /// The forms included in the details of the asset type.
  final Map<String, FormEntryOutput> formsOutput;

  /// The name of the asset type.
  final String name;

  /// The identifier of the Amazon DataZone project that owns the asset type.
  final String owningProjectId;

  /// The revision of the asset type.
  final String revision;

  /// The timestamp of when the asset type was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the asset type.
  final String? createdBy;

  /// The description of the asset type.
  final String? description;

  /// The identifier of the Amazon DataZone domain where the asset type was
  /// originally created.
  final String? originDomainId;

  /// The identifier of the Amazon DataZone project where the asset type exists.
  final String? originProjectId;

  /// The timestamp of when the asset type was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the asset type.
  final String? updatedBy;

  AssetTypeItem({
    required this.domainId,
    required this.formsOutput,
    required this.name,
    required this.owningProjectId,
    required this.revision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.originDomainId,
    this.originProjectId,
    this.updatedAt,
    this.updatedBy,
  });

  factory AssetTypeItem.fromJson(Map<String, dynamic> json) {
    return AssetTypeItem(
      domainId: json['domainId'] as String,
      formsOutput: (json['formsOutput'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, FormEntryOutput.fromJson(e as Map<String, dynamic>))),
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      revision: json['revision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      originDomainId: json['originDomainId'] as String?,
      originProjectId: json['originProjectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final formsOutput = this.formsOutput;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final revision = this.revision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final originDomainId = this.originDomainId;
    final originProjectId = this.originProjectId;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'formsOutput': formsOutput,
      'name': name,
      'owningProjectId': owningProjectId,
      'revision': revision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (originDomainId != null) 'originDomainId': originDomainId,
      if (originProjectId != null) 'originProjectId': originProjectId,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum AuthType {
  iamIdc,
  disabled,
}

extension AuthTypeValueExtension on AuthType {
  String toValue() {
    switch (this) {
      case AuthType.iamIdc:
        return 'IAM_IDC';
      case AuthType.disabled:
        return 'DISABLED';
    }
  }
}

extension AuthTypeFromString on String {
  AuthType toAuthType() {
    switch (this) {
      case 'IAM_IDC':
        return AuthType.iamIdc;
      case 'DISABLED':
        return AuthType.disabled;
    }
    throw Exception('$this is not known in enum AuthType');
  }
}

/// The configuration of the business name generation.
class BusinessNameGenerationConfiguration {
  /// Specifies whether the business name generation is enabled.
  final bool? enabled;

  BusinessNameGenerationConfiguration({
    this.enabled,
  });

  factory BusinessNameGenerationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BusinessNameGenerationConfiguration(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

class CancelMetadataGenerationRunOutput {
  CancelMetadataGenerationRunOutput();

  factory CancelMetadataGenerationRunOutput.fromJson(Map<String, dynamic> _) {
    return CancelMetadataGenerationRunOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelSubscriptionOutput {
  /// The timestamp that specifies when the request to cancel the subscription was
  /// created.
  final DateTime createdAt;

  /// Specifies the Amazon DataZone user who is cancelling the subscription.
  final String createdBy;

  /// The unique identifier of the Amazon DataZone domain where the subscription
  /// is being cancelled.
  final String domainId;

  /// The identifier of the subscription.
  final String id;

  /// The status of the request to cancel the subscription.
  final SubscriptionStatus status;

  /// The asset to which a subscription is being cancelled.
  final SubscribedListing subscribedListing;

  /// The Amazon DataZone user who is made a subscriber to the specified asset by
  /// the subscription that is being cancelled.
  final SubscribedPrincipal subscribedPrincipal;

  /// The timestamp that specifies when the subscription was cancelled.
  final DateTime updatedAt;

  /// Specifies whether the permissions to the asset are retained after the
  /// subscription is cancelled.
  final bool? retainPermissions;

  /// The unique ID of the subscripton request for the subscription that is being
  /// cancelled.
  final String? subscriptionRequestId;

  /// The Amazon DataZone user that cancelled the subscription.
  final String? updatedBy;

  CancelSubscriptionOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.status,
    required this.subscribedListing,
    required this.subscribedPrincipal,
    required this.updatedAt,
    this.retainPermissions,
    this.subscriptionRequestId,
    this.updatedBy,
  });

  factory CancelSubscriptionOutput.fromJson(Map<String, dynamic> json) {
    return CancelSubscriptionOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionStatus(),
      subscribedListing: SubscribedListing.fromJson(
          json['subscribedListing'] as Map<String, dynamic>),
      subscribedPrincipal: SubscribedPrincipal.fromJson(
          json['subscribedPrincipal'] as Map<String, dynamic>),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      retainPermissions: json['retainPermissions'] as bool?,
      subscriptionRequestId: json['subscriptionRequestId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final status = this.status;
    final subscribedListing = this.subscribedListing;
    final subscribedPrincipal = this.subscribedPrincipal;
    final updatedAt = this.updatedAt;
    final retainPermissions = this.retainPermissions;
    final subscriptionRequestId = this.subscriptionRequestId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'status': status.toValue(),
      'subscribedListing': subscribedListing,
      'subscribedPrincipal': subscribedPrincipal,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (retainPermissions != null) 'retainPermissions': retainPermissions,
      if (subscriptionRequestId != null)
        'subscriptionRequestId': subscriptionRequestId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum ChangeAction {
  publish,
  unpublish,
}

extension ChangeActionValueExtension on ChangeAction {
  String toValue() {
    switch (this) {
      case ChangeAction.publish:
        return 'PUBLISH';
      case ChangeAction.unpublish:
        return 'UNPUBLISH';
    }
  }
}

extension ChangeActionFromString on String {
  ChangeAction toChangeAction() {
    switch (this) {
      case 'PUBLISH':
        return ChangeAction.publish;
      case 'UNPUBLISH':
        return ChangeAction.unpublish;
    }
    throw Exception('$this is not known in enum ChangeAction');
  }
}

/// Part of the provisioning properties of the environment blueprint.
class CloudFormationProperties {
  /// The template URL of the cloud formation provisioning properties of the
  /// environment blueprint.
  final String templateUrl;

  CloudFormationProperties({
    required this.templateUrl,
  });

  factory CloudFormationProperties.fromJson(Map<String, dynamic> json) {
    return CloudFormationProperties(
      templateUrl: json['templateUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final templateUrl = this.templateUrl;
    return {
      'templateUrl': templateUrl,
    };
  }
}

/// The details of the parameters for the configurable environment action.
class ConfigurableActionParameter {
  /// The key of the configurable action parameter.
  final String? key;

  /// The value of the configurable action parameter.
  final String? value;

  ConfigurableActionParameter({
    this.key,
    this.value,
  });

  factory ConfigurableActionParameter.fromJson(Map<String, dynamic> json) {
    return ConfigurableActionParameter(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

enum ConfigurableActionTypeAuthorization {
  iam,
  https,
}

extension ConfigurableActionTypeAuthorizationValueExtension
    on ConfigurableActionTypeAuthorization {
  String toValue() {
    switch (this) {
      case ConfigurableActionTypeAuthorization.iam:
        return 'IAM';
      case ConfigurableActionTypeAuthorization.https:
        return 'HTTPS';
    }
  }
}

extension ConfigurableActionTypeAuthorizationFromString on String {
  ConfigurableActionTypeAuthorization toConfigurableActionTypeAuthorization() {
    switch (this) {
      case 'IAM':
        return ConfigurableActionTypeAuthorization.iam;
      case 'HTTPS':
        return ConfigurableActionTypeAuthorization.https;
    }
    throw Exception(
        '$this is not known in enum ConfigurableActionTypeAuthorization');
  }
}

/// The configurable action of a Amazon DataZone environment.
class ConfigurableEnvironmentAction {
  /// The parameters of a configurable action in a Amazon DataZone environment.
  final List<ConfigurableActionParameter> parameters;

  /// The type of a configurable action in a Amazon DataZone environment.
  final String type;

  /// The authentication type of a configurable action of a Amazon DataZone
  /// environment.
  final ConfigurableActionTypeAuthorization? auth;

  ConfigurableEnvironmentAction({
    required this.parameters,
    required this.type,
    this.auth,
  });

  factory ConfigurableEnvironmentAction.fromJson(Map<String, dynamic> json) {
    return ConfigurableEnvironmentAction(
      parameters: (json['parameters'] as List)
          .whereNotNull()
          .map((e) =>
              ConfigurableActionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      auth: (json['auth'] as String?)?.toConfigurableActionTypeAuthorization(),
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final type = this.type;
    final auth = this.auth;
    return {
      'parameters': parameters,
      'type': type,
      if (auth != null) 'auth': auth.toValue(),
    };
  }
}

class CreateAssetOutput {
  /// The ID of the Amazon DataZone domain in which the asset was created.
  final String domainId;

  /// The metadata forms that are attached to the created asset.
  final List<FormOutput> formsOutput;

  /// The unique identifier of the created asset.
  final String id;

  /// The name of the created asset.
  final String name;

  /// The ID of the Amazon DataZone project that owns the created asset.
  final String owningProjectId;

  /// The revision of the asset.
  final String revision;

  /// The identifier of the created asset type.
  final String typeIdentifier;

  /// The revision type of the asset.
  final String typeRevision;

  /// The timestamp of when the asset was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user that created this asset in the catalog.
  final String? createdBy;

  /// The description of the created asset.
  final String? description;

  /// The external identifier of the asset.
  final String? externalIdentifier;

  /// The timestamp of when the first revision of the asset took place.
  final DateTime? firstRevisionCreatedAt;

  /// The Amazon DataZone user that made the first revision of the asset.
  final String? firstRevisionCreatedBy;

  /// The glossary terms that are attached to the created asset.
  final List<String>? glossaryTerms;

  /// The latest data point that was imported into the time series form for the
  /// asset.
  final List<TimeSeriesDataPointSummaryFormOutput>?
      latestTimeSeriesDataPointFormsOutput;

  /// The details of an asset published in an Amazon DataZone catalog.
  final AssetListingDetails? listing;

  /// The configuration of the automatically generated business-friendly metadata
  /// for the asset.
  final PredictionConfiguration? predictionConfiguration;

  /// The read-only metadata forms that are attached to the created asset.
  final List<FormOutput>? readOnlyFormsOutput;

  CreateAssetOutput({
    required this.domainId,
    required this.formsOutput,
    required this.id,
    required this.name,
    required this.owningProjectId,
    required this.revision,
    required this.typeIdentifier,
    required this.typeRevision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.externalIdentifier,
    this.firstRevisionCreatedAt,
    this.firstRevisionCreatedBy,
    this.glossaryTerms,
    this.latestTimeSeriesDataPointFormsOutput,
    this.listing,
    this.predictionConfiguration,
    this.readOnlyFormsOutput,
  });

  factory CreateAssetOutput.fromJson(Map<String, dynamic> json) {
    return CreateAssetOutput(
      domainId: json['domainId'] as String,
      formsOutput: (json['formsOutput'] as List)
          .whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      revision: json['revision'] as String,
      typeIdentifier: json['typeIdentifier'] as String,
      typeRevision: json['typeRevision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      externalIdentifier: json['externalIdentifier'] as String?,
      firstRevisionCreatedAt: timeStampFromJson(json['firstRevisionCreatedAt']),
      firstRevisionCreatedBy: json['firstRevisionCreatedBy'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestTimeSeriesDataPointFormsOutput:
          (json['latestTimeSeriesDataPointFormsOutput'] as List?)
              ?.whereNotNull()
              .map((e) => TimeSeriesDataPointSummaryFormOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      listing: json['listing'] != null
          ? AssetListingDetails.fromJson(
              json['listing'] as Map<String, dynamic>)
          : null,
      predictionConfiguration: json['predictionConfiguration'] != null
          ? PredictionConfiguration.fromJson(
              json['predictionConfiguration'] as Map<String, dynamic>)
          : null,
      readOnlyFormsOutput: (json['readOnlyFormsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final formsOutput = this.formsOutput;
    final id = this.id;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final revision = this.revision;
    final typeIdentifier = this.typeIdentifier;
    final typeRevision = this.typeRevision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final externalIdentifier = this.externalIdentifier;
    final firstRevisionCreatedAt = this.firstRevisionCreatedAt;
    final firstRevisionCreatedBy = this.firstRevisionCreatedBy;
    final glossaryTerms = this.glossaryTerms;
    final latestTimeSeriesDataPointFormsOutput =
        this.latestTimeSeriesDataPointFormsOutput;
    final listing = this.listing;
    final predictionConfiguration = this.predictionConfiguration;
    final readOnlyFormsOutput = this.readOnlyFormsOutput;
    return {
      'domainId': domainId,
      'formsOutput': formsOutput,
      'id': id,
      'name': name,
      'owningProjectId': owningProjectId,
      'revision': revision,
      'typeIdentifier': typeIdentifier,
      'typeRevision': typeRevision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (externalIdentifier != null) 'externalIdentifier': externalIdentifier,
      if (firstRevisionCreatedAt != null)
        'firstRevisionCreatedAt': unixTimestampToJson(firstRevisionCreatedAt),
      if (firstRevisionCreatedBy != null)
        'firstRevisionCreatedBy': firstRevisionCreatedBy,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (latestTimeSeriesDataPointFormsOutput != null)
        'latestTimeSeriesDataPointFormsOutput':
            latestTimeSeriesDataPointFormsOutput,
      if (listing != null) 'listing': listing,
      if (predictionConfiguration != null)
        'predictionConfiguration': predictionConfiguration,
      if (readOnlyFormsOutput != null)
        'readOnlyFormsOutput': readOnlyFormsOutput,
    };
  }
}

class CreateAssetRevisionOutput {
  /// The unique identifier of the Amazon DataZone domain where the asset was
  /// revised.
  final String domainId;

  /// The metadata forms that were attached to the asset as part of the asset
  /// revision.
  final List<FormOutput> formsOutput;

  /// The unique identifier of the asset revision.
  final String id;

  /// The revised name of the asset.
  final String name;

  /// The unique identifier of the revised project that owns the asset.
  final String owningProjectId;

  /// The revision of the asset.
  final String revision;

  /// The identifier of the revision type.
  final String typeIdentifier;

  /// The revision type of the asset.
  final String typeRevision;

  /// The timestamp of when the asset revision occured.
  final DateTime? createdAt;

  /// The Amazon DataZone user who performed the asset revision.
  final String? createdBy;

  /// The revised asset description.
  final String? description;

  /// The external identifier of the asset.
  final String? externalIdentifier;

  /// The timestamp of when the first asset revision occured.
  final DateTime? firstRevisionCreatedAt;

  /// The Amazon DataZone user who performed the first asset revision.
  final String? firstRevisionCreatedBy;

  /// The glossary terms that were attached to the asset as part of asset
  /// revision.
  final List<String>? glossaryTerms;

  /// The latest data point that was imported into the time series form for the
  /// asset.
  final List<TimeSeriesDataPointSummaryFormOutput>?
      latestTimeSeriesDataPointFormsOutput;

  /// The details of an asset published in an Amazon DataZone catalog.
  final AssetListingDetails? listing;

  /// The configuration of the automatically generated business-friendly metadata
  /// for the asset.
  final PredictionConfiguration? predictionConfiguration;

  /// The read-only metadata forms that were attached to the asset as part of the
  /// asset revision.
  final List<FormOutput>? readOnlyFormsOutput;

  CreateAssetRevisionOutput({
    required this.domainId,
    required this.formsOutput,
    required this.id,
    required this.name,
    required this.owningProjectId,
    required this.revision,
    required this.typeIdentifier,
    required this.typeRevision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.externalIdentifier,
    this.firstRevisionCreatedAt,
    this.firstRevisionCreatedBy,
    this.glossaryTerms,
    this.latestTimeSeriesDataPointFormsOutput,
    this.listing,
    this.predictionConfiguration,
    this.readOnlyFormsOutput,
  });

  factory CreateAssetRevisionOutput.fromJson(Map<String, dynamic> json) {
    return CreateAssetRevisionOutput(
      domainId: json['domainId'] as String,
      formsOutput: (json['formsOutput'] as List)
          .whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      revision: json['revision'] as String,
      typeIdentifier: json['typeIdentifier'] as String,
      typeRevision: json['typeRevision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      externalIdentifier: json['externalIdentifier'] as String?,
      firstRevisionCreatedAt: timeStampFromJson(json['firstRevisionCreatedAt']),
      firstRevisionCreatedBy: json['firstRevisionCreatedBy'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestTimeSeriesDataPointFormsOutput:
          (json['latestTimeSeriesDataPointFormsOutput'] as List?)
              ?.whereNotNull()
              .map((e) => TimeSeriesDataPointSummaryFormOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      listing: json['listing'] != null
          ? AssetListingDetails.fromJson(
              json['listing'] as Map<String, dynamic>)
          : null,
      predictionConfiguration: json['predictionConfiguration'] != null
          ? PredictionConfiguration.fromJson(
              json['predictionConfiguration'] as Map<String, dynamic>)
          : null,
      readOnlyFormsOutput: (json['readOnlyFormsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final formsOutput = this.formsOutput;
    final id = this.id;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final revision = this.revision;
    final typeIdentifier = this.typeIdentifier;
    final typeRevision = this.typeRevision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final externalIdentifier = this.externalIdentifier;
    final firstRevisionCreatedAt = this.firstRevisionCreatedAt;
    final firstRevisionCreatedBy = this.firstRevisionCreatedBy;
    final glossaryTerms = this.glossaryTerms;
    final latestTimeSeriesDataPointFormsOutput =
        this.latestTimeSeriesDataPointFormsOutput;
    final listing = this.listing;
    final predictionConfiguration = this.predictionConfiguration;
    final readOnlyFormsOutput = this.readOnlyFormsOutput;
    return {
      'domainId': domainId,
      'formsOutput': formsOutput,
      'id': id,
      'name': name,
      'owningProjectId': owningProjectId,
      'revision': revision,
      'typeIdentifier': typeIdentifier,
      'typeRevision': typeRevision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (externalIdentifier != null) 'externalIdentifier': externalIdentifier,
      if (firstRevisionCreatedAt != null)
        'firstRevisionCreatedAt': unixTimestampToJson(firstRevisionCreatedAt),
      if (firstRevisionCreatedBy != null)
        'firstRevisionCreatedBy': firstRevisionCreatedBy,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (latestTimeSeriesDataPointFormsOutput != null)
        'latestTimeSeriesDataPointFormsOutput':
            latestTimeSeriesDataPointFormsOutput,
      if (listing != null) 'listing': listing,
      if (predictionConfiguration != null)
        'predictionConfiguration': predictionConfiguration,
      if (readOnlyFormsOutput != null)
        'readOnlyFormsOutput': readOnlyFormsOutput,
    };
  }
}

class CreateAssetTypeOutput {
  /// The ID of the Amazon DataZone domain in which the asset type was created.
  final String domainId;

  /// The metadata forms that are attached to the asset type.
  final Map<String, FormEntryOutput> formsOutput;

  /// The name of the asset type.
  final String name;

  /// The revision of the custom asset type.
  final String revision;

  /// The timestamp of when the asset type is to be created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who creates this custom asset type.
  final String? createdBy;

  /// The description of the custom asset type.
  final String? description;

  /// The ID of the Amazon DataZone domain where the asset type was originally
  /// created.
  final String? originDomainId;

  /// The ID of the Amazon DataZone project where the asset type was originally
  /// created.
  final String? originProjectId;

  /// The ID of the Amazon DataZone project that currently owns this asset type.
  final String? owningProjectId;

  /// The timestamp of when the custom type was created.
  final DateTime? updatedAt;

  /// The Amazon DataZone user that created the custom asset type.
  final String? updatedBy;

  CreateAssetTypeOutput({
    required this.domainId,
    required this.formsOutput,
    required this.name,
    required this.revision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.originDomainId,
    this.originProjectId,
    this.owningProjectId,
    this.updatedAt,
    this.updatedBy,
  });

  factory CreateAssetTypeOutput.fromJson(Map<String, dynamic> json) {
    return CreateAssetTypeOutput(
      domainId: json['domainId'] as String,
      formsOutput: (json['formsOutput'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, FormEntryOutput.fromJson(e as Map<String, dynamic>))),
      name: json['name'] as String,
      revision: json['revision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      originDomainId: json['originDomainId'] as String?,
      originProjectId: json['originProjectId'] as String?,
      owningProjectId: json['owningProjectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final formsOutput = this.formsOutput;
    final name = this.name;
    final revision = this.revision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final originDomainId = this.originDomainId;
    final originProjectId = this.originProjectId;
    final owningProjectId = this.owningProjectId;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'formsOutput': formsOutput,
      'name': name,
      'revision': revision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (originDomainId != null) 'originDomainId': originDomainId,
      if (originProjectId != null) 'originProjectId': originProjectId,
      if (owningProjectId != null) 'owningProjectId': owningProjectId,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class CreateDataSourceOutput {
  /// The ID of the Amazon DataZone domain in which the data source is created.
  final String domainId;

  /// The unique identifier of the Amazon DataZone environment to which the data
  /// source publishes assets.
  final String environmentId;

  /// The unique identifier of the data source.
  final String id;

  /// The name of the data source.
  final String name;

  /// The ID of the Amazon DataZone project to which the data source is added.
  final String projectId;

  /// The metadata forms attached to the assets that this data source creates.
  final List<FormOutput>? assetFormsOutput;

  /// Specifies the configuration of the data source. It can be set to either
  /// <code>glueRunConfiguration</code> or <code>redshiftRunConfiguration</code>.
  final DataSourceConfigurationOutput? configuration;

  /// The timestamp of when the data source was created.
  final DateTime? createdAt;

  /// The description of the data source.
  final String? description;

  /// Specifies whether the data source is enabled.
  final EnableSetting? enableSetting;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? errorMessage;

  /// The timestamp that specifies when the data source was last run.
  final DateTime? lastRunAt;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? lastRunErrorMessage;

  /// The status of the last run of this data source.
  final DataSourceRunStatus? lastRunStatus;

  /// Specifies whether the assets that this data source creates in the inventory
  /// are to be also automatically published to the catalog.
  final bool? publishOnImport;

  /// Specifies whether the business name generation is to be enabled for this
  /// data source.
  final RecommendationConfiguration? recommendation;

  /// The schedule of the data source runs.
  final ScheduleConfiguration? schedule;

  /// The status of the data source.
  final DataSourceStatus? status;

  /// The type of the data source.
  final String? type;

  /// The timestamp of when the data source was updated.
  final DateTime? updatedAt;

  CreateDataSourceOutput({
    required this.domainId,
    required this.environmentId,
    required this.id,
    required this.name,
    required this.projectId,
    this.assetFormsOutput,
    this.configuration,
    this.createdAt,
    this.description,
    this.enableSetting,
    this.errorMessage,
    this.lastRunAt,
    this.lastRunErrorMessage,
    this.lastRunStatus,
    this.publishOnImport,
    this.recommendation,
    this.schedule,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory CreateDataSourceOutput.fromJson(Map<String, dynamic> json) {
    return CreateDataSourceOutput(
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      assetFormsOutput: (json['assetFormsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      configuration: json['configuration'] != null
          ? DataSourceConfigurationOutput.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      enableSetting: (json['enableSetting'] as String?)?.toEnableSetting(),
      errorMessage: json['errorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['errorMessage'] as Map<String, dynamic>)
          : null,
      lastRunAt: timeStampFromJson(json['lastRunAt']),
      lastRunErrorMessage: json['lastRunErrorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['lastRunErrorMessage'] as Map<String, dynamic>)
          : null,
      lastRunStatus:
          (json['lastRunStatus'] as String?)?.toDataSourceRunStatus(),
      publishOnImport: json['publishOnImport'] as bool?,
      recommendation: json['recommendation'] != null
          ? RecommendationConfiguration.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      schedule: json['schedule'] != null
          ? ScheduleConfiguration.fromJson(
              json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toDataSourceStatus(),
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final id = this.id;
    final name = this.name;
    final projectId = this.projectId;
    final assetFormsOutput = this.assetFormsOutput;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final description = this.description;
    final enableSetting = this.enableSetting;
    final errorMessage = this.errorMessage;
    final lastRunAt = this.lastRunAt;
    final lastRunErrorMessage = this.lastRunErrorMessage;
    final lastRunStatus = this.lastRunStatus;
    final publishOnImport = this.publishOnImport;
    final recommendation = this.recommendation;
    final schedule = this.schedule;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      'domainId': domainId,
      'environmentId': environmentId,
      'id': id,
      'name': name,
      'projectId': projectId,
      if (assetFormsOutput != null) 'assetFormsOutput': assetFormsOutput,
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (enableSetting != null) 'enableSetting': enableSetting.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (lastRunAt != null) 'lastRunAt': iso8601ToJson(lastRunAt),
      if (lastRunErrorMessage != null)
        'lastRunErrorMessage': lastRunErrorMessage,
      if (lastRunStatus != null) 'lastRunStatus': lastRunStatus.toValue(),
      if (publishOnImport != null) 'publishOnImport': publishOnImport,
      if (recommendation != null) 'recommendation': recommendation,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CreateDomainOutput {
  /// The identifier of the Amazon DataZone domain.
  final String id;

  /// The ARN of the Amazon DataZone domain.
  final String? arn;

  /// The description of the Amazon DataZone domain.
  final String? description;

  /// The domain execution role that is created when an Amazon DataZone domain is
  /// created. The domain execution role is created in the Amazon Web Services
  /// account that houses the Amazon DataZone domain.
  final String? domainExecutionRole;

  /// The identifier of the Amazon Web Services Key Management Service (KMS) key
  /// that is used to encrypt the Amazon DataZone domain, metadata, and reporting
  /// data.
  final String? kmsKeyIdentifier;

  /// The name of the Amazon DataZone domain.
  final String? name;

  /// The URL of the data portal for this Amazon DataZone domain.
  final String? portalUrl;

  /// The single-sign on configuration of the Amazon DataZone domain.
  final SingleSignOn? singleSignOn;

  /// The status of the Amazon DataZone domain.
  final DomainStatus? status;

  /// The tags specified for the Amazon DataZone domain.
  final Map<String, String>? tags;

  CreateDomainOutput({
    required this.id,
    this.arn,
    this.description,
    this.domainExecutionRole,
    this.kmsKeyIdentifier,
    this.name,
    this.portalUrl,
    this.singleSignOn,
    this.status,
    this.tags,
  });

  factory CreateDomainOutput.fromJson(Map<String, dynamic> json) {
    return CreateDomainOutput(
      id: json['id'] as String,
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      domainExecutionRole: json['domainExecutionRole'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      name: json['name'] as String?,
      portalUrl: json['portalUrl'] as String?,
      singleSignOn: json['singleSignOn'] != null
          ? SingleSignOn.fromJson(json['singleSignOn'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toDomainStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final arn = this.arn;
    final description = this.description;
    final domainExecutionRole = this.domainExecutionRole;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final name = this.name;
    final portalUrl = this.portalUrl;
    final singleSignOn = this.singleSignOn;
    final status = this.status;
    final tags = this.tags;
    return {
      'id': id,
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (domainExecutionRole != null)
        'domainExecutionRole': domainExecutionRole,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (name != null) 'name': name,
      if (portalUrl != null) 'portalUrl': portalUrl,
      if (singleSignOn != null) 'singleSignOn': singleSignOn,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateEnvironmentOutput {
  /// The Amazon DataZone user who created this environment.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which the environment is
  /// created.
  final String domainId;

  /// The ID of the environment profile with which this Amazon DataZone
  /// environment was created.
  final String environmentProfileId;

  /// The name of this environment.
  final String name;

  /// The ID of the Amazon DataZone project in which this environment is created.
  final String projectId;

  /// The provider of this Amazon DataZone environment.
  final String provider;

  /// The Amazon Web Services account in which the Amazon DataZone environment is
  /// created.
  final String? awsAccountId;

  /// The Amazon Web Services region in which the Amazon DataZone environment is
  /// created.
  final String? awsAccountRegion;

  /// The timestamp of when the environment was created.
  final DateTime? createdAt;

  /// The deployment properties of this Amazon DataZone environment.
  final DeploymentProperties? deploymentProperties;

  /// The description of this Amazon DataZone environment.
  final String? description;

  /// The configurable actions of this Amazon DataZone environment.
  final List<ConfigurableEnvironmentAction>? environmentActions;

  /// The ID of the blueprint with which this Amazon DataZone environment was
  /// created.
  final String? environmentBlueprintId;

  /// The glossary terms that can be used in this Amazon DataZone environment.
  final List<String>? glossaryTerms;

  /// The ID of this Amazon DataZone environment.
  final String? id;

  /// The details of the last deployment of this Amazon DataZone environment.
  final Deployment? lastDeployment;

  /// The provisioned resources of this Amazon DataZone environment.
  final List<Resource>? provisionedResources;

  /// The provisioning properties of this Amazon DataZone environment.
  final ProvisioningProperties? provisioningProperties;

  /// The status of this Amazon DataZone environment.
  final EnvironmentStatus? status;

  /// The timestamp of when this environment was updated.
  final DateTime? updatedAt;

  /// The user parameters of this Amazon DataZone environment.
  final List<CustomParameter>? userParameters;

  CreateEnvironmentOutput({
    required this.createdBy,
    required this.domainId,
    required this.environmentProfileId,
    required this.name,
    required this.projectId,
    required this.provider,
    this.awsAccountId,
    this.awsAccountRegion,
    this.createdAt,
    this.deploymentProperties,
    this.description,
    this.environmentActions,
    this.environmentBlueprintId,
    this.glossaryTerms,
    this.id,
    this.lastDeployment,
    this.provisionedResources,
    this.provisioningProperties,
    this.status,
    this.updatedAt,
    this.userParameters,
  });

  factory CreateEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentProfileId: json['environmentProfileId'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      provider: json['provider'] as String,
      awsAccountId: json['awsAccountId'] as String?,
      awsAccountRegion: json['awsAccountRegion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deploymentProperties: json['deploymentProperties'] != null
          ? DeploymentProperties.fromJson(
              json['deploymentProperties'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      environmentActions: (json['environmentActions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConfigurableEnvironmentAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentBlueprintId: json['environmentBlueprintId'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      lastDeployment: json['lastDeployment'] != null
          ? Deployment.fromJson(json['lastDeployment'] as Map<String, dynamic>)
          : null,
      provisionedResources: (json['provisionedResources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisioningProperties: json['provisioningProperties'] != null
          ? ProvisioningProperties.fromJson(
              json['provisioningProperties'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      userParameters: (json['userParameters'] as List?)
          ?.whereNotNull()
          .map((e) => CustomParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentProfileId = this.environmentProfileId;
    final name = this.name;
    final projectId = this.projectId;
    final provider = this.provider;
    final awsAccountId = this.awsAccountId;
    final awsAccountRegion = this.awsAccountRegion;
    final createdAt = this.createdAt;
    final deploymentProperties = this.deploymentProperties;
    final description = this.description;
    final environmentActions = this.environmentActions;
    final environmentBlueprintId = this.environmentBlueprintId;
    final glossaryTerms = this.glossaryTerms;
    final id = this.id;
    final lastDeployment = this.lastDeployment;
    final provisionedResources = this.provisionedResources;
    final provisioningProperties = this.provisioningProperties;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final userParameters = this.userParameters;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentProfileId': environmentProfileId,
      'name': name,
      'projectId': projectId,
      'provider': provider,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (deploymentProperties != null)
        'deploymentProperties': deploymentProperties,
      if (description != null) 'description': description,
      if (environmentActions != null) 'environmentActions': environmentActions,
      if (environmentBlueprintId != null)
        'environmentBlueprintId': environmentBlueprintId,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (id != null) 'id': id,
      if (lastDeployment != null) 'lastDeployment': lastDeployment,
      if (provisionedResources != null)
        'provisionedResources': provisionedResources,
      if (provisioningProperties != null)
        'provisioningProperties': provisioningProperties,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (userParameters != null) 'userParameters': userParameters,
    };
  }
}

class CreateEnvironmentProfileOutput {
  /// The Amazon DataZone user who created this environment profile.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which this environment profile is
  /// created.
  final String domainId;

  /// The ID of the blueprint with which this environment profile is created.
  final String environmentBlueprintId;

  /// The ID of this Amazon DataZone environment profile.
  final String id;

  /// The name of this Amazon DataZone environment profile.
  final String name;

  /// The Amazon Web Services account ID in which this Amazon DataZone environment
  /// profile is created.
  final String? awsAccountId;

  /// The Amazon Web Services region in which this Amazon DataZone environment
  /// profile is created.
  final String? awsAccountRegion;

  /// The timestamp of when this environment profile was created.
  final DateTime? createdAt;

  /// The description of this Amazon DataZone environment profile.
  final String? description;

  /// The ID of the Amazon DataZone project in which this environment profile is
  /// created.
  final String? projectId;

  /// The timestamp of when this environment profile was updated.
  final DateTime? updatedAt;

  /// The user parameters of this Amazon DataZone environment profile.
  final List<CustomParameter>? userParameters;

  CreateEnvironmentProfileOutput({
    required this.createdBy,
    required this.domainId,
    required this.environmentBlueprintId,
    required this.id,
    required this.name,
    this.awsAccountId,
    this.awsAccountRegion,
    this.createdAt,
    this.description,
    this.projectId,
    this.updatedAt,
    this.userParameters,
  });

  factory CreateEnvironmentProfileOutput.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentProfileOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentBlueprintId: json['environmentBlueprintId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      awsAccountId: json['awsAccountId'] as String?,
      awsAccountRegion: json['awsAccountRegion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      projectId: json['projectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      userParameters: (json['userParameters'] as List?)
          ?.whereNotNull()
          .map((e) => CustomParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentBlueprintId = this.environmentBlueprintId;
    final id = this.id;
    final name = this.name;
    final awsAccountId = this.awsAccountId;
    final awsAccountRegion = this.awsAccountRegion;
    final createdAt = this.createdAt;
    final description = this.description;
    final projectId = this.projectId;
    final updatedAt = this.updatedAt;
    final userParameters = this.userParameters;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentBlueprintId': environmentBlueprintId,
      'id': id,
      'name': name,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (projectId != null) 'projectId': projectId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (userParameters != null) 'userParameters': userParameters,
    };
  }
}

class CreateFormTypeOutput {
  /// The ID of the Amazon DataZone domain in which this metadata form type is
  /// created.
  final String domainId;

  /// The name of this Amazon DataZone metadata form type.
  final String name;

  /// The revision of this Amazon DataZone metadata form type.
  final String revision;

  /// The description of this Amazon DataZone metadata form type.
  final String? description;

  /// The ID of the Amazon DataZone domain in which this metadata form type was
  /// originally created.
  final String? originDomainId;

  /// The ID of the project in which this Amazon DataZone metadata form type was
  /// originally created.
  final String? originProjectId;

  /// The ID of the project that owns this Amazon DataZone metadata form type.
  final String? owningProjectId;

  CreateFormTypeOutput({
    required this.domainId,
    required this.name,
    required this.revision,
    this.description,
    this.originDomainId,
    this.originProjectId,
    this.owningProjectId,
  });

  factory CreateFormTypeOutput.fromJson(Map<String, dynamic> json) {
    return CreateFormTypeOutput(
      domainId: json['domainId'] as String,
      name: json['name'] as String,
      revision: json['revision'] as String,
      description: json['description'] as String?,
      originDomainId: json['originDomainId'] as String?,
      originProjectId: json['originProjectId'] as String?,
      owningProjectId: json['owningProjectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final name = this.name;
    final revision = this.revision;
    final description = this.description;
    final originDomainId = this.originDomainId;
    final originProjectId = this.originProjectId;
    final owningProjectId = this.owningProjectId;
    return {
      'domainId': domainId,
      'name': name,
      'revision': revision,
      if (description != null) 'description': description,
      if (originDomainId != null) 'originDomainId': originDomainId,
      if (originProjectId != null) 'originProjectId': originProjectId,
      if (owningProjectId != null) 'owningProjectId': owningProjectId,
    };
  }
}

class CreateGlossaryOutput {
  /// The ID of the Amazon DataZone domain in which this business glossary is
  /// created.
  final String domainId;

  /// The ID of this business glossary.
  final String id;

  /// The name of this business glossary.
  final String name;

  /// The ID of the project that currently owns this business glossary.
  final String owningProjectId;

  /// The description of this business glossary.
  final String? description;

  /// The status of this business glossary.
  final GlossaryStatus? status;

  CreateGlossaryOutput({
    required this.domainId,
    required this.id,
    required this.name,
    required this.owningProjectId,
    this.description,
    this.status,
  });

  factory CreateGlossaryOutput.fromJson(Map<String, dynamic> json) {
    return CreateGlossaryOutput(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      description: json['description'] as String?,
      status: (json['status'] as String?)?.toGlossaryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final description = this.description;
    final status = this.status;
    return {
      'domainId': domainId,
      'id': id,
      'name': name,
      'owningProjectId': owningProjectId,
      if (description != null) 'description': description,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateGlossaryTermOutput {
  /// The ID of the Amazon DataZone domain in which this business glossary term is
  /// created.
  final String domainId;

  /// The ID of the business glossary in which this term is created.
  final String glossaryId;

  /// The ID of this business glossary term.
  final String id;

  /// The name of this business glossary term.
  final String name;

  /// The status of this business glossary term.
  final GlossaryTermStatus status;

  /// The long description of this business glossary term.
  final String? longDescription;

  /// The short description of this business glossary term.
  final String? shortDescription;

  /// The term relations of this business glossary term.
  final TermRelations? termRelations;

  CreateGlossaryTermOutput({
    required this.domainId,
    required this.glossaryId,
    required this.id,
    required this.name,
    required this.status,
    this.longDescription,
    this.shortDescription,
    this.termRelations,
  });

  factory CreateGlossaryTermOutput.fromJson(Map<String, dynamic> json) {
    return CreateGlossaryTermOutput(
      domainId: json['domainId'] as String,
      glossaryId: json['glossaryId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toGlossaryTermStatus(),
      longDescription: json['longDescription'] as String?,
      shortDescription: json['shortDescription'] as String?,
      termRelations: json['termRelations'] != null
          ? TermRelations.fromJson(
              json['termRelations'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final glossaryId = this.glossaryId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final longDescription = this.longDescription;
    final shortDescription = this.shortDescription;
    final termRelations = this.termRelations;
    return {
      'domainId': domainId,
      'glossaryId': glossaryId,
      'id': id,
      'name': name,
      'status': status.toValue(),
      if (longDescription != null) 'longDescription': longDescription,
      if (shortDescription != null) 'shortDescription': shortDescription,
      if (termRelations != null) 'termRelations': termRelations,
    };
  }
}

class CreateGroupProfileOutput {
  /// The identifier of the Amazon DataZone domain in which the group profile is
  /// created.
  final String? domainId;

  /// The name of the group for which group profile is created.
  final String? groupName;

  /// The identifier of the group profile.
  final String? id;

  /// The status of the group profile.
  final GroupProfileStatus? status;

  CreateGroupProfileOutput({
    this.domainId,
    this.groupName,
    this.id,
    this.status,
  });

  factory CreateGroupProfileOutput.fromJson(Map<String, dynamic> json) {
    return CreateGroupProfileOutput(
      domainId: json['domainId'] as String?,
      groupName: json['groupName'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toGroupProfileStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final groupName = this.groupName;
    final id = this.id;
    final status = this.status;
    return {
      if (domainId != null) 'domainId': domainId,
      if (groupName != null) 'groupName': groupName,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateListingChangeSetOutput {
  /// The ID of the listing (a record of an asset at a given time).
  final String listingId;

  /// The revision of a listing.
  final String listingRevision;

  /// Specifies the status of the listing.
  final ListingStatus status;

  CreateListingChangeSetOutput({
    required this.listingId,
    required this.listingRevision,
    required this.status,
  });

  factory CreateListingChangeSetOutput.fromJson(Map<String, dynamic> json) {
    return CreateListingChangeSetOutput(
      listingId: json['listingId'] as String,
      listingRevision: json['listingRevision'] as String,
      status: (json['status'] as String).toListingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final listingId = this.listingId;
    final listingRevision = this.listingRevision;
    final status = this.status;
    return {
      'listingId': listingId,
      'listingRevision': listingRevision,
      'status': status.toValue(),
    };
  }
}

class CreateProjectMembershipOutput {
  CreateProjectMembershipOutput();

  factory CreateProjectMembershipOutput.fromJson(Map<String, dynamic> _) {
    return CreateProjectMembershipOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateProjectOutput {
  /// The Amazon DataZone user who created the project.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which the project was
  /// created.
  final String domainId;

  /// The ID of the Amazon DataZone project.
  final String id;

  /// The name of the project.
  final String name;

  /// The timestamp of when the project was created.
  final DateTime? createdAt;

  /// The description of the project.
  final String? description;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final List<ProjectDeletionError>? failureReasons;

  /// The glossary terms that can be used in the project.
  final List<String>? glossaryTerms;

  /// The timestamp of when the project was last updated.
  final DateTime? lastUpdatedAt;

  /// The status of the Amazon DataZone project that was created.
  final ProjectStatus? projectStatus;

  CreateProjectOutput({
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.name,
    this.createdAt,
    this.description,
    this.failureReasons,
    this.glossaryTerms,
    this.lastUpdatedAt,
    this.projectStatus,
  });

  factory CreateProjectOutput.fromJson(Map<String, dynamic> json) {
    return CreateProjectOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectDeletionError.fromJson(e as Map<String, dynamic>))
          .toList(),
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      projectStatus: (json['projectStatus'] as String?)?.toProjectStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final createdAt = this.createdAt;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final glossaryTerms = this.glossaryTerms;
    final lastUpdatedAt = this.lastUpdatedAt;
    final projectStatus = this.projectStatus;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'name': name,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (projectStatus != null) 'projectStatus': projectStatus.toValue(),
    };
  }
}

class CreateSubscriptionGrantOutput {
  /// A timestamp of when the subscription grant is created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription grant.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which the subscription grant is
  /// created.
  final String domainId;

  /// The entity to which the subscription is granted.
  final GrantedEntity grantedEntity;

  /// The ID of the subscription grant.
  final String id;

  /// The status of the subscription grant.
  final SubscriptionGrantOverallStatus status;

  /// The ID of the subscription target for which the subscription grant is
  /// created.
  final String subscriptionTargetId;

  /// A timestamp of when the subscription grant was updated.
  final DateTime updatedAt;

  /// The assets for which the subscription grant is created.
  final List<SubscribedAsset>? assets;

  /// The identifier of the subscription grant.
  final String? subscriptionId;

  /// The Amazon DataZone user who updated the subscription grant.
  final String? updatedBy;

  CreateSubscriptionGrantOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.grantedEntity,
    required this.id,
    required this.status,
    required this.subscriptionTargetId,
    required this.updatedAt,
    this.assets,
    this.subscriptionId,
    this.updatedBy,
  });

  factory CreateSubscriptionGrantOutput.fromJson(Map<String, dynamic> json) {
    return CreateSubscriptionGrantOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      grantedEntity:
          GrantedEntity.fromJson(json['grantedEntity'] as Map<String, dynamic>),
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionGrantOverallStatus(),
      subscriptionTargetId: json['subscriptionTargetId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      assets: (json['assets'] as List?)
          ?.whereNotNull()
          .map((e) => SubscribedAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionId: json['subscriptionId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final grantedEntity = this.grantedEntity;
    final id = this.id;
    final status = this.status;
    final subscriptionTargetId = this.subscriptionTargetId;
    final updatedAt = this.updatedAt;
    final assets = this.assets;
    final subscriptionId = this.subscriptionId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'grantedEntity': grantedEntity,
      'id': id,
      'status': status.toValue(),
      'subscriptionTargetId': subscriptionTargetId,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (assets != null) 'assets': assets,
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class CreateSubscriptionRequestOutput {
  /// A timestamp of when the subscription request is created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription request.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in whcih the subscription request is
  /// created.
  final String domainId;

  /// The ID of the subscription request.
  final String id;

  /// The reason for the subscription request.
  final String requestReason;

  /// The status of the subscription request.
  final SubscriptionRequestStatus status;

  /// The published asset for which the subscription grant is to be created.
  final List<SubscribedListing> subscribedListings;

  /// The subscribed principals of the subscription request.
  final List<SubscribedPrincipal> subscribedPrincipals;

  /// The timestamp of when the subscription request was updated.
  final DateTime updatedAt;

  /// The decision comment of the subscription request.
  final String? decisionComment;

  /// The ID of the reviewer of the subscription request.
  final String? reviewerId;

  /// The Amazon DataZone user who updated the subscription request.
  final String? updatedBy;

  CreateSubscriptionRequestOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.requestReason,
    required this.status,
    required this.subscribedListings,
    required this.subscribedPrincipals,
    required this.updatedAt,
    this.decisionComment,
    this.reviewerId,
    this.updatedBy,
  });

  factory CreateSubscriptionRequestOutput.fromJson(Map<String, dynamic> json) {
    return CreateSubscriptionRequestOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      requestReason: json['requestReason'] as String,
      status: (json['status'] as String).toSubscriptionRequestStatus(),
      subscribedListings: (json['subscribedListings'] as List)
          .whereNotNull()
          .map((e) => SubscribedListing.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscribedPrincipals: (json['subscribedPrincipals'] as List)
          .whereNotNull()
          .map((e) => SubscribedPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      decisionComment: json['decisionComment'] as String?,
      reviewerId: json['reviewerId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final requestReason = this.requestReason;
    final status = this.status;
    final subscribedListings = this.subscribedListings;
    final subscribedPrincipals = this.subscribedPrincipals;
    final updatedAt = this.updatedAt;
    final decisionComment = this.decisionComment;
    final reviewerId = this.reviewerId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'requestReason': requestReason,
      'status': status.toValue(),
      'subscribedListings': subscribedListings,
      'subscribedPrincipals': subscribedPrincipals,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (decisionComment != null) 'decisionComment': decisionComment,
      if (reviewerId != null) 'reviewerId': reviewerId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class CreateSubscriptionTargetOutput {
  /// The asset types that can be included in the subscription target.
  final List<String> applicableAssetTypes;

  /// The authorised principals of the subscription target.
  final List<String> authorizedPrincipals;

  /// The timestamp of when the subscription target was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription target.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which the subscription target was
  /// created.
  final String domainId;

  /// The ID of the environment in which the subscription target was created.
  final String environmentId;

  /// The ID of the subscription target.
  final String id;

  /// The manage access role with which the subscription target was created.
  final String manageAccessRole;

  /// The name of the subscription target.
  final String name;

  /// ???
  final String projectId;

  /// The provider of the subscription target.
  final String provider;

  /// The configuration of the subscription target.
  final List<SubscriptionTargetForm> subscriptionTargetConfig;

  /// The type of the subscription target.
  final String type;

  /// The timestamp of when the subscription target was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the subscription target.
  final String? updatedBy;

  CreateSubscriptionTargetOutput({
    required this.applicableAssetTypes,
    required this.authorizedPrincipals,
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.environmentId,
    required this.id,
    required this.manageAccessRole,
    required this.name,
    required this.projectId,
    required this.provider,
    required this.subscriptionTargetConfig,
    required this.type,
    this.updatedAt,
    this.updatedBy,
  });

  factory CreateSubscriptionTargetOutput.fromJson(Map<String, dynamic> json) {
    return CreateSubscriptionTargetOutput(
      applicableAssetTypes: (json['applicableAssetTypes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      authorizedPrincipals: (json['authorizedPrincipals'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      id: json['id'] as String,
      manageAccessRole: json['manageAccessRole'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      provider: json['provider'] as String,
      subscriptionTargetConfig: (json['subscriptionTargetConfig'] as List)
          .whereNotNull()
          .map(
              (e) => SubscriptionTargetForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicableAssetTypes = this.applicableAssetTypes;
    final authorizedPrincipals = this.authorizedPrincipals;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final id = this.id;
    final manageAccessRole = this.manageAccessRole;
    final name = this.name;
    final projectId = this.projectId;
    final provider = this.provider;
    final subscriptionTargetConfig = this.subscriptionTargetConfig;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'applicableAssetTypes': applicableAssetTypes,
      'authorizedPrincipals': authorizedPrincipals,
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentId': environmentId,
      'id': id,
      'manageAccessRole': manageAccessRole,
      'name': name,
      'projectId': projectId,
      'provider': provider,
      'subscriptionTargetConfig': subscriptionTargetConfig,
      'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class CreateUserProfileOutput {
  final UserProfileDetails? details;

  /// The identifier of the Amazon DataZone domain in which a user profile is
  /// created.
  final String? domainId;

  /// The identifier of the user profile.
  final String? id;

  /// The status of the user profile.
  final UserProfileStatus? status;

  /// The type of the user profile.
  final UserProfileType? type;

  CreateUserProfileOutput({
    this.details,
    this.domainId,
    this.id,
    this.status,
    this.type,
  });

  factory CreateUserProfileOutput.fromJson(Map<String, dynamic> json) {
    return CreateUserProfileOutput(
      details: json['details'] != null
          ? UserProfileDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
      domainId: json['domainId'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toUserProfileStatus(),
      type: (json['type'] as String?)?.toUserProfileType(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final domainId = this.domainId;
    final id = this.id;
    final status = this.status;
    final type = this.type;
    return {
      if (details != null) 'details': details,
      if (domainId != null) 'domainId': domainId,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// The details of user parameters of an environment blueprint.
class CustomParameter {
  /// The filed type of the parameter.
  final String fieldType;

  /// The key name of the parameter.
  final String keyName;

  /// The default value of the parameter.
  final String? defaultValue;

  /// The description of the parameter.
  final String? description;

  /// Specifies whether the parameter is editable.
  final bool? isEditable;

  /// Specifies whether the custom parameter is optional.
  final bool? isOptional;

  CustomParameter({
    required this.fieldType,
    required this.keyName,
    this.defaultValue,
    this.description,
    this.isEditable,
    this.isOptional,
  });

  factory CustomParameter.fromJson(Map<String, dynamic> json) {
    return CustomParameter(
      fieldType: json['fieldType'] as String,
      keyName: json['keyName'] as String,
      defaultValue: json['defaultValue'] as String?,
      description: json['description'] as String?,
      isEditable: json['isEditable'] as bool?,
      isOptional: json['isOptional'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldType = this.fieldType;
    final keyName = this.keyName;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final isEditable = this.isEditable;
    final isOptional = this.isOptional;
    return {
      'fieldType': fieldType,
      'keyName': keyName,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
      if (isEditable != null) 'isEditable': isEditable,
      if (isOptional != null) 'isOptional': isOptional,
    };
  }
}

enum DataAssetActivityStatus {
  failed,
  publishingFailed,
  succeededCreated,
  succeededUpdated,
  skippedAlreadyImported,
  skippedArchived,
  skippedNoAccess,
  unchanged,
}

extension DataAssetActivityStatusValueExtension on DataAssetActivityStatus {
  String toValue() {
    switch (this) {
      case DataAssetActivityStatus.failed:
        return 'FAILED';
      case DataAssetActivityStatus.publishingFailed:
        return 'PUBLISHING_FAILED';
      case DataAssetActivityStatus.succeededCreated:
        return 'SUCCEEDED_CREATED';
      case DataAssetActivityStatus.succeededUpdated:
        return 'SUCCEEDED_UPDATED';
      case DataAssetActivityStatus.skippedAlreadyImported:
        return 'SKIPPED_ALREADY_IMPORTED';
      case DataAssetActivityStatus.skippedArchived:
        return 'SKIPPED_ARCHIVED';
      case DataAssetActivityStatus.skippedNoAccess:
        return 'SKIPPED_NO_ACCESS';
      case DataAssetActivityStatus.unchanged:
        return 'UNCHANGED';
    }
  }
}

extension DataAssetActivityStatusFromString on String {
  DataAssetActivityStatus toDataAssetActivityStatus() {
    switch (this) {
      case 'FAILED':
        return DataAssetActivityStatus.failed;
      case 'PUBLISHING_FAILED':
        return DataAssetActivityStatus.publishingFailed;
      case 'SUCCEEDED_CREATED':
        return DataAssetActivityStatus.succeededCreated;
      case 'SUCCEEDED_UPDATED':
        return DataAssetActivityStatus.succeededUpdated;
      case 'SKIPPED_ALREADY_IMPORTED':
        return DataAssetActivityStatus.skippedAlreadyImported;
      case 'SKIPPED_ARCHIVED':
        return DataAssetActivityStatus.skippedArchived;
      case 'SKIPPED_NO_ACCESS':
        return DataAssetActivityStatus.skippedNoAccess;
      case 'UNCHANGED':
        return DataAssetActivityStatus.unchanged;
    }
    throw Exception('$this is not known in enum DataAssetActivityStatus');
  }
}

/// <p/>
class DataProductItem {
  /// <p/>
  final String? domainId;

  /// <p/>
  final String? itemId;

  DataProductItem({
    this.domainId,
    this.itemId,
  });

  factory DataProductItem.fromJson(Map<String, dynamic> json) {
    return DataProductItem(
      domainId: json['domainId'] as String?,
      itemId: json['itemId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final itemId = this.itemId;
    return {
      if (domainId != null) 'domainId': domainId,
      if (itemId != null) 'itemId': itemId,
    };
  }
}

/// <p/>
class DataProductSummary {
  /// <p/>
  final String domainId;

  /// <p/>
  final String id;

  /// <p/>
  final String name;

  /// <p/>
  final String owningProjectId;

  /// <p/>
  final DateTime? createdAt;

  /// <p/>
  final String? createdBy;

  /// <p/>
  final List<DataProductItem>? dataProductItems;

  /// <p/>
  final String? description;

  /// <p/>
  final List<String>? glossaryTerms;

  /// <p/>
  final DateTime? updatedAt;

  /// <p/>
  final String? updatedBy;

  DataProductSummary({
    required this.domainId,
    required this.id,
    required this.name,
    required this.owningProjectId,
    this.createdAt,
    this.createdBy,
    this.dataProductItems,
    this.description,
    this.glossaryTerms,
    this.updatedAt,
    this.updatedBy,
  });

  factory DataProductSummary.fromJson(Map<String, dynamic> json) {
    return DataProductSummary(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      dataProductItems: (json['dataProductItems'] as List?)
          ?.whereNotNull()
          .map((e) => DataProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final dataProductItems = this.dataProductItems;
    final description = this.description;
    final glossaryTerms = this.glossaryTerms;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'id': id,
      'name': name,
      'owningProjectId': owningProjectId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (dataProductItems != null) 'dataProductItems': dataProductItems,
      if (description != null) 'description': description,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The configuration of the data source.
class DataSourceConfigurationInput {
  /// The configuration of the Amazon Web Services Glue data source.
  final GlueRunConfigurationInput? glueRunConfiguration;

  /// The configuration of the Amazon Redshift data source.
  final RedshiftRunConfigurationInput? redshiftRunConfiguration;

  DataSourceConfigurationInput({
    this.glueRunConfiguration,
    this.redshiftRunConfiguration,
  });

  Map<String, dynamic> toJson() {
    final glueRunConfiguration = this.glueRunConfiguration;
    final redshiftRunConfiguration = this.redshiftRunConfiguration;
    return {
      if (glueRunConfiguration != null)
        'glueRunConfiguration': glueRunConfiguration,
      if (redshiftRunConfiguration != null)
        'redshiftRunConfiguration': redshiftRunConfiguration,
    };
  }
}

/// The configuration of the data source.
class DataSourceConfigurationOutput {
  /// The configuration of the Amazon Web Services Glue data source.
  final GlueRunConfigurationOutput? glueRunConfiguration;

  /// The configuration of the Amazon Redshift data source.
  final RedshiftRunConfigurationOutput? redshiftRunConfiguration;

  DataSourceConfigurationOutput({
    this.glueRunConfiguration,
    this.redshiftRunConfiguration,
  });

  factory DataSourceConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return DataSourceConfigurationOutput(
      glueRunConfiguration: json['glueRunConfiguration'] != null
          ? GlueRunConfigurationOutput.fromJson(
              json['glueRunConfiguration'] as Map<String, dynamic>)
          : null,
      redshiftRunConfiguration: json['redshiftRunConfiguration'] != null
          ? RedshiftRunConfigurationOutput.fromJson(
              json['redshiftRunConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final glueRunConfiguration = this.glueRunConfiguration;
    final redshiftRunConfiguration = this.redshiftRunConfiguration;
    return {
      if (glueRunConfiguration != null)
        'glueRunConfiguration': glueRunConfiguration,
      if (redshiftRunConfiguration != null)
        'redshiftRunConfiguration': redshiftRunConfiguration,
    };
  }
}

/// The details of the error message that is returned if the operation cannot be
/// successfully completed.
class DataSourceErrorMessage {
  /// The type of the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorType errorType;

  /// The details of the error message that is returned if the operation cannot be
  /// successfully completed.
  final String? errorDetail;

  DataSourceErrorMessage({
    required this.errorType,
    this.errorDetail,
  });

  factory DataSourceErrorMessage.fromJson(Map<String, dynamic> json) {
    return DataSourceErrorMessage(
      errorType: (json['errorType'] as String).toDataSourceErrorType(),
      errorDetail: json['errorDetail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorType = this.errorType;
    final errorDetail = this.errorDetail;
    return {
      'errorType': errorType.toValue(),
      if (errorDetail != null) 'errorDetail': errorDetail,
    };
  }
}

enum DataSourceErrorType {
  accessDeniedException,
  conflictException,
  internalServerException,
  resourceNotFoundException,
  serviceQuotaExceededException,
  throttlingException,
  validationException,
}

extension DataSourceErrorTypeValueExtension on DataSourceErrorType {
  String toValue() {
    switch (this) {
      case DataSourceErrorType.accessDeniedException:
        return 'ACCESS_DENIED_EXCEPTION';
      case DataSourceErrorType.conflictException:
        return 'CONFLICT_EXCEPTION';
      case DataSourceErrorType.internalServerException:
        return 'INTERNAL_SERVER_EXCEPTION';
      case DataSourceErrorType.resourceNotFoundException:
        return 'RESOURCE_NOT_FOUND_EXCEPTION';
      case DataSourceErrorType.serviceQuotaExceededException:
        return 'SERVICE_QUOTA_EXCEEDED_EXCEPTION';
      case DataSourceErrorType.throttlingException:
        return 'THROTTLING_EXCEPTION';
      case DataSourceErrorType.validationException:
        return 'VALIDATION_EXCEPTION';
    }
  }
}

extension DataSourceErrorTypeFromString on String {
  DataSourceErrorType toDataSourceErrorType() {
    switch (this) {
      case 'ACCESS_DENIED_EXCEPTION':
        return DataSourceErrorType.accessDeniedException;
      case 'CONFLICT_EXCEPTION':
        return DataSourceErrorType.conflictException;
      case 'INTERNAL_SERVER_EXCEPTION':
        return DataSourceErrorType.internalServerException;
      case 'RESOURCE_NOT_FOUND_EXCEPTION':
        return DataSourceErrorType.resourceNotFoundException;
      case 'SERVICE_QUOTA_EXCEEDED_EXCEPTION':
        return DataSourceErrorType.serviceQuotaExceededException;
      case 'THROTTLING_EXCEPTION':
        return DataSourceErrorType.throttlingException;
      case 'VALIDATION_EXCEPTION':
        return DataSourceErrorType.validationException;
    }
    throw Exception('$this is not known in enum DataSourceErrorType');
  }
}

/// The activity details of the data source run.
class DataSourceRunActivity {
  /// The timestamp of when data source run activity was created.
  final DateTime createdAt;

  /// The status of the asset included in the data source run activity.
  final DataAssetActivityStatus dataAssetStatus;

  /// The identifier of the data source for the data source run activity.
  final String dataSourceRunId;

  /// The database included in the data source run activity.
  final String database;

  /// The project ID included in the data source run activity.
  final String projectId;

  /// The technical name included in the data source run activity.
  final String technicalName;

  /// The timestamp of when data source run activity was updated.
  final DateTime updatedAt;

  /// The identifier of the asset included in the data source run activity.
  final String? dataAssetId;
  final DataSourceErrorMessage? errorMessage;

  /// The technical description included in the data source run activity.
  final String? technicalDescription;

  DataSourceRunActivity({
    required this.createdAt,
    required this.dataAssetStatus,
    required this.dataSourceRunId,
    required this.database,
    required this.projectId,
    required this.technicalName,
    required this.updatedAt,
    this.dataAssetId,
    this.errorMessage,
    this.technicalDescription,
  });

  factory DataSourceRunActivity.fromJson(Map<String, dynamic> json) {
    return DataSourceRunActivity(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      dataAssetStatus:
          (json['dataAssetStatus'] as String).toDataAssetActivityStatus(),
      dataSourceRunId: json['dataSourceRunId'] as String,
      database: json['database'] as String,
      projectId: json['projectId'] as String,
      technicalName: json['technicalName'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      dataAssetId: json['dataAssetId'] as String?,
      errorMessage: json['errorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['errorMessage'] as Map<String, dynamic>)
          : null,
      technicalDescription: json['technicalDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataAssetStatus = this.dataAssetStatus;
    final dataSourceRunId = this.dataSourceRunId;
    final database = this.database;
    final projectId = this.projectId;
    final technicalName = this.technicalName;
    final updatedAt = this.updatedAt;
    final dataAssetId = this.dataAssetId;
    final errorMessage = this.errorMessage;
    final technicalDescription = this.technicalDescription;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'dataAssetStatus': dataAssetStatus.toValue(),
      'dataSourceRunId': dataSourceRunId,
      'database': database,
      'projectId': projectId,
      'technicalName': technicalName,
      'updatedAt': iso8601ToJson(updatedAt),
      if (dataAssetId != null) 'dataAssetId': dataAssetId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (technicalDescription != null)
        'technicalDescription': technicalDescription,
    };
  }
}

enum DataSourceRunStatus {
  requested,
  running,
  failed,
  partiallySucceeded,
  success,
}

extension DataSourceRunStatusValueExtension on DataSourceRunStatus {
  String toValue() {
    switch (this) {
      case DataSourceRunStatus.requested:
        return 'REQUESTED';
      case DataSourceRunStatus.running:
        return 'RUNNING';
      case DataSourceRunStatus.failed:
        return 'FAILED';
      case DataSourceRunStatus.partiallySucceeded:
        return 'PARTIALLY_SUCCEEDED';
      case DataSourceRunStatus.success:
        return 'SUCCESS';
    }
  }
}

extension DataSourceRunStatusFromString on String {
  DataSourceRunStatus toDataSourceRunStatus() {
    switch (this) {
      case 'REQUESTED':
        return DataSourceRunStatus.requested;
      case 'RUNNING':
        return DataSourceRunStatus.running;
      case 'FAILED':
        return DataSourceRunStatus.failed;
      case 'PARTIALLY_SUCCEEDED':
        return DataSourceRunStatus.partiallySucceeded;
      case 'SUCCESS':
        return DataSourceRunStatus.success;
    }
    throw Exception('$this is not known in enum DataSourceRunStatus');
  }
}

/// The details of a data source run.
class DataSourceRunSummary {
  /// The timestamp of when a data source run was created.
  final DateTime createdAt;

  /// The identifier of the data source of the data source run.
  final String dataSourceId;

  /// The identifier of the data source run.
  final String id;

  /// The project ID of the data source run.
  final String projectId;

  /// The status of the data source run.
  final DataSourceRunStatus status;

  /// The type of the data source run.
  final DataSourceRunType type;

  /// The timestamp of when a data source run was updated.
  final DateTime updatedAt;
  final DataSourceErrorMessage? errorMessage;
  final RunStatisticsForAssets? runStatisticsForAssets;

  /// The timestamp of when a data source run was started.
  final DateTime? startedAt;

  /// The timestamp of when a data source run was stopped.
  final DateTime? stoppedAt;

  DataSourceRunSummary({
    required this.createdAt,
    required this.dataSourceId,
    required this.id,
    required this.projectId,
    required this.status,
    required this.type,
    required this.updatedAt,
    this.errorMessage,
    this.runStatisticsForAssets,
    this.startedAt,
    this.stoppedAt,
  });

  factory DataSourceRunSummary.fromJson(Map<String, dynamic> json) {
    return DataSourceRunSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      dataSourceId: json['dataSourceId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      status: (json['status'] as String).toDataSourceRunStatus(),
      type: (json['type'] as String).toDataSourceRunType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      errorMessage: json['errorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['errorMessage'] as Map<String, dynamic>)
          : null,
      runStatisticsForAssets: json['runStatisticsForAssets'] != null
          ? RunStatisticsForAssets.fromJson(
              json['runStatisticsForAssets'] as Map<String, dynamic>)
          : null,
      startedAt: timeStampFromJson(json['startedAt']),
      stoppedAt: timeStampFromJson(json['stoppedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataSourceId = this.dataSourceId;
    final id = this.id;
    final projectId = this.projectId;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final errorMessage = this.errorMessage;
    final runStatisticsForAssets = this.runStatisticsForAssets;
    final startedAt = this.startedAt;
    final stoppedAt = this.stoppedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'dataSourceId': dataSourceId,
      'id': id,
      'projectId': projectId,
      'status': status.toValue(),
      'type': type.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (runStatisticsForAssets != null)
        'runStatisticsForAssets': runStatisticsForAssets,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stoppedAt != null) 'stoppedAt': iso8601ToJson(stoppedAt),
    };
  }
}

enum DataSourceRunType {
  prioritized,
  scheduled,
}

extension DataSourceRunTypeValueExtension on DataSourceRunType {
  String toValue() {
    switch (this) {
      case DataSourceRunType.prioritized:
        return 'PRIORITIZED';
      case DataSourceRunType.scheduled:
        return 'SCHEDULED';
    }
  }
}

extension DataSourceRunTypeFromString on String {
  DataSourceRunType toDataSourceRunType() {
    switch (this) {
      case 'PRIORITIZED':
        return DataSourceRunType.prioritized;
      case 'SCHEDULED':
        return DataSourceRunType.scheduled;
    }
    throw Exception('$this is not known in enum DataSourceRunType');
  }
}

enum DataSourceStatus {
  creating,
  failedCreation,
  ready,
  updating,
  failedUpdate,
  running,
  deleting,
  failedDeletion,
}

extension DataSourceStatusValueExtension on DataSourceStatus {
  String toValue() {
    switch (this) {
      case DataSourceStatus.creating:
        return 'CREATING';
      case DataSourceStatus.failedCreation:
        return 'FAILED_CREATION';
      case DataSourceStatus.ready:
        return 'READY';
      case DataSourceStatus.updating:
        return 'UPDATING';
      case DataSourceStatus.failedUpdate:
        return 'FAILED_UPDATE';
      case DataSourceStatus.running:
        return 'RUNNING';
      case DataSourceStatus.deleting:
        return 'DELETING';
      case DataSourceStatus.failedDeletion:
        return 'FAILED_DELETION';
    }
  }
}

extension DataSourceStatusFromString on String {
  DataSourceStatus toDataSourceStatus() {
    switch (this) {
      case 'CREATING':
        return DataSourceStatus.creating;
      case 'FAILED_CREATION':
        return DataSourceStatus.failedCreation;
      case 'READY':
        return DataSourceStatus.ready;
      case 'UPDATING':
        return DataSourceStatus.updating;
      case 'FAILED_UPDATE':
        return DataSourceStatus.failedUpdate;
      case 'RUNNING':
        return DataSourceStatus.running;
      case 'DELETING':
        return DataSourceStatus.deleting;
      case 'FAILED_DELETION':
        return DataSourceStatus.failedDeletion;
    }
    throw Exception('$this is not known in enum DataSourceStatus');
  }
}

/// The details of the data source.
class DataSourceSummary {
  /// The ID of the data source.
  final String dataSourceId;

  /// The ID of the Amazon DataZone domain in which the data source exists.
  final String domainId;

  /// The ID of the environment in which the data source exists.
  final String environmentId;

  /// The name of the data source.
  final String name;

  /// The status of the data source.
  final DataSourceStatus status;

  /// The type of the data source.
  final String type;

  /// The timestamp of when the data source was created.
  final DateTime? createdAt;

  /// Specifies whether the data source is enabled.
  final EnableSetting? enableSetting;

  /// The count of the assets created during the last data source run.
  final int? lastRunAssetCount;

  /// The timestamp of when the data source run was last performed.
  final DateTime? lastRunAt;
  final DataSourceErrorMessage? lastRunErrorMessage;

  /// The status of the last data source run.
  final DataSourceRunStatus? lastRunStatus;
  final ScheduleConfiguration? schedule;

  /// The timestamp of when the data source was updated.
  final DateTime? updatedAt;

  DataSourceSummary({
    required this.dataSourceId,
    required this.domainId,
    required this.environmentId,
    required this.name,
    required this.status,
    required this.type,
    this.createdAt,
    this.enableSetting,
    this.lastRunAssetCount,
    this.lastRunAt,
    this.lastRunErrorMessage,
    this.lastRunStatus,
    this.schedule,
    this.updatedAt,
  });

  factory DataSourceSummary.fromJson(Map<String, dynamic> json) {
    return DataSourceSummary(
      dataSourceId: json['dataSourceId'] as String,
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toDataSourceStatus(),
      type: json['type'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      enableSetting: (json['enableSetting'] as String?)?.toEnableSetting(),
      lastRunAssetCount: json['lastRunAssetCount'] as int?,
      lastRunAt: timeStampFromJson(json['lastRunAt']),
      lastRunErrorMessage: json['lastRunErrorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['lastRunErrorMessage'] as Map<String, dynamic>)
          : null,
      lastRunStatus:
          (json['lastRunStatus'] as String?)?.toDataSourceRunStatus(),
      schedule: json['schedule'] != null
          ? ScheduleConfiguration.fromJson(
              json['schedule'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final createdAt = this.createdAt;
    final enableSetting = this.enableSetting;
    final lastRunAssetCount = this.lastRunAssetCount;
    final lastRunAt = this.lastRunAt;
    final lastRunErrorMessage = this.lastRunErrorMessage;
    final lastRunStatus = this.lastRunStatus;
    final schedule = this.schedule;
    final updatedAt = this.updatedAt;
    return {
      'dataSourceId': dataSourceId,
      'domainId': domainId,
      'environmentId': environmentId,
      'name': name,
      'status': status.toValue(),
      'type': type,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (enableSetting != null) 'enableSetting': enableSetting.toValue(),
      if (lastRunAssetCount != null) 'lastRunAssetCount': lastRunAssetCount,
      if (lastRunAt != null) 'lastRunAt': iso8601ToJson(lastRunAt),
      if (lastRunErrorMessage != null)
        'lastRunErrorMessage': lastRunErrorMessage,
      if (lastRunStatus != null) 'lastRunStatus': lastRunStatus.toValue(),
      if (schedule != null) 'schedule': schedule,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class DeleteAssetOutput {
  DeleteAssetOutput();

  factory DeleteAssetOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAssetOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAssetTypeOutput {
  DeleteAssetTypeOutput();

  factory DeleteAssetTypeOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAssetTypeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDataSourceOutput {
  /// The ID of the Amazon DataZone domain in which the data source is deleted.
  final String domainId;

  /// The ID of the environemnt associated with this data source.
  final String environmentId;

  /// The ID of the data source that is deleted.
  final String id;

  /// The name of the data source that is deleted.
  final String name;

  /// The ID of the project in which this data source exists and from which it's
  /// deleted.
  final String projectId;

  /// The asset data forms associated with this data source.
  final List<FormOutput>? assetFormsOutput;

  /// The configuration of the data source that is deleted.
  final DataSourceConfigurationOutput? configuration;

  /// The timestamp of when this data source was created.
  final DateTime? createdAt;

  /// The description of the data source that is deleted.
  final String? description;

  /// The enable setting of the data source that specifies whether the data source
  /// is enabled or disabled.
  final EnableSetting? enableSetting;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? errorMessage;

  /// The timestamp of when the data source was last run.
  final DateTime? lastRunAt;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? lastRunErrorMessage;

  /// The status of the last run of this data source.
  final DataSourceRunStatus? lastRunStatus;

  /// Specifies whether the assets that this data source creates in the inventory
  /// are to be also automatically published to the catalog.
  final bool? publishOnImport;

  /// The schedule of runs for this data source.
  final ScheduleConfiguration? schedule;

  /// The status of this data source.
  final DataSourceStatus? status;

  /// The type of this data source.
  final String? type;

  /// The timestamp of when this data source was updated.
  final DateTime? updatedAt;

  DeleteDataSourceOutput({
    required this.domainId,
    required this.environmentId,
    required this.id,
    required this.name,
    required this.projectId,
    this.assetFormsOutput,
    this.configuration,
    this.createdAt,
    this.description,
    this.enableSetting,
    this.errorMessage,
    this.lastRunAt,
    this.lastRunErrorMessage,
    this.lastRunStatus,
    this.publishOnImport,
    this.schedule,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory DeleteDataSourceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDataSourceOutput(
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      assetFormsOutput: (json['assetFormsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      configuration: json['configuration'] != null
          ? DataSourceConfigurationOutput.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      enableSetting: (json['enableSetting'] as String?)?.toEnableSetting(),
      errorMessage: json['errorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['errorMessage'] as Map<String, dynamic>)
          : null,
      lastRunAt: timeStampFromJson(json['lastRunAt']),
      lastRunErrorMessage: json['lastRunErrorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['lastRunErrorMessage'] as Map<String, dynamic>)
          : null,
      lastRunStatus:
          (json['lastRunStatus'] as String?)?.toDataSourceRunStatus(),
      publishOnImport: json['publishOnImport'] as bool?,
      schedule: json['schedule'] != null
          ? ScheduleConfiguration.fromJson(
              json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toDataSourceStatus(),
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final id = this.id;
    final name = this.name;
    final projectId = this.projectId;
    final assetFormsOutput = this.assetFormsOutput;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final description = this.description;
    final enableSetting = this.enableSetting;
    final errorMessage = this.errorMessage;
    final lastRunAt = this.lastRunAt;
    final lastRunErrorMessage = this.lastRunErrorMessage;
    final lastRunStatus = this.lastRunStatus;
    final publishOnImport = this.publishOnImport;
    final schedule = this.schedule;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      'domainId': domainId,
      'environmentId': environmentId,
      'id': id,
      'name': name,
      'projectId': projectId,
      if (assetFormsOutput != null) 'assetFormsOutput': assetFormsOutput,
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (enableSetting != null) 'enableSetting': enableSetting.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (lastRunAt != null) 'lastRunAt': iso8601ToJson(lastRunAt),
      if (lastRunErrorMessage != null)
        'lastRunErrorMessage': lastRunErrorMessage,
      if (lastRunStatus != null) 'lastRunStatus': lastRunStatus.toValue(),
      if (publishOnImport != null) 'publishOnImport': publishOnImport,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class DeleteDomainOutput {
  /// The status of the domain.
  final DomainStatus status;

  DeleteDomainOutput({
    required this.status,
  });

  factory DeleteDomainOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDomainOutput(
      status: (json['status'] as String).toDomainStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

class DeleteEnvironmentBlueprintConfigurationOutput {
  DeleteEnvironmentBlueprintConfigurationOutput();

  factory DeleteEnvironmentBlueprintConfigurationOutput.fromJson(
      Map<String, dynamic> _) {
    return DeleteEnvironmentBlueprintConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFormTypeOutput {
  DeleteFormTypeOutput();

  factory DeleteFormTypeOutput.fromJson(Map<String, dynamic> _) {
    return DeleteFormTypeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGlossaryOutput {
  DeleteGlossaryOutput();

  factory DeleteGlossaryOutput.fromJson(Map<String, dynamic> _) {
    return DeleteGlossaryOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGlossaryTermOutput {
  DeleteGlossaryTermOutput();

  factory DeleteGlossaryTermOutput.fromJson(Map<String, dynamic> _) {
    return DeleteGlossaryTermOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteListingOutput {
  DeleteListingOutput();

  factory DeleteListingOutput.fromJson(Map<String, dynamic> _) {
    return DeleteListingOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProjectMembershipOutput {
  DeleteProjectMembershipOutput();

  factory DeleteProjectMembershipOutput.fromJson(Map<String, dynamic> _) {
    return DeleteProjectMembershipOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProjectOutput {
  DeleteProjectOutput();

  factory DeleteProjectOutput.fromJson(Map<String, dynamic> _) {
    return DeleteProjectOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSubscriptionGrantOutput {
  /// The timestamp of when the subscription grant that is deleted was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription grant that is deleted.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which the subscription grant is
  /// deleted.
  final String domainId;

  /// The entity to which the subscription is deleted.
  final GrantedEntity grantedEntity;

  /// The ID of the subscription grant that is deleted.
  final String id;

  /// The status of the subscription grant that is deleted.
  final SubscriptionGrantOverallStatus status;

  /// The ID of the subscription target associated with the subscription grant
  /// that is deleted.
  final String subscriptionTargetId;

  /// The timestamp of when the subscription grant that is deleted was updated.
  final DateTime updatedAt;

  /// The assets for which the subsctiption grant that is deleted gave access.
  final List<SubscribedAsset>? assets;

  /// The identifier of the subsctiption whose subscription grant is to be
  /// deleted.
  final String? subscriptionId;

  /// The Amazon DataZone user who updated the subscription grant that is deleted.
  final String? updatedBy;

  DeleteSubscriptionGrantOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.grantedEntity,
    required this.id,
    required this.status,
    required this.subscriptionTargetId,
    required this.updatedAt,
    this.assets,
    this.subscriptionId,
    this.updatedBy,
  });

  factory DeleteSubscriptionGrantOutput.fromJson(Map<String, dynamic> json) {
    return DeleteSubscriptionGrantOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      grantedEntity:
          GrantedEntity.fromJson(json['grantedEntity'] as Map<String, dynamic>),
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionGrantOverallStatus(),
      subscriptionTargetId: json['subscriptionTargetId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      assets: (json['assets'] as List?)
          ?.whereNotNull()
          .map((e) => SubscribedAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionId: json['subscriptionId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final grantedEntity = this.grantedEntity;
    final id = this.id;
    final status = this.status;
    final subscriptionTargetId = this.subscriptionTargetId;
    final updatedAt = this.updatedAt;
    final assets = this.assets;
    final subscriptionId = this.subscriptionId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'grantedEntity': grantedEntity,
      'id': id,
      'status': status.toValue(),
      'subscriptionTargetId': subscriptionTargetId,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (assets != null) 'assets': assets,
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class DeleteTimeSeriesDataPointsOutput {
  DeleteTimeSeriesDataPointsOutput();

  factory DeleteTimeSeriesDataPointsOutput.fromJson(Map<String, dynamic> _) {
    return DeleteTimeSeriesDataPointsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The details of the last deployment of the environment.
class Deployment {
  /// The identifier of the last deployment of the environment.
  final String? deploymentId;

  /// The status of the last deployment of the environment.
  final DeploymentStatus? deploymentStatus;

  /// The type of the last deployment of the environment.
  final DeploymentType? deploymentType;

  /// The failure reason of the last deployment of the environment.
  final EnvironmentError? failureReason;

  /// Specifies whether the last deployment of the environment is complete.
  final bool? isDeploymentComplete;

  /// The messages of the last deployment of the environment.
  final List<String>? messages;

  Deployment({
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentType,
    this.failureReason,
    this.isDeploymentComplete,
    this.messages,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      deploymentId: json['deploymentId'] as String?,
      deploymentStatus:
          (json['deploymentStatus'] as String?)?.toDeploymentStatus(),
      deploymentType: (json['deploymentType'] as String?)?.toDeploymentType(),
      failureReason: json['failureReason'] != null
          ? EnvironmentError.fromJson(
              json['failureReason'] as Map<String, dynamic>)
          : null,
      isDeploymentComplete: json['isDeploymentComplete'] as bool?,
      messages: (json['messages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final deploymentStatus = this.deploymentStatus;
    final deploymentType = this.deploymentType;
    final failureReason = this.failureReason;
    final isDeploymentComplete = this.isDeploymentComplete;
    final messages = this.messages;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (deploymentStatus != null)
        'deploymentStatus': deploymentStatus.toValue(),
      if (deploymentType != null) 'deploymentType': deploymentType.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (isDeploymentComplete != null)
        'isDeploymentComplete': isDeploymentComplete,
      if (messages != null) 'messages': messages,
    };
  }
}

/// The deployment properties of the Amazon DataZone blueprint.
class DeploymentProperties {
  /// The end timeout of the environment blueprint deployment.
  final int? endTimeoutMinutes;

  /// The start timeout of the environment blueprint deployment.
  final int? startTimeoutMinutes;

  DeploymentProperties({
    this.endTimeoutMinutes,
    this.startTimeoutMinutes,
  });

  factory DeploymentProperties.fromJson(Map<String, dynamic> json) {
    return DeploymentProperties(
      endTimeoutMinutes: json['endTimeoutMinutes'] as int?,
      startTimeoutMinutes: json['startTimeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTimeoutMinutes = this.endTimeoutMinutes;
    final startTimeoutMinutes = this.startTimeoutMinutes;
    return {
      if (endTimeoutMinutes != null) 'endTimeoutMinutes': endTimeoutMinutes,
      if (startTimeoutMinutes != null)
        'startTimeoutMinutes': startTimeoutMinutes,
    };
  }
}

enum DeploymentStatus {
  inProgress,
  successful,
  failed,
  pendingDeployment,
}

extension DeploymentStatusValueExtension on DeploymentStatus {
  String toValue() {
    switch (this) {
      case DeploymentStatus.inProgress:
        return 'IN_PROGRESS';
      case DeploymentStatus.successful:
        return 'SUCCESSFUL';
      case DeploymentStatus.failed:
        return 'FAILED';
      case DeploymentStatus.pendingDeployment:
        return 'PENDING_DEPLOYMENT';
    }
  }
}

extension DeploymentStatusFromString on String {
  DeploymentStatus toDeploymentStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return DeploymentStatus.inProgress;
      case 'SUCCESSFUL':
        return DeploymentStatus.successful;
      case 'FAILED':
        return DeploymentStatus.failed;
      case 'PENDING_DEPLOYMENT':
        return DeploymentStatus.pendingDeployment;
    }
    throw Exception('$this is not known in enum DeploymentStatus');
  }
}

enum DeploymentType {
  create,
  update,
  delete,
}

extension DeploymentTypeValueExtension on DeploymentType {
  String toValue() {
    switch (this) {
      case DeploymentType.create:
        return 'CREATE';
      case DeploymentType.update:
        return 'UPDATE';
      case DeploymentType.delete:
        return 'DELETE';
    }
  }
}

extension DeploymentTypeFromString on String {
  DeploymentType toDeploymentType() {
    switch (this) {
      case 'CREATE':
        return DeploymentType.create;
      case 'UPDATE':
        return DeploymentType.update;
      case 'DELETE':
        return DeploymentType.delete;
    }
    throw Exception('$this is not known in enum DeploymentType');
  }
}

/// Details of a glossary term attached to the inventory asset.
class DetailedGlossaryTerm {
  /// The name of a glossary term attached to the inventory asset.
  final String? name;

  /// The shoft description of a glossary term attached to the inventory asset.
  final String? shortDescription;

  DetailedGlossaryTerm({
    this.name,
    this.shortDescription,
  });

  factory DetailedGlossaryTerm.fromJson(Map<String, dynamic> json) {
    return DetailedGlossaryTerm(
      name: json['name'] as String?,
      shortDescription: json['shortDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final shortDescription = this.shortDescription;
    return {
      if (name != null) 'name': name,
      if (shortDescription != null) 'shortDescription': shortDescription,
    };
  }
}

enum DomainStatus {
  creating,
  available,
  creationFailed,
  deleting,
  deleted,
  deletionFailed,
}

extension DomainStatusValueExtension on DomainStatus {
  String toValue() {
    switch (this) {
      case DomainStatus.creating:
        return 'CREATING';
      case DomainStatus.available:
        return 'AVAILABLE';
      case DomainStatus.creationFailed:
        return 'CREATION_FAILED';
      case DomainStatus.deleting:
        return 'DELETING';
      case DomainStatus.deleted:
        return 'DELETED';
      case DomainStatus.deletionFailed:
        return 'DELETION_FAILED';
    }
  }
}

extension DomainStatusFromString on String {
  DomainStatus toDomainStatus() {
    switch (this) {
      case 'CREATING':
        return DomainStatus.creating;
      case 'AVAILABLE':
        return DomainStatus.available;
      case 'CREATION_FAILED':
        return DomainStatus.creationFailed;
      case 'DELETING':
        return DomainStatus.deleting;
      case 'DELETED':
        return DomainStatus.deleted;
      case 'DELETION_FAILED':
        return DomainStatus.deletionFailed;
    }
    throw Exception('$this is not known in enum DomainStatus');
  }
}

/// A summary of a Amazon DataZone domain.
class DomainSummary {
  /// The ARN of the Amazon DataZone domain.
  final String arn;

  /// A timestamp of when a Amazon DataZone domain was created.
  final DateTime createdAt;

  /// The ID of the Amazon DataZone domain.
  final String id;

  /// The identifier of the Amazon Web Services account that manages the domain.
  final String managedAccountId;

  /// A name of an Amazon DataZone domain.
  final String name;

  /// The status of the Amazon DataZone domain.
  final DomainStatus status;

  /// A description of an Amazon DataZone domain.
  final String? description;

  /// A timestamp of when a Amazon DataZone domain was last updated.
  final DateTime? lastUpdatedAt;

  /// The data portal URL for the Amazon DataZone domain.
  final String? portalUrl;

  DomainSummary({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.managedAccountId,
    required this.name,
    required this.status,
    this.description,
    this.lastUpdatedAt,
    this.portalUrl,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      managedAccountId: json['managedAccountId'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toDomainStatus(),
      description: json['description'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      portalUrl: json['portalUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final managedAccountId = this.managedAccountId;
    final name = this.name;
    final status = this.status;
    final description = this.description;
    final lastUpdatedAt = this.lastUpdatedAt;
    final portalUrl = this.portalUrl;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'managedAccountId': managedAccountId,
      'name': name,
      'status': status.toValue(),
      if (description != null) 'description': description,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (portalUrl != null) 'portalUrl': portalUrl,
    };
  }
}

enum EnableSetting {
  enabled,
  disabled,
}

extension EnableSettingValueExtension on EnableSetting {
  String toValue() {
    switch (this) {
      case EnableSetting.enabled:
        return 'ENABLED';
      case EnableSetting.disabled:
        return 'DISABLED';
    }
  }
}

extension EnableSettingFromString on String {
  EnableSetting toEnableSetting() {
    switch (this) {
      case 'ENABLED':
        return EnableSetting.enabled;
      case 'DISABLED':
        return EnableSetting.disabled;
    }
    throw Exception('$this is not known in enum EnableSetting');
  }
}

enum EntityType {
  asset,
}

extension EntityTypeValueExtension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.asset:
        return 'ASSET';
    }
  }
}

extension EntityTypeFromString on String {
  EntityType toEntityType() {
    switch (this) {
      case 'ASSET':
        return EntityType.asset;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

/// The configuration details of an environment blueprint.
class EnvironmentBlueprintConfigurationItem {
  /// The identifier of the Amazon DataZone domain in which an environment
  /// blueprint exists.
  final String domainId;

  /// The identifier of the environment blueprint.
  final String environmentBlueprintId;

  /// The timestamp of when an environment blueprint was created.
  final DateTime? createdAt;

  /// The enabled Amazon Web Services Regions specified in a blueprint
  /// configuration.
  final List<String>? enabledRegions;

  /// The ARN of the manage access role specified in the environment blueprint
  /// configuration.
  final String? manageAccessRoleArn;

  /// The ARN of the provisioning role specified in the environment blueprint
  /// configuration.
  final String? provisioningRoleArn;

  /// The regional parameters of the environment blueprint.
  final Map<String, Map<String, String>>? regionalParameters;

  /// The timestamp of when the environment blueprint was updated.
  final DateTime? updatedAt;

  EnvironmentBlueprintConfigurationItem({
    required this.domainId,
    required this.environmentBlueprintId,
    this.createdAt,
    this.enabledRegions,
    this.manageAccessRoleArn,
    this.provisioningRoleArn,
    this.regionalParameters,
    this.updatedAt,
  });

  factory EnvironmentBlueprintConfigurationItem.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentBlueprintConfigurationItem(
      domainId: json['domainId'] as String,
      environmentBlueprintId: json['environmentBlueprintId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      enabledRegions: (json['enabledRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      manageAccessRoleArn: json['manageAccessRoleArn'] as String?,
      provisioningRoleArn: json['provisioningRoleArn'] as String?,
      regionalParameters: (json['regionalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final environmentBlueprintId = this.environmentBlueprintId;
    final createdAt = this.createdAt;
    final enabledRegions = this.enabledRegions;
    final manageAccessRoleArn = this.manageAccessRoleArn;
    final provisioningRoleArn = this.provisioningRoleArn;
    final regionalParameters = this.regionalParameters;
    final updatedAt = this.updatedAt;
    return {
      'domainId': domainId,
      'environmentBlueprintId': environmentBlueprintId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (enabledRegions != null) 'enabledRegions': enabledRegions,
      if (manageAccessRoleArn != null)
        'manageAccessRoleArn': manageAccessRoleArn,
      if (provisioningRoleArn != null)
        'provisioningRoleArn': provisioningRoleArn,
      if (regionalParameters != null) 'regionalParameters': regionalParameters,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The details of an environment blueprint summary.
class EnvironmentBlueprintSummary {
  /// The identifier of the blueprint.
  final String id;

  /// The name of the blueprint.
  final String name;

  /// The provider of the blueprint.
  final String provider;

  /// The provisioning properties of the blueprint.
  final ProvisioningProperties provisioningProperties;

  /// The timestamp of when an environment blueprint was created.
  final DateTime? createdAt;

  /// The description of a blueprint.
  final String? description;

  /// The timestamp of when the blueprint was enabled.
  final DateTime? updatedAt;

  EnvironmentBlueprintSummary({
    required this.id,
    required this.name,
    required this.provider,
    required this.provisioningProperties,
    this.createdAt,
    this.description,
    this.updatedAt,
  });

  factory EnvironmentBlueprintSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentBlueprintSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      provider: json['provider'] as String,
      provisioningProperties: ProvisioningProperties.fromJson(
          json['provisioningProperties'] as Map<String, dynamic>),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final provider = this.provider;
    final provisioningProperties = this.provisioningProperties;
    final createdAt = this.createdAt;
    final description = this.description;
    final updatedAt = this.updatedAt;
    return {
      'id': id,
      'name': name,
      'provider': provider,
      'provisioningProperties': provisioningProperties,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The failure reasons for the environment deployment.
class EnvironmentError {
  /// The error message for the failure reason for the environment deployment.
  final String message;

  /// The error code for the failure reason for the environment deployment.
  final String? code;

  EnvironmentError({
    required this.message,
    this.code,
  });

  factory EnvironmentError.fromJson(Map<String, dynamic> json) {
    return EnvironmentError(
      message: json['message'] as String,
      code: json['code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final code = this.code;
    return {
      'message': message,
      if (code != null) 'code': code,
    };
  }
}

/// The parameter details of an evironment profile.
class EnvironmentParameter {
  /// The name of an environment profile parameter.
  final String? name;

  /// The value of an environment profile parameter.
  final String? value;

  EnvironmentParameter({
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// The details of an environment profile.
class EnvironmentProfileSummary {
  /// The Amazon DataZone user who created the environment profile.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which the environment
  /// profile exists.
  final String domainId;

  /// The identifier of a blueprint with which an environment profile is created.
  final String environmentBlueprintId;

  /// The identifier of the environment profile.
  final String id;

  /// The name of the environment profile.
  final String name;

  /// The identifier of an Amazon Web Services account in which an environment
  /// profile exists.
  final String? awsAccountId;

  /// The Amazon Web Services Region in which an environment profile exists.
  final String? awsAccountRegion;

  /// The timestamp of when an environment profile was created.
  final DateTime? createdAt;

  /// The description of the environment profile.
  final String? description;

  /// The identifier of a project in which an environment profile exists.
  final String? projectId;

  /// The timestamp of when the environment profile was updated.
  final DateTime? updatedAt;

  EnvironmentProfileSummary({
    required this.createdBy,
    required this.domainId,
    required this.environmentBlueprintId,
    required this.id,
    required this.name,
    this.awsAccountId,
    this.awsAccountRegion,
    this.createdAt,
    this.description,
    this.projectId,
    this.updatedAt,
  });

  factory EnvironmentProfileSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentProfileSummary(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentBlueprintId: json['environmentBlueprintId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      awsAccountId: json['awsAccountId'] as String?,
      awsAccountRegion: json['awsAccountRegion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      projectId: json['projectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentBlueprintId = this.environmentBlueprintId;
    final id = this.id;
    final name = this.name;
    final awsAccountId = this.awsAccountId;
    final awsAccountRegion = this.awsAccountRegion;
    final createdAt = this.createdAt;
    final description = this.description;
    final projectId = this.projectId;
    final updatedAt = this.updatedAt;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentBlueprintId': environmentBlueprintId,
      'id': id,
      'name': name,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (projectId != null) 'projectId': projectId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

enum EnvironmentStatus {
  active,
  creating,
  updating,
  deleting,
  createFailed,
  updateFailed,
  deleteFailed,
  validationFailed,
  suspended,
  disabled,
  expired,
  deleted,
  inaccessible,
}

extension EnvironmentStatusValueExtension on EnvironmentStatus {
  String toValue() {
    switch (this) {
      case EnvironmentStatus.active:
        return 'ACTIVE';
      case EnvironmentStatus.creating:
        return 'CREATING';
      case EnvironmentStatus.updating:
        return 'UPDATING';
      case EnvironmentStatus.deleting:
        return 'DELETING';
      case EnvironmentStatus.createFailed:
        return 'CREATE_FAILED';
      case EnvironmentStatus.updateFailed:
        return 'UPDATE_FAILED';
      case EnvironmentStatus.deleteFailed:
        return 'DELETE_FAILED';
      case EnvironmentStatus.validationFailed:
        return 'VALIDATION_FAILED';
      case EnvironmentStatus.suspended:
        return 'SUSPENDED';
      case EnvironmentStatus.disabled:
        return 'DISABLED';
      case EnvironmentStatus.expired:
        return 'EXPIRED';
      case EnvironmentStatus.deleted:
        return 'DELETED';
      case EnvironmentStatus.inaccessible:
        return 'INACCESSIBLE';
    }
  }
}

extension EnvironmentStatusFromString on String {
  EnvironmentStatus toEnvironmentStatus() {
    switch (this) {
      case 'ACTIVE':
        return EnvironmentStatus.active;
      case 'CREATING':
        return EnvironmentStatus.creating;
      case 'UPDATING':
        return EnvironmentStatus.updating;
      case 'DELETING':
        return EnvironmentStatus.deleting;
      case 'CREATE_FAILED':
        return EnvironmentStatus.createFailed;
      case 'UPDATE_FAILED':
        return EnvironmentStatus.updateFailed;
      case 'DELETE_FAILED':
        return EnvironmentStatus.deleteFailed;
      case 'VALIDATION_FAILED':
        return EnvironmentStatus.validationFailed;
      case 'SUSPENDED':
        return EnvironmentStatus.suspended;
      case 'DISABLED':
        return EnvironmentStatus.disabled;
      case 'EXPIRED':
        return EnvironmentStatus.expired;
      case 'DELETED':
        return EnvironmentStatus.deleted;
      case 'INACCESSIBLE':
        return EnvironmentStatus.inaccessible;
    }
    throw Exception('$this is not known in enum EnvironmentStatus');
  }
}

/// The details of an environment.
class EnvironmentSummary {
  /// The Amazon DataZone user who created the environment.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which the environment
  /// exists.
  final String domainId;

  /// The identifier of the environment profile with which the environment was
  /// created.
  final String environmentProfileId;

  /// The name of the environment.
  final String name;

  /// The identifier of the project in which the environment exists.
  final String projectId;

  /// The provider of the environment.
  final String provider;

  /// The identifier of the Amazon Web Services account in which an environment
  /// exists.
  final String? awsAccountId;

  /// The Amazon Web Services Region in which an environment exists.
  final String? awsAccountRegion;

  /// The timestamp of when the environment was created.
  final DateTime? createdAt;

  /// The description of the environment.
  final String? description;

  /// The identifier of the environment.
  final String? id;

  /// The status of the environment.
  final EnvironmentStatus? status;

  /// The timestamp of when the environment was updated.
  final DateTime? updatedAt;

  EnvironmentSummary({
    required this.createdBy,
    required this.domainId,
    required this.environmentProfileId,
    required this.name,
    required this.projectId,
    required this.provider,
    this.awsAccountId,
    this.awsAccountRegion,
    this.createdAt,
    this.description,
    this.id,
    this.status,
    this.updatedAt,
  });

  factory EnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentSummary(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentProfileId: json['environmentProfileId'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      provider: json['provider'] as String,
      awsAccountId: json['awsAccountId'] as String?,
      awsAccountRegion: json['awsAccountRegion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentProfileId = this.environmentProfileId;
    final name = this.name;
    final projectId = this.projectId;
    final provider = this.provider;
    final awsAccountId = this.awsAccountId;
    final awsAccountRegion = this.awsAccountRegion;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentProfileId': environmentProfileId,
      'name': name,
      'projectId': projectId,
      'provider': provider,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Specifies the error message that is returned if the operation cannot be
/// successfully completed.
class FailureCause {
  /// The description of the error message.
  final String? message;

  FailureCause({
    this.message,
  });

  factory FailureCause.fromJson(Map<String, dynamic> json) {
    return FailureCause(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// A search filter in Amazon DataZone.
class Filter {
  /// A search filter attribute in Amazon DataZone.
  final String attribute;

  /// A search filter value in Amazon DataZone.
  final String value;

  Filter({
    required this.attribute,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final value = this.value;
    return {
      'attribute': attribute,
      'value': value,
    };
  }
}

/// A search filter clause in Amazon DataZone.
class FilterClause {
  /// The 'and' search filter clause in Amazon DataZone.
  final List<FilterClause>? and;

  /// A search filter in Amazon DataZone.
  final Filter? filter;

  /// The 'or' search filter clause in Amazon DataZone.
  final List<FilterClause>? or;

  FilterClause({
    this.and,
    this.filter,
    this.or,
  });

  Map<String, dynamic> toJson() {
    final and = this.and;
    final filter = this.filter;
    final or = this.or;
    return {
      if (and != null) 'and': and,
      if (filter != null) 'filter': filter,
      if (or != null) 'or': or,
    };
  }
}

/// A filter expression in Amazon DataZone.
class FilterExpression {
  /// The search filter expression.
  final String expression;

  /// The search filter explresison type.
  final FilterExpressionType type;

  FilterExpression({
    required this.expression,
    required this.type,
  });

  factory FilterExpression.fromJson(Map<String, dynamic> json) {
    return FilterExpression(
      expression: json['expression'] as String,
      type: (json['type'] as String).toFilterExpressionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final type = this.type;
    return {
      'expression': expression,
      'type': type.toValue(),
    };
  }
}

enum FilterExpressionType {
  include,
  exclude,
}

extension FilterExpressionTypeValueExtension on FilterExpressionType {
  String toValue() {
    switch (this) {
      case FilterExpressionType.include:
        return 'INCLUDE';
      case FilterExpressionType.exclude:
        return 'EXCLUDE';
    }
  }
}

extension FilterExpressionTypeFromString on String {
  FilterExpressionType toFilterExpressionType() {
    switch (this) {
      case 'INCLUDE':
        return FilterExpressionType.include;
      case 'EXCLUDE':
        return FilterExpressionType.exclude;
    }
    throw Exception('$this is not known in enum FilterExpressionType');
  }
}

/// The details of the form entry.
class FormEntryInput {
  /// The type ID of the form entry.
  final String typeIdentifier;

  /// The type revision of the form entry.
  final String typeRevision;

  /// Specifies whether a form entry is required.
  final bool? required;

  FormEntryInput({
    required this.typeIdentifier,
    required this.typeRevision,
    this.required,
  });

  Map<String, dynamic> toJson() {
    final typeIdentifier = this.typeIdentifier;
    final typeRevision = this.typeRevision;
    final required = this.required;
    return {
      'typeIdentifier': typeIdentifier,
      'typeRevision': typeRevision,
      if (required != null) 'required': required,
    };
  }
}

/// The details of the form entry.
class FormEntryOutput {
  /// The name of the type of the form entry.
  final String typeName;

  /// The type revision of the form entry.
  final String typeRevision;

  /// Specifies whether a form entry is required.
  final bool? required;

  FormEntryOutput({
    required this.typeName,
    required this.typeRevision,
    this.required,
  });

  factory FormEntryOutput.fromJson(Map<String, dynamic> json) {
    return FormEntryOutput(
      typeName: json['typeName'] as String,
      typeRevision: json['typeRevision'] as String,
      required: json['required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final typeName = this.typeName;
    final typeRevision = this.typeRevision;
    final required = this.required;
    return {
      'typeName': typeName,
      'typeRevision': typeRevision,
      if (required != null) 'required': required,
    };
  }
}

/// The details of a metadata form.
class FormInput {
  /// The name of the metadata form.
  final String formName;

  /// The content of the metadata form.
  final String? content;

  /// The ID of the metadata form type.
  final String? typeIdentifier;

  /// The revision of the metadata form type.
  final String? typeRevision;

  FormInput({
    required this.formName,
    this.content,
    this.typeIdentifier,
    this.typeRevision,
  });

  Map<String, dynamic> toJson() {
    final formName = this.formName;
    final content = this.content;
    final typeIdentifier = this.typeIdentifier;
    final typeRevision = this.typeRevision;
    return {
      'formName': formName,
      if (content != null) 'content': content,
      if (typeIdentifier != null) 'typeIdentifier': typeIdentifier,
      if (typeRevision != null) 'typeRevision': typeRevision,
    };
  }
}

/// The details of a metadata form.
class FormOutput {
  /// The name of the metadata form.
  final String formName;

  /// The content of the metadata form.
  final String? content;

  /// The name of the metadata form type.
  final String? typeName;

  /// The revision of the metadata form type.
  final String? typeRevision;

  FormOutput({
    required this.formName,
    this.content,
    this.typeName,
    this.typeRevision,
  });

  factory FormOutput.fromJson(Map<String, dynamic> json) {
    return FormOutput(
      formName: json['formName'] as String,
      content: json['content'] as String?,
      typeName: json['typeName'] as String?,
      typeRevision: json['typeRevision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final formName = this.formName;
    final content = this.content;
    final typeName = this.typeName;
    final typeRevision = this.typeRevision;
    return {
      'formName': formName,
      if (content != null) 'content': content,
      if (typeName != null) 'typeName': typeName,
      if (typeRevision != null) 'typeRevision': typeRevision,
    };
  }
}

/// The details of the metadata form type.
class FormTypeData {
  /// The identifier of the Amazon DataZone domain in which the form type exists.
  final String domainId;

  /// The name of the form type.
  final String name;

  /// The revision of the form type.
  final String revision;

  /// The timestamp of when the metadata form type was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created teh metadata form type.
  final String? createdBy;

  /// The description of the metadata form type.
  final String? description;

  /// The imports specified in the form type.
  final List<Import>? imports;

  /// The model of the form type.
  final Model? model;

  /// The identifier of the Amazon DataZone domain in which the form type was
  /// originally created.
  final String? originDomainId;

  /// The identifier of the project in which the form type was originally created.
  final String? originProjectId;

  /// The identifier of the project that owns the form type.
  final String? owningProjectId;

  /// The status of the form type.
  final FormTypeStatus? status;

  FormTypeData({
    required this.domainId,
    required this.name,
    required this.revision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.imports,
    this.model,
    this.originDomainId,
    this.originProjectId,
    this.owningProjectId,
    this.status,
  });

  factory FormTypeData.fromJson(Map<String, dynamic> json) {
    return FormTypeData(
      domainId: json['domainId'] as String,
      name: json['name'] as String,
      revision: json['revision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      imports: (json['imports'] as List?)
          ?.whereNotNull()
          .map((e) => Import.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] != null
          ? Model.fromJson(json['model'] as Map<String, dynamic>)
          : null,
      originDomainId: json['originDomainId'] as String?,
      originProjectId: json['originProjectId'] as String?,
      owningProjectId: json['owningProjectId'] as String?,
      status: (json['status'] as String?)?.toFormTypeStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final name = this.name;
    final revision = this.revision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final imports = this.imports;
    final model = this.model;
    final originDomainId = this.originDomainId;
    final originProjectId = this.originProjectId;
    final owningProjectId = this.owningProjectId;
    final status = this.status;
    return {
      'domainId': domainId,
      'name': name,
      'revision': revision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (imports != null) 'imports': imports,
      if (model != null) 'model': model,
      if (originDomainId != null) 'originDomainId': originDomainId,
      if (originProjectId != null) 'originProjectId': originProjectId,
      if (owningProjectId != null) 'owningProjectId': owningProjectId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum FormTypeStatus {
  enabled,
  disabled,
}

extension FormTypeStatusValueExtension on FormTypeStatus {
  String toValue() {
    switch (this) {
      case FormTypeStatus.enabled:
        return 'ENABLED';
      case FormTypeStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension FormTypeStatusFromString on String {
  FormTypeStatus toFormTypeStatus() {
    switch (this) {
      case 'ENABLED':
        return FormTypeStatus.enabled;
      case 'DISABLED':
        return FormTypeStatus.disabled;
    }
    throw Exception('$this is not known in enum FormTypeStatus');
  }
}

class GetAssetOutput {
  /// The ID of the Amazon DataZone domain to which the asset belongs.
  final String domainId;

  /// The metadata forms attached to the asset.
  final List<FormOutput> formsOutput;

  /// The ID of the asset.
  final String id;

  /// The name of the asset.
  final String name;

  /// The ID of the project that owns the asset.
  final String owningProjectId;

  /// The revision of the asset.
  final String revision;

  /// The ID of the asset type.
  final String typeIdentifier;

  /// The revision of the asset type.
  final String typeRevision;

  /// The timestamp of when the asset was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the asset.
  final String? createdBy;

  /// The description of the Amazon DataZone asset.
  final String? description;

  /// The external ID of the asset.
  final String? externalIdentifier;

  /// The timestamp of when the first revision of the asset was created.
  final DateTime? firstRevisionCreatedAt;

  /// The Amazon DataZone user who created the first revision of the asset.
  final String? firstRevisionCreatedBy;

  /// The business glossary terms attached to the asset.
  final List<String>? glossaryTerms;

  /// The latest data point that was imported into the time series form for the
  /// asset.
  final List<TimeSeriesDataPointSummaryFormOutput>?
      latestTimeSeriesDataPointFormsOutput;

  /// The listing of the asset.
  final AssetListingDetails? listing;

  /// The read-only metadata forms attached to the asset.
  final List<FormOutput>? readOnlyFormsOutput;

  GetAssetOutput({
    required this.domainId,
    required this.formsOutput,
    required this.id,
    required this.name,
    required this.owningProjectId,
    required this.revision,
    required this.typeIdentifier,
    required this.typeRevision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.externalIdentifier,
    this.firstRevisionCreatedAt,
    this.firstRevisionCreatedBy,
    this.glossaryTerms,
    this.latestTimeSeriesDataPointFormsOutput,
    this.listing,
    this.readOnlyFormsOutput,
  });

  factory GetAssetOutput.fromJson(Map<String, dynamic> json) {
    return GetAssetOutput(
      domainId: json['domainId'] as String,
      formsOutput: (json['formsOutput'] as List)
          .whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      revision: json['revision'] as String,
      typeIdentifier: json['typeIdentifier'] as String,
      typeRevision: json['typeRevision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      externalIdentifier: json['externalIdentifier'] as String?,
      firstRevisionCreatedAt: timeStampFromJson(json['firstRevisionCreatedAt']),
      firstRevisionCreatedBy: json['firstRevisionCreatedBy'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestTimeSeriesDataPointFormsOutput:
          (json['latestTimeSeriesDataPointFormsOutput'] as List?)
              ?.whereNotNull()
              .map((e) => TimeSeriesDataPointSummaryFormOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      listing: json['listing'] != null
          ? AssetListingDetails.fromJson(
              json['listing'] as Map<String, dynamic>)
          : null,
      readOnlyFormsOutput: (json['readOnlyFormsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final formsOutput = this.formsOutput;
    final id = this.id;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final revision = this.revision;
    final typeIdentifier = this.typeIdentifier;
    final typeRevision = this.typeRevision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final externalIdentifier = this.externalIdentifier;
    final firstRevisionCreatedAt = this.firstRevisionCreatedAt;
    final firstRevisionCreatedBy = this.firstRevisionCreatedBy;
    final glossaryTerms = this.glossaryTerms;
    final latestTimeSeriesDataPointFormsOutput =
        this.latestTimeSeriesDataPointFormsOutput;
    final listing = this.listing;
    final readOnlyFormsOutput = this.readOnlyFormsOutput;
    return {
      'domainId': domainId,
      'formsOutput': formsOutput,
      'id': id,
      'name': name,
      'owningProjectId': owningProjectId,
      'revision': revision,
      'typeIdentifier': typeIdentifier,
      'typeRevision': typeRevision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (externalIdentifier != null) 'externalIdentifier': externalIdentifier,
      if (firstRevisionCreatedAt != null)
        'firstRevisionCreatedAt': unixTimestampToJson(firstRevisionCreatedAt),
      if (firstRevisionCreatedBy != null)
        'firstRevisionCreatedBy': firstRevisionCreatedBy,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (latestTimeSeriesDataPointFormsOutput != null)
        'latestTimeSeriesDataPointFormsOutput':
            latestTimeSeriesDataPointFormsOutput,
      if (listing != null) 'listing': listing,
      if (readOnlyFormsOutput != null)
        'readOnlyFormsOutput': readOnlyFormsOutput,
    };
  }
}

class GetAssetTypeOutput {
  /// The ID of the Amazon DataZone domain in which the asset type exists.
  final String domainId;

  /// The metadata forms attached to the asset type.
  final Map<String, FormEntryOutput> formsOutput;

  /// The name of the asset type.
  final String name;

  /// The ID of the Amazon DataZone project that owns the asset type.
  final String owningProjectId;

  /// The revision of the asset type.
  final String revision;

  /// The timestamp of when the asset type was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the asset type.
  final String? createdBy;

  /// The description of the asset type.
  final String? description;

  /// The ID of the Amazon DataZone domain in which the asset type was originally
  /// created.
  final String? originDomainId;

  /// The ID of the Amazon DataZone project in which the asset type was originally
  /// created.
  final String? originProjectId;

  /// The timestamp of when the asset type was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user that updated the asset type.
  final String? updatedBy;

  GetAssetTypeOutput({
    required this.domainId,
    required this.formsOutput,
    required this.name,
    required this.owningProjectId,
    required this.revision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.originDomainId,
    this.originProjectId,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetAssetTypeOutput.fromJson(Map<String, dynamic> json) {
    return GetAssetTypeOutput(
      domainId: json['domainId'] as String,
      formsOutput: (json['formsOutput'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, FormEntryOutput.fromJson(e as Map<String, dynamic>))),
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      revision: json['revision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      originDomainId: json['originDomainId'] as String?,
      originProjectId: json['originProjectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final formsOutput = this.formsOutput;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final revision = this.revision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final originDomainId = this.originDomainId;
    final originProjectId = this.originProjectId;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'formsOutput': formsOutput,
      'name': name,
      'owningProjectId': owningProjectId,
      'revision': revision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (originDomainId != null) 'originDomainId': originDomainId,
      if (originProjectId != null) 'originProjectId': originProjectId,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetDataSourceOutput {
  /// The ID of the Amazon DataZone domain in which the data source exists.
  final String domainId;

  /// The ID of the environment where this data source creates and publishes
  /// assets,
  final String environmentId;

  /// The ID of the data source.
  final String id;

  /// The name of the data source.
  final String name;

  /// The ID of the project where the data source creates and publishes assets.
  final String projectId;

  /// The metadata forms attached to the assets created by this data source.
  final List<FormOutput>? assetFormsOutput;

  /// The configuration of the data source.
  final DataSourceConfigurationOutput? configuration;

  /// The timestamp of when the data source was created.
  final DateTime? createdAt;

  /// The description of the data source.
  final String? description;

  /// Specifies whether this data source is enabled or not.
  final EnableSetting? enableSetting;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? errorMessage;

  /// The number of assets created by the data source during its last run.
  final int? lastRunAssetCount;

  /// The timestamp of the last run of the data source.
  final DateTime? lastRunAt;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? lastRunErrorMessage;

  /// The status of the last run of the data source.
  final DataSourceRunStatus? lastRunStatus;

  /// Specifies whether the assets that this data source creates in the inventory
  /// are to be also automatically published to the catalog.
  final bool? publishOnImport;

  /// The recommendation configuration of the data source.
  final RecommendationConfiguration? recommendation;

  /// The schedule of the data source runs.
  final ScheduleConfiguration? schedule;

  /// The status of the data source.
  final DataSourceStatus? status;

  /// The type of the data source.
  final String? type;

  /// The timestamp of when the data source was updated.
  final DateTime? updatedAt;

  GetDataSourceOutput({
    required this.domainId,
    required this.environmentId,
    required this.id,
    required this.name,
    required this.projectId,
    this.assetFormsOutput,
    this.configuration,
    this.createdAt,
    this.description,
    this.enableSetting,
    this.errorMessage,
    this.lastRunAssetCount,
    this.lastRunAt,
    this.lastRunErrorMessage,
    this.lastRunStatus,
    this.publishOnImport,
    this.recommendation,
    this.schedule,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory GetDataSourceOutput.fromJson(Map<String, dynamic> json) {
    return GetDataSourceOutput(
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      assetFormsOutput: (json['assetFormsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      configuration: json['configuration'] != null
          ? DataSourceConfigurationOutput.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      enableSetting: (json['enableSetting'] as String?)?.toEnableSetting(),
      errorMessage: json['errorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['errorMessage'] as Map<String, dynamic>)
          : null,
      lastRunAssetCount: json['lastRunAssetCount'] as int?,
      lastRunAt: timeStampFromJson(json['lastRunAt']),
      lastRunErrorMessage: json['lastRunErrorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['lastRunErrorMessage'] as Map<String, dynamic>)
          : null,
      lastRunStatus:
          (json['lastRunStatus'] as String?)?.toDataSourceRunStatus(),
      publishOnImport: json['publishOnImport'] as bool?,
      recommendation: json['recommendation'] != null
          ? RecommendationConfiguration.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      schedule: json['schedule'] != null
          ? ScheduleConfiguration.fromJson(
              json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toDataSourceStatus(),
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final id = this.id;
    final name = this.name;
    final projectId = this.projectId;
    final assetFormsOutput = this.assetFormsOutput;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final description = this.description;
    final enableSetting = this.enableSetting;
    final errorMessage = this.errorMessage;
    final lastRunAssetCount = this.lastRunAssetCount;
    final lastRunAt = this.lastRunAt;
    final lastRunErrorMessage = this.lastRunErrorMessage;
    final lastRunStatus = this.lastRunStatus;
    final publishOnImport = this.publishOnImport;
    final recommendation = this.recommendation;
    final schedule = this.schedule;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      'domainId': domainId,
      'environmentId': environmentId,
      'id': id,
      'name': name,
      'projectId': projectId,
      if (assetFormsOutput != null) 'assetFormsOutput': assetFormsOutput,
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (enableSetting != null) 'enableSetting': enableSetting.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (lastRunAssetCount != null) 'lastRunAssetCount': lastRunAssetCount,
      if (lastRunAt != null) 'lastRunAt': iso8601ToJson(lastRunAt),
      if (lastRunErrorMessage != null)
        'lastRunErrorMessage': lastRunErrorMessage,
      if (lastRunStatus != null) 'lastRunStatus': lastRunStatus.toValue(),
      if (publishOnImport != null) 'publishOnImport': publishOnImport,
      if (recommendation != null) 'recommendation': recommendation,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetDataSourceRunOutput {
  /// The timestamp of when the data source run was created.
  final DateTime createdAt;

  /// The ID of the data source for this data source run.
  final String dataSourceId;

  /// The ID of the domain in which this data source run was performed.
  final String domainId;

  /// The ID of the data source run.
  final String id;

  /// The ID of the project in which this data source run occured.
  final String projectId;

  /// The status of this data source run.
  final DataSourceRunStatus status;

  /// The type of this data source run.
  final DataSourceRunType type;

  /// The timestamp of when this data source run was updated.
  final DateTime updatedAt;

  /// The configuration snapshot of the data source run.
  final String? dataSourceConfigurationSnapshot;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? errorMessage;

  /// The asset statistics from this data source run.
  final RunStatisticsForAssets? runStatisticsForAssets;

  /// The timestamp of when this data source run started.
  final DateTime? startedAt;

  /// The timestamp of when this data source run stopped.
  final DateTime? stoppedAt;

  GetDataSourceRunOutput({
    required this.createdAt,
    required this.dataSourceId,
    required this.domainId,
    required this.id,
    required this.projectId,
    required this.status,
    required this.type,
    required this.updatedAt,
    this.dataSourceConfigurationSnapshot,
    this.errorMessage,
    this.runStatisticsForAssets,
    this.startedAt,
    this.stoppedAt,
  });

  factory GetDataSourceRunOutput.fromJson(Map<String, dynamic> json) {
    return GetDataSourceRunOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      dataSourceId: json['dataSourceId'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      status: (json['status'] as String).toDataSourceRunStatus(),
      type: (json['type'] as String).toDataSourceRunType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      dataSourceConfigurationSnapshot:
          json['dataSourceConfigurationSnapshot'] as String?,
      errorMessage: json['errorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['errorMessage'] as Map<String, dynamic>)
          : null,
      runStatisticsForAssets: json['runStatisticsForAssets'] != null
          ? RunStatisticsForAssets.fromJson(
              json['runStatisticsForAssets'] as Map<String, dynamic>)
          : null,
      startedAt: timeStampFromJson(json['startedAt']),
      stoppedAt: timeStampFromJson(json['stoppedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataSourceId = this.dataSourceId;
    final domainId = this.domainId;
    final id = this.id;
    final projectId = this.projectId;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final dataSourceConfigurationSnapshot =
        this.dataSourceConfigurationSnapshot;
    final errorMessage = this.errorMessage;
    final runStatisticsForAssets = this.runStatisticsForAssets;
    final startedAt = this.startedAt;
    final stoppedAt = this.stoppedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'dataSourceId': dataSourceId,
      'domainId': domainId,
      'id': id,
      'projectId': projectId,
      'status': status.toValue(),
      'type': type.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (dataSourceConfigurationSnapshot != null)
        'dataSourceConfigurationSnapshot': dataSourceConfigurationSnapshot,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (runStatisticsForAssets != null)
        'runStatisticsForAssets': runStatisticsForAssets,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stoppedAt != null) 'stoppedAt': iso8601ToJson(stoppedAt),
    };
  }
}

class GetDomainOutput {
  /// The domain execution role with which the Amazon DataZone domain is created.
  final String domainExecutionRole;

  /// The identifier of the specified Amazon DataZone domain.
  final String id;

  /// The status of the specified Amazon DataZone domain.
  final DomainStatus status;

  /// The ARN of the specified Amazon DataZone domain.
  final String? arn;

  /// The timestamp of when the Amazon DataZone domain was created.
  final DateTime? createdAt;

  /// The description of the Amazon DataZone domain.
  final String? description;

  /// The identifier of the Amazon Web Services Key Management Service (KMS) key
  /// that is used to encrypt the Amazon DataZone domain, metadata, and reporting
  /// data.
  final String? kmsKeyIdentifier;

  /// The timestamp of when the Amazon DataZone domain was last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the Amazon DataZone domain.
  final String? name;

  /// The URL of the data portal for this Amazon DataZone domain.
  final String? portalUrl;

  /// The single sing-on option of the specified Amazon DataZone domain.
  final SingleSignOn? singleSignOn;

  /// The tags specified for the Amazon DataZone domain.
  final Map<String, String>? tags;

  GetDomainOutput({
    required this.domainExecutionRole,
    required this.id,
    required this.status,
    this.arn,
    this.createdAt,
    this.description,
    this.kmsKeyIdentifier,
    this.lastUpdatedAt,
    this.name,
    this.portalUrl,
    this.singleSignOn,
    this.tags,
  });

  factory GetDomainOutput.fromJson(Map<String, dynamic> json) {
    return GetDomainOutput(
      domainExecutionRole: json['domainExecutionRole'] as String,
      id: json['id'] as String,
      status: (json['status'] as String).toDomainStatus(),
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      portalUrl: json['portalUrl'] as String?,
      singleSignOn: json['singleSignOn'] != null
          ? SingleSignOn.fromJson(json['singleSignOn'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final domainExecutionRole = this.domainExecutionRole;
    final id = this.id;
    final status = this.status;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final portalUrl = this.portalUrl;
    final singleSignOn = this.singleSignOn;
    final tags = this.tags;
    return {
      'domainExecutionRole': domainExecutionRole,
      'id': id,
      'status': status.toValue(),
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (portalUrl != null) 'portalUrl': portalUrl,
      if (singleSignOn != null) 'singleSignOn': singleSignOn,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetEnvironmentBlueprintConfigurationOutput {
  /// The ID of the Amazon DataZone domain where this blueprint exists.
  final String domainId;

  /// The ID of the blueprint.
  final String environmentBlueprintId;

  /// The timestamp of when this blueprint was created.
  final DateTime? createdAt;

  /// The Amazon Web Services regions in which this blueprint is enabled.
  final List<String>? enabledRegions;

  /// The ARN of the manage access role with which this blueprint is created.
  final String? manageAccessRoleArn;

  /// The ARN of the provisioning role with which this blueprint is created.
  final String? provisioningRoleArn;

  /// The regional parameters of the blueprint.
  final Map<String, Map<String, String>>? regionalParameters;

  /// The timestamp of when this blueprint was upated.
  final DateTime? updatedAt;

  GetEnvironmentBlueprintConfigurationOutput({
    required this.domainId,
    required this.environmentBlueprintId,
    this.createdAt,
    this.enabledRegions,
    this.manageAccessRoleArn,
    this.provisioningRoleArn,
    this.regionalParameters,
    this.updatedAt,
  });

  factory GetEnvironmentBlueprintConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetEnvironmentBlueprintConfigurationOutput(
      domainId: json['domainId'] as String,
      environmentBlueprintId: json['environmentBlueprintId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      enabledRegions: (json['enabledRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      manageAccessRoleArn: json['manageAccessRoleArn'] as String?,
      provisioningRoleArn: json['provisioningRoleArn'] as String?,
      regionalParameters: (json['regionalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final environmentBlueprintId = this.environmentBlueprintId;
    final createdAt = this.createdAt;
    final enabledRegions = this.enabledRegions;
    final manageAccessRoleArn = this.manageAccessRoleArn;
    final provisioningRoleArn = this.provisioningRoleArn;
    final regionalParameters = this.regionalParameters;
    final updatedAt = this.updatedAt;
    return {
      'domainId': domainId,
      'environmentBlueprintId': environmentBlueprintId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (enabledRegions != null) 'enabledRegions': enabledRegions,
      if (manageAccessRoleArn != null)
        'manageAccessRoleArn': manageAccessRoleArn,
      if (provisioningRoleArn != null)
        'provisioningRoleArn': provisioningRoleArn,
      if (regionalParameters != null) 'regionalParameters': regionalParameters,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetEnvironmentBlueprintOutput {
  /// The ID of this Amazon DataZone blueprint.
  final String id;

  /// The name of this Amazon DataZone blueprint.
  final String name;

  /// The provider of this Amazon DataZone blueprint.
  final String provider;

  /// The provisioning properties of this Amazon DataZone blueprint.
  final ProvisioningProperties provisioningProperties;

  /// A timestamp of when this blueprint was created.
  final DateTime? createdAt;

  /// The deployment properties of this Amazon DataZone blueprint.
  final DeploymentProperties? deploymentProperties;

  /// The description of this Amazon DataZone blueprint.
  final String? description;

  /// The glossary terms attached to this Amazon DataZone blueprint.
  final List<String>? glossaryTerms;

  /// The timestamp of when this blueprint was updated.
  final DateTime? updatedAt;

  /// The user parameters of this blueprint.
  final List<CustomParameter>? userParameters;

  GetEnvironmentBlueprintOutput({
    required this.id,
    required this.name,
    required this.provider,
    required this.provisioningProperties,
    this.createdAt,
    this.deploymentProperties,
    this.description,
    this.glossaryTerms,
    this.updatedAt,
    this.userParameters,
  });

  factory GetEnvironmentBlueprintOutput.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentBlueprintOutput(
      id: json['id'] as String,
      name: json['name'] as String,
      provider: json['provider'] as String,
      provisioningProperties: ProvisioningProperties.fromJson(
          json['provisioningProperties'] as Map<String, dynamic>),
      createdAt: timeStampFromJson(json['createdAt']),
      deploymentProperties: json['deploymentProperties'] != null
          ? DeploymentProperties.fromJson(
              json['deploymentProperties'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      userParameters: (json['userParameters'] as List?)
          ?.whereNotNull()
          .map((e) => CustomParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final provider = this.provider;
    final provisioningProperties = this.provisioningProperties;
    final createdAt = this.createdAt;
    final deploymentProperties = this.deploymentProperties;
    final description = this.description;
    final glossaryTerms = this.glossaryTerms;
    final updatedAt = this.updatedAt;
    final userParameters = this.userParameters;
    return {
      'id': id,
      'name': name,
      'provider': provider,
      'provisioningProperties': provisioningProperties,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (deploymentProperties != null)
        'deploymentProperties': deploymentProperties,
      if (description != null) 'description': description,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (userParameters != null) 'userParameters': userParameters,
    };
  }
}

class GetEnvironmentOutput {
  /// The Amazon DataZone user who created the environment.
  final String createdBy;

  /// The ID of the Amazon DataZone domain where the environment exists.
  final String domainId;

  /// The ID of the environment profile with which the environment is created.
  final String environmentProfileId;

  /// The name of the environment.
  final String name;

  /// The ID of the Amazon DataZone project in which this environment is created.
  final String projectId;

  /// The provider of this Amazon DataZone environment.
  final String provider;

  /// The ID of the Amazon Web Services account where the environment exists.
  final String? awsAccountId;

  /// The Amazon Web Services region where the environment exists.
  final String? awsAccountRegion;

  /// The timestamp of when the environment was created.
  final DateTime? createdAt;

  /// The deployment properties of the environment.
  final DeploymentProperties? deploymentProperties;

  /// The description of the environment.
  final String? description;

  /// The actions of the environment.
  final List<ConfigurableEnvironmentAction>? environmentActions;

  /// The blueprint with which the environment is created.
  final String? environmentBlueprintId;

  /// The business glossary terms that can be used in this environment.
  final List<String>? glossaryTerms;

  /// The ID of the environment.
  final String? id;

  /// The details of the last deployment of the environment.
  final Deployment? lastDeployment;

  /// The provisioned resources of this Amazon DataZone environment.
  final List<Resource>? provisionedResources;

  /// The provisioning properties of this Amazon DataZone environment.
  final ProvisioningProperties? provisioningProperties;

  /// The status of this Amazon DataZone environment.
  final EnvironmentStatus? status;

  /// The timestamp of when this environment was updated.
  final DateTime? updatedAt;

  /// The user parameters of this Amazon DataZone environment.
  final List<CustomParameter>? userParameters;

  GetEnvironmentOutput({
    required this.createdBy,
    required this.domainId,
    required this.environmentProfileId,
    required this.name,
    required this.projectId,
    required this.provider,
    this.awsAccountId,
    this.awsAccountRegion,
    this.createdAt,
    this.deploymentProperties,
    this.description,
    this.environmentActions,
    this.environmentBlueprintId,
    this.glossaryTerms,
    this.id,
    this.lastDeployment,
    this.provisionedResources,
    this.provisioningProperties,
    this.status,
    this.updatedAt,
    this.userParameters,
  });

  factory GetEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentProfileId: json['environmentProfileId'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      provider: json['provider'] as String,
      awsAccountId: json['awsAccountId'] as String?,
      awsAccountRegion: json['awsAccountRegion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deploymentProperties: json['deploymentProperties'] != null
          ? DeploymentProperties.fromJson(
              json['deploymentProperties'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      environmentActions: (json['environmentActions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConfigurableEnvironmentAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentBlueprintId: json['environmentBlueprintId'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      lastDeployment: json['lastDeployment'] != null
          ? Deployment.fromJson(json['lastDeployment'] as Map<String, dynamic>)
          : null,
      provisionedResources: (json['provisionedResources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisioningProperties: json['provisioningProperties'] != null
          ? ProvisioningProperties.fromJson(
              json['provisioningProperties'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      userParameters: (json['userParameters'] as List?)
          ?.whereNotNull()
          .map((e) => CustomParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentProfileId = this.environmentProfileId;
    final name = this.name;
    final projectId = this.projectId;
    final provider = this.provider;
    final awsAccountId = this.awsAccountId;
    final awsAccountRegion = this.awsAccountRegion;
    final createdAt = this.createdAt;
    final deploymentProperties = this.deploymentProperties;
    final description = this.description;
    final environmentActions = this.environmentActions;
    final environmentBlueprintId = this.environmentBlueprintId;
    final glossaryTerms = this.glossaryTerms;
    final id = this.id;
    final lastDeployment = this.lastDeployment;
    final provisionedResources = this.provisionedResources;
    final provisioningProperties = this.provisioningProperties;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final userParameters = this.userParameters;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentProfileId': environmentProfileId,
      'name': name,
      'projectId': projectId,
      'provider': provider,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (deploymentProperties != null)
        'deploymentProperties': deploymentProperties,
      if (description != null) 'description': description,
      if (environmentActions != null) 'environmentActions': environmentActions,
      if (environmentBlueprintId != null)
        'environmentBlueprintId': environmentBlueprintId,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (id != null) 'id': id,
      if (lastDeployment != null) 'lastDeployment': lastDeployment,
      if (provisionedResources != null)
        'provisionedResources': provisionedResources,
      if (provisioningProperties != null)
        'provisioningProperties': provisioningProperties,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (userParameters != null) 'userParameters': userParameters,
    };
  }
}

class GetEnvironmentProfileOutput {
  /// The Amazon DataZone user who created this environment profile.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which this environment profile
  /// exists.
  final String domainId;

  /// The ID of the blueprint with which this environment profile is created.
  final String environmentBlueprintId;

  /// The ID of the environment profile.
  final String id;

  /// The name of the environment profile.
  final String name;

  /// The ID of the Amazon Web Services account where this environment profile
  /// exists.
  final String? awsAccountId;

  /// The Amazon Web Services region where this environment profile exists.
  final String? awsAccountRegion;

  /// The timestamp of when this environment profile was created.
  final DateTime? createdAt;

  /// The description of the environment profile.
  final String? description;

  /// The ID of the Amazon DataZone project in which this environment profile is
  /// created.
  final String? projectId;

  /// The timestamp of when this environment profile was upated.
  final DateTime? updatedAt;

  /// The user parameters of the environment profile.
  final List<CustomParameter>? userParameters;

  GetEnvironmentProfileOutput({
    required this.createdBy,
    required this.domainId,
    required this.environmentBlueprintId,
    required this.id,
    required this.name,
    this.awsAccountId,
    this.awsAccountRegion,
    this.createdAt,
    this.description,
    this.projectId,
    this.updatedAt,
    this.userParameters,
  });

  factory GetEnvironmentProfileOutput.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentProfileOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentBlueprintId: json['environmentBlueprintId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      awsAccountId: json['awsAccountId'] as String?,
      awsAccountRegion: json['awsAccountRegion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      projectId: json['projectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      userParameters: (json['userParameters'] as List?)
          ?.whereNotNull()
          .map((e) => CustomParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentBlueprintId = this.environmentBlueprintId;
    final id = this.id;
    final name = this.name;
    final awsAccountId = this.awsAccountId;
    final awsAccountRegion = this.awsAccountRegion;
    final createdAt = this.createdAt;
    final description = this.description;
    final projectId = this.projectId;
    final updatedAt = this.updatedAt;
    final userParameters = this.userParameters;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentBlueprintId': environmentBlueprintId,
      'id': id,
      'name': name,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (projectId != null) 'projectId': projectId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (userParameters != null) 'userParameters': userParameters,
    };
  }
}

class GetFormTypeOutput {
  /// The ID of the Amazon DataZone domain in which this metadata form type
  /// exists.
  final String domainId;

  /// The model of the metadata form type.
  final Model model;

  /// The name of the metadata form type.
  final String name;

  /// The revision of the metadata form type.
  final String revision;

  /// The timestamp of when this metadata form type was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created this metadata form type.
  final String? createdBy;

  /// The description of the metadata form type.
  final String? description;

  /// The imports of the metadata form type.
  final List<Import>? imports;

  /// The ID of the Amazon DataZone domain in which the metadata form type was
  /// originally created.
  final String? originDomainId;

  /// The ID of the project in which this metadata form type was originally
  /// created.
  final String? originProjectId;

  /// The ID of the project that owns this metadata form type.
  final String? owningProjectId;

  /// The status of the metadata form type.
  final FormTypeStatus? status;

  GetFormTypeOutput({
    required this.domainId,
    required this.model,
    required this.name,
    required this.revision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.imports,
    this.originDomainId,
    this.originProjectId,
    this.owningProjectId,
    this.status,
  });

  factory GetFormTypeOutput.fromJson(Map<String, dynamic> json) {
    return GetFormTypeOutput(
      domainId: json['domainId'] as String,
      model: Model.fromJson(json['model'] as Map<String, dynamic>),
      name: json['name'] as String,
      revision: json['revision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      imports: (json['imports'] as List?)
          ?.whereNotNull()
          .map((e) => Import.fromJson(e as Map<String, dynamic>))
          .toList(),
      originDomainId: json['originDomainId'] as String?,
      originProjectId: json['originProjectId'] as String?,
      owningProjectId: json['owningProjectId'] as String?,
      status: (json['status'] as String?)?.toFormTypeStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final model = this.model;
    final name = this.name;
    final revision = this.revision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final imports = this.imports;
    final originDomainId = this.originDomainId;
    final originProjectId = this.originProjectId;
    final owningProjectId = this.owningProjectId;
    final status = this.status;
    return {
      'domainId': domainId,
      'model': model,
      'name': name,
      'revision': revision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (imports != null) 'imports': imports,
      if (originDomainId != null) 'originDomainId': originDomainId,
      if (originProjectId != null) 'originProjectId': originProjectId,
      if (owningProjectId != null) 'owningProjectId': owningProjectId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetGlossaryOutput {
  /// The ID of the Amazon DataZone domain in which this business glossary exists.
  final String domainId;

  /// The ID of the business glossary.
  final String id;

  /// The name of the business glossary.
  final String name;

  /// The ID of the project that owns this business glossary.
  final String owningProjectId;

  /// The status of the business glossary.
  final GlossaryStatus status;

  /// The timestamp of when this business glossary was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created this business glossary.
  final String? createdBy;

  /// The description of the business glossary.
  final String? description;

  /// The timestamp of when the business glossary was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the business glossary.
  final String? updatedBy;

  GetGlossaryOutput({
    required this.domainId,
    required this.id,
    required this.name,
    required this.owningProjectId,
    required this.status,
    this.createdAt,
    this.createdBy,
    this.description,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetGlossaryOutput.fromJson(Map<String, dynamic> json) {
    return GetGlossaryOutput(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      status: (json['status'] as String).toGlossaryStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final status = this.status;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'id': id,
      'name': name,
      'owningProjectId': owningProjectId,
      'status': status.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetGlossaryTermOutput {
  /// The ID of the Amazon DataZone domain in which this business glossary term
  /// exists.
  final String domainId;

  /// The ID of the business glossary to which this term belongs.
  final String glossaryId;

  /// The ID of the business glossary term.
  final String id;

  /// The name of the business glossary term.
  final String name;

  /// The status of the business glossary term.
  final GlossaryTermStatus status;

  /// The timestamp of when the business glossary term was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the business glossary.
  final String? createdBy;

  /// The long description of the business glossary term.
  final String? longDescription;

  /// The short decription of the business glossary term.
  final String? shortDescription;

  /// The relations of the business glossary term.
  final TermRelations? termRelations;

  /// The timestamp of when the business glossary term was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the business glossary term.
  final String? updatedBy;

  GetGlossaryTermOutput({
    required this.domainId,
    required this.glossaryId,
    required this.id,
    required this.name,
    required this.status,
    this.createdAt,
    this.createdBy,
    this.longDescription,
    this.shortDescription,
    this.termRelations,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetGlossaryTermOutput.fromJson(Map<String, dynamic> json) {
    return GetGlossaryTermOutput(
      domainId: json['domainId'] as String,
      glossaryId: json['glossaryId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toGlossaryTermStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      longDescription: json['longDescription'] as String?,
      shortDescription: json['shortDescription'] as String?,
      termRelations: json['termRelations'] != null
          ? TermRelations.fromJson(
              json['termRelations'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final glossaryId = this.glossaryId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final longDescription = this.longDescription;
    final shortDescription = this.shortDescription;
    final termRelations = this.termRelations;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'glossaryId': glossaryId,
      'id': id,
      'name': name,
      'status': status.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (longDescription != null) 'longDescription': longDescription,
      if (shortDescription != null) 'shortDescription': shortDescription,
      if (termRelations != null) 'termRelations': termRelations,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetGroupProfileOutput {
  /// The identifier of the Amazon DataZone domain in which the group profile
  /// exists.
  final String? domainId;

  /// The name of the group for which the specified group profile exists.
  final String? groupName;

  /// The identifier of the group profile.
  final String? id;

  /// The identifier of the group profile.
  final GroupProfileStatus? status;

  GetGroupProfileOutput({
    this.domainId,
    this.groupName,
    this.id,
    this.status,
  });

  factory GetGroupProfileOutput.fromJson(Map<String, dynamic> json) {
    return GetGroupProfileOutput(
      domainId: json['domainId'] as String?,
      groupName: json['groupName'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toGroupProfileStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final groupName = this.groupName;
    final id = this.id;
    final status = this.status;
    return {
      if (domainId != null) 'domainId': domainId,
      if (groupName != null) 'groupName': groupName,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetIamPortalLoginUrlOutput {
  /// The ID of the user profile.
  final String userProfileId;

  /// The data portal URL of the specified Amazon DataZone domain.
  final String? authCodeUrl;

  GetIamPortalLoginUrlOutput({
    required this.userProfileId,
    this.authCodeUrl,
  });

  factory GetIamPortalLoginUrlOutput.fromJson(Map<String, dynamic> json) {
    return GetIamPortalLoginUrlOutput(
      userProfileId: json['userProfileId'] as String,
      authCodeUrl: json['authCodeUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userProfileId = this.userProfileId;
    final authCodeUrl = this.authCodeUrl;
    return {
      'userProfileId': userProfileId,
      if (authCodeUrl != null) 'authCodeUrl': authCodeUrl,
    };
  }
}

class GetListingOutput {
  /// The ID of the Amazon DataZone domain.
  final String domainId;

  /// The ID of the listing.
  final String id;

  /// The revision of a listing.
  final String listingRevision;

  /// The timestamp of when the listing was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the listing.
  final String? createdBy;

  /// The description of the listing.
  final String? description;

  /// The details of a listing.
  final ListingItem? item;

  /// The name of the listing.
  final String? name;

  /// The status of the listing.
  final ListingStatus? status;

  /// The timestamp of when the listing was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the listing.
  final String? updatedBy;

  GetListingOutput({
    required this.domainId,
    required this.id,
    required this.listingRevision,
    this.createdAt,
    this.createdBy,
    this.description,
    this.item,
    this.name,
    this.status,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetListingOutput.fromJson(Map<String, dynamic> json) {
    return GetListingOutput(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      listingRevision: json['listingRevision'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      item: json['item'] != null
          ? ListingItem.fromJson(json['item'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toListingStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final listingRevision = this.listingRevision;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final item = this.item;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'id': id,
      'listingRevision': listingRevision,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (item != null) 'item': item,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetMetadataGenerationRunOutput {
  /// The ID of the Amazon DataZone domain the metadata generation run of which
  /// you want to get.
  final String domainId;

  /// The ID of the metadata generation run.
  final String id;

  /// The ID of the project that owns the assets for which you're running metadata
  /// generation.
  final String owningProjectId;

  /// The timestamp of when the metadata generation run was start.
  final DateTime? createdAt;

  /// The Amazon DataZone user who started the metadata generation run.
  final String? createdBy;

  /// The status of the metadata generation run.
  final MetadataGenerationRunStatus? status;

  /// The asset for which you're generating metadata.
  final MetadataGenerationRunTarget? target;

  /// The type of metadata generation run.
  final MetadataGenerationRunType? type;

  GetMetadataGenerationRunOutput({
    required this.domainId,
    required this.id,
    required this.owningProjectId,
    this.createdAt,
    this.createdBy,
    this.status,
    this.target,
    this.type,
  });

  factory GetMetadataGenerationRunOutput.fromJson(Map<String, dynamic> json) {
    return GetMetadataGenerationRunOutput(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      owningProjectId: json['owningProjectId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      status: (json['status'] as String?)?.toMetadataGenerationRunStatus(),
      target: json['target'] != null
          ? MetadataGenerationRunTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toMetadataGenerationRunType(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final owningProjectId = this.owningProjectId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final status = this.status;
    final target = this.target;
    final type = this.type;
    return {
      'domainId': domainId,
      'id': id,
      'owningProjectId': owningProjectId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (status != null) 'status': status.toValue(),
      if (target != null) 'target': target,
      if (type != null) 'type': type.toValue(),
    };
  }
}

class GetProjectOutput {
  /// The Amazon DataZone user who created the project.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which the project exists.
  final String domainId;

  /// &gt;The ID of the project.
  final String id;

  /// The name of the project.
  final String name;

  /// The timestamp of when the project was created.
  final DateTime? createdAt;

  /// The description of the project.
  final String? description;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final List<ProjectDeletionError>? failureReasons;

  /// The business glossary terms that can be used in the project.
  final List<String>? glossaryTerms;

  /// The timestamp of when the project was last updated.
  final DateTime? lastUpdatedAt;

  /// The status of the project.
  final ProjectStatus? projectStatus;

  GetProjectOutput({
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.name,
    this.createdAt,
    this.description,
    this.failureReasons,
    this.glossaryTerms,
    this.lastUpdatedAt,
    this.projectStatus,
  });

  factory GetProjectOutput.fromJson(Map<String, dynamic> json) {
    return GetProjectOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectDeletionError.fromJson(e as Map<String, dynamic>))
          .toList(),
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      projectStatus: (json['projectStatus'] as String?)?.toProjectStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final createdAt = this.createdAt;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final glossaryTerms = this.glossaryTerms;
    final lastUpdatedAt = this.lastUpdatedAt;
    final projectStatus = this.projectStatus;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'name': name,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (projectStatus != null) 'projectStatus': projectStatus.toValue(),
    };
  }
}

class GetSubscriptionGrantOutput {
  /// The timestamp of when the subscription grant is created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription grant.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which the subscription grant exists.
  final String domainId;

  /// The entity to which the subscription is granted.
  final GrantedEntity grantedEntity;

  /// The ID of the subscription grant.
  final String id;

  /// The status of the subscription grant.
  final SubscriptionGrantOverallStatus status;

  /// The subscription target ID associated with the subscription grant.
  final String subscriptionTargetId;

  /// The timestamp of when the subscription grant was upated.
  final DateTime updatedAt;

  /// The assets for which the subscription grant is created.
  final List<SubscribedAsset>? assets;

  /// The identifier of the subscription.
  final String? subscriptionId;

  /// The Amazon DataZone user who updated the subscription grant.
  final String? updatedBy;

  GetSubscriptionGrantOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.grantedEntity,
    required this.id,
    required this.status,
    required this.subscriptionTargetId,
    required this.updatedAt,
    this.assets,
    this.subscriptionId,
    this.updatedBy,
  });

  factory GetSubscriptionGrantOutput.fromJson(Map<String, dynamic> json) {
    return GetSubscriptionGrantOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      grantedEntity:
          GrantedEntity.fromJson(json['grantedEntity'] as Map<String, dynamic>),
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionGrantOverallStatus(),
      subscriptionTargetId: json['subscriptionTargetId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      assets: (json['assets'] as List?)
          ?.whereNotNull()
          .map((e) => SubscribedAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionId: json['subscriptionId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final grantedEntity = this.grantedEntity;
    final id = this.id;
    final status = this.status;
    final subscriptionTargetId = this.subscriptionTargetId;
    final updatedAt = this.updatedAt;
    final assets = this.assets;
    final subscriptionId = this.subscriptionId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'grantedEntity': grantedEntity,
      'id': id,
      'status': status.toValue(),
      'subscriptionTargetId': subscriptionTargetId,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (assets != null) 'assets': assets,
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetSubscriptionOutput {
  /// The timestamp of when the subscription was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which the subscription exists.
  final String domainId;

  /// The ID of the subscription.
  final String id;

  /// The status of the subscription.
  final SubscriptionStatus status;

  /// The details of the published asset for which the subscription grant is
  /// created.
  final SubscribedListing subscribedListing;

  /// The principal that owns the subscription.
  final SubscribedPrincipal subscribedPrincipal;

  /// The timestamp of when the subscription was updated.
  final DateTime updatedAt;

  /// The retain permissions of the subscription.
  final bool? retainPermissions;

  /// The ID of the subscription request.
  final String? subscriptionRequestId;

  /// The Amazon DataZone user who updated the subscription.
  final String? updatedBy;

  GetSubscriptionOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.status,
    required this.subscribedListing,
    required this.subscribedPrincipal,
    required this.updatedAt,
    this.retainPermissions,
    this.subscriptionRequestId,
    this.updatedBy,
  });

  factory GetSubscriptionOutput.fromJson(Map<String, dynamic> json) {
    return GetSubscriptionOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionStatus(),
      subscribedListing: SubscribedListing.fromJson(
          json['subscribedListing'] as Map<String, dynamic>),
      subscribedPrincipal: SubscribedPrincipal.fromJson(
          json['subscribedPrincipal'] as Map<String, dynamic>),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      retainPermissions: json['retainPermissions'] as bool?,
      subscriptionRequestId: json['subscriptionRequestId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final status = this.status;
    final subscribedListing = this.subscribedListing;
    final subscribedPrincipal = this.subscribedPrincipal;
    final updatedAt = this.updatedAt;
    final retainPermissions = this.retainPermissions;
    final subscriptionRequestId = this.subscriptionRequestId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'status': status.toValue(),
      'subscribedListing': subscribedListing,
      'subscribedPrincipal': subscribedPrincipal,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (retainPermissions != null) 'retainPermissions': retainPermissions,
      if (subscriptionRequestId != null)
        'subscriptionRequestId': subscriptionRequestId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetSubscriptionRequestDetailsOutput {
  /// The timestamp of when the specified subscription request was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription request.
  final String createdBy;

  /// The Amazon DataZone domain of the subscription request.
  final String domainId;

  /// The identifier of the subscription request.
  final String id;

  /// The reason for the subscription request.
  final String requestReason;

  /// The status of the subscription request.
  final SubscriptionRequestStatus status;

  /// The subscribed listings in the subscription request.
  final List<SubscribedListing> subscribedListings;

  /// The subscribed principals in the subscription request.
  final List<SubscribedPrincipal> subscribedPrincipals;

  /// The timestamp of when the subscription request was updated.
  final DateTime updatedAt;

  /// The decision comment of the subscription request.
  final String? decisionComment;

  /// The identifier of the Amazon DataZone user who reviewed the subscription
  /// request.
  final String? reviewerId;

  /// The Amazon DataZone user who updated the subscription request.
  final String? updatedBy;

  GetSubscriptionRequestDetailsOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.requestReason,
    required this.status,
    required this.subscribedListings,
    required this.subscribedPrincipals,
    required this.updatedAt,
    this.decisionComment,
    this.reviewerId,
    this.updatedBy,
  });

  factory GetSubscriptionRequestDetailsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetSubscriptionRequestDetailsOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      requestReason: json['requestReason'] as String,
      status: (json['status'] as String).toSubscriptionRequestStatus(),
      subscribedListings: (json['subscribedListings'] as List)
          .whereNotNull()
          .map((e) => SubscribedListing.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscribedPrincipals: (json['subscribedPrincipals'] as List)
          .whereNotNull()
          .map((e) => SubscribedPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      decisionComment: json['decisionComment'] as String?,
      reviewerId: json['reviewerId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final requestReason = this.requestReason;
    final status = this.status;
    final subscribedListings = this.subscribedListings;
    final subscribedPrincipals = this.subscribedPrincipals;
    final updatedAt = this.updatedAt;
    final decisionComment = this.decisionComment;
    final reviewerId = this.reviewerId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'requestReason': requestReason,
      'status': status.toValue(),
      'subscribedListings': subscribedListings,
      'subscribedPrincipals': subscribedPrincipals,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (decisionComment != null) 'decisionComment': decisionComment,
      if (reviewerId != null) 'reviewerId': reviewerId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetSubscriptionTargetOutput {
  /// The asset types associated with the subscription target.
  final List<String> applicableAssetTypes;

  /// The authorized principals of the subscription target.
  final List<String> authorizedPrincipals;

  /// The timestamp of when the subscription target was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription target.
  final String createdBy;

  /// The ID of the Amazon DataZone domain in which the subscription target
  /// exists.
  final String domainId;

  /// The ID of the environment associated with the subscription target.
  final String environmentId;

  /// The ID of the subscription target.
  final String id;

  /// The manage access role with which the subscription target was created.
  final String manageAccessRole;

  /// The name of the subscription target.
  final String name;

  /// The ID of the project associated with the subscription target.
  final String projectId;

  /// The provider of the subscription target.
  final String provider;

  /// The configuration of teh subscription target.
  final List<SubscriptionTargetForm> subscriptionTargetConfig;

  /// The type of the subscription target.
  final String type;

  /// The timestamp of when the subscription target was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the subscription target.
  final String? updatedBy;

  GetSubscriptionTargetOutput({
    required this.applicableAssetTypes,
    required this.authorizedPrincipals,
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.environmentId,
    required this.id,
    required this.manageAccessRole,
    required this.name,
    required this.projectId,
    required this.provider,
    required this.subscriptionTargetConfig,
    required this.type,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetSubscriptionTargetOutput.fromJson(Map<String, dynamic> json) {
    return GetSubscriptionTargetOutput(
      applicableAssetTypes: (json['applicableAssetTypes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      authorizedPrincipals: (json['authorizedPrincipals'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      id: json['id'] as String,
      manageAccessRole: json['manageAccessRole'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      provider: json['provider'] as String,
      subscriptionTargetConfig: (json['subscriptionTargetConfig'] as List)
          .whereNotNull()
          .map(
              (e) => SubscriptionTargetForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicableAssetTypes = this.applicableAssetTypes;
    final authorizedPrincipals = this.authorizedPrincipals;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final id = this.id;
    final manageAccessRole = this.manageAccessRole;
    final name = this.name;
    final projectId = this.projectId;
    final provider = this.provider;
    final subscriptionTargetConfig = this.subscriptionTargetConfig;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'applicableAssetTypes': applicableAssetTypes,
      'authorizedPrincipals': authorizedPrincipals,
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentId': environmentId,
      'id': id,
      'manageAccessRole': manageAccessRole,
      'name': name,
      'projectId': projectId,
      'provider': provider,
      'subscriptionTargetConfig': subscriptionTargetConfig,
      'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetTimeSeriesDataPointOutput {
  /// The ID of the Amazon DataZone domain that houses the asset data point that
  /// you want to get.
  final String? domainId;

  /// The ID of the asset for which you want to get the data point.
  final String? entityId;

  /// The type of the asset for which you want to get the data point.
  final TimeSeriesEntityType? entityType;

  /// The time series form that houses the data point that you want to get.
  final TimeSeriesDataPointFormOutput? form;

  /// The name of the time series form that houses the data point that you want to
  /// get.
  final String? formName;

  GetTimeSeriesDataPointOutput({
    this.domainId,
    this.entityId,
    this.entityType,
    this.form,
    this.formName,
  });

  factory GetTimeSeriesDataPointOutput.fromJson(Map<String, dynamic> json) {
    return GetTimeSeriesDataPointOutput(
      domainId: json['domainId'] as String?,
      entityId: json['entityId'] as String?,
      entityType: (json['entityType'] as String?)?.toTimeSeriesEntityType(),
      form: json['form'] != null
          ? TimeSeriesDataPointFormOutput.fromJson(
              json['form'] as Map<String, dynamic>)
          : null,
      formName: json['formName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final entityId = this.entityId;
    final entityType = this.entityType;
    final form = this.form;
    final formName = this.formName;
    return {
      if (domainId != null) 'domainId': domainId,
      if (entityId != null) 'entityId': entityId,
      if (entityType != null) 'entityType': entityType.toValue(),
      if (form != null) 'form': form,
      if (formName != null) 'formName': formName,
    };
  }
}

class GetUserProfileOutput {
  final UserProfileDetails? details;

  /// the identifier of the Amazon DataZone domain of which you want to get the
  /// user profile.
  final String? domainId;

  /// The identifier of the user profile.
  final String? id;

  /// The status of the user profile.
  final UserProfileStatus? status;

  /// The type of the user profile.
  final UserProfileType? type;

  GetUserProfileOutput({
    this.details,
    this.domainId,
    this.id,
    this.status,
    this.type,
  });

  factory GetUserProfileOutput.fromJson(Map<String, dynamic> json) {
    return GetUserProfileOutput(
      details: json['details'] != null
          ? UserProfileDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
      domainId: json['domainId'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toUserProfileStatus(),
      type: (json['type'] as String?)?.toUserProfileType(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final domainId = this.domainId;
    final id = this.id;
    final status = this.status;
    final type = this.type;
    return {
      if (details != null) 'details': details,
      if (domainId != null) 'domainId': domainId,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// The details of a business glossary.
class GlossaryItem {
  /// The identifier of the Amazon DataZone domain in which the business glossary
  /// exists.
  final String domainId;

  /// The identifier of the glossary.
  final String id;

  /// The name of the glossary.
  final String name;

  /// The identifier of the project that owns the business glosary.
  final String owningProjectId;

  /// The business glossary status.
  final GlossaryStatus status;

  /// The timestamp of when the glossary was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the glossary.
  final String? createdBy;

  /// The business glossary description.
  final String? description;

  /// The timestamp of when the business glossary was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the business glossary.
  final String? updatedBy;

  GlossaryItem({
    required this.domainId,
    required this.id,
    required this.name,
    required this.owningProjectId,
    required this.status,
    this.createdAt,
    this.createdBy,
    this.description,
    this.updatedAt,
    this.updatedBy,
  });

  factory GlossaryItem.fromJson(Map<String, dynamic> json) {
    return GlossaryItem(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      status: (json['status'] as String).toGlossaryStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final status = this.status;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'id': id,
      'name': name,
      'owningProjectId': owningProjectId,
      'status': status.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum GlossaryStatus {
  disabled,
  enabled,
}

extension GlossaryStatusValueExtension on GlossaryStatus {
  String toValue() {
    switch (this) {
      case GlossaryStatus.disabled:
        return 'DISABLED';
      case GlossaryStatus.enabled:
        return 'ENABLED';
    }
  }
}

extension GlossaryStatusFromString on String {
  GlossaryStatus toGlossaryStatus() {
    switch (this) {
      case 'DISABLED':
        return GlossaryStatus.disabled;
      case 'ENABLED':
        return GlossaryStatus.enabled;
    }
    throw Exception('$this is not known in enum GlossaryStatus');
  }
}

/// The details of a business glossary term.
class GlossaryTermItem {
  /// The identifier of the Amazon DataZone domain in which the business glossary
  /// exists.
  final String domainId;

  /// The identifier of the business glossary to which the term belongs.
  final String glossaryId;

  /// The identifier of the business glossary term.
  final String id;

  /// The name of the business glossary term.
  final String name;

  /// The status of the business glossary term.
  final GlossaryTermStatus status;

  /// The timestamp of when a business glossary term was created.
  final DateTime? createdAt;

  /// The Amazon DataZone user who created the business glossary.
  final String? createdBy;

  /// The long description of the business glossary term.
  final String? longDescription;

  /// The short description of the business glossary term.
  final String? shortDescription;

  /// The relations of the business glossary term.
  final TermRelations? termRelations;

  /// The timestamp of when a business glossary term was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the business glossary term.
  final String? updatedBy;

  GlossaryTermItem({
    required this.domainId,
    required this.glossaryId,
    required this.id,
    required this.name,
    required this.status,
    this.createdAt,
    this.createdBy,
    this.longDescription,
    this.shortDescription,
    this.termRelations,
    this.updatedAt,
    this.updatedBy,
  });

  factory GlossaryTermItem.fromJson(Map<String, dynamic> json) {
    return GlossaryTermItem(
      domainId: json['domainId'] as String,
      glossaryId: json['glossaryId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toGlossaryTermStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      longDescription: json['longDescription'] as String?,
      shortDescription: json['shortDescription'] as String?,
      termRelations: json['termRelations'] != null
          ? TermRelations.fromJson(
              json['termRelations'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final glossaryId = this.glossaryId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final longDescription = this.longDescription;
    final shortDescription = this.shortDescription;
    final termRelations = this.termRelations;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'domainId': domainId,
      'glossaryId': glossaryId,
      'id': id,
      'name': name,
      'status': status.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (longDescription != null) 'longDescription': longDescription,
      if (shortDescription != null) 'shortDescription': shortDescription,
      if (termRelations != null) 'termRelations': termRelations,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum GlossaryTermStatus {
  enabled,
  disabled,
}

extension GlossaryTermStatusValueExtension on GlossaryTermStatus {
  String toValue() {
    switch (this) {
      case GlossaryTermStatus.enabled:
        return 'ENABLED';
      case GlossaryTermStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension GlossaryTermStatusFromString on String {
  GlossaryTermStatus toGlossaryTermStatus() {
    switch (this) {
      case 'ENABLED':
        return GlossaryTermStatus.enabled;
      case 'DISABLED':
        return GlossaryTermStatus.disabled;
    }
    throw Exception('$this is not known in enum GlossaryTermStatus');
  }
}

/// The configuration details of the Amazon Web Services Glue data source.
class GlueRunConfigurationInput {
  /// The relational filter configurations included in the configuration details
  /// of the Amazon Web Services Glue data source.
  final List<RelationalFilterConfiguration> relationalFilterConfigurations;

  /// Specifies whether to automatically import data quality metrics as part of
  /// the data source run.
  final bool? autoImportDataQualityResult;

  /// The data access role included in the configuration details of the Amazon Web
  /// Services Glue data source.
  final String? dataAccessRole;

  GlueRunConfigurationInput({
    required this.relationalFilterConfigurations,
    this.autoImportDataQualityResult,
    this.dataAccessRole,
  });

  Map<String, dynamic> toJson() {
    final relationalFilterConfigurations = this.relationalFilterConfigurations;
    final autoImportDataQualityResult = this.autoImportDataQualityResult;
    final dataAccessRole = this.dataAccessRole;
    return {
      'relationalFilterConfigurations': relationalFilterConfigurations,
      if (autoImportDataQualityResult != null)
        'autoImportDataQualityResult': autoImportDataQualityResult,
      if (dataAccessRole != null) 'dataAccessRole': dataAccessRole,
    };
  }
}

/// The configuration details of the Amazon Web Services Glue data source.
class GlueRunConfigurationOutput {
  /// The relational filter configurations included in the configuration details
  /// of the Amazon Web Services Glue data source.
  final List<RelationalFilterConfiguration> relationalFilterConfigurations;

  /// The Amazon Web Services account ID included in the configuration details of
  /// the Amazon Web Services Glue data source.
  final String? accountId;

  /// Specifies whether to automatically import data quality metrics as part of
  /// the data source run.
  final bool? autoImportDataQualityResult;

  /// The data access role included in the configuration details of the Amazon Web
  /// Services Glue data source.
  final String? dataAccessRole;

  /// The Amazon Web Services region included in the configuration details of the
  /// Amazon Web Services Glue data source.
  final String? region;

  GlueRunConfigurationOutput({
    required this.relationalFilterConfigurations,
    this.accountId,
    this.autoImportDataQualityResult,
    this.dataAccessRole,
    this.region,
  });

  factory GlueRunConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return GlueRunConfigurationOutput(
      relationalFilterConfigurations: (json['relationalFilterConfigurations']
              as List)
          .whereNotNull()
          .map((e) =>
              RelationalFilterConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      accountId: json['accountId'] as String?,
      autoImportDataQualityResult: json['autoImportDataQualityResult'] as bool?,
      dataAccessRole: json['dataAccessRole'] as String?,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relationalFilterConfigurations = this.relationalFilterConfigurations;
    final accountId = this.accountId;
    final autoImportDataQualityResult = this.autoImportDataQualityResult;
    final dataAccessRole = this.dataAccessRole;
    final region = this.region;
    return {
      'relationalFilterConfigurations': relationalFilterConfigurations,
      if (accountId != null) 'accountId': accountId,
      if (autoImportDataQualityResult != null)
        'autoImportDataQualityResult': autoImportDataQualityResult,
      if (dataAccessRole != null) 'dataAccessRole': dataAccessRole,
      if (region != null) 'region': region,
    };
  }
}

/// The details of a listing for which a subscription is granted.
class GrantedEntity {
  /// The listing for which a subscription is granted.
  final ListingRevision? listing;

  GrantedEntity({
    this.listing,
  });

  factory GrantedEntity.fromJson(Map<String, dynamic> json) {
    return GrantedEntity(
      listing: json['listing'] != null
          ? ListingRevision.fromJson(json['listing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final listing = this.listing;
    return {
      if (listing != null) 'listing': listing,
    };
  }
}

/// The details of a listing for which a subscription is to be granted.
class GrantedEntityInput {
  /// The listing for which a subscription is to be granted.
  final ListingRevisionInput? listing;

  GrantedEntityInput({
    this.listing,
  });

  Map<String, dynamic> toJson() {
    final listing = this.listing;
    return {
      if (listing != null) 'listing': listing,
    };
  }
}

/// The details of a group in Amazon DataZone.
class GroupDetails {
  /// The identifier of the group in Amazon DataZone.
  final String groupId;

  GroupDetails({
    required this.groupId,
  });

  factory GroupDetails.fromJson(Map<String, dynamic> json) {
    return GroupDetails(
      groupId: json['groupId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    return {
      'groupId': groupId,
    };
  }
}

enum GroupProfileStatus {
  assigned,
  notAssigned,
}

extension GroupProfileStatusValueExtension on GroupProfileStatus {
  String toValue() {
    switch (this) {
      case GroupProfileStatus.assigned:
        return 'ASSIGNED';
      case GroupProfileStatus.notAssigned:
        return 'NOT_ASSIGNED';
    }
  }
}

extension GroupProfileStatusFromString on String {
  GroupProfileStatus toGroupProfileStatus() {
    switch (this) {
      case 'ASSIGNED':
        return GroupProfileStatus.assigned;
      case 'NOT_ASSIGNED':
        return GroupProfileStatus.notAssigned;
    }
    throw Exception('$this is not known in enum GroupProfileStatus');
  }
}

/// The details of a group profile.
class GroupProfileSummary {
  /// The ID of the Amazon DataZone domain of a group profile.
  final String? domainId;

  /// The group name of a group profile.
  final String? groupName;

  /// The ID of a group profile.
  final String? id;

  /// The status of a group profile.
  final GroupProfileStatus? status;

  GroupProfileSummary({
    this.domainId,
    this.groupName,
    this.id,
    this.status,
  });

  factory GroupProfileSummary.fromJson(Map<String, dynamic> json) {
    return GroupProfileSummary(
      domainId: json['domainId'] as String?,
      groupName: json['groupName'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toGroupProfileStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final groupName = this.groupName;
    final id = this.id;
    final status = this.status;
    return {
      if (domainId != null) 'domainId': domainId,
      if (groupName != null) 'groupName': groupName,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum GroupSearchType {
  ssoGroup,
  datazoneSsoGroup,
}

extension GroupSearchTypeValueExtension on GroupSearchType {
  String toValue() {
    switch (this) {
      case GroupSearchType.ssoGroup:
        return 'SSO_GROUP';
      case GroupSearchType.datazoneSsoGroup:
        return 'DATAZONE_SSO_GROUP';
    }
  }
}

extension GroupSearchTypeFromString on String {
  GroupSearchType toGroupSearchType() {
    switch (this) {
      case 'SSO_GROUP':
        return GroupSearchType.ssoGroup;
      case 'DATAZONE_SSO_GROUP':
        return GroupSearchType.datazoneSsoGroup;
    }
    throw Exception('$this is not known in enum GroupSearchType');
  }
}

/// The details of an IAM user profile in Amazon DataZone.
class IamUserProfileDetails {
  /// The ARN of an IAM user profile in Amazon DataZone.
  final String? arn;

  IamUserProfileDetails({
    this.arn,
  });

  factory IamUserProfileDetails.fromJson(Map<String, dynamic> json) {
    return IamUserProfileDetails(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

/// The details of the import of the metadata form type.
class Import {
  /// The name of the import.
  final String name;

  /// The revision of the import.
  final String revision;

  Import({
    required this.name,
    required this.revision,
  });

  factory Import.fromJson(Map<String, dynamic> json) {
    return Import(
      name: json['name'] as String,
      revision: json['revision'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final revision = this.revision;
    return {
      'name': name,
      'revision': revision,
    };
  }
}

enum InventorySearchScope {
  asset,
  glossary,
  glossaryTerm,
}

extension InventorySearchScopeValueExtension on InventorySearchScope {
  String toValue() {
    switch (this) {
      case InventorySearchScope.asset:
        return 'ASSET';
      case InventorySearchScope.glossary:
        return 'GLOSSARY';
      case InventorySearchScope.glossaryTerm:
        return 'GLOSSARY_TERM';
    }
  }
}

extension InventorySearchScopeFromString on String {
  InventorySearchScope toInventorySearchScope() {
    switch (this) {
      case 'ASSET':
        return InventorySearchScope.asset;
      case 'GLOSSARY':
        return InventorySearchScope.glossary;
      case 'GLOSSARY_TERM':
        return InventorySearchScope.glossaryTerm;
    }
    throw Exception('$this is not known in enum InventorySearchScope');
  }
}

class ListAssetRevisionsOutput {
  /// The results of the <code>ListAssetRevisions</code> action.
  final List<AssetRevision>? items;

  /// When the number of revisions is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of revisions, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListAssetRevisions</code> to list the next set of revisions.
  final String? nextToken;

  ListAssetRevisionsOutput({
    this.items,
    this.nextToken,
  });

  factory ListAssetRevisionsOutput.fromJson(Map<String, dynamic> json) {
    return ListAssetRevisionsOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => AssetRevision.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataSourceRunActivitiesOutput {
  /// The results of the <code>ListDataSourceRunActivities</code> action.
  final List<DataSourceRunActivity> items;

  /// When the number of activities is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of activities, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListDataSourceRunActivities</code> to list the next set of activities.
  final String? nextToken;

  ListDataSourceRunActivitiesOutput({
    required this.items,
    this.nextToken,
  });

  factory ListDataSourceRunActivitiesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListDataSourceRunActivitiesOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => DataSourceRunActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataSourceRunsOutput {
  /// The results of the <code>ListDataSourceRuns</code> action.
  final List<DataSourceRunSummary> items;

  /// When the number of runs is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of runs, the response
  /// includes a pagination token named <code>NextToken</code>. You can specify
  /// this <code>NextToken</code> value in a subsequent call to
  /// <code>ListDataSourceRuns</code> to list the next set of runs.
  final String? nextToken;

  ListDataSourceRunsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListDataSourceRunsOutput.fromJson(Map<String, dynamic> json) {
    return ListDataSourceRunsOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => DataSourceRunSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataSourcesOutput {
  /// The results of the <code>ListDataSources</code> action.
  final List<DataSourceSummary> items;

  /// When the number of data sources is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of data sources, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListDataSources</code> to list the next set of data sources.
  final String? nextToken;

  ListDataSourcesOutput({
    required this.items,
    this.nextToken,
  });

  factory ListDataSourcesOutput.fromJson(Map<String, dynamic> json) {
    return ListDataSourcesOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => DataSourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDomainsOutput {
  /// The results of the <code>ListDomains</code> action.
  final List<DomainSummary> items;

  /// When the number of domains is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of domains, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListDomains</code> to list the next set of domains.
  final String? nextToken;

  ListDomainsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListDomainsOutput.fromJson(Map<String, dynamic> json) {
    return ListDomainsOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentBlueprintConfigurationsOutput {
  /// The results of the <code>ListEnvironmentBlueprintConfigurations</code>
  /// action.
  final List<EnvironmentBlueprintConfigurationItem>? items;

  /// When the number of blueprint configurations is greater than the default
  /// value for the <code>MaxResults</code> parameter, or if you explicitly
  /// specify a value for <code>MaxResults</code> that is less than the number of
  /// configurations, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value in
  /// a subsequent call to <code>ListEnvironmentBlueprintConfigurations</code> to
  /// list the next set of configurations.
  final String? nextToken;

  ListEnvironmentBlueprintConfigurationsOutput({
    this.items,
    this.nextToken,
  });

  factory ListEnvironmentBlueprintConfigurationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListEnvironmentBlueprintConfigurationsOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentBlueprintConfigurationItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentBlueprintsOutput {
  /// The results of the <code>ListEnvironmentBlueprints</code> action.
  final List<EnvironmentBlueprintSummary> items;

  /// When the number of blueprints in the environment is greater than the default
  /// value for the <code>MaxResults</code> parameter, or if you explicitly
  /// specify a value for <code>MaxResults</code> that is less than the number of
  /// blueprints in the environment, the response includes a pagination token
  /// named <code>NextToken</code>. You can specify this <code>NextToken</code>
  /// value in a subsequent call to <code>ListEnvironmentBlueprints</code>to list
  /// the next set of blueprints.
  final String? nextToken;

  ListEnvironmentBlueprintsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListEnvironmentBlueprintsOutput.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentBlueprintsOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              EnvironmentBlueprintSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentProfilesOutput {
  /// The results of the <code>ListEnvironmentProfiles</code> action.
  final List<EnvironmentProfileSummary> items;

  /// When the number of environment profiles is greater than the default value
  /// for the <code>MaxResults</code> parameter, or if you explicitly specify a
  /// value for <code>MaxResults</code> that is less than the number of
  /// environment profiles, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value in
  /// a subsequent call to <code>ListEnvironmentProfiles</code> to list the next
  /// set of environment profiles.
  final String? nextToken;

  ListEnvironmentProfilesOutput({
    required this.items,
    this.nextToken,
  });

  factory ListEnvironmentProfilesOutput.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentProfilesOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              EnvironmentProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentsOutput {
  /// The results of the <code>ListEnvironments</code> action.
  final List<EnvironmentSummary> items;

  /// When the number of environments is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of environments, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListEnvironments</code> to list the next set of environments.
  final String? nextToken;

  ListEnvironmentsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListEnvironmentsOutput.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => EnvironmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListMetadataGenerationRunsOutput {
  /// The results of the ListMetadataGenerationRuns action.
  final List<MetadataGenerationRunItem>? items;

  /// When the number of metadata generation runs is greater than the default
  /// value for the MaxResults parameter, or if you explicitly specify a value for
  /// MaxResults that is less than the number of metadata generation runs, the
  /// response includes a pagination token named NextToken. You can specify this
  /// NextToken value in a subsequent call to ListMetadataGenerationRuns to list
  /// the next set of revisions.
  final String? nextToken;

  ListMetadataGenerationRunsOutput({
    this.items,
    this.nextToken,
  });

  factory ListMetadataGenerationRunsOutput.fromJson(Map<String, dynamic> json) {
    return ListMetadataGenerationRunsOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MetadataGenerationRunItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNotificationsOutput {
  /// When the number of notifications is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of notifications, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListNotifications</code> to list the next set of notifications.
  final String? nextToken;

  /// The results of the <code>ListNotifications</code> action.
  final List<NotificationOutput>? notifications;

  ListNotificationsOutput({
    this.nextToken,
    this.notifications,
  });

  factory ListNotificationsOutput.fromJson(Map<String, dynamic> json) {
    return ListNotificationsOutput(
      nextToken: json['nextToken'] as String?,
      notifications: (json['notifications'] as List?)
          ?.whereNotNull()
          .map((e) => NotificationOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notifications = this.notifications;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (notifications != null) 'notifications': notifications,
    };
  }
}

class ListProjectMembershipsOutput {
  /// The members of the project.
  final List<ProjectMember> members;

  /// When the number of memberships is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of memberships, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListProjectMemberships</code> to list the next set of memberships.
  final String? nextToken;

  ListProjectMembershipsOutput({
    required this.members,
    this.nextToken,
  });

  factory ListProjectMembershipsOutput.fromJson(Map<String, dynamic> json) {
    return ListProjectMembershipsOutput(
      members: (json['members'] as List)
          .whereNotNull()
          .map((e) => ProjectMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListProjectsOutput {
  /// The results of the <code>ListProjects</code> action.
  final List<ProjectSummary>? items;

  /// When the number of projects is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of projects, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListProjects</code> to list the next set of projects.
  final String? nextToken;

  ListProjectsOutput({
    this.items,
    this.nextToken,
  });

  factory ListProjectsOutput.fromJson(Map<String, dynamic> json) {
    return ListProjectsOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSubscriptionGrantsOutput {
  /// The results of the <code>ListSubscriptionGrants</code> action.
  final List<SubscriptionGrantSummary> items;

  /// When the number of subscription grants is greater than the default value for
  /// the <code>MaxResults</code> parameter, or if you explicitly specify a value
  /// for <code>MaxResults</code> that is less than the number of subscription
  /// grants, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value in
  /// a subsequent call to <code>ListSubscriptionGrants</code> to list the next
  /// set of subscription grants.
  final String? nextToken;

  ListSubscriptionGrantsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListSubscriptionGrantsOutput.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionGrantsOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              SubscriptionGrantSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSubscriptionRequestsOutput {
  /// The results of the <code>ListSubscriptionRequests</code> action.
  final List<SubscriptionRequestSummary> items;

  /// When the number of subscription requests is greater than the default value
  /// for the <code>MaxResults</code> parameter, or if you explicitly specify a
  /// value for <code>MaxResults</code> that is less than the number of
  /// subscription requests, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value in
  /// a subsequent call to <code>ListSubscriptionRequests</code> to list the next
  /// set of subscription requests.
  final String? nextToken;

  ListSubscriptionRequestsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListSubscriptionRequestsOutput.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionRequestsOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              SubscriptionRequestSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSubscriptionTargetsOutput {
  /// The results of the <code>ListSubscriptionTargets</code> action.
  final List<SubscriptionTargetSummary> items;

  /// When the number of subscription targets is greater than the default value
  /// for the <code>MaxResults</code> parameter, or if you explicitly specify a
  /// value for <code>MaxResults</code> that is less than the number of
  /// subscription targets, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value in
  /// a subsequent call to <code>ListSubscriptionTargets</code> to list the next
  /// set of subscription targets.
  final String? nextToken;

  ListSubscriptionTargetsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListSubscriptionTargetsOutput.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionTargetsOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              SubscriptionTargetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSubscriptionsOutput {
  /// The results of the <code>ListSubscriptions</code> action.
  final List<SubscriptionSummary> items;

  /// When the number of subscriptions is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of subscriptions, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>ListSubscriptions</code> to list the next set of subscriptions.
  final String? nextToken;

  ListSubscriptionsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListSubscriptionsOutput.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionsOutput(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => SubscriptionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags of the specified resource.
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

class ListTimeSeriesDataPointsOutput {
  /// The results of the ListTimeSeriesDataPoints action.
  final List<TimeSeriesDataPointSummaryFormOutput>? items;

  /// When the number of data points is greater than the default value for the
  /// MaxResults parameter, or if you explicitly specify a value for MaxResults
  /// that is less than the number of data points, the response includes a
  /// pagination token named NextToken. You can specify this NextToken value in a
  /// subsequent call to ListTimeSeriesDataPoints to list the next set of data
  /// points.
  final String? nextToken;

  ListTimeSeriesDataPointsOutput({
    this.items,
    this.nextToken,
  });

  factory ListTimeSeriesDataPointsOutput.fromJson(Map<String, dynamic> json) {
    return ListTimeSeriesDataPointsOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => TimeSeriesDataPointSummaryFormOutput.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The details of a listing (aka asset published in a Amazon DataZone catalog).
class ListingItem {
  /// An asset published in an Amazon DataZone catalog.
  final AssetListing? assetListing;

  ListingItem({
    this.assetListing,
  });

  factory ListingItem.fromJson(Map<String, dynamic> json) {
    return ListingItem(
      assetListing: json['assetListing'] != null
          ? AssetListing.fromJson(json['assetListing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetListing = this.assetListing;
    return {
      if (assetListing != null) 'assetListing': assetListing,
    };
  }
}

/// A revision of an asset published in a Amazon DataZone catalog.
class ListingRevision {
  /// An identifier of a revision of an asset published in a Amazon DataZone
  /// catalog.
  final String id;

  /// The details of a revision of an asset published in a Amazon DataZone
  /// catalog.
  final String revision;

  ListingRevision({
    required this.id,
    required this.revision,
  });

  factory ListingRevision.fromJson(Map<String, dynamic> json) {
    return ListingRevision(
      id: json['id'] as String,
      revision: json['revision'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final revision = this.revision;
    return {
      'id': id,
      'revision': revision,
    };
  }
}

/// A revision to be made to an asset published in a Amazon DataZone catalog.
class ListingRevisionInput {
  /// An identifier of revision to be made to an asset published in a Amazon
  /// DataZone catalog.
  final String identifier;

  /// The details of a revision to be made to an asset published in a Amazon
  /// DataZone catalog.
  final String revision;

  ListingRevisionInput({
    required this.identifier,
    required this.revision,
  });

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final revision = this.revision;
    return {
      'identifier': identifier,
      'revision': revision,
    };
  }
}

enum ListingStatus {
  creating,
  active,
  inactive,
}

extension ListingStatusValueExtension on ListingStatus {
  String toValue() {
    switch (this) {
      case ListingStatus.creating:
        return 'CREATING';
      case ListingStatus.active:
        return 'ACTIVE';
      case ListingStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension ListingStatusFromString on String {
  ListingStatus toListingStatus() {
    switch (this) {
      case 'CREATING':
        return ListingStatus.creating;
      case 'ACTIVE':
        return ListingStatus.active;
      case 'INACTIVE':
        return ListingStatus.inactive;
    }
    throw Exception('$this is not known in enum ListingStatus');
  }
}

/// The details about a project member.
class Member {
  /// The ID of the group of a project member.
  final String? groupIdentifier;

  /// The user ID of a project member.
  final String? userIdentifier;

  Member({
    this.groupIdentifier,
    this.userIdentifier,
  });

  Map<String, dynamic> toJson() {
    final groupIdentifier = this.groupIdentifier;
    final userIdentifier = this.userIdentifier;
    return {
      if (groupIdentifier != null) 'groupIdentifier': groupIdentifier,
      if (userIdentifier != null) 'userIdentifier': userIdentifier,
    };
  }
}

/// The details about a project member.
class MemberDetails {
  /// The group details of a project member.
  final GroupDetails? group;

  /// The user details of a project member.
  final UserDetails? user;

  MemberDetails({
    this.group,
    this.user,
  });

  factory MemberDetails.fromJson(Map<String, dynamic> json) {
    return MemberDetails(
      group: json['group'] != null
          ? GroupDetails.fromJson(json['group'] as Map<String, dynamic>)
          : null,
      user: json['user'] != null
          ? UserDetails.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final user = this.user;
    return {
      if (group != null) 'group': group,
      if (user != null) 'user': user,
    };
  }
}

/// The metadata generation run.
class MetadataGenerationRunItem {
  /// The ID of the Amazon DataZone domain in which the metadata generation run
  /// was created.
  final String domainId;

  /// The ID of the metadata generation run.
  final String id;

  /// The ID of the project that owns the asset for which the metadata generation
  /// was ran.
  final String owningProjectId;

  /// The timestamp at which the metadata generation run was created.
  final DateTime? createdAt;

  /// The user who created the metadata generation run.
  final String? createdBy;

  /// The status of the metadata generation run.
  final MetadataGenerationRunStatus? status;

  /// The asset for which metadata was generated.
  final MetadataGenerationRunTarget? target;

  /// The type of the metadata generation run.
  final MetadataGenerationRunType? type;

  MetadataGenerationRunItem({
    required this.domainId,
    required this.id,
    required this.owningProjectId,
    this.createdAt,
    this.createdBy,
    this.status,
    this.target,
    this.type,
  });

  factory MetadataGenerationRunItem.fromJson(Map<String, dynamic> json) {
    return MetadataGenerationRunItem(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      owningProjectId: json['owningProjectId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      status: (json['status'] as String?)?.toMetadataGenerationRunStatus(),
      target: json['target'] != null
          ? MetadataGenerationRunTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toMetadataGenerationRunType(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final owningProjectId = this.owningProjectId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final status = this.status;
    final target = this.target;
    final type = this.type;
    return {
      'domainId': domainId,
      'id': id,
      'owningProjectId': owningProjectId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (status != null) 'status': status.toValue(),
      if (target != null) 'target': target,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum MetadataGenerationRunStatus {
  submitted,
  inProgress,
  canceled,
  succeeded,
  failed,
}

extension MetadataGenerationRunStatusValueExtension
    on MetadataGenerationRunStatus {
  String toValue() {
    switch (this) {
      case MetadataGenerationRunStatus.submitted:
        return 'SUBMITTED';
      case MetadataGenerationRunStatus.inProgress:
        return 'IN_PROGRESS';
      case MetadataGenerationRunStatus.canceled:
        return 'CANCELED';
      case MetadataGenerationRunStatus.succeeded:
        return 'SUCCEEDED';
      case MetadataGenerationRunStatus.failed:
        return 'FAILED';
    }
  }
}

extension MetadataGenerationRunStatusFromString on String {
  MetadataGenerationRunStatus toMetadataGenerationRunStatus() {
    switch (this) {
      case 'SUBMITTED':
        return MetadataGenerationRunStatus.submitted;
      case 'IN_PROGRESS':
        return MetadataGenerationRunStatus.inProgress;
      case 'CANCELED':
        return MetadataGenerationRunStatus.canceled;
      case 'SUCCEEDED':
        return MetadataGenerationRunStatus.succeeded;
      case 'FAILED':
        return MetadataGenerationRunStatus.failed;
    }
    throw Exception('$this is not known in enum MetadataGenerationRunStatus');
  }
}

/// The asset for which metadata was generated.
class MetadataGenerationRunTarget {
  /// The ID of the metadata generation run's target.
  final String identifier;

  /// The type of the asset for which metadata was generated.
  final MetadataGenerationTargetType type;

  /// The revision of the asset for which metadata was generated.
  final String? revision;

  MetadataGenerationRunTarget({
    required this.identifier,
    required this.type,
    this.revision,
  });

  factory MetadataGenerationRunTarget.fromJson(Map<String, dynamic> json) {
    return MetadataGenerationRunTarget(
      identifier: json['identifier'] as String,
      type: (json['type'] as String).toMetadataGenerationTargetType(),
      revision: json['revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final type = this.type;
    final revision = this.revision;
    return {
      'identifier': identifier,
      'type': type.toValue(),
      if (revision != null) 'revision': revision,
    };
  }
}

enum MetadataGenerationRunType {
  businessDescriptions,
}

extension MetadataGenerationRunTypeValueExtension on MetadataGenerationRunType {
  String toValue() {
    switch (this) {
      case MetadataGenerationRunType.businessDescriptions:
        return 'BUSINESS_DESCRIPTIONS';
    }
  }
}

extension MetadataGenerationRunTypeFromString on String {
  MetadataGenerationRunType toMetadataGenerationRunType() {
    switch (this) {
      case 'BUSINESS_DESCRIPTIONS':
        return MetadataGenerationRunType.businessDescriptions;
    }
    throw Exception('$this is not known in enum MetadataGenerationRunType');
  }
}

enum MetadataGenerationTargetType {
  asset,
}

extension MetadataGenerationTargetTypeValueExtension
    on MetadataGenerationTargetType {
  String toValue() {
    switch (this) {
      case MetadataGenerationTargetType.asset:
        return 'ASSET';
    }
  }
}

extension MetadataGenerationTargetTypeFromString on String {
  MetadataGenerationTargetType toMetadataGenerationTargetType() {
    switch (this) {
      case 'ASSET':
        return MetadataGenerationTargetType.asset;
    }
    throw Exception('$this is not known in enum MetadataGenerationTargetType');
  }
}

/// The model of the API.
class Model {
  /// Indicates the smithy model of the API.
  final String? smithy;

  Model({
    this.smithy,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      smithy: json['smithy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final smithy = this.smithy;
    return {
      if (smithy != null) 'smithy': smithy,
    };
  }
}

/// The details of a notification generated in Amazon DataZone.
class NotificationOutput {
  /// The action link included in the notification.
  final String actionLink;

  /// The timestamp of when a notification was created.
  final DateTime creationTimestamp;

  /// The identifier of a Amazon DataZone domain in which the notification exists.
  final String domainIdentifier;

  /// The identifier of the notification.
  final String identifier;

  /// The timestamp of when the notification was last updated.
  final DateTime lastUpdatedTimestamp;

  /// The message included in the notification.
  final String message;

  /// The title of the notification.
  final String title;

  /// The topic of the notification.
  final Topic topic;

  /// The type of the notification.
  final NotificationType type;

  /// The metadata included in the notification.
  final Map<String, String>? metadata;

  /// The status included in the notification.
  final TaskStatus? status;

  NotificationOutput({
    required this.actionLink,
    required this.creationTimestamp,
    required this.domainIdentifier,
    required this.identifier,
    required this.lastUpdatedTimestamp,
    required this.message,
    required this.title,
    required this.topic,
    required this.type,
    this.metadata,
    this.status,
  });

  factory NotificationOutput.fromJson(Map<String, dynamic> json) {
    return NotificationOutput(
      actionLink: json['actionLink'] as String,
      creationTimestamp:
          nonNullableTimeStampFromJson(json['creationTimestamp'] as Object),
      domainIdentifier: json['domainIdentifier'] as String,
      identifier: json['identifier'] as String,
      lastUpdatedTimestamp:
          nonNullableTimeStampFromJson(json['lastUpdatedTimestamp'] as Object),
      message: json['message'] as String,
      title: json['title'] as String,
      topic: Topic.fromJson(json['topic'] as Map<String, dynamic>),
      type: (json['type'] as String).toNotificationType(),
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.toTaskStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionLink = this.actionLink;
    final creationTimestamp = this.creationTimestamp;
    final domainIdentifier = this.domainIdentifier;
    final identifier = this.identifier;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final message = this.message;
    final title = this.title;
    final topic = this.topic;
    final type = this.type;
    final metadata = this.metadata;
    final status = this.status;
    return {
      'actionLink': actionLink,
      'creationTimestamp': unixTimestampToJson(creationTimestamp),
      'domainIdentifier': domainIdentifier,
      'identifier': identifier,
      'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      'message': message,
      'title': title,
      'topic': topic,
      'type': type.toValue(),
      if (metadata != null) 'metadata': metadata,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The details of the resource mentioned in a notification.
class NotificationResource {
  /// The ID of the resource mentioned in a notification.
  final String id;

  /// The type of the resource mentioned in a notification.
  final NotificationResourceType type;

  /// The name of the resource mentioned in a notification.
  final String? name;

  NotificationResource({
    required this.id,
    required this.type,
    this.name,
  });

  factory NotificationResource.fromJson(Map<String, dynamic> json) {
    return NotificationResource(
      id: json['id'] as String,
      type: (json['type'] as String).toNotificationResourceType(),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    final name = this.name;
    return {
      'id': id,
      'type': type.toValue(),
      if (name != null) 'name': name,
    };
  }
}

enum NotificationResourceType {
  project,
}

extension NotificationResourceTypeValueExtension on NotificationResourceType {
  String toValue() {
    switch (this) {
      case NotificationResourceType.project:
        return 'PROJECT';
    }
  }
}

extension NotificationResourceTypeFromString on String {
  NotificationResourceType toNotificationResourceType() {
    switch (this) {
      case 'PROJECT':
        return NotificationResourceType.project;
    }
    throw Exception('$this is not known in enum NotificationResourceType');
  }
}

enum NotificationRole {
  projectOwner,
  projectContributor,
  projectViewer,
  domainOwner,
  projectSubscriber,
}

extension NotificationRoleValueExtension on NotificationRole {
  String toValue() {
    switch (this) {
      case NotificationRole.projectOwner:
        return 'PROJECT_OWNER';
      case NotificationRole.projectContributor:
        return 'PROJECT_CONTRIBUTOR';
      case NotificationRole.projectViewer:
        return 'PROJECT_VIEWER';
      case NotificationRole.domainOwner:
        return 'DOMAIN_OWNER';
      case NotificationRole.projectSubscriber:
        return 'PROJECT_SUBSCRIBER';
    }
  }
}

extension NotificationRoleFromString on String {
  NotificationRole toNotificationRole() {
    switch (this) {
      case 'PROJECT_OWNER':
        return NotificationRole.projectOwner;
      case 'PROJECT_CONTRIBUTOR':
        return NotificationRole.projectContributor;
      case 'PROJECT_VIEWER':
        return NotificationRole.projectViewer;
      case 'DOMAIN_OWNER':
        return NotificationRole.domainOwner;
      case 'PROJECT_SUBSCRIBER':
        return NotificationRole.projectSubscriber;
    }
    throw Exception('$this is not known in enum NotificationRole');
  }
}

enum NotificationType {
  task,
  event,
}

extension NotificationTypeValueExtension on NotificationType {
  String toValue() {
    switch (this) {
      case NotificationType.task:
        return 'TASK';
      case NotificationType.event:
        return 'EVENT';
    }
  }
}

extension NotificationTypeFromString on String {
  NotificationType toNotificationType() {
    switch (this) {
      case 'TASK':
        return NotificationType.task;
      case 'EVENT':
        return NotificationType.event;
    }
    throw Exception('$this is not known in enum NotificationType');
  }
}

class PostTimeSeriesDataPointsOutput {
  /// The ID of the Amazon DataZone domain in which you want to post time series
  /// data points.
  final String? domainId;

  /// The ID of the asset for which you want to post time series data points.
  final String? entityId;

  /// The type of the asset for which you want to post data points.
  final TimeSeriesEntityType? entityType;

  /// The forms that contain the data points that you have posted.
  final List<TimeSeriesDataPointFormOutput>? forms;

  PostTimeSeriesDataPointsOutput({
    this.domainId,
    this.entityId,
    this.entityType,
    this.forms,
  });

  factory PostTimeSeriesDataPointsOutput.fromJson(Map<String, dynamic> json) {
    return PostTimeSeriesDataPointsOutput(
      domainId: json['domainId'] as String?,
      entityId: json['entityId'] as String?,
      entityType: (json['entityType'] as String?)?.toTimeSeriesEntityType(),
      forms: (json['forms'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TimeSeriesDataPointFormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final entityId = this.entityId;
    final entityType = this.entityType;
    final forms = this.forms;
    return {
      if (domainId != null) 'domainId': domainId,
      if (entityId != null) 'entityId': entityId,
      if (entityType != null) 'entityType': entityType.toValue(),
      if (forms != null) 'forms': forms,
    };
  }
}

/// The configuration of the prediction.
class PredictionConfiguration {
  /// The business name generation mechanism.
  final BusinessNameGenerationConfiguration? businessNameGeneration;

  PredictionConfiguration({
    this.businessNameGeneration,
  });

  factory PredictionConfiguration.fromJson(Map<String, dynamic> json) {
    return PredictionConfiguration(
      businessNameGeneration: json['businessNameGeneration'] != null
          ? BusinessNameGenerationConfiguration.fromJson(
              json['businessNameGeneration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final businessNameGeneration = this.businessNameGeneration;
    return {
      if (businessNameGeneration != null)
        'businessNameGeneration': businessNameGeneration,
    };
  }
}

/// Specifies the error message that is returned if the operation cannot be
/// successfully completed.
class ProjectDeletionError {
  /// The code of the project deletion error.
  final String? code;

  /// The message of the project deletion error.
  final String? message;

  ProjectDeletionError({
    this.code,
    this.message,
  });

  factory ProjectDeletionError.fromJson(Map<String, dynamic> json) {
    return ProjectDeletionError(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

/// The details of a project member.
class ProjectMember {
  /// The designated role of a project member.
  final UserDesignation designation;

  /// The membership details of a project member.
  final MemberDetails memberDetails;

  ProjectMember({
    required this.designation,
    required this.memberDetails,
  });

  factory ProjectMember.fromJson(Map<String, dynamic> json) {
    return ProjectMember(
      designation: (json['designation'] as String).toUserDesignation(),
      memberDetails:
          MemberDetails.fromJson(json['memberDetails'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final designation = this.designation;
    final memberDetails = this.memberDetails;
    return {
      'designation': designation.toValue(),
      'memberDetails': memberDetails,
    };
  }
}

enum ProjectStatus {
  active,
  deleting,
  deleteFailed,
}

extension ProjectStatusValueExtension on ProjectStatus {
  String toValue() {
    switch (this) {
      case ProjectStatus.active:
        return 'ACTIVE';
      case ProjectStatus.deleting:
        return 'DELETING';
      case ProjectStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension ProjectStatusFromString on String {
  ProjectStatus toProjectStatus() {
    switch (this) {
      case 'ACTIVE':
        return ProjectStatus.active;
      case 'DELETING':
        return ProjectStatus.deleting;
      case 'DELETE_FAILED':
        return ProjectStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum ProjectStatus');
  }
}

/// The details of a Amazon DataZone project.
class ProjectSummary {
  /// The Amazon DataZone user who created the project.
  final String createdBy;

  /// The identifier of a Amazon DataZone domain where the project exists.
  final String domainId;

  /// The identifier of a project.
  final String id;

  /// The name of a project.
  final String name;

  /// The timestamp of when a project was created.
  final DateTime? createdAt;

  /// The description of a project.
  final String? description;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final List<ProjectDeletionError>? failureReasons;

  /// The status of the project.
  final ProjectStatus? projectStatus;

  /// The timestamp of when the project was updated.
  final DateTime? updatedAt;

  ProjectSummary({
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.name,
    this.createdAt,
    this.description,
    this.failureReasons,
    this.projectStatus,
    this.updatedAt,
  });

  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectDeletionError.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectStatus: (json['projectStatus'] as String?)?.toProjectStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final createdAt = this.createdAt;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final projectStatus = this.projectStatus;
    final updatedAt = this.updatedAt;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'name': name,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (projectStatus != null) 'projectStatus': projectStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The provisioning properties of an environment blueprint.
class ProvisioningProperties {
  /// The cloud formation properties included as part of the provisioning
  /// properties of an environment blueprint.
  final CloudFormationProperties? cloudFormation;

  ProvisioningProperties({
    this.cloudFormation,
  });

  factory ProvisioningProperties.fromJson(Map<String, dynamic> json) {
    return ProvisioningProperties(
      cloudFormation: json['cloudFormation'] != null
          ? CloudFormationProperties.fromJson(
              json['cloudFormation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    return {
      if (cloudFormation != null) 'cloudFormation': cloudFormation,
    };
  }
}

class PutEnvironmentBlueprintConfigurationOutput {
  /// The identifier of the Amazon DataZone domain.
  final String domainId;

  /// The identifier of the environment blueprint.
  final String environmentBlueprintId;

  /// The timestamp of when the environment blueprint was created.
  final DateTime? createdAt;

  /// Specifies the enabled Amazon Web Services Regions.
  final List<String>? enabledRegions;

  /// The ARN of the manage access role.
  final String? manageAccessRoleArn;

  /// The ARN of the provisioning role.
  final String? provisioningRoleArn;

  /// The regional parameters in the environment blueprint.
  final Map<String, Map<String, String>>? regionalParameters;

  /// The timestamp of when the environment blueprint was updated.
  final DateTime? updatedAt;

  PutEnvironmentBlueprintConfigurationOutput({
    required this.domainId,
    required this.environmentBlueprintId,
    this.createdAt,
    this.enabledRegions,
    this.manageAccessRoleArn,
    this.provisioningRoleArn,
    this.regionalParameters,
    this.updatedAt,
  });

  factory PutEnvironmentBlueprintConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return PutEnvironmentBlueprintConfigurationOutput(
      domainId: json['domainId'] as String,
      environmentBlueprintId: json['environmentBlueprintId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      enabledRegions: (json['enabledRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      manageAccessRoleArn: json['manageAccessRoleArn'] as String?,
      provisioningRoleArn: json['provisioningRoleArn'] as String?,
      regionalParameters: (json['regionalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final environmentBlueprintId = this.environmentBlueprintId;
    final createdAt = this.createdAt;
    final enabledRegions = this.enabledRegions;
    final manageAccessRoleArn = this.manageAccessRoleArn;
    final provisioningRoleArn = this.provisioningRoleArn;
    final regionalParameters = this.regionalParameters;
    final updatedAt = this.updatedAt;
    return {
      'domainId': domainId,
      'environmentBlueprintId': environmentBlueprintId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (enabledRegions != null) 'enabledRegions': enabledRegions,
      if (manageAccessRoleArn != null)
        'manageAccessRoleArn': manageAccessRoleArn,
      if (provisioningRoleArn != null)
        'provisioningRoleArn': provisioningRoleArn,
      if (regionalParameters != null) 'regionalParameters': regionalParameters,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The recommendation to be updated as part of the
/// <code>UpdateDataSource</code> action.
class RecommendationConfiguration {
  /// Specifies whether automatic business name generation is to be enabled or not
  /// as part of the recommendation configuration.
  final bool? enableBusinessNameGeneration;

  RecommendationConfiguration({
    this.enableBusinessNameGeneration,
  });

  factory RecommendationConfiguration.fromJson(Map<String, dynamic> json) {
    return RecommendationConfiguration(
      enableBusinessNameGeneration:
          json['enableBusinessNameGeneration'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableBusinessNameGeneration = this.enableBusinessNameGeneration;
    return {
      if (enableBusinessNameGeneration != null)
        'enableBusinessNameGeneration': enableBusinessNameGeneration,
    };
  }
}

/// The details of the Amazon Redshift cluster storage.
class RedshiftClusterStorage {
  /// The name of an Amazon Redshift cluster.
  final String clusterName;

  RedshiftClusterStorage({
    required this.clusterName,
  });

  factory RedshiftClusterStorage.fromJson(Map<String, dynamic> json) {
    return RedshiftClusterStorage(
      clusterName: json['clusterName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterName = this.clusterName;
    return {
      'clusterName': clusterName,
    };
  }
}

/// The details of the credentials required to access an Amazon Redshift
/// cluster.
class RedshiftCredentialConfiguration {
  /// The ARN of a secret manager for an Amazon Redshift cluster.
  final String secretManagerArn;

  RedshiftCredentialConfiguration({
    required this.secretManagerArn,
  });

  factory RedshiftCredentialConfiguration.fromJson(Map<String, dynamic> json) {
    return RedshiftCredentialConfiguration(
      secretManagerArn: json['secretManagerArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final secretManagerArn = this.secretManagerArn;
    return {
      'secretManagerArn': secretManagerArn,
    };
  }
}

/// The configuration details of the Amazon Redshift data source.
class RedshiftRunConfigurationInput {
  final RedshiftCredentialConfiguration redshiftCredentialConfiguration;
  final RedshiftStorage redshiftStorage;

  /// The relational filger configurations included in the configuration details
  /// of the Amazon Redshift data source.
  final List<RelationalFilterConfiguration> relationalFilterConfigurations;

  /// The data access role included in the configuration details of the Amazon
  /// Redshift data source.
  final String? dataAccessRole;

  RedshiftRunConfigurationInput({
    required this.redshiftCredentialConfiguration,
    required this.redshiftStorage,
    required this.relationalFilterConfigurations,
    this.dataAccessRole,
  });

  Map<String, dynamic> toJson() {
    final redshiftCredentialConfiguration =
        this.redshiftCredentialConfiguration;
    final redshiftStorage = this.redshiftStorage;
    final relationalFilterConfigurations = this.relationalFilterConfigurations;
    final dataAccessRole = this.dataAccessRole;
    return {
      'redshiftCredentialConfiguration': redshiftCredentialConfiguration,
      'redshiftStorage': redshiftStorage,
      'relationalFilterConfigurations': relationalFilterConfigurations,
      if (dataAccessRole != null) 'dataAccessRole': dataAccessRole,
    };
  }
}

/// The configuration details of the Amazon Redshift data source.
class RedshiftRunConfigurationOutput {
  final RedshiftCredentialConfiguration redshiftCredentialConfiguration;
  final RedshiftStorage redshiftStorage;

  /// The relational filger configurations included in the configuration details
  /// of the Amazon Redshift data source.
  final List<RelationalFilterConfiguration> relationalFilterConfigurations;

  /// The ID of the Amazon Web Services account included in the configuration
  /// details of the Amazon Redshift data source.
  final String? accountId;

  /// The data access role included in the configuration details of the Amazon
  /// Redshift data source.
  final String? dataAccessRole;

  /// The Amazon Web Services region included in the configuration details of the
  /// Amazon Redshift data source.
  final String? region;

  RedshiftRunConfigurationOutput({
    required this.redshiftCredentialConfiguration,
    required this.redshiftStorage,
    required this.relationalFilterConfigurations,
    this.accountId,
    this.dataAccessRole,
    this.region,
  });

  factory RedshiftRunConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return RedshiftRunConfigurationOutput(
      redshiftCredentialConfiguration: RedshiftCredentialConfiguration.fromJson(
          json['redshiftCredentialConfiguration'] as Map<String, dynamic>),
      redshiftStorage: RedshiftStorage.fromJson(
          json['redshiftStorage'] as Map<String, dynamic>),
      relationalFilterConfigurations: (json['relationalFilterConfigurations']
              as List)
          .whereNotNull()
          .map((e) =>
              RelationalFilterConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      accountId: json['accountId'] as String?,
      dataAccessRole: json['dataAccessRole'] as String?,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final redshiftCredentialConfiguration =
        this.redshiftCredentialConfiguration;
    final redshiftStorage = this.redshiftStorage;
    final relationalFilterConfigurations = this.relationalFilterConfigurations;
    final accountId = this.accountId;
    final dataAccessRole = this.dataAccessRole;
    final region = this.region;
    return {
      'redshiftCredentialConfiguration': redshiftCredentialConfiguration,
      'redshiftStorage': redshiftStorage,
      'relationalFilterConfigurations': relationalFilterConfigurations,
      if (accountId != null) 'accountId': accountId,
      if (dataAccessRole != null) 'dataAccessRole': dataAccessRole,
      if (region != null) 'region': region,
    };
  }
}

/// The details of the Amazon Redshift Serverless workgroup storage.
class RedshiftServerlessStorage {
  /// The name of the Amazon Redshift Serverless workgroup.
  final String workgroupName;

  RedshiftServerlessStorage({
    required this.workgroupName,
  });

  factory RedshiftServerlessStorage.fromJson(Map<String, dynamic> json) {
    return RedshiftServerlessStorage(
      workgroupName: json['workgroupName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final workgroupName = this.workgroupName;
    return {
      'workgroupName': workgroupName,
    };
  }
}

/// The details of the Amazon Redshift storage as part of the configuration of
/// an Amazon Redshift data source run.
class RedshiftStorage {
  /// The details of the Amazon Redshift cluster source.
  final RedshiftClusterStorage? redshiftClusterSource;

  /// The details of the Amazon Redshift Serverless workgroup source.
  final RedshiftServerlessStorage? redshiftServerlessSource;

  RedshiftStorage({
    this.redshiftClusterSource,
    this.redshiftServerlessSource,
  });

  factory RedshiftStorage.fromJson(Map<String, dynamic> json) {
    return RedshiftStorage(
      redshiftClusterSource: json['redshiftClusterSource'] != null
          ? RedshiftClusterStorage.fromJson(
              json['redshiftClusterSource'] as Map<String, dynamic>)
          : null,
      redshiftServerlessSource: json['redshiftServerlessSource'] != null
          ? RedshiftServerlessStorage.fromJson(
              json['redshiftServerlessSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final redshiftClusterSource = this.redshiftClusterSource;
    final redshiftServerlessSource = this.redshiftServerlessSource;
    return {
      if (redshiftClusterSource != null)
        'redshiftClusterSource': redshiftClusterSource,
      if (redshiftServerlessSource != null)
        'redshiftServerlessSource': redshiftServerlessSource,
    };
  }
}

/// The details of the automatically generated business metadata that is
/// rejected.
class RejectChoice {
  /// Specifies the target (for example, a column name) where a prediction can be
  /// rejected.
  final String predictionTarget;

  /// Specifies the the automatically generated business metadata that can be
  /// rejected.
  final List<int>? predictionChoices;

  RejectChoice({
    required this.predictionTarget,
    this.predictionChoices,
  });

  Map<String, dynamic> toJson() {
    final predictionTarget = this.predictionTarget;
    final predictionChoices = this.predictionChoices;
    return {
      'predictionTarget': predictionTarget,
      if (predictionChoices != null) 'predictionChoices': predictionChoices,
    };
  }
}

class RejectPredictionsOutput {
  /// The ID of the asset.
  final String assetId;

  /// The revision that is to be made to the asset.
  final String assetRevision;

  /// The ID of the Amazon DataZone domain.
  final String domainId;

  RejectPredictionsOutput({
    required this.assetId,
    required this.assetRevision,
    required this.domainId,
  });

  factory RejectPredictionsOutput.fromJson(Map<String, dynamic> json) {
    return RejectPredictionsOutput(
      assetId: json['assetId'] as String,
      assetRevision: json['assetRevision'] as String,
      domainId: json['domainId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final assetRevision = this.assetRevision;
    final domainId = this.domainId;
    return {
      'assetId': assetId,
      'assetRevision': assetRevision,
      'domainId': domainId,
    };
  }
}

/// Specifies the rule and the threshold under which a prediction can be
/// rejected.
class RejectRule {
  /// Specifies whether you want to reject the top prediction for all targets or
  /// none.
  final RejectRuleBehavior? rule;

  /// The confidence score that specifies the condition at which a prediction can
  /// be rejected.
  final double? threshold;

  RejectRule({
    this.rule,
    this.threshold,
  });

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    final threshold = this.threshold;
    return {
      if (rule != null) 'rule': rule.toValue(),
      if (threshold != null) 'threshold': threshold,
    };
  }
}

enum RejectRuleBehavior {
  all,
  none,
}

extension RejectRuleBehaviorValueExtension on RejectRuleBehavior {
  String toValue() {
    switch (this) {
      case RejectRuleBehavior.all:
        return 'ALL';
      case RejectRuleBehavior.none:
        return 'NONE';
    }
  }
}

extension RejectRuleBehaviorFromString on String {
  RejectRuleBehavior toRejectRuleBehavior() {
    switch (this) {
      case 'ALL':
        return RejectRuleBehavior.all;
      case 'NONE':
        return RejectRuleBehavior.none;
    }
    throw Exception('$this is not known in enum RejectRuleBehavior');
  }
}

class RejectSubscriptionRequestOutput {
  /// The timestamp of when the subscription request was rejected.
  final DateTime createdAt;

  /// The timestamp of when the subscription request was rejected.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which the subscription
  /// request was rejected.
  final String domainId;

  /// The identifier of the subscription request that was rejected.
  final String id;

  /// The reason for the subscription request.
  final String requestReason;

  /// The status of the subscription request.
  final SubscriptionRequestStatus status;

  /// The subscribed listings of the subscription request.
  final List<SubscribedListing> subscribedListings;

  /// The subscribed principals of the subscription request.
  final List<SubscribedPrincipal> subscribedPrincipals;

  /// The timestamp of when the subscription request was updated.
  final DateTime updatedAt;

  /// The decision comment of the rejected subscription request.
  final String? decisionComment;

  /// The identifier of the subscription request reviewer.
  final String? reviewerId;

  /// The Amazon DataZone user who updated the subscription request.
  final String? updatedBy;

  RejectSubscriptionRequestOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.requestReason,
    required this.status,
    required this.subscribedListings,
    required this.subscribedPrincipals,
    required this.updatedAt,
    this.decisionComment,
    this.reviewerId,
    this.updatedBy,
  });

  factory RejectSubscriptionRequestOutput.fromJson(Map<String, dynamic> json) {
    return RejectSubscriptionRequestOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      requestReason: json['requestReason'] as String,
      status: (json['status'] as String).toSubscriptionRequestStatus(),
      subscribedListings: (json['subscribedListings'] as List)
          .whereNotNull()
          .map((e) => SubscribedListing.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscribedPrincipals: (json['subscribedPrincipals'] as List)
          .whereNotNull()
          .map((e) => SubscribedPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      decisionComment: json['decisionComment'] as String?,
      reviewerId: json['reviewerId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final requestReason = this.requestReason;
    final status = this.status;
    final subscribedListings = this.subscribedListings;
    final subscribedPrincipals = this.subscribedPrincipals;
    final updatedAt = this.updatedAt;
    final decisionComment = this.decisionComment;
    final reviewerId = this.reviewerId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'requestReason': requestReason,
      'status': status.toValue(),
      'subscribedListings': subscribedListings,
      'subscribedPrincipals': subscribedPrincipals,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (decisionComment != null) 'decisionComment': decisionComment,
      if (reviewerId != null) 'reviewerId': reviewerId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The relational filter configuration for the data source.
class RelationalFilterConfiguration {
  /// The database name specified in the relational filter configuration for the
  /// data source.
  final String databaseName;

  /// The filter expressions specified in the relational filter configuration for
  /// the data source.
  final List<FilterExpression>? filterExpressions;

  /// The schema name specified in the relational filter configuration for the
  /// data source.
  final String? schemaName;

  RelationalFilterConfiguration({
    required this.databaseName,
    this.filterExpressions,
    this.schemaName,
  });

  factory RelationalFilterConfiguration.fromJson(Map<String, dynamic> json) {
    return RelationalFilterConfiguration(
      databaseName: json['databaseName'] as String,
      filterExpressions: (json['filterExpressions'] as List?)
          ?.whereNotNull()
          .map((e) => FilterExpression.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaName: json['schemaName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final filterExpressions = this.filterExpressions;
    final schemaName = this.schemaName;
    return {
      'databaseName': databaseName,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (schemaName != null) 'schemaName': schemaName,
    };
  }
}

/// The details of a provisioned resource of this Amazon DataZone environment.
class Resource {
  /// The type of a provisioned resource of this Amazon DataZone environment.
  final String type;

  /// The value of a provisioned resource of this Amazon DataZone environment.
  final String value;

  /// The name of a provisioned resource of this Amazon DataZone environment.
  final String? name;

  /// The provider of a provisioned resource of this Amazon DataZone environment.
  final String? provider;

  Resource({
    required this.type,
    required this.value,
    this.name,
    this.provider,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      type: json['type'] as String,
      value: json['value'] as String,
      name: json['name'] as String?,
      provider: json['provider'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    final name = this.name;
    final provider = this.provider;
    return {
      'type': type,
      'value': value,
      if (name != null) 'name': name,
      if (provider != null) 'provider': provider,
    };
  }
}

class RevokeSubscriptionOutput {
  /// The timestamp of when the subscription was revoked.
  final DateTime createdAt;

  /// The identifier of the user who revoked the subscription.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain where you want to revoke a
  /// subscription.
  final String domainId;

  /// The identifier of the revoked subscription.
  final String id;

  /// The status of the revoked subscription.
  final SubscriptionStatus status;

  /// The subscribed listing of the revoked subscription.
  final SubscribedListing subscribedListing;

  /// The subscribed principal of the revoked subscription.
  final SubscribedPrincipal subscribedPrincipal;

  /// The timestamp of when the subscription was revoked.
  final DateTime updatedAt;

  /// Specifies whether permissions are retained when the subscription is revoked.
  final bool? retainPermissions;

  /// The identifier of the subscription request for the revoked subscription.
  final String? subscriptionRequestId;

  /// The Amazon DataZone user who revoked the subscription.
  final String? updatedBy;

  RevokeSubscriptionOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.status,
    required this.subscribedListing,
    required this.subscribedPrincipal,
    required this.updatedAt,
    this.retainPermissions,
    this.subscriptionRequestId,
    this.updatedBy,
  });

  factory RevokeSubscriptionOutput.fromJson(Map<String, dynamic> json) {
    return RevokeSubscriptionOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionStatus(),
      subscribedListing: SubscribedListing.fromJson(
          json['subscribedListing'] as Map<String, dynamic>),
      subscribedPrincipal: SubscribedPrincipal.fromJson(
          json['subscribedPrincipal'] as Map<String, dynamic>),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      retainPermissions: json['retainPermissions'] as bool?,
      subscriptionRequestId: json['subscriptionRequestId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final status = this.status;
    final subscribedListing = this.subscribedListing;
    final subscribedPrincipal = this.subscribedPrincipal;
    final updatedAt = this.updatedAt;
    final retainPermissions = this.retainPermissions;
    final subscriptionRequestId = this.subscriptionRequestId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'status': status.toValue(),
      'subscribedListing': subscribedListing,
      'subscribedPrincipal': subscribedPrincipal,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (retainPermissions != null) 'retainPermissions': retainPermissions,
      if (subscriptionRequestId != null)
        'subscriptionRequestId': subscriptionRequestId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The asset statistics from the data source run.
class RunStatisticsForAssets {
  /// The <code>added</code> statistic for the data source run.
  final int? added;

  /// The <code>failed</code> statistic for the data source run.
  final int? failed;

  /// The <code>skipped</code> statistic for the data source run.
  final int? skipped;

  /// The <code>unchanged</code> statistic for the data source run.
  final int? unchanged;

  /// The <code>updated</code> statistic for the data source run.
  final int? updated;

  RunStatisticsForAssets({
    this.added,
    this.failed,
    this.skipped,
    this.unchanged,
    this.updated,
  });

  factory RunStatisticsForAssets.fromJson(Map<String, dynamic> json) {
    return RunStatisticsForAssets(
      added: json['added'] as int?,
      failed: json['failed'] as int?,
      skipped: json['skipped'] as int?,
      unchanged: json['unchanged'] as int?,
      updated: json['updated'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final added = this.added;
    final failed = this.failed;
    final skipped = this.skipped;
    final unchanged = this.unchanged;
    final updated = this.updated;
    return {
      if (added != null) 'added': added,
      if (failed != null) 'failed': failed,
      if (skipped != null) 'skipped': skipped,
      if (unchanged != null) 'unchanged': unchanged,
      if (updated != null) 'updated': updated,
    };
  }
}

/// The details of the schedule of the data source runs.
class ScheduleConfiguration {
  /// The schedule of the data source runs.
  final String? schedule;

  /// The timezone of the data source run.
  final Timezone? timezone;

  ScheduleConfiguration({
    this.schedule,
    this.timezone,
  });

  factory ScheduleConfiguration.fromJson(Map<String, dynamic> json) {
    return ScheduleConfiguration(
      schedule: json['schedule'] as String?,
      timezone: (json['timezone'] as String?)?.toTimezone(),
    );
  }

  Map<String, dynamic> toJson() {
    final schedule = this.schedule;
    final timezone = this.timezone;
    return {
      if (schedule != null) 'schedule': schedule,
      if (timezone != null) 'timezone': timezone.toValue(),
    };
  }
}

class SearchGroupProfilesOutput {
  /// The results of the <code>SearchGroupProfiles</code> action.
  final List<GroupProfileSummary>? items;

  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>SearchGroupProfiles</code> to list the next set of results.
  final String? nextToken;

  SearchGroupProfilesOutput({
    this.items,
    this.nextToken,
  });

  factory SearchGroupProfilesOutput.fromJson(Map<String, dynamic> json) {
    return SearchGroupProfilesOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => GroupProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The details of the search.
class SearchInItem {
  /// The search attribute.
  final String attribute;

  SearchInItem({
    required this.attribute,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      'attribute': attribute,
    };
  }
}

/// The details of the search results.
class SearchInventoryResultItem {
  /// The asset item included in the search results.
  final AssetItem? assetItem;

  /// The data product item included in the search results.
  final DataProductSummary? dataProductItem;

  /// The glossary item included in the search results.
  final GlossaryItem? glossaryItem;

  /// The glossary term item included in the search results.
  final GlossaryTermItem? glossaryTermItem;

  SearchInventoryResultItem({
    this.assetItem,
    this.dataProductItem,
    this.glossaryItem,
    this.glossaryTermItem,
  });

  factory SearchInventoryResultItem.fromJson(Map<String, dynamic> json) {
    return SearchInventoryResultItem(
      assetItem: json['assetItem'] != null
          ? AssetItem.fromJson(json['assetItem'] as Map<String, dynamic>)
          : null,
      dataProductItem: json['dataProductItem'] != null
          ? DataProductSummary.fromJson(
              json['dataProductItem'] as Map<String, dynamic>)
          : null,
      glossaryItem: json['glossaryItem'] != null
          ? GlossaryItem.fromJson(json['glossaryItem'] as Map<String, dynamic>)
          : null,
      glossaryTermItem: json['glossaryTermItem'] != null
          ? GlossaryTermItem.fromJson(
              json['glossaryTermItem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetItem = this.assetItem;
    final dataProductItem = this.dataProductItem;
    final glossaryItem = this.glossaryItem;
    final glossaryTermItem = this.glossaryTermItem;
    return {
      if (assetItem != null) 'assetItem': assetItem,
      if (dataProductItem != null) 'dataProductItem': dataProductItem,
      if (glossaryItem != null) 'glossaryItem': glossaryItem,
      if (glossaryTermItem != null) 'glossaryTermItem': glossaryTermItem,
    };
  }
}

class SearchListingsOutput {
  /// The results of the <code>SearchListings</code> action.
  final List<SearchResultItem>? items;

  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>SearchListings</code> to list the next set of results.
  final String? nextToken;

  /// Total number of search results.
  final int? totalMatchCount;

  SearchListingsOutput({
    this.items,
    this.nextToken,
    this.totalMatchCount,
  });

  factory SearchListingsOutput.fromJson(Map<String, dynamic> json) {
    return SearchListingsOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      totalMatchCount: json['totalMatchCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    final totalMatchCount = this.totalMatchCount;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
      if (totalMatchCount != null) 'totalMatchCount': totalMatchCount,
    };
  }
}

class SearchOutput {
  /// The results of the <code>Search</code> action.
  final List<SearchInventoryResultItem>? items;

  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>Search</code> to list the next set of results.
  final String? nextToken;

  /// Total number of search results.
  final int? totalMatchCount;

  SearchOutput({
    this.items,
    this.nextToken,
    this.totalMatchCount,
  });

  factory SearchOutput.fromJson(Map<String, dynamic> json) {
    return SearchOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SearchInventoryResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      totalMatchCount: json['totalMatchCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    final totalMatchCount = this.totalMatchCount;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
      if (totalMatchCount != null) 'totalMatchCount': totalMatchCount,
    };
  }
}

enum SearchOutputAdditionalAttribute {
  forms,
  timeSeriesDataPointForms,
}

extension SearchOutputAdditionalAttributeValueExtension
    on SearchOutputAdditionalAttribute {
  String toValue() {
    switch (this) {
      case SearchOutputAdditionalAttribute.forms:
        return 'FORMS';
      case SearchOutputAdditionalAttribute.timeSeriesDataPointForms:
        return 'TIME_SERIES_DATA_POINT_FORMS';
    }
  }
}

extension SearchOutputAdditionalAttributeFromString on String {
  SearchOutputAdditionalAttribute toSearchOutputAdditionalAttribute() {
    switch (this) {
      case 'FORMS':
        return SearchOutputAdditionalAttribute.forms;
      case 'TIME_SERIES_DATA_POINT_FORMS':
        return SearchOutputAdditionalAttribute.timeSeriesDataPointForms;
    }
    throw Exception(
        '$this is not known in enum SearchOutputAdditionalAttribute');
  }
}

/// The details of the results of the <code>SearchListings</code> action.
class SearchResultItem {
  /// The asset listing included in the results of the <code>SearchListings</code>
  /// action.
  final AssetListingItem? assetListing;

  SearchResultItem({
    this.assetListing,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) {
    return SearchResultItem(
      assetListing: json['assetListing'] != null
          ? AssetListingItem.fromJson(
              json['assetListing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetListing = this.assetListing;
    return {
      if (assetListing != null) 'assetListing': assetListing,
    };
  }
}

/// The details of the way to sort search results.
class SearchSort {
  /// The attribute detail of the way to sort search results.
  final String attribute;

  /// The order detail of the wya to sort search results.
  final SortOrder? order;

  SearchSort({
    required this.attribute,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final order = this.order;
    return {
      'attribute': attribute,
      if (order != null) 'order': order.toValue(),
    };
  }
}

class SearchTypesOutput {
  /// The results of the <code>SearchTypes</code> action.
  final List<SearchTypesResultItem>? items;

  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>SearchTypes</code> to list the next set of results.
  final String? nextToken;

  /// Total number of search results.
  final int? totalMatchCount;

  SearchTypesOutput({
    this.items,
    this.nextToken,
    this.totalMatchCount,
  });

  factory SearchTypesOutput.fromJson(Map<String, dynamic> json) {
    return SearchTypesOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => SearchTypesResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      totalMatchCount: json['totalMatchCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    final totalMatchCount = this.totalMatchCount;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
      if (totalMatchCount != null) 'totalMatchCount': totalMatchCount,
    };
  }
}

/// The details of the results of the <code>SearchTypes</code> action.
class SearchTypesResultItem {
  /// The asset type included in the results of the <code>SearchTypes</code>
  /// action.
  final AssetTypeItem? assetTypeItem;

  /// The form type included in the results of the <code>SearchTypes</code>
  /// action.
  final FormTypeData? formTypeItem;

  SearchTypesResultItem({
    this.assetTypeItem,
    this.formTypeItem,
  });

  factory SearchTypesResultItem.fromJson(Map<String, dynamic> json) {
    return SearchTypesResultItem(
      assetTypeItem: json['assetTypeItem'] != null
          ? AssetTypeItem.fromJson(
              json['assetTypeItem'] as Map<String, dynamic>)
          : null,
      formTypeItem: json['formTypeItem'] != null
          ? FormTypeData.fromJson(json['formTypeItem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetTypeItem = this.assetTypeItem;
    final formTypeItem = this.formTypeItem;
    return {
      if (assetTypeItem != null) 'assetTypeItem': assetTypeItem,
      if (formTypeItem != null) 'formTypeItem': formTypeItem,
    };
  }
}

class SearchUserProfilesOutput {
  /// The results of the <code>SearchUserProfiles</code> action.
  final List<UserProfileSummary>? items;

  /// When the number of results is greater than the default value for the
  /// <code>MaxResults</code> parameter, or if you explicitly specify a value for
  /// <code>MaxResults</code> that is less than the number of results, the
  /// response includes a pagination token named <code>NextToken</code>. You can
  /// specify this <code>NextToken</code> value in a subsequent call to
  /// <code>SearchUserProfiles</code> to list the next set of results.
  final String? nextToken;

  SearchUserProfilesOutput({
    this.items,
    this.nextToken,
  });

  factory SearchUserProfilesOutput.fromJson(Map<String, dynamic> json) {
    return SearchUserProfilesOutput(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => UserProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The single sign-on details in Amazon DataZone.
class SingleSignOn {
  /// The type of single sign-on in Amazon DataZone.
  final AuthType? type;

  /// The single sign-on user assignment in Amazon DataZone.
  final UserAssignment? userAssignment;

  SingleSignOn({
    this.type,
    this.userAssignment,
  });

  factory SingleSignOn.fromJson(Map<String, dynamic> json) {
    return SingleSignOn(
      type: (json['type'] as String?)?.toAuthType(),
      userAssignment: (json['userAssignment'] as String?)?.toUserAssignment(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final userAssignment = this.userAssignment;
    return {
      if (type != null) 'type': type.toValue(),
      if (userAssignment != null) 'userAssignment': userAssignment.toValue(),
    };
  }
}

enum SortFieldProject {
  name,
}

extension SortFieldProjectValueExtension on SortFieldProject {
  String toValue() {
    switch (this) {
      case SortFieldProject.name:
        return 'NAME';
    }
  }
}

extension SortFieldProjectFromString on String {
  SortFieldProject toSortFieldProject() {
    switch (this) {
      case 'NAME':
        return SortFieldProject.name;
    }
    throw Exception('$this is not known in enum SortFieldProject');
  }
}

enum SortKey {
  createdAt,
  updatedAt,
}

extension SortKeyValueExtension on SortKey {
  String toValue() {
    switch (this) {
      case SortKey.createdAt:
        return 'CREATED_AT';
      case SortKey.updatedAt:
        return 'UPDATED_AT';
    }
  }
}

extension SortKeyFromString on String {
  SortKey toSortKey() {
    switch (this) {
      case 'CREATED_AT':
        return SortKey.createdAt;
      case 'UPDATED_AT':
        return SortKey.updatedAt;
    }
    throw Exception('$this is not known in enum SortKey');
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// The single sign-on details of the user profile.
class SsoUserProfileDetails {
  /// The first name included in the single sign-on details of the user profile.
  final String? firstName;

  /// The last name included in the single sign-on details of the user profile.
  final String? lastName;

  /// The username included in the single sign-on details of the user profile.
  final String? username;

  SsoUserProfileDetails({
    this.firstName,
    this.lastName,
    this.username,
  });

  factory SsoUserProfileDetails.fromJson(Map<String, dynamic> json) {
    return SsoUserProfileDetails(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstName = this.firstName;
    final lastName = this.lastName;
    final username = this.username;
    return {
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (username != null) 'username': username,
    };
  }
}

class StartDataSourceRunOutput {
  /// The timestamp of when data source run was created.
  final DateTime createdAt;

  /// The identifier of the data source.
  final String dataSourceId;

  /// The identifier of the Amazon DataZone domain in which to start a data source
  /// run.
  final String domainId;

  /// The identifier of the data source run.
  final String id;

  /// The identifier of the project.
  final String projectId;

  /// The status of the data source run.
  final DataSourceRunStatus status;

  /// The type of the data source run.
  final DataSourceRunType type;

  /// The timestamp of when the data source run was updated.
  final DateTime updatedAt;

  /// The configuration snapshot of the data source that is being run.
  final String? dataSourceConfigurationSnapshot;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? errorMessage;

  /// Specifies run statistics for assets.
  final RunStatisticsForAssets? runStatisticsForAssets;

  /// The timestamp of when the data source run was started.
  final DateTime? startedAt;

  /// The timestamp of when the data source run was stopped.
  final DateTime? stoppedAt;

  StartDataSourceRunOutput({
    required this.createdAt,
    required this.dataSourceId,
    required this.domainId,
    required this.id,
    required this.projectId,
    required this.status,
    required this.type,
    required this.updatedAt,
    this.dataSourceConfigurationSnapshot,
    this.errorMessage,
    this.runStatisticsForAssets,
    this.startedAt,
    this.stoppedAt,
  });

  factory StartDataSourceRunOutput.fromJson(Map<String, dynamic> json) {
    return StartDataSourceRunOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      dataSourceId: json['dataSourceId'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      status: (json['status'] as String).toDataSourceRunStatus(),
      type: (json['type'] as String).toDataSourceRunType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      dataSourceConfigurationSnapshot:
          json['dataSourceConfigurationSnapshot'] as String?,
      errorMessage: json['errorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['errorMessage'] as Map<String, dynamic>)
          : null,
      runStatisticsForAssets: json['runStatisticsForAssets'] != null
          ? RunStatisticsForAssets.fromJson(
              json['runStatisticsForAssets'] as Map<String, dynamic>)
          : null,
      startedAt: timeStampFromJson(json['startedAt']),
      stoppedAt: timeStampFromJson(json['stoppedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataSourceId = this.dataSourceId;
    final domainId = this.domainId;
    final id = this.id;
    final projectId = this.projectId;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final dataSourceConfigurationSnapshot =
        this.dataSourceConfigurationSnapshot;
    final errorMessage = this.errorMessage;
    final runStatisticsForAssets = this.runStatisticsForAssets;
    final startedAt = this.startedAt;
    final stoppedAt = this.stoppedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'dataSourceId': dataSourceId,
      'domainId': domainId,
      'id': id,
      'projectId': projectId,
      'status': status.toValue(),
      'type': type.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (dataSourceConfigurationSnapshot != null)
        'dataSourceConfigurationSnapshot': dataSourceConfigurationSnapshot,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (runStatisticsForAssets != null)
        'runStatisticsForAssets': runStatisticsForAssets,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stoppedAt != null) 'stoppedAt': iso8601ToJson(stoppedAt),
    };
  }
}

class StartMetadataGenerationRunOutput {
  /// The ID of the Amazon DataZone domain in which the metadata generation run
  /// was started.
  final String domainId;

  /// The ID of the metadata generation run.
  final String id;

  /// The timestamp at which the metadata generation run was started.
  final DateTime? createdAt;

  /// The ID of the user who started the metadata generation run.
  final String? createdBy;

  /// The ID of the project that owns the asset for which the metadata generation
  /// run was started.
  final String? owningProjectId;

  /// The status of the metadata generation run.
  final MetadataGenerationRunStatus? status;

  /// The type of the metadata generation run.
  final MetadataGenerationRunType? type;

  StartMetadataGenerationRunOutput({
    required this.domainId,
    required this.id,
    this.createdAt,
    this.createdBy,
    this.owningProjectId,
    this.status,
    this.type,
  });

  factory StartMetadataGenerationRunOutput.fromJson(Map<String, dynamic> json) {
    return StartMetadataGenerationRunOutput(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      owningProjectId: json['owningProjectId'] as String?,
      status: (json['status'] as String?)?.toMetadataGenerationRunStatus(),
      type: (json['type'] as String?)?.toMetadataGenerationRunType(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final owningProjectId = this.owningProjectId;
    final status = this.status;
    final type = this.type;
    return {
      'domainId': domainId,
      'id': id,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (owningProjectId != null) 'owningProjectId': owningProjectId,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// The details of the asset for which the subscription grant is created.
class SubscribedAsset {
  /// The identifier of the asset for which the subscription grant is created.
  final String assetId;

  /// The revision of the asset for which the subscription grant is created.
  final String assetRevision;

  /// The status of the asset for which the subscription grant is created.
  final SubscriptionGrantStatus status;

  /// The failure cause included in the details of the asset for which the
  /// subscription grant is created.
  final FailureCause? failureCause;

  /// The failure timestamp included in the details of the asset for which the
  /// subscription grant is created.
  final DateTime? failureTimestamp;

  /// The timestamp of when the subscription grant to the asset is created.
  final DateTime? grantedTimestamp;

  /// The target name of the asset for which the subscription grant is created.
  final String? targetName;

  SubscribedAsset({
    required this.assetId,
    required this.assetRevision,
    required this.status,
    this.failureCause,
    this.failureTimestamp,
    this.grantedTimestamp,
    this.targetName,
  });

  factory SubscribedAsset.fromJson(Map<String, dynamic> json) {
    return SubscribedAsset(
      assetId: json['assetId'] as String,
      assetRevision: json['assetRevision'] as String,
      status: (json['status'] as String).toSubscriptionGrantStatus(),
      failureCause: json['failureCause'] != null
          ? FailureCause.fromJson(json['failureCause'] as Map<String, dynamic>)
          : null,
      failureTimestamp: timeStampFromJson(json['failureTimestamp']),
      grantedTimestamp: timeStampFromJson(json['grantedTimestamp']),
      targetName: json['targetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final assetRevision = this.assetRevision;
    final status = this.status;
    final failureCause = this.failureCause;
    final failureTimestamp = this.failureTimestamp;
    final grantedTimestamp = this.grantedTimestamp;
    final targetName = this.targetName;
    return {
      'assetId': assetId,
      'assetRevision': assetRevision,
      'status': status.toValue(),
      if (failureCause != null) 'failureCause': failureCause,
      if (failureTimestamp != null)
        'failureTimestamp': unixTimestampToJson(failureTimestamp),
      if (grantedTimestamp != null)
        'grantedTimestamp': unixTimestampToJson(grantedTimestamp),
      if (targetName != null) 'targetName': targetName,
    };
  }
}

/// The details of the published asset for which the subscription grant is
/// created.
class SubscribedAssetListing {
  /// The identifier of the published asset for which the subscription grant is
  /// created.
  final String? entityId;

  /// The revision of the published asset for which the subscription grant is
  /// created.
  final String? entityRevision;

  /// The type of the published asset for which the subscription grant is created.
  final String? entityType;

  /// The forms attached to the published asset for which the subscription grant
  /// is created.
  final String? forms;

  /// The glossary terms attached to the published asset for which the
  /// subscription grant is created.
  final List<DetailedGlossaryTerm>? glossaryTerms;

  SubscribedAssetListing({
    this.entityId,
    this.entityRevision,
    this.entityType,
    this.forms,
    this.glossaryTerms,
  });

  factory SubscribedAssetListing.fromJson(Map<String, dynamic> json) {
    return SubscribedAssetListing(
      entityId: json['entityId'] as String?,
      entityRevision: json['entityRevision'] as String?,
      entityType: json['entityType'] as String?,
      forms: json['forms'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => DetailedGlossaryTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final entityRevision = this.entityRevision;
    final entityType = this.entityType;
    final forms = this.forms;
    final glossaryTerms = this.glossaryTerms;
    return {
      if (entityId != null) 'entityId': entityId,
      if (entityRevision != null) 'entityRevision': entityRevision,
      if (entityType != null) 'entityType': entityType,
      if (forms != null) 'forms': forms,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
    };
  }
}

/// The details of the published asset for which the subscription grant is
/// created.
class SubscribedListing {
  /// The description of the published asset for which the subscription grant is
  /// created.
  final String description;

  /// The identifier of the published asset for which the subscription grant is
  /// created.
  final String id;

  /// The published asset for which the subscription grant is created.
  final SubscribedListingItem item;

  /// The name of the published asset for which the subscription grant is created.
  final String name;

  /// The identifier of the project of the published asset for which the
  /// subscription grant is created.
  final String ownerProjectId;

  /// The name of the project that owns the published asset for which the
  /// subscription grant is created.
  final String? ownerProjectName;

  /// The revision of the published asset for which the subscription grant is
  /// created.
  final String? revision;

  SubscribedListing({
    required this.description,
    required this.id,
    required this.item,
    required this.name,
    required this.ownerProjectId,
    this.ownerProjectName,
    this.revision,
  });

  factory SubscribedListing.fromJson(Map<String, dynamic> json) {
    return SubscribedListing(
      description: json['description'] as String,
      id: json['id'] as String,
      item:
          SubscribedListingItem.fromJson(json['item'] as Map<String, dynamic>),
      name: json['name'] as String,
      ownerProjectId: json['ownerProjectId'] as String,
      ownerProjectName: json['ownerProjectName'] as String?,
      revision: json['revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final id = this.id;
    final item = this.item;
    final name = this.name;
    final ownerProjectId = this.ownerProjectId;
    final ownerProjectName = this.ownerProjectName;
    final revision = this.revision;
    return {
      'description': description,
      'id': id,
      'item': item,
      'name': name,
      'ownerProjectId': ownerProjectId,
      if (ownerProjectName != null) 'ownerProjectName': ownerProjectName,
      if (revision != null) 'revision': revision,
    };
  }
}

/// The published asset for which the subscription grant is to be created.
class SubscribedListingInput {
  /// The identifier of the published asset for which the subscription grant is to
  /// be created.
  final String identifier;

  SubscribedListingInput({
    required this.identifier,
  });

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      'identifier': identifier,
    };
  }
}

/// The published asset for which the subscription grant is created.
class SubscribedListingItem {
  /// The asset for which the subscription grant is created.
  final SubscribedAssetListing? assetListing;

  SubscribedListingItem({
    this.assetListing,
  });

  factory SubscribedListingItem.fromJson(Map<String, dynamic> json) {
    return SubscribedListingItem(
      assetListing: json['assetListing'] != null
          ? SubscribedAssetListing.fromJson(
              json['assetListing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetListing = this.assetListing;
    return {
      if (assetListing != null) 'assetListing': assetListing,
    };
  }
}

/// The principal that has the subscription grant for the asset.
class SubscribedPrincipal {
  /// The project that has the subscription grant.
  final SubscribedProject? project;

  SubscribedPrincipal({
    this.project,
  });

  factory SubscribedPrincipal.fromJson(Map<String, dynamic> json) {
    return SubscribedPrincipal(
      project: json['project'] != null
          ? SubscribedProject.fromJson(json['project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      if (project != null) 'project': project,
    };
  }
}

/// The principal that is to be given a subscriptiong grant.
class SubscribedPrincipalInput {
  /// The project that is to be given a subscription grant.
  final SubscribedProjectInput? project;

  SubscribedPrincipalInput({
    this.project,
  });

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      if (project != null) 'project': project,
    };
  }
}

/// The project that has the subscription grant.
class SubscribedProject {
  /// The identifier of the project that has the subscription grant.
  final String? id;

  /// The name of the project that has the subscription grant.
  final String? name;

  SubscribedProject({
    this.id,
    this.name,
  });

  factory SubscribedProject.fromJson(Map<String, dynamic> json) {
    return SubscribedProject(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// The project that is to be given a subscription grant.
class SubscribedProjectInput {
  /// The identifier of the project that is to be given a subscription grant.
  final String? identifier;

  SubscribedProjectInput({
    this.identifier,
  });

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      if (identifier != null) 'identifier': identifier,
    };
  }
}

enum SubscriptionGrantOverallStatus {
  pending,
  inProgress,
  grantFailed,
  revokeFailed,
  grantAndRevokeFailed,
  completed,
  inaccessible,
}

extension SubscriptionGrantOverallStatusValueExtension
    on SubscriptionGrantOverallStatus {
  String toValue() {
    switch (this) {
      case SubscriptionGrantOverallStatus.pending:
        return 'PENDING';
      case SubscriptionGrantOverallStatus.inProgress:
        return 'IN_PROGRESS';
      case SubscriptionGrantOverallStatus.grantFailed:
        return 'GRANT_FAILED';
      case SubscriptionGrantOverallStatus.revokeFailed:
        return 'REVOKE_FAILED';
      case SubscriptionGrantOverallStatus.grantAndRevokeFailed:
        return 'GRANT_AND_REVOKE_FAILED';
      case SubscriptionGrantOverallStatus.completed:
        return 'COMPLETED';
      case SubscriptionGrantOverallStatus.inaccessible:
        return 'INACCESSIBLE';
    }
  }
}

extension SubscriptionGrantOverallStatusFromString on String {
  SubscriptionGrantOverallStatus toSubscriptionGrantOverallStatus() {
    switch (this) {
      case 'PENDING':
        return SubscriptionGrantOverallStatus.pending;
      case 'IN_PROGRESS':
        return SubscriptionGrantOverallStatus.inProgress;
      case 'GRANT_FAILED':
        return SubscriptionGrantOverallStatus.grantFailed;
      case 'REVOKE_FAILED':
        return SubscriptionGrantOverallStatus.revokeFailed;
      case 'GRANT_AND_REVOKE_FAILED':
        return SubscriptionGrantOverallStatus.grantAndRevokeFailed;
      case 'COMPLETED':
        return SubscriptionGrantOverallStatus.completed;
      case 'INACCESSIBLE':
        return SubscriptionGrantOverallStatus.inaccessible;
    }
    throw Exception(
        '$this is not known in enum SubscriptionGrantOverallStatus');
  }
}

enum SubscriptionGrantStatus {
  grantPending,
  revokePending,
  grantInProgress,
  revokeInProgress,
  granted,
  revoked,
  grantFailed,
  revokeFailed,
}

extension SubscriptionGrantStatusValueExtension on SubscriptionGrantStatus {
  String toValue() {
    switch (this) {
      case SubscriptionGrantStatus.grantPending:
        return 'GRANT_PENDING';
      case SubscriptionGrantStatus.revokePending:
        return 'REVOKE_PENDING';
      case SubscriptionGrantStatus.grantInProgress:
        return 'GRANT_IN_PROGRESS';
      case SubscriptionGrantStatus.revokeInProgress:
        return 'REVOKE_IN_PROGRESS';
      case SubscriptionGrantStatus.granted:
        return 'GRANTED';
      case SubscriptionGrantStatus.revoked:
        return 'REVOKED';
      case SubscriptionGrantStatus.grantFailed:
        return 'GRANT_FAILED';
      case SubscriptionGrantStatus.revokeFailed:
        return 'REVOKE_FAILED';
    }
  }
}

extension SubscriptionGrantStatusFromString on String {
  SubscriptionGrantStatus toSubscriptionGrantStatus() {
    switch (this) {
      case 'GRANT_PENDING':
        return SubscriptionGrantStatus.grantPending;
      case 'REVOKE_PENDING':
        return SubscriptionGrantStatus.revokePending;
      case 'GRANT_IN_PROGRESS':
        return SubscriptionGrantStatus.grantInProgress;
      case 'REVOKE_IN_PROGRESS':
        return SubscriptionGrantStatus.revokeInProgress;
      case 'GRANTED':
        return SubscriptionGrantStatus.granted;
      case 'REVOKED':
        return SubscriptionGrantStatus.revoked;
      case 'GRANT_FAILED':
        return SubscriptionGrantStatus.grantFailed;
      case 'REVOKE_FAILED':
        return SubscriptionGrantStatus.revokeFailed;
    }
    throw Exception('$this is not known in enum SubscriptionGrantStatus');
  }
}

/// The details of the subscription grant.
class SubscriptionGrantSummary {
  /// The timestamp of when a subscription grant was created.
  final DateTime createdAt;

  /// The datazone user who created the subscription grant.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which a subscription grant
  /// exists.
  final String domainId;

  /// The entity to which the subscription is granted.
  final GrantedEntity grantedEntity;

  /// The identifier of the subscription grant.
  final String id;

  /// The status of the subscription grant.
  final SubscriptionGrantOverallStatus status;

  /// The identifier of the target of the subscription grant.
  final String subscriptionTargetId;

  /// The timestampf of when the subscription grant was updated.
  final DateTime updatedAt;

  /// The assets included in the subscription grant.
  final List<SubscribedAsset>? assets;

  /// The ID of the subscription grant.
  final String? subscriptionId;

  /// The Amazon DataZone user who updated the subscription grant.
  final String? updatedBy;

  SubscriptionGrantSummary({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.grantedEntity,
    required this.id,
    required this.status,
    required this.subscriptionTargetId,
    required this.updatedAt,
    this.assets,
    this.subscriptionId,
    this.updatedBy,
  });

  factory SubscriptionGrantSummary.fromJson(Map<String, dynamic> json) {
    return SubscriptionGrantSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      grantedEntity:
          GrantedEntity.fromJson(json['grantedEntity'] as Map<String, dynamic>),
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionGrantOverallStatus(),
      subscriptionTargetId: json['subscriptionTargetId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      assets: (json['assets'] as List?)
          ?.whereNotNull()
          .map((e) => SubscribedAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionId: json['subscriptionId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final grantedEntity = this.grantedEntity;
    final id = this.id;
    final status = this.status;
    final subscriptionTargetId = this.subscriptionTargetId;
    final updatedAt = this.updatedAt;
    final assets = this.assets;
    final subscriptionId = this.subscriptionId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'grantedEntity': grantedEntity,
      'id': id,
      'status': status.toValue(),
      'subscriptionTargetId': subscriptionTargetId,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (assets != null) 'assets': assets,
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum SubscriptionRequestStatus {
  pending,
  accepted,
  rejected,
}

extension SubscriptionRequestStatusValueExtension on SubscriptionRequestStatus {
  String toValue() {
    switch (this) {
      case SubscriptionRequestStatus.pending:
        return 'PENDING';
      case SubscriptionRequestStatus.accepted:
        return 'ACCEPTED';
      case SubscriptionRequestStatus.rejected:
        return 'REJECTED';
    }
  }
}

extension SubscriptionRequestStatusFromString on String {
  SubscriptionRequestStatus toSubscriptionRequestStatus() {
    switch (this) {
      case 'PENDING':
        return SubscriptionRequestStatus.pending;
      case 'ACCEPTED':
        return SubscriptionRequestStatus.accepted;
      case 'REJECTED':
        return SubscriptionRequestStatus.rejected;
    }
    throw Exception('$this is not known in enum SubscriptionRequestStatus');
  }
}

/// The details of the subscription request.
class SubscriptionRequestSummary {
  /// The timestamp of when a subscription request was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription request.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which a subscription request
  /// exists.
  final String domainId;

  /// The identifier of the subscription request.
  final String id;

  /// The reason for the subscription request.
  final String requestReason;

  /// The status of the subscription request.
  final SubscriptionRequestStatus status;

  /// The listings included in the subscription request.
  final List<SubscribedListing> subscribedListings;

  /// The principals included in the subscription request.
  final List<SubscribedPrincipal> subscribedPrincipals;

  /// The timestamp of when the subscription request was updated.
  final DateTime updatedAt;

  /// The decision comment of the subscription request.
  final String? decisionComment;

  /// The identifier of the subscription request reviewer.
  final String? reviewerId;

  /// The identifier of the Amazon DataZone user who updated the subscription
  /// request.
  final String? updatedBy;

  SubscriptionRequestSummary({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.requestReason,
    required this.status,
    required this.subscribedListings,
    required this.subscribedPrincipals,
    required this.updatedAt,
    this.decisionComment,
    this.reviewerId,
    this.updatedBy,
  });

  factory SubscriptionRequestSummary.fromJson(Map<String, dynamic> json) {
    return SubscriptionRequestSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      requestReason: json['requestReason'] as String,
      status: (json['status'] as String).toSubscriptionRequestStatus(),
      subscribedListings: (json['subscribedListings'] as List)
          .whereNotNull()
          .map((e) => SubscribedListing.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscribedPrincipals: (json['subscribedPrincipals'] as List)
          .whereNotNull()
          .map((e) => SubscribedPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      decisionComment: json['decisionComment'] as String?,
      reviewerId: json['reviewerId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final requestReason = this.requestReason;
    final status = this.status;
    final subscribedListings = this.subscribedListings;
    final subscribedPrincipals = this.subscribedPrincipals;
    final updatedAt = this.updatedAt;
    final decisionComment = this.decisionComment;
    final reviewerId = this.reviewerId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'requestReason': requestReason,
      'status': status.toValue(),
      'subscribedListings': subscribedListings,
      'subscribedPrincipals': subscribedPrincipals,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (decisionComment != null) 'decisionComment': decisionComment,
      if (reviewerId != null) 'reviewerId': reviewerId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum SubscriptionStatus {
  approved,
  revoked,
  cancelled,
}

extension SubscriptionStatusValueExtension on SubscriptionStatus {
  String toValue() {
    switch (this) {
      case SubscriptionStatus.approved:
        return 'APPROVED';
      case SubscriptionStatus.revoked:
        return 'REVOKED';
      case SubscriptionStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension SubscriptionStatusFromString on String {
  SubscriptionStatus toSubscriptionStatus() {
    switch (this) {
      case 'APPROVED':
        return SubscriptionStatus.approved;
      case 'REVOKED':
        return SubscriptionStatus.revoked;
      case 'CANCELLED':
        return SubscriptionStatus.cancelled;
    }
    throw Exception('$this is not known in enum SubscriptionStatus');
  }
}

/// The details of the subscription.
class SubscriptionSummary {
  /// The timestamp of when the subscription was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which a subscription exists.
  final String domainId;

  /// The identifier of the subscription.
  final String id;

  /// The status of the subscription.
  final SubscriptionStatus status;

  /// The listing included in the subscription.
  final SubscribedListing subscribedListing;

  /// The principal included in the subscription.
  final SubscribedPrincipal subscribedPrincipal;

  /// The timestamp of when the subscription was updated.
  final DateTime updatedAt;

  /// The retain permissions included in the subscription.
  final bool? retainPermissions;

  /// The identifier of the subscription request for the subscription.
  final String? subscriptionRequestId;

  /// The Amazon DataZone user who updated the subscription.
  final String? updatedBy;

  SubscriptionSummary({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.status,
    required this.subscribedListing,
    required this.subscribedPrincipal,
    required this.updatedAt,
    this.retainPermissions,
    this.subscriptionRequestId,
    this.updatedBy,
  });

  factory SubscriptionSummary.fromJson(Map<String, dynamic> json) {
    return SubscriptionSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionStatus(),
      subscribedListing: SubscribedListing.fromJson(
          json['subscribedListing'] as Map<String, dynamic>),
      subscribedPrincipal: SubscribedPrincipal.fromJson(
          json['subscribedPrincipal'] as Map<String, dynamic>),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      retainPermissions: json['retainPermissions'] as bool?,
      subscriptionRequestId: json['subscriptionRequestId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final status = this.status;
    final subscribedListing = this.subscribedListing;
    final subscribedPrincipal = this.subscribedPrincipal;
    final updatedAt = this.updatedAt;
    final retainPermissions = this.retainPermissions;
    final subscriptionRequestId = this.subscriptionRequestId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'status': status.toValue(),
      'subscribedListing': subscribedListing,
      'subscribedPrincipal': subscribedPrincipal,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (retainPermissions != null) 'retainPermissions': retainPermissions,
      if (subscriptionRequestId != null)
        'subscriptionRequestId': subscriptionRequestId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The details of the subscription target configuration.
class SubscriptionTargetForm {
  /// The content of the subscription target configuration.
  final String content;

  /// The form name included in the subscription target configuration.
  final String formName;

  SubscriptionTargetForm({
    required this.content,
    required this.formName,
  });

  factory SubscriptionTargetForm.fromJson(Map<String, dynamic> json) {
    return SubscriptionTargetForm(
      content: json['content'] as String,
      formName: json['formName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final formName = this.formName;
    return {
      'content': content,
      'formName': formName,
    };
  }
}

/// The details of the subscription target.
class SubscriptionTargetSummary {
  /// The asset types included in the subscription target.
  final List<String> applicableAssetTypes;

  /// The authorized principals included in the subscription target.
  final List<String> authorizedPrincipals;

  /// The timestamp of when the subscription target was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription target.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which the subscription
  /// target exists.
  final String domainId;

  /// The identifier of the environment of the subscription target.
  final String environmentId;

  /// The identifier of the subscription target.
  final String id;

  /// The manage access role specified in the subscription target.
  final String manageAccessRole;

  /// The name of the subscription target.
  final String name;

  /// The identifier of the project specified in the subscription target.
  final String projectId;

  /// The provider of the subscription target.
  final String provider;

  /// The configuration of the subscription target.
  final List<SubscriptionTargetForm> subscriptionTargetConfig;

  /// The type of the subscription target.
  final String type;

  /// The timestamp of when the subscription target was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the subscription target.
  final String? updatedBy;

  SubscriptionTargetSummary({
    required this.applicableAssetTypes,
    required this.authorizedPrincipals,
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.environmentId,
    required this.id,
    required this.manageAccessRole,
    required this.name,
    required this.projectId,
    required this.provider,
    required this.subscriptionTargetConfig,
    required this.type,
    this.updatedAt,
    this.updatedBy,
  });

  factory SubscriptionTargetSummary.fromJson(Map<String, dynamic> json) {
    return SubscriptionTargetSummary(
      applicableAssetTypes: (json['applicableAssetTypes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      authorizedPrincipals: (json['authorizedPrincipals'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      id: json['id'] as String,
      manageAccessRole: json['manageAccessRole'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      provider: json['provider'] as String,
      subscriptionTargetConfig: (json['subscriptionTargetConfig'] as List)
          .whereNotNull()
          .map(
              (e) => SubscriptionTargetForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicableAssetTypes = this.applicableAssetTypes;
    final authorizedPrincipals = this.authorizedPrincipals;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final id = this.id;
    final manageAccessRole = this.manageAccessRole;
    final name = this.name;
    final projectId = this.projectId;
    final provider = this.provider;
    final subscriptionTargetConfig = this.subscriptionTargetConfig;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'applicableAssetTypes': applicableAssetTypes,
      'authorizedPrincipals': authorizedPrincipals,
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentId': environmentId,
      'id': id,
      'manageAccessRole': manageAccessRole,
      'name': name,
      'projectId': projectId,
      'provider': provider,
      'subscriptionTargetConfig': subscriptionTargetConfig,
      'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
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

enum TaskStatus {
  active,
  inactive,
}

extension TaskStatusValueExtension on TaskStatus {
  String toValue() {
    switch (this) {
      case TaskStatus.active:
        return 'ACTIVE';
      case TaskStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension TaskStatusFromString on String {
  TaskStatus toTaskStatus() {
    switch (this) {
      case 'ACTIVE':
        return TaskStatus.active;
      case 'INACTIVE':
        return TaskStatus.inactive;
    }
    throw Exception('$this is not known in enum TaskStatus');
  }
}

/// The details of the term relations.
class TermRelations {
  /// The classifies of the term relations.
  final List<String>? classifies;

  /// The <code>isA</code> property of the term relations.
  final List<String>? isA;

  TermRelations({
    this.classifies,
    this.isA,
  });

  factory TermRelations.fromJson(Map<String, dynamic> json) {
    return TermRelations(
      classifies: (json['classifies'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      isA: (json['isA'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final classifies = this.classifies;
    final isA = this.isA;
    return {
      if (classifies != null) 'classifies': classifies,
      if (isA != null) 'isA': isA,
    };
  }
}

/// The time series data points form.
class TimeSeriesDataPointFormInput {
  /// The name of the time series data points form.
  final String formName;

  /// The timestamp of the time series data points form.
  final DateTime timestamp;

  /// The ID of the type of the time series data points form.
  final String typeIdentifier;

  /// The content of the time series data points form.
  final String? content;

  /// The revision type of the time series data points form.
  final String? typeRevision;

  TimeSeriesDataPointFormInput({
    required this.formName,
    required this.timestamp,
    required this.typeIdentifier,
    this.content,
    this.typeRevision,
  });

  Map<String, dynamic> toJson() {
    final formName = this.formName;
    final timestamp = this.timestamp;
    final typeIdentifier = this.typeIdentifier;
    final content = this.content;
    final typeRevision = this.typeRevision;
    return {
      'formName': formName,
      'timestamp': unixTimestampToJson(timestamp),
      'typeIdentifier': typeIdentifier,
      if (content != null) 'content': content,
      if (typeRevision != null) 'typeRevision': typeRevision,
    };
  }
}

/// The time series data points form.
class TimeSeriesDataPointFormOutput {
  /// The name of the time series data points form.
  final String formName;

  /// The timestamp of the time series data points form.
  final DateTime timestamp;

  /// The ID of the type of the time series data points form.
  final String typeIdentifier;

  /// The content of the time series data points form.
  final String? content;

  /// The ID of the time series data points form.
  final String? id;

  /// The revision type of the time series data points form.
  final String? typeRevision;

  TimeSeriesDataPointFormOutput({
    required this.formName,
    required this.timestamp,
    required this.typeIdentifier,
    this.content,
    this.id,
    this.typeRevision,
  });

  factory TimeSeriesDataPointFormOutput.fromJson(Map<String, dynamic> json) {
    return TimeSeriesDataPointFormOutput(
      formName: json['formName'] as String,
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] as Object),
      typeIdentifier: json['typeIdentifier'] as String,
      content: json['content'] as String?,
      id: json['id'] as String?,
      typeRevision: json['typeRevision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final formName = this.formName;
    final timestamp = this.timestamp;
    final typeIdentifier = this.typeIdentifier;
    final content = this.content;
    final id = this.id;
    final typeRevision = this.typeRevision;
    return {
      'formName': formName,
      'timestamp': unixTimestampToJson(timestamp),
      'typeIdentifier': typeIdentifier,
      if (content != null) 'content': content,
      if (id != null) 'id': id,
      if (typeRevision != null) 'typeRevision': typeRevision,
    };
  }
}

/// The summary of the time series data points form.
class TimeSeriesDataPointSummaryFormOutput {
  /// The name of the time series data points summary form.
  final String formName;

  /// The timestamp of the time series data points summary form.
  final DateTime timestamp;

  /// The type ID of the time series data points summary form.
  final String typeIdentifier;

  /// The content of the summary of the time series data points form.
  final String? contentSummary;

  /// The ID of the time series data points summary form.
  final String? id;

  /// The type revision of the time series data points summary form.
  final String? typeRevision;

  TimeSeriesDataPointSummaryFormOutput({
    required this.formName,
    required this.timestamp,
    required this.typeIdentifier,
    this.contentSummary,
    this.id,
    this.typeRevision,
  });

  factory TimeSeriesDataPointSummaryFormOutput.fromJson(
      Map<String, dynamic> json) {
    return TimeSeriesDataPointSummaryFormOutput(
      formName: json['formName'] as String,
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] as Object),
      typeIdentifier: json['typeIdentifier'] as String,
      contentSummary: json['contentSummary'] as String?,
      id: json['id'] as String?,
      typeRevision: json['typeRevision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final formName = this.formName;
    final timestamp = this.timestamp;
    final typeIdentifier = this.typeIdentifier;
    final contentSummary = this.contentSummary;
    final id = this.id;
    final typeRevision = this.typeRevision;
    return {
      'formName': formName,
      'timestamp': unixTimestampToJson(timestamp),
      'typeIdentifier': typeIdentifier,
      if (contentSummary != null) 'contentSummary': contentSummary,
      if (id != null) 'id': id,
      if (typeRevision != null) 'typeRevision': typeRevision,
    };
  }
}

enum TimeSeriesEntityType {
  asset,
  listing,
}

extension TimeSeriesEntityTypeValueExtension on TimeSeriesEntityType {
  String toValue() {
    switch (this) {
      case TimeSeriesEntityType.asset:
        return 'ASSET';
      case TimeSeriesEntityType.listing:
        return 'LISTING';
    }
  }
}

extension TimeSeriesEntityTypeFromString on String {
  TimeSeriesEntityType toTimeSeriesEntityType() {
    switch (this) {
      case 'ASSET':
        return TimeSeriesEntityType.asset;
      case 'LISTING':
        return TimeSeriesEntityType.listing;
    }
    throw Exception('$this is not known in enum TimeSeriesEntityType');
  }
}

enum Timezone {
  utc,
  africaJohannesburg,
  americaMontreal,
  americaSaoPaulo,
  asiaBahrain,
  asiaBangkok,
  asiaCalcutta,
  asiaDubai,
  asiaHongKong,
  asiaJakarta,
  asiaKualaLumpur,
  asiaSeoul,
  asiaShanghai,
  asiaSingapore,
  asiaTaipei,
  asiaTokyo,
  australiaMelbourne,
  australiaSydney,
  canadaCentral,
  cet,
  cst6cdt,
  etcGmt,
  etcGmt0,
  etcGmtAdd_0,
  etcGmtAdd_1,
  etcGmtAdd_10,
  etcGmtAdd_11,
  etcGmtAdd_12,
  etcGmtAdd_2,
  etcGmtAdd_3,
  etcGmtAdd_4,
  etcGmtAdd_5,
  etcGmtAdd_6,
  etcGmtAdd_7,
  etcGmtAdd_8,
  etcGmtAdd_9,
  etcGmtNeg_0,
  etcGmtNeg_1,
  etcGmtNeg_10,
  etcGmtNeg_11,
  etcGmtNeg_12,
  etcGmtNeg_13,
  etcGmtNeg_14,
  etcGmtNeg_2,
  etcGmtNeg_3,
  etcGmtNeg_4,
  etcGmtNeg_5,
  etcGmtNeg_6,
  etcGmtNeg_7,
  etcGmtNeg_8,
  etcGmtNeg_9,
  europeDublin,
  europeLondon,
  europeParis,
  europeStockholm,
  europeZurich,
  israel,
  mexicoGeneral,
  mst7mdt,
  pacificAuckland,
  usCentral,
  usEastern,
  usMountain,
  usPacific,
}

extension TimezoneValueExtension on Timezone {
  String toValue() {
    switch (this) {
      case Timezone.utc:
        return 'UTC';
      case Timezone.africaJohannesburg:
        return 'AFRICA_JOHANNESBURG';
      case Timezone.americaMontreal:
        return 'AMERICA_MONTREAL';
      case Timezone.americaSaoPaulo:
        return 'AMERICA_SAO_PAULO';
      case Timezone.asiaBahrain:
        return 'ASIA_BAHRAIN';
      case Timezone.asiaBangkok:
        return 'ASIA_BANGKOK';
      case Timezone.asiaCalcutta:
        return 'ASIA_CALCUTTA';
      case Timezone.asiaDubai:
        return 'ASIA_DUBAI';
      case Timezone.asiaHongKong:
        return 'ASIA_HONG_KONG';
      case Timezone.asiaJakarta:
        return 'ASIA_JAKARTA';
      case Timezone.asiaKualaLumpur:
        return 'ASIA_KUALA_LUMPUR';
      case Timezone.asiaSeoul:
        return 'ASIA_SEOUL';
      case Timezone.asiaShanghai:
        return 'ASIA_SHANGHAI';
      case Timezone.asiaSingapore:
        return 'ASIA_SINGAPORE';
      case Timezone.asiaTaipei:
        return 'ASIA_TAIPEI';
      case Timezone.asiaTokyo:
        return 'ASIA_TOKYO';
      case Timezone.australiaMelbourne:
        return 'AUSTRALIA_MELBOURNE';
      case Timezone.australiaSydney:
        return 'AUSTRALIA_SYDNEY';
      case Timezone.canadaCentral:
        return 'CANADA_CENTRAL';
      case Timezone.cet:
        return 'CET';
      case Timezone.cst6cdt:
        return 'CST6CDT';
      case Timezone.etcGmt:
        return 'ETC_GMT';
      case Timezone.etcGmt0:
        return 'ETC_GMT0';
      case Timezone.etcGmtAdd_0:
        return 'ETC_GMT_ADD_0';
      case Timezone.etcGmtAdd_1:
        return 'ETC_GMT_ADD_1';
      case Timezone.etcGmtAdd_10:
        return 'ETC_GMT_ADD_10';
      case Timezone.etcGmtAdd_11:
        return 'ETC_GMT_ADD_11';
      case Timezone.etcGmtAdd_12:
        return 'ETC_GMT_ADD_12';
      case Timezone.etcGmtAdd_2:
        return 'ETC_GMT_ADD_2';
      case Timezone.etcGmtAdd_3:
        return 'ETC_GMT_ADD_3';
      case Timezone.etcGmtAdd_4:
        return 'ETC_GMT_ADD_4';
      case Timezone.etcGmtAdd_5:
        return 'ETC_GMT_ADD_5';
      case Timezone.etcGmtAdd_6:
        return 'ETC_GMT_ADD_6';
      case Timezone.etcGmtAdd_7:
        return 'ETC_GMT_ADD_7';
      case Timezone.etcGmtAdd_8:
        return 'ETC_GMT_ADD_8';
      case Timezone.etcGmtAdd_9:
        return 'ETC_GMT_ADD_9';
      case Timezone.etcGmtNeg_0:
        return 'ETC_GMT_NEG_0';
      case Timezone.etcGmtNeg_1:
        return 'ETC_GMT_NEG_1';
      case Timezone.etcGmtNeg_10:
        return 'ETC_GMT_NEG_10';
      case Timezone.etcGmtNeg_11:
        return 'ETC_GMT_NEG_11';
      case Timezone.etcGmtNeg_12:
        return 'ETC_GMT_NEG_12';
      case Timezone.etcGmtNeg_13:
        return 'ETC_GMT_NEG_13';
      case Timezone.etcGmtNeg_14:
        return 'ETC_GMT_NEG_14';
      case Timezone.etcGmtNeg_2:
        return 'ETC_GMT_NEG_2';
      case Timezone.etcGmtNeg_3:
        return 'ETC_GMT_NEG_3';
      case Timezone.etcGmtNeg_4:
        return 'ETC_GMT_NEG_4';
      case Timezone.etcGmtNeg_5:
        return 'ETC_GMT_NEG_5';
      case Timezone.etcGmtNeg_6:
        return 'ETC_GMT_NEG_6';
      case Timezone.etcGmtNeg_7:
        return 'ETC_GMT_NEG_7';
      case Timezone.etcGmtNeg_8:
        return 'ETC_GMT_NEG_8';
      case Timezone.etcGmtNeg_9:
        return 'ETC_GMT_NEG_9';
      case Timezone.europeDublin:
        return 'EUROPE_DUBLIN';
      case Timezone.europeLondon:
        return 'EUROPE_LONDON';
      case Timezone.europeParis:
        return 'EUROPE_PARIS';
      case Timezone.europeStockholm:
        return 'EUROPE_STOCKHOLM';
      case Timezone.europeZurich:
        return 'EUROPE_ZURICH';
      case Timezone.israel:
        return 'ISRAEL';
      case Timezone.mexicoGeneral:
        return 'MEXICO_GENERAL';
      case Timezone.mst7mdt:
        return 'MST7MDT';
      case Timezone.pacificAuckland:
        return 'PACIFIC_AUCKLAND';
      case Timezone.usCentral:
        return 'US_CENTRAL';
      case Timezone.usEastern:
        return 'US_EASTERN';
      case Timezone.usMountain:
        return 'US_MOUNTAIN';
      case Timezone.usPacific:
        return 'US_PACIFIC';
    }
  }
}

extension TimezoneFromString on String {
  Timezone toTimezone() {
    switch (this) {
      case 'UTC':
        return Timezone.utc;
      case 'AFRICA_JOHANNESBURG':
        return Timezone.africaJohannesburg;
      case 'AMERICA_MONTREAL':
        return Timezone.americaMontreal;
      case 'AMERICA_SAO_PAULO':
        return Timezone.americaSaoPaulo;
      case 'ASIA_BAHRAIN':
        return Timezone.asiaBahrain;
      case 'ASIA_BANGKOK':
        return Timezone.asiaBangkok;
      case 'ASIA_CALCUTTA':
        return Timezone.asiaCalcutta;
      case 'ASIA_DUBAI':
        return Timezone.asiaDubai;
      case 'ASIA_HONG_KONG':
        return Timezone.asiaHongKong;
      case 'ASIA_JAKARTA':
        return Timezone.asiaJakarta;
      case 'ASIA_KUALA_LUMPUR':
        return Timezone.asiaKualaLumpur;
      case 'ASIA_SEOUL':
        return Timezone.asiaSeoul;
      case 'ASIA_SHANGHAI':
        return Timezone.asiaShanghai;
      case 'ASIA_SINGAPORE':
        return Timezone.asiaSingapore;
      case 'ASIA_TAIPEI':
        return Timezone.asiaTaipei;
      case 'ASIA_TOKYO':
        return Timezone.asiaTokyo;
      case 'AUSTRALIA_MELBOURNE':
        return Timezone.australiaMelbourne;
      case 'AUSTRALIA_SYDNEY':
        return Timezone.australiaSydney;
      case 'CANADA_CENTRAL':
        return Timezone.canadaCentral;
      case 'CET':
        return Timezone.cet;
      case 'CST6CDT':
        return Timezone.cst6cdt;
      case 'ETC_GMT':
        return Timezone.etcGmt;
      case 'ETC_GMT0':
        return Timezone.etcGmt0;
      case 'ETC_GMT_ADD_0':
        return Timezone.etcGmtAdd_0;
      case 'ETC_GMT_ADD_1':
        return Timezone.etcGmtAdd_1;
      case 'ETC_GMT_ADD_10':
        return Timezone.etcGmtAdd_10;
      case 'ETC_GMT_ADD_11':
        return Timezone.etcGmtAdd_11;
      case 'ETC_GMT_ADD_12':
        return Timezone.etcGmtAdd_12;
      case 'ETC_GMT_ADD_2':
        return Timezone.etcGmtAdd_2;
      case 'ETC_GMT_ADD_3':
        return Timezone.etcGmtAdd_3;
      case 'ETC_GMT_ADD_4':
        return Timezone.etcGmtAdd_4;
      case 'ETC_GMT_ADD_5':
        return Timezone.etcGmtAdd_5;
      case 'ETC_GMT_ADD_6':
        return Timezone.etcGmtAdd_6;
      case 'ETC_GMT_ADD_7':
        return Timezone.etcGmtAdd_7;
      case 'ETC_GMT_ADD_8':
        return Timezone.etcGmtAdd_8;
      case 'ETC_GMT_ADD_9':
        return Timezone.etcGmtAdd_9;
      case 'ETC_GMT_NEG_0':
        return Timezone.etcGmtNeg_0;
      case 'ETC_GMT_NEG_1':
        return Timezone.etcGmtNeg_1;
      case 'ETC_GMT_NEG_10':
        return Timezone.etcGmtNeg_10;
      case 'ETC_GMT_NEG_11':
        return Timezone.etcGmtNeg_11;
      case 'ETC_GMT_NEG_12':
        return Timezone.etcGmtNeg_12;
      case 'ETC_GMT_NEG_13':
        return Timezone.etcGmtNeg_13;
      case 'ETC_GMT_NEG_14':
        return Timezone.etcGmtNeg_14;
      case 'ETC_GMT_NEG_2':
        return Timezone.etcGmtNeg_2;
      case 'ETC_GMT_NEG_3':
        return Timezone.etcGmtNeg_3;
      case 'ETC_GMT_NEG_4':
        return Timezone.etcGmtNeg_4;
      case 'ETC_GMT_NEG_5':
        return Timezone.etcGmtNeg_5;
      case 'ETC_GMT_NEG_6':
        return Timezone.etcGmtNeg_6;
      case 'ETC_GMT_NEG_7':
        return Timezone.etcGmtNeg_7;
      case 'ETC_GMT_NEG_8':
        return Timezone.etcGmtNeg_8;
      case 'ETC_GMT_NEG_9':
        return Timezone.etcGmtNeg_9;
      case 'EUROPE_DUBLIN':
        return Timezone.europeDublin;
      case 'EUROPE_LONDON':
        return Timezone.europeLondon;
      case 'EUROPE_PARIS':
        return Timezone.europeParis;
      case 'EUROPE_STOCKHOLM':
        return Timezone.europeStockholm;
      case 'EUROPE_ZURICH':
        return Timezone.europeZurich;
      case 'ISRAEL':
        return Timezone.israel;
      case 'MEXICO_GENERAL':
        return Timezone.mexicoGeneral;
      case 'MST7MDT':
        return Timezone.mst7mdt;
      case 'PACIFIC_AUCKLAND':
        return Timezone.pacificAuckland;
      case 'US_CENTRAL':
        return Timezone.usCentral;
      case 'US_EASTERN':
        return Timezone.usEastern;
      case 'US_MOUNTAIN':
        return Timezone.usMountain;
      case 'US_PACIFIC':
        return Timezone.usPacific;
    }
    throw Exception('$this is not known in enum Timezone');
  }
}

/// The topic of the notification.
class Topic {
  final NotificationResource resource;

  /// The role of the resource mentioned in a notification.
  final NotificationRole role;

  /// The subject of the resource mentioned in a notification.
  final String subject;

  Topic({
    required this.resource,
    required this.role,
    required this.subject,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      resource: NotificationResource.fromJson(
          json['resource'] as Map<String, dynamic>),
      role: (json['role'] as String).toNotificationRole(),
      subject: json['subject'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final role = this.role;
    final subject = this.subject;
    return {
      'resource': resource,
      'role': role.toValue(),
      'subject': subject,
    };
  }
}

enum TypesSearchScope {
  assetType,
  formType,
}

extension TypesSearchScopeValueExtension on TypesSearchScope {
  String toValue() {
    switch (this) {
      case TypesSearchScope.assetType:
        return 'ASSET_TYPE';
      case TypesSearchScope.formType:
        return 'FORM_TYPE';
    }
  }
}

extension TypesSearchScopeFromString on String {
  TypesSearchScope toTypesSearchScope() {
    switch (this) {
      case 'ASSET_TYPE':
        return TypesSearchScope.assetType;
      case 'FORM_TYPE':
        return TypesSearchScope.formType;
    }
    throw Exception('$this is not known in enum TypesSearchScope');
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

class UpdateDataSourceOutput {
  /// The identifier of the Amazon DataZone domain in which a data source is to be
  /// updated.
  final String domainId;

  /// The identifier of the environment in which a data source is to be updated.
  final String environmentId;

  /// The identifier of the data source to be updated.
  final String id;

  /// The name to be updated as part of the <code>UpdateDataSource</code> action.
  final String name;

  /// The identifier of the project where data source is to be updated.
  final String projectId;

  /// The asset forms to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  final List<FormOutput>? assetFormsOutput;

  /// The configuration to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  final DataSourceConfigurationOutput? configuration;

  /// The timestamp of when the data source was updated.
  final DateTime? createdAt;

  /// The description to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  final String? description;

  /// The enable setting to be updated as part of the
  /// <code>UpdateDataSource</code> action.
  final EnableSetting? enableSetting;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final DataSourceErrorMessage? errorMessage;

  /// The timestamp of when the data source was last run.
  final DateTime? lastRunAt;

  /// The last run error message of the data source.
  final DataSourceErrorMessage? lastRunErrorMessage;

  /// The last run status of the data source.
  final DataSourceRunStatus? lastRunStatus;

  /// The publish on import setting to be updated as part of the
  /// <code>UpdateDataSource</code> action.
  final bool? publishOnImport;

  /// The recommendation to be updated as part of the
  /// <code>UpdateDataSource</code> action.
  final RecommendationConfiguration? recommendation;

  /// The schedule to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  final ScheduleConfiguration? schedule;

  /// The status to be updated as part of the <code>UpdateDataSource</code>
  /// action.
  final DataSourceStatus? status;

  /// The type to be updated as part of the <code>UpdateDataSource</code> action.
  final String? type;

  /// The timestamp of when the data source was updated.
  final DateTime? updatedAt;

  UpdateDataSourceOutput({
    required this.domainId,
    required this.environmentId,
    required this.id,
    required this.name,
    required this.projectId,
    this.assetFormsOutput,
    this.configuration,
    this.createdAt,
    this.description,
    this.enableSetting,
    this.errorMessage,
    this.lastRunAt,
    this.lastRunErrorMessage,
    this.lastRunStatus,
    this.publishOnImport,
    this.recommendation,
    this.schedule,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory UpdateDataSourceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateDataSourceOutput(
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      assetFormsOutput: (json['assetFormsOutput'] as List?)
          ?.whereNotNull()
          .map((e) => FormOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      configuration: json['configuration'] != null
          ? DataSourceConfigurationOutput.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      enableSetting: (json['enableSetting'] as String?)?.toEnableSetting(),
      errorMessage: json['errorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['errorMessage'] as Map<String, dynamic>)
          : null,
      lastRunAt: timeStampFromJson(json['lastRunAt']),
      lastRunErrorMessage: json['lastRunErrorMessage'] != null
          ? DataSourceErrorMessage.fromJson(
              json['lastRunErrorMessage'] as Map<String, dynamic>)
          : null,
      lastRunStatus:
          (json['lastRunStatus'] as String?)?.toDataSourceRunStatus(),
      publishOnImport: json['publishOnImport'] as bool?,
      recommendation: json['recommendation'] != null
          ? RecommendationConfiguration.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      schedule: json['schedule'] != null
          ? ScheduleConfiguration.fromJson(
              json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toDataSourceStatus(),
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final id = this.id;
    final name = this.name;
    final projectId = this.projectId;
    final assetFormsOutput = this.assetFormsOutput;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final description = this.description;
    final enableSetting = this.enableSetting;
    final errorMessage = this.errorMessage;
    final lastRunAt = this.lastRunAt;
    final lastRunErrorMessage = this.lastRunErrorMessage;
    final lastRunStatus = this.lastRunStatus;
    final publishOnImport = this.publishOnImport;
    final recommendation = this.recommendation;
    final schedule = this.schedule;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      'domainId': domainId,
      'environmentId': environmentId,
      'id': id,
      'name': name,
      'projectId': projectId,
      if (assetFormsOutput != null) 'assetFormsOutput': assetFormsOutput,
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (enableSetting != null) 'enableSetting': enableSetting.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (lastRunAt != null) 'lastRunAt': iso8601ToJson(lastRunAt),
      if (lastRunErrorMessage != null)
        'lastRunErrorMessage': lastRunErrorMessage,
      if (lastRunStatus != null) 'lastRunStatus': lastRunStatus.toValue(),
      if (publishOnImport != null) 'publishOnImport': publishOnImport,
      if (recommendation != null) 'recommendation': recommendation,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class UpdateDomainOutput {
  /// The identifier of the Amazon DataZone domain.
  final String id;

  /// The description to be updated as part of the <code>UpdateDomain</code>
  /// action.
  final String? description;

  /// The domain execution role to be updated as part of the
  /// <code>UpdateDomain</code> action.
  final String? domainExecutionRole;

  /// Specifies the timestamp of when the domain was last updated.
  final DateTime? lastUpdatedAt;

  /// The name to be updated as part of the <code>UpdateDomain</code> action.
  final String? name;

  /// The single sign-on option of the Amazon DataZone domain.
  final SingleSignOn? singleSignOn;

  UpdateDomainOutput({
    required this.id,
    this.description,
    this.domainExecutionRole,
    this.lastUpdatedAt,
    this.name,
    this.singleSignOn,
  });

  factory UpdateDomainOutput.fromJson(Map<String, dynamic> json) {
    return UpdateDomainOutput(
      id: json['id'] as String,
      description: json['description'] as String?,
      domainExecutionRole: json['domainExecutionRole'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      singleSignOn: json['singleSignOn'] != null
          ? SingleSignOn.fromJson(json['singleSignOn'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final description = this.description;
    final domainExecutionRole = this.domainExecutionRole;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final singleSignOn = this.singleSignOn;
    return {
      'id': id,
      if (description != null) 'description': description,
      if (domainExecutionRole != null)
        'domainExecutionRole': domainExecutionRole,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (singleSignOn != null) 'singleSignOn': singleSignOn,
    };
  }
}

class UpdateEnvironmentOutput {
  /// The Amazon DataZone user who created the environment.
  final String createdBy;

  /// The identifier of the domain in which the environment is to be updated.
  final String domainId;

  /// The profile identifier of the environment.
  final String environmentProfileId;

  /// The name to be updated as part of the <code>UpdateEnvironment</code> action.
  final String name;

  /// The project identifier of the environment.
  final String projectId;

  /// The provider identifier of the environment.
  final String provider;

  /// The identifier of the Amazon Web Services account in which the environment
  /// is to be updated.
  final String? awsAccountId;

  /// The Amazon Web Services Region in which the environment is updated.
  final String? awsAccountRegion;

  /// The timestamp of when the environment was created.
  final DateTime? createdAt;

  /// The deployment properties to be updated as part of the
  /// <code>UpdateEnvironment</code> action.
  final DeploymentProperties? deploymentProperties;

  /// The description to be updated as part of the <code>UpdateEnvironment</code>
  /// action.
  final String? description;

  /// The environment actions to be updated as part of the
  /// <code>UpdateEnvironment</code> action.
  final List<ConfigurableEnvironmentAction>? environmentActions;

  /// The blueprint identifier of the environment.
  final String? environmentBlueprintId;

  /// The glossary terms to be updated as part of the
  /// <code>UpdateEnvironment</code> action.
  final List<String>? glossaryTerms;

  /// The identifier of the environment that is to be updated.
  final String? id;

  /// The last deployment of the environment.
  final Deployment? lastDeployment;

  /// The provisioned resources to be updated as part of the
  /// <code>UpdateEnvironment</code> action.
  final List<Resource>? provisionedResources;

  /// The provisioning properties to be updated as part of the
  /// <code>UpdateEnvironment</code> action.
  final ProvisioningProperties? provisioningProperties;

  /// The status to be updated as part of the <code>UpdateEnvironment</code>
  /// action.
  final EnvironmentStatus? status;

  /// The timestamp of when the environment was updated.
  final DateTime? updatedAt;

  /// The user parameters to be updated as part of the
  /// <code>UpdateEnvironment</code> action.
  final List<CustomParameter>? userParameters;

  UpdateEnvironmentOutput({
    required this.createdBy,
    required this.domainId,
    required this.environmentProfileId,
    required this.name,
    required this.projectId,
    required this.provider,
    this.awsAccountId,
    this.awsAccountRegion,
    this.createdAt,
    this.deploymentProperties,
    this.description,
    this.environmentActions,
    this.environmentBlueprintId,
    this.glossaryTerms,
    this.id,
    this.lastDeployment,
    this.provisionedResources,
    this.provisioningProperties,
    this.status,
    this.updatedAt,
    this.userParameters,
  });

  factory UpdateEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentProfileId: json['environmentProfileId'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      provider: json['provider'] as String,
      awsAccountId: json['awsAccountId'] as String?,
      awsAccountRegion: json['awsAccountRegion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deploymentProperties: json['deploymentProperties'] != null
          ? DeploymentProperties.fromJson(
              json['deploymentProperties'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      environmentActions: (json['environmentActions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConfigurableEnvironmentAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentBlueprintId: json['environmentBlueprintId'] as String?,
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      lastDeployment: json['lastDeployment'] != null
          ? Deployment.fromJson(json['lastDeployment'] as Map<String, dynamic>)
          : null,
      provisionedResources: (json['provisionedResources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      provisioningProperties: json['provisioningProperties'] != null
          ? ProvisioningProperties.fromJson(
              json['provisioningProperties'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      userParameters: (json['userParameters'] as List?)
          ?.whereNotNull()
          .map((e) => CustomParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentProfileId = this.environmentProfileId;
    final name = this.name;
    final projectId = this.projectId;
    final provider = this.provider;
    final awsAccountId = this.awsAccountId;
    final awsAccountRegion = this.awsAccountRegion;
    final createdAt = this.createdAt;
    final deploymentProperties = this.deploymentProperties;
    final description = this.description;
    final environmentActions = this.environmentActions;
    final environmentBlueprintId = this.environmentBlueprintId;
    final glossaryTerms = this.glossaryTerms;
    final id = this.id;
    final lastDeployment = this.lastDeployment;
    final provisionedResources = this.provisionedResources;
    final provisioningProperties = this.provisioningProperties;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final userParameters = this.userParameters;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentProfileId': environmentProfileId,
      'name': name,
      'projectId': projectId,
      'provider': provider,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (deploymentProperties != null)
        'deploymentProperties': deploymentProperties,
      if (description != null) 'description': description,
      if (environmentActions != null) 'environmentActions': environmentActions,
      if (environmentBlueprintId != null)
        'environmentBlueprintId': environmentBlueprintId,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (id != null) 'id': id,
      if (lastDeployment != null) 'lastDeployment': lastDeployment,
      if (provisionedResources != null)
        'provisionedResources': provisionedResources,
      if (provisioningProperties != null)
        'provisioningProperties': provisioningProperties,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (userParameters != null) 'userParameters': userParameters,
    };
  }
}

class UpdateEnvironmentProfileOutput {
  /// The Amazon DataZone user who created the environment profile.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which the environment
  /// profile is to be updated.
  final String domainId;

  /// The identifier of the blueprint of the environment profile that is to be
  /// updated.
  final String environmentBlueprintId;

  /// The identifier of the environment profile that is to be udpated.
  final String id;

  /// The name to be updated as part of the <code>UpdateEnvironmentProfile</code>
  /// action.
  final String name;

  /// The Amazon Web Services account in which a specified environment profile is
  /// to be udpated.
  final String? awsAccountId;

  /// The Amazon Web Services Region in which a specified environment profile is
  /// to be updated.
  final String? awsAccountRegion;

  /// The timestamp of when the environment profile was created.
  final DateTime? createdAt;

  /// The description to be updated as part of the
  /// <code>UpdateEnvironmentProfile</code> action.
  final String? description;

  /// The identifier of the project of the environment profile that is to be
  /// updated.
  final String? projectId;

  /// The timestamp of when the environment profile was updated.
  final DateTime? updatedAt;

  /// The user parameters to be updated as part of the
  /// <code>UpdateEnvironmentProfile</code> action.
  final List<CustomParameter>? userParameters;

  UpdateEnvironmentProfileOutput({
    required this.createdBy,
    required this.domainId,
    required this.environmentBlueprintId,
    required this.id,
    required this.name,
    this.awsAccountId,
    this.awsAccountRegion,
    this.createdAt,
    this.description,
    this.projectId,
    this.updatedAt,
    this.userParameters,
  });

  factory UpdateEnvironmentProfileOutput.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentProfileOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentBlueprintId: json['environmentBlueprintId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      awsAccountId: json['awsAccountId'] as String?,
      awsAccountRegion: json['awsAccountRegion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      projectId: json['projectId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      userParameters: (json['userParameters'] as List?)
          ?.whereNotNull()
          .map((e) => CustomParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentBlueprintId = this.environmentBlueprintId;
    final id = this.id;
    final name = this.name;
    final awsAccountId = this.awsAccountId;
    final awsAccountRegion = this.awsAccountRegion;
    final createdAt = this.createdAt;
    final description = this.description;
    final projectId = this.projectId;
    final updatedAt = this.updatedAt;
    final userParameters = this.userParameters;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentBlueprintId': environmentBlueprintId,
      'id': id,
      'name': name,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsAccountRegion != null) 'awsAccountRegion': awsAccountRegion,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (projectId != null) 'projectId': projectId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (userParameters != null) 'userParameters': userParameters,
    };
  }
}

class UpdateGlossaryOutput {
  /// The identifier of the Amazon DataZone domain in which a business glossary is
  /// to be updated.
  final String domainId;

  /// The identifier of the business glossary that is to be updated.
  final String id;

  /// The name to be updated as part of the <code>UpdateGlossary</code> action.
  final String name;

  /// The identifier of the project in which to update a business glossary.
  final String owningProjectId;

  /// The description to be updated as part of the <code>UpdateGlossary</code>
  /// action.
  final String? description;

  /// The status to be updated as part of the <code>UpdateGlossary</code> action.
  final GlossaryStatus? status;

  UpdateGlossaryOutput({
    required this.domainId,
    required this.id,
    required this.name,
    required this.owningProjectId,
    this.description,
    this.status,
  });

  factory UpdateGlossaryOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGlossaryOutput(
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      owningProjectId: json['owningProjectId'] as String,
      description: json['description'] as String?,
      status: (json['status'] as String?)?.toGlossaryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final owningProjectId = this.owningProjectId;
    final description = this.description;
    final status = this.status;
    return {
      'domainId': domainId,
      'id': id,
      'name': name,
      'owningProjectId': owningProjectId,
      if (description != null) 'description': description,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class UpdateGlossaryTermOutput {
  /// The identifier of the Amazon DataZone domain in which a business glossary
  /// term is to be updated.
  final String domainId;

  /// The identifier of the business glossary in which a term is to be updated.
  final String glossaryId;

  /// The identifier of the business glossary term that is to be updated.
  final String id;

  /// The name to be updated as part of the <code>UpdateGlossaryTerm</code>
  /// action.
  final String name;

  /// The status to be updated as part of the <code>UpdateGlossaryTerm</code>
  /// action.
  final GlossaryTermStatus status;

  /// The long description to be updated as part of the
  /// <code>UpdateGlossaryTerm</code> action.
  final String? longDescription;

  /// The short description to be updated as part of the
  /// <code>UpdateGlossaryTerm</code> action.
  final String? shortDescription;

  /// The term relations to be updated as part of the
  /// <code>UpdateGlossaryTerm</code> action.
  final TermRelations? termRelations;

  UpdateGlossaryTermOutput({
    required this.domainId,
    required this.glossaryId,
    required this.id,
    required this.name,
    required this.status,
    this.longDescription,
    this.shortDescription,
    this.termRelations,
  });

  factory UpdateGlossaryTermOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGlossaryTermOutput(
      domainId: json['domainId'] as String,
      glossaryId: json['glossaryId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toGlossaryTermStatus(),
      longDescription: json['longDescription'] as String?,
      shortDescription: json['shortDescription'] as String?,
      termRelations: json['termRelations'] != null
          ? TermRelations.fromJson(
              json['termRelations'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final glossaryId = this.glossaryId;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final longDescription = this.longDescription;
    final shortDescription = this.shortDescription;
    final termRelations = this.termRelations;
    return {
      'domainId': domainId,
      'glossaryId': glossaryId,
      'id': id,
      'name': name,
      'status': status.toValue(),
      if (longDescription != null) 'longDescription': longDescription,
      if (shortDescription != null) 'shortDescription': shortDescription,
      if (termRelations != null) 'termRelations': termRelations,
    };
  }
}

class UpdateGroupProfileOutput {
  /// The identifier of the Amazon DataZone domain in which a group profile is
  /// updated.
  final String? domainId;

  /// The name of the group profile that is updated.
  final String? groupName;

  /// The identifier of the group profile that is updated.
  final String? id;

  /// The status of the group profile that is updated.
  final GroupProfileStatus? status;

  UpdateGroupProfileOutput({
    this.domainId,
    this.groupName,
    this.id,
    this.status,
  });

  factory UpdateGroupProfileOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGroupProfileOutput(
      domainId: json['domainId'] as String?,
      groupName: json['groupName'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toGroupProfileStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final groupName = this.groupName;
    final id = this.id;
    final status = this.status;
    return {
      if (domainId != null) 'domainId': domainId,
      if (groupName != null) 'groupName': groupName,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class UpdateProjectOutput {
  /// The Amazon DataZone user who created the project.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which a project is updated.
  final String domainId;

  /// The identifier of the project that is to be updated.
  final String id;

  /// The name of the project that is to be updated.
  final String name;

  /// The timestamp of when the project was created.
  final DateTime? createdAt;

  /// The description of the project that is to be updated.
  final String? description;

  /// Specifies the error message that is returned if the operation cannot be
  /// successfully completed.
  final List<ProjectDeletionError>? failureReasons;

  /// The glossary terms of the project that are to be updated.
  final List<String>? glossaryTerms;

  /// The timestamp of when the project was last updated.
  final DateTime? lastUpdatedAt;

  /// The status of the project.
  final ProjectStatus? projectStatus;

  UpdateProjectOutput({
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.name,
    this.createdAt,
    this.description,
    this.failureReasons,
    this.glossaryTerms,
    this.lastUpdatedAt,
    this.projectStatus,
  });

  factory UpdateProjectOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProjectOutput(
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectDeletionError.fromJson(e as Map<String, dynamic>))
          .toList(),
      glossaryTerms: (json['glossaryTerms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      projectStatus: (json['projectStatus'] as String?)?.toProjectStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final name = this.name;
    final createdAt = this.createdAt;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final glossaryTerms = this.glossaryTerms;
    final lastUpdatedAt = this.lastUpdatedAt;
    final projectStatus = this.projectStatus;
    return {
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'name': name,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (glossaryTerms != null) 'glossaryTerms': glossaryTerms,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (projectStatus != null) 'projectStatus': projectStatus.toValue(),
    };
  }
}

class UpdateSubscriptionGrantStatusOutput {
  /// The timestamp of when the subscription grant status was created.
  final DateTime createdAt;

  /// The Amazon DataZone domain user who created the subscription grant status.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which a subscription grant
  /// status is to be updated.
  final String domainId;

  /// The granted entity to be updated as part of the
  /// <code>UpdateSubscriptionGrantStatus</code> action.
  final GrantedEntity grantedEntity;

  /// The identifier of the subscription grant.
  final String id;

  /// The status to be updated as part of the
  /// <code>UpdateSubscriptionGrantStatus</code> action.
  final SubscriptionGrantOverallStatus status;

  /// The identifier of the subscription target whose subscription grant status is
  /// to be updated.
  final String subscriptionTargetId;

  /// The timestamp of when the subscription grant status is to be updated.
  final DateTime updatedAt;

  /// The details of the asset for which the subscription grant is created.
  final List<SubscribedAsset>? assets;

  /// The identifier of the subscription.
  final String? subscriptionId;

  /// The Amazon DataZone user who updated the subscription grant status.
  final String? updatedBy;

  UpdateSubscriptionGrantStatusOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.grantedEntity,
    required this.id,
    required this.status,
    required this.subscriptionTargetId,
    required this.updatedAt,
    this.assets,
    this.subscriptionId,
    this.updatedBy,
  });

  factory UpdateSubscriptionGrantStatusOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateSubscriptionGrantStatusOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      grantedEntity:
          GrantedEntity.fromJson(json['grantedEntity'] as Map<String, dynamic>),
      id: json['id'] as String,
      status: (json['status'] as String).toSubscriptionGrantOverallStatus(),
      subscriptionTargetId: json['subscriptionTargetId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      assets: (json['assets'] as List?)
          ?.whereNotNull()
          .map((e) => SubscribedAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionId: json['subscriptionId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final grantedEntity = this.grantedEntity;
    final id = this.id;
    final status = this.status;
    final subscriptionTargetId = this.subscriptionTargetId;
    final updatedAt = this.updatedAt;
    final assets = this.assets;
    final subscriptionId = this.subscriptionId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'grantedEntity': grantedEntity,
      'id': id,
      'status': status.toValue(),
      'subscriptionTargetId': subscriptionTargetId,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (assets != null) 'assets': assets,
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateSubscriptionRequestOutput {
  /// The timestamp of when the subscription request was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription request.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which a subscription request
  /// is to be updated.
  final String domainId;

  /// The identifier of the subscription request that is to be updated.
  final String id;

  /// The reason for the <code>UpdateSubscriptionRequest</code> action.
  final String requestReason;

  /// The status of the subscription request.
  final SubscriptionRequestStatus status;

  /// The subscribed listings of the subscription request.
  final List<SubscribedListing> subscribedListings;

  /// The subscribed principals of the subscription request.
  final List<SubscribedPrincipal> subscribedPrincipals;

  /// The timestamp of when the subscription request was updated.
  final DateTime updatedAt;

  /// The decision comment of the <code>UpdateSubscriptionRequest</code> action.
  final String? decisionComment;

  /// The identifier of the Amazon DataZone user who reviews the subscription
  /// request.
  final String? reviewerId;

  /// The Amazon DataZone user who updated the subscription request.
  final String? updatedBy;

  UpdateSubscriptionRequestOutput({
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.id,
    required this.requestReason,
    required this.status,
    required this.subscribedListings,
    required this.subscribedPrincipals,
    required this.updatedAt,
    this.decisionComment,
    this.reviewerId,
    this.updatedBy,
  });

  factory UpdateSubscriptionRequestOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSubscriptionRequestOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      id: json['id'] as String,
      requestReason: json['requestReason'] as String,
      status: (json['status'] as String).toSubscriptionRequestStatus(),
      subscribedListings: (json['subscribedListings'] as List)
          .whereNotNull()
          .map((e) => SubscribedListing.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscribedPrincipals: (json['subscribedPrincipals'] as List)
          .whereNotNull()
          .map((e) => SubscribedPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      decisionComment: json['decisionComment'] as String?,
      reviewerId: json['reviewerId'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final id = this.id;
    final requestReason = this.requestReason;
    final status = this.status;
    final subscribedListings = this.subscribedListings;
    final subscribedPrincipals = this.subscribedPrincipals;
    final updatedAt = this.updatedAt;
    final decisionComment = this.decisionComment;
    final reviewerId = this.reviewerId;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'id': id,
      'requestReason': requestReason,
      'status': status.toValue(),
      'subscribedListings': subscribedListings,
      'subscribedPrincipals': subscribedPrincipals,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (decisionComment != null) 'decisionComment': decisionComment,
      if (reviewerId != null) 'reviewerId': reviewerId,
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateSubscriptionTargetOutput {
  /// The applicable asset types to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  final List<String> applicableAssetTypes;

  /// The authorized principals to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  final List<String> authorizedPrincipals;

  /// The timestamp of when a subscription target was created.
  final DateTime createdAt;

  /// The Amazon DataZone user who created the subscription target.
  final String createdBy;

  /// The identifier of the Amazon DataZone domain in which a subscription target
  /// is to be updated.
  final String domainId;

  /// The identifier of the environment in which a subscription target is to be
  /// updated.
  final String environmentId;

  /// Identifier of the subscription target that is to be updated.
  final String id;

  /// The manage access role to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  final String manageAccessRole;

  /// The name to be updated as part of the <code>UpdateSubscriptionTarget</code>
  /// action.
  final String name;

  /// The identifier of the project in which a subscription target is to be
  /// updated.
  final String projectId;

  /// The provider to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  final String provider;

  /// The configuration to be updated as part of the
  /// <code>UpdateSubscriptionTarget</code> action.
  final List<SubscriptionTargetForm> subscriptionTargetConfig;

  /// The type to be updated as part of the <code>UpdateSubscriptionTarget</code>
  /// action.
  final String type;

  /// The timestamp of when the subscription target was updated.
  final DateTime? updatedAt;

  /// The Amazon DataZone user who updated the subscription target.
  final String? updatedBy;

  UpdateSubscriptionTargetOutput({
    required this.applicableAssetTypes,
    required this.authorizedPrincipals,
    required this.createdAt,
    required this.createdBy,
    required this.domainId,
    required this.environmentId,
    required this.id,
    required this.manageAccessRole,
    required this.name,
    required this.projectId,
    required this.provider,
    required this.subscriptionTargetConfig,
    required this.type,
    this.updatedAt,
    this.updatedBy,
  });

  factory UpdateSubscriptionTargetOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSubscriptionTargetOutput(
      applicableAssetTypes: (json['applicableAssetTypes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      authorizedPrincipals: (json['authorizedPrincipals'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      domainId: json['domainId'] as String,
      environmentId: json['environmentId'] as String,
      id: json['id'] as String,
      manageAccessRole: json['manageAccessRole'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      provider: json['provider'] as String,
      subscriptionTargetConfig: (json['subscriptionTargetConfig'] as List)
          .whereNotNull()
          .map(
              (e) => SubscriptionTargetForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicableAssetTypes = this.applicableAssetTypes;
    final authorizedPrincipals = this.authorizedPrincipals;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final domainId = this.domainId;
    final environmentId = this.environmentId;
    final id = this.id;
    final manageAccessRole = this.manageAccessRole;
    final name = this.name;
    final projectId = this.projectId;
    final provider = this.provider;
    final subscriptionTargetConfig = this.subscriptionTargetConfig;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'applicableAssetTypes': applicableAssetTypes,
      'authorizedPrincipals': authorizedPrincipals,
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'domainId': domainId,
      'environmentId': environmentId,
      'id': id,
      'manageAccessRole': manageAccessRole,
      'name': name,
      'projectId': projectId,
      'provider': provider,
      'subscriptionTargetConfig': subscriptionTargetConfig,
      'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateUserProfileOutput {
  final UserProfileDetails? details;

  /// The identifier of the Amazon DataZone domain in which a user profile is
  /// updated.
  final String? domainId;

  /// The identifier of the user profile.
  final String? id;

  /// The status of the user profile.
  final UserProfileStatus? status;

  /// The type of the user profile.
  final UserProfileType? type;

  UpdateUserProfileOutput({
    this.details,
    this.domainId,
    this.id,
    this.status,
    this.type,
  });

  factory UpdateUserProfileOutput.fromJson(Map<String, dynamic> json) {
    return UpdateUserProfileOutput(
      details: json['details'] != null
          ? UserProfileDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
      domainId: json['domainId'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toUserProfileStatus(),
      type: (json['type'] as String?)?.toUserProfileType(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final domainId = this.domainId;
    final id = this.id;
    final status = this.status;
    final type = this.type;
    return {
      if (details != null) 'details': details,
      if (domainId != null) 'domainId': domainId,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum UserAssignment {
  automatic,
  manual,
}

extension UserAssignmentValueExtension on UserAssignment {
  String toValue() {
    switch (this) {
      case UserAssignment.automatic:
        return 'AUTOMATIC';
      case UserAssignment.manual:
        return 'MANUAL';
    }
  }
}

extension UserAssignmentFromString on String {
  UserAssignment toUserAssignment() {
    switch (this) {
      case 'AUTOMATIC':
        return UserAssignment.automatic;
      case 'MANUAL':
        return UserAssignment.manual;
    }
    throw Exception('$this is not known in enum UserAssignment');
  }
}

enum UserDesignation {
  projectOwner,
  projectContributor,
}

extension UserDesignationValueExtension on UserDesignation {
  String toValue() {
    switch (this) {
      case UserDesignation.projectOwner:
        return 'PROJECT_OWNER';
      case UserDesignation.projectContributor:
        return 'PROJECT_CONTRIBUTOR';
    }
  }
}

extension UserDesignationFromString on String {
  UserDesignation toUserDesignation() {
    switch (this) {
      case 'PROJECT_OWNER':
        return UserDesignation.projectOwner;
      case 'PROJECT_CONTRIBUTOR':
        return UserDesignation.projectContributor;
    }
    throw Exception('$this is not known in enum UserDesignation');
  }
}

/// The user details of a project member.
class UserDetails {
  /// The identifier of the Amazon DataZone user.
  final String userId;

  UserDetails({
    required this.userId,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      'userId': userId,
    };
  }
}

/// The details of the user profile in Amazon DataZone.
class UserProfileDetails {
  /// The IAM details included in the user profile details.
  final IamUserProfileDetails? iam;

  /// The single sign-on details included in the user profile details.
  final SsoUserProfileDetails? sso;

  UserProfileDetails({
    this.iam,
    this.sso,
  });

  factory UserProfileDetails.fromJson(Map<String, dynamic> json) {
    return UserProfileDetails(
      iam: json['iam'] != null
          ? IamUserProfileDetails.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
      sso: json['sso'] != null
          ? SsoUserProfileDetails.fromJson(json['sso'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    final sso = this.sso;
    return {
      if (iam != null) 'iam': iam,
      if (sso != null) 'sso': sso,
    };
  }
}

enum UserProfileStatus {
  assigned,
  notAssigned,
  activated,
  deactivated,
}

extension UserProfileStatusValueExtension on UserProfileStatus {
  String toValue() {
    switch (this) {
      case UserProfileStatus.assigned:
        return 'ASSIGNED';
      case UserProfileStatus.notAssigned:
        return 'NOT_ASSIGNED';
      case UserProfileStatus.activated:
        return 'ACTIVATED';
      case UserProfileStatus.deactivated:
        return 'DEACTIVATED';
    }
  }
}

extension UserProfileStatusFromString on String {
  UserProfileStatus toUserProfileStatus() {
    switch (this) {
      case 'ASSIGNED':
        return UserProfileStatus.assigned;
      case 'NOT_ASSIGNED':
        return UserProfileStatus.notAssigned;
      case 'ACTIVATED':
        return UserProfileStatus.activated;
      case 'DEACTIVATED':
        return UserProfileStatus.deactivated;
    }
    throw Exception('$this is not known in enum UserProfileStatus');
  }
}

/// The details of the user profile.
class UserProfileSummary {
  /// The details of the user profile.
  final UserProfileDetails? details;

  /// The ID of the Amazon DataZone domain of the user profile.
  final String? domainId;

  /// The ID of the user profile.
  final String? id;

  /// The status of the user profile.
  final UserProfileStatus? status;

  /// The type of the user profile.
  final UserProfileType? type;

  UserProfileSummary({
    this.details,
    this.domainId,
    this.id,
    this.status,
    this.type,
  });

  factory UserProfileSummary.fromJson(Map<String, dynamic> json) {
    return UserProfileSummary(
      details: json['details'] != null
          ? UserProfileDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
      domainId: json['domainId'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toUserProfileStatus(),
      type: (json['type'] as String?)?.toUserProfileType(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final domainId = this.domainId;
    final id = this.id;
    final status = this.status;
    final type = this.type;
    return {
      if (details != null) 'details': details,
      if (domainId != null) 'domainId': domainId,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum UserProfileType {
  iam,
  sso,
}

extension UserProfileTypeValueExtension on UserProfileType {
  String toValue() {
    switch (this) {
      case UserProfileType.iam:
        return 'IAM';
      case UserProfileType.sso:
        return 'SSO';
    }
  }
}

extension UserProfileTypeFromString on String {
  UserProfileType toUserProfileType() {
    switch (this) {
      case 'IAM':
        return UserProfileType.iam;
      case 'SSO':
        return UserProfileType.sso;
    }
    throw Exception('$this is not known in enum UserProfileType');
  }
}

enum UserSearchType {
  ssoUser,
  datazoneUser,
  datazoneSsoUser,
  datazoneIamUser,
}

extension UserSearchTypeValueExtension on UserSearchType {
  String toValue() {
    switch (this) {
      case UserSearchType.ssoUser:
        return 'SSO_USER';
      case UserSearchType.datazoneUser:
        return 'DATAZONE_USER';
      case UserSearchType.datazoneSsoUser:
        return 'DATAZONE_SSO_USER';
      case UserSearchType.datazoneIamUser:
        return 'DATAZONE_IAM_USER';
    }
  }
}

extension UserSearchTypeFromString on String {
  UserSearchType toUserSearchType() {
    switch (this) {
      case 'SSO_USER':
        return UserSearchType.ssoUser;
      case 'DATAZONE_USER':
        return UserSearchType.datazoneUser;
      case 'DATAZONE_SSO_USER':
        return UserSearchType.datazoneSsoUser;
      case 'DATAZONE_IAM_USER':
        return UserSearchType.datazoneIamUser;
    }
    throw Exception('$this is not known in enum UserSearchType');
  }
}

enum UserType {
  iamUser,
  iamRole,
  ssoUser,
}

extension UserTypeValueExtension on UserType {
  String toValue() {
    switch (this) {
      case UserType.iamUser:
        return 'IAM_USER';
      case UserType.iamRole:
        return 'IAM_ROLE';
      case UserType.ssoUser:
        return 'SSO_USER';
    }
  }
}

extension UserTypeFromString on String {
  UserType toUserType() {
    switch (this) {
      case 'IAM_USER':
        return UserType.iamUser;
      case 'IAM_ROLE':
        return UserType.iamRole;
      case 'SSO_USER':
        return UserType.ssoUser;
    }
    throw Exception('$this is not known in enum UserType');
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

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
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
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
