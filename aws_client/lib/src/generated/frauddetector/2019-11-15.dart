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

part '2019-11-15.g.dart';

/// This is the Amazon Fraud Detector API Reference. This guide is for
/// developers who need detailed information about Amazon Fraud Detector API
/// actions, data types, and errors. For more information about Amazon Fraud
/// Detector features, see the <a
/// href="https://docs.aws.amazon.com/frauddetector/latest/ug/">Amazon Fraud
/// Detector User Guide</a>.
class FraudDetector {
  final _s.JsonProtocol _protocol;
  FraudDetector({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'frauddetector',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a batch of variables.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [variableEntries] :
  /// The list of variables for the batch create variable request.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<BatchCreateVariableResult> batchCreateVariable({
    @_s.required List<VariableEntry> variableEntries,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(variableEntries, 'variableEntries');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.BatchCreateVariable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'variableEntries': variableEntries,
        if (tags != null) 'tags': tags,
      },
    );

    return BatchCreateVariableResult.fromJson(jsonResponse.body);
  }

  /// Gets a batch of variables.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [names] :
  /// The list of variable names to get.
  Future<BatchGetVariableResult> batchGetVariable({
    @_s.required List<String> names,
  }) async {
    ArgumentError.checkNotNull(names, 'names');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.BatchGetVariable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'names': names,
      },
    );

    return BatchGetVariableResult.fromJson(jsonResponse.body);
  }

  /// Creates a detector version. The detector version starts in a
  /// <code>DRAFT</code> status.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector under which you want to create a new version.
  ///
  /// Parameter [rules] :
  /// The rules to include in the detector version.
  ///
  /// Parameter [description] :
  /// The description of the detector version.
  ///
  /// Parameter [externalModelEndpoints] :
  /// The Amazon Sagemaker model endpoints to include in the detector version.
  ///
  /// Parameter [modelVersions] :
  /// The model versions to include in the detector version.
  ///
  /// Parameter [ruleExecutionMode] :
  /// The rule execution mode for the rules included in the detector version.
  ///
  /// You can define and edit the rule mode at the detector version level, when
  /// it is in draft status.
  ///
  /// If you specify <code>FIRST_MATCHED</code>, Amazon Fraud Detector evaluates
  /// rules sequentially, first to last, stopping at the first matched rule.
  /// Amazon Fraud dectector then provides the outcomes for that single rule.
  ///
  /// If you specifiy <code>ALL_MATCHED</code>, Amazon Fraud Detector evaluates
  /// all rules and returns the outcomes for all matched rules.
  ///
  /// The default behavior is <code>FIRST_MATCHED</code>.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<CreateDetectorVersionResult> createDetectorVersion({
    @_s.required String detectorId,
    @_s.required List<Rule> rules,
    String description,
    List<String> externalModelEndpoints,
    List<ModelVersion> modelVersions,
    RuleExecutionMode ruleExecutionMode,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(rules, 'rules');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateDetectorVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'rules': rules,
        if (description != null) 'description': description,
        if (externalModelEndpoints != null)
          'externalModelEndpoints': externalModelEndpoints,
        if (modelVersions != null) 'modelVersions': modelVersions,
        if (ruleExecutionMode != null)
          'ruleExecutionMode': ruleExecutionMode.toValue(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDetectorVersionResult.fromJson(jsonResponse.body);
  }

  /// Creates a model using the specified model type.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventTypeName] :
  /// The name of the event type.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [description] :
  /// The model description.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<void> createModel({
    @_s.required String eventTypeName,
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(eventTypeName, 'eventTypeName');
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventTypeName': eventTypeName,
        'modelId': modelId,
        'modelType': modelType?.toValue() ?? '',
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateModelResult.fromJson(jsonResponse.body);
  }

  /// Creates a version of the model using the specified model type and model
  /// id.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [trainingDataSchema] :
  /// The training data schema.
  ///
  /// Parameter [trainingDataSource] :
  /// The training data source location in Amazon S3.
  ///
  /// Parameter [externalEventsDetail] :
  /// Details for the external events data used for model version training.
  /// Required if <code>trainingDataSource</code> is
  /// <code>EXTERNAL_EVENTS</code>.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<CreateModelVersionResult> createModelVersion({
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    @_s.required TrainingDataSchema trainingDataSchema,
    @_s.required TrainingDataSourceEnum trainingDataSource,
    ExternalEventsDetail externalEventsDetail,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    ArgumentError.checkNotNull(trainingDataSchema, 'trainingDataSchema');
    ArgumentError.checkNotNull(trainingDataSource, 'trainingDataSource');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateModelVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType?.toValue() ?? '',
        'trainingDataSchema': trainingDataSchema,
        'trainingDataSource': trainingDataSource?.toValue() ?? '',
        if (externalEventsDetail != null)
          'externalEventsDetail': externalEventsDetail,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateModelVersionResult.fromJson(jsonResponse.body);
  }

  /// Creates a rule for use with the specified detector.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID for the rule's parent detector.
  ///
  /// Parameter [expression] :
  /// The rule expression.
  ///
  /// Parameter [language] :
  /// The language of the rule.
  ///
  /// Parameter [outcomes] :
  /// The outcome or outcomes returned when the rule expression matches.
  ///
  /// Parameter [ruleId] :
  /// The rule ID.
  ///
  /// Parameter [description] :
  /// The rule description.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<CreateRuleResult> createRule({
    @_s.required String detectorId,
    @_s.required String expression,
    @_s.required Language language,
    @_s.required List<String> outcomes,
    @_s.required String ruleId,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
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
    ArgumentError.checkNotNull(language, 'language');
    ArgumentError.checkNotNull(outcomes, 'outcomes');
    ArgumentError.checkNotNull(ruleId, 'ruleId');
    _s.validateStringLength(
      'ruleId',
      ruleId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleId',
      ruleId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'expression': expression,
        'language': language?.toValue() ?? '',
        'outcomes': outcomes,
        'ruleId': ruleId,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRuleResult.fromJson(jsonResponse.body);
  }

  /// Creates a variable.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [dataSource] :
  /// The source of the data.
  ///
  /// Parameter [dataType] :
  /// The data type.
  ///
  /// Parameter [defaultValue] :
  /// The default value for the variable when no value is received.
  ///
  /// Parameter [name] :
  /// The name of the variable.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  ///
  /// Parameter [variableType] :
  /// The variable type. For more information see <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types">Variable
  /// types</a>.
  ///
  /// Valid Values: <code>AUTH_CODE | AVS | BILLING_ADDRESS_L1 |
  /// BILLING_ADDRESS_L2 | BILLING_CITY | BILLING_COUNTRY | BILLING_NAME |
  /// BILLING_PHONE | BILLING_STATE | BILLING_ZIP | CARD_BIN | CATEGORICAL |
  /// CURRENCY_CODE | EMAIL_ADDRESS | FINGERPRINT | FRAUD_LABEL | FREE_FORM_TEXT
  /// | IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE | PHONE_NUMBER | PRICE |
  /// PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 |
  /// SHIPPING_CITY | SHIPPING_COUNTRY | SHIPPING_NAME | SHIPPING_PHONE |
  /// SHIPPING_STATE | SHIPPING_ZIP | USERAGENT</code>
  Future<void> createVariable({
    @_s.required DataSource dataSource,
    @_s.required DataType dataType,
    @_s.required String defaultValue,
    @_s.required String name,
    String description,
    List<Tag> tags,
    String variableType,
  }) async {
    ArgumentError.checkNotNull(dataSource, 'dataSource');
    ArgumentError.checkNotNull(dataType, 'dataType');
    ArgumentError.checkNotNull(defaultValue, 'defaultValue');
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateVariable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataSource': dataSource?.toValue() ?? '',
        'dataType': dataType?.toValue() ?? '',
        'defaultValue': defaultValue,
        'name': name,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
        if (variableType != null) 'variableType': variableType,
      },
    );

    return CreateVariableResult.fromJson(jsonResponse.body);
  }

  /// Deletes the detector. Before deleting a detector, you must first delete
  /// all detector versions and rule versions associated with the detector.
  ///
  /// When you delete a detector, Amazon Fraud Detector permanently deletes the
  /// detector and the data is no longer stored in Amazon Fraud Detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector to delete.
  Future<void> deleteDetector({
    @_s.required String detectorId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteDetector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
      },
    );

    return DeleteDetectorResult.fromJson(jsonResponse.body);
  }

  /// Deletes the detector version. You cannot delete detector versions that are
  /// in <code>ACTIVE</code> status.
  ///
  /// When you delete a detector version, Amazon Fraud Detector permanently
  /// deletes the detector and the data is no longer stored in Amazon Fraud
  /// Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the parent detector for the detector version to delete.
  ///
  /// Parameter [detectorVersionId] :
  /// The ID of the detector version to delete.
  Future<void> deleteDetectorVersion({
    @_s.required String detectorId,
    @_s.required String detectorVersionId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(detectorVersionId, 'detectorVersionId');
    _s.validateStringLength(
      'detectorVersionId',
      detectorVersionId,
      1,
      5,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorVersionId',
      detectorVersionId,
      r'''^([1-9][0-9]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteDetectorVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'detectorVersionId': detectorVersionId,
      },
    );

    return DeleteDetectorVersionResult.fromJson(jsonResponse.body);
  }

  /// Deletes an entity type.
  ///
  /// You cannot delete an entity type that is included in an event type.
  ///
  /// When you delete an entity type, Amazon Fraud Detector permanently deletes
  /// that entity type from the evaluation history, and the data is no longer
  /// stored in Amazon Fraud Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the entity type to delete.
  Future<void> deleteEntityType({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteEntityType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteEntityTypeResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified event.
  ///
  /// When you delete an event, Amazon Fraud Detector permanently deletes that
  /// event from the evaluation history, and the event data is no longer stored
  /// in Amazon Fraud Detector.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventId] :
  /// The ID of the event to delete.
  ///
  /// Parameter [eventTypeName] :
  /// The name of the event type.
  Future<void> deleteEvent({
    @_s.required String eventId,
    @_s.required String eventTypeName,
  }) async {
    ArgumentError.checkNotNull(eventId, 'eventId');
    _s.validateStringLength(
      'eventId',
      eventId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventId',
      eventId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(eventTypeName, 'eventTypeName');
    _s.validateStringLength(
      'eventTypeName',
      eventTypeName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventTypeName',
      eventTypeName,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteEvent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventId': eventId,
        'eventTypeName': eventTypeName,
      },
    );

    return DeleteEventResult.fromJson(jsonResponse.body);
  }

  /// Deletes an event type.
  ///
  /// You cannot delete an event type that is used in a detector or a model.
  ///
  /// When you delete an entity type, Amazon Fraud Detector permanently deletes
  /// that entity type from the evaluation history, and the data is no longer
  /// stored in Amazon Fraud Detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the event type to delete.
  Future<void> deleteEventType({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteEventType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteEventTypeResult.fromJson(jsonResponse.body);
  }

  /// Removes a SageMaker model from Amazon Fraud Detector.
  ///
  /// You can remove an Amazon SageMaker model if it is not associated with a
  /// detector version. Removing a SageMaker model disconnects it from Amazon
  /// Fraud Detector, but the model remains available in SageMaker.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [modelEndpoint] :
  /// The endpoint of the Amazon Sagemaker model to delete.
  Future<void> deleteExternalModel({
    @_s.required String modelEndpoint,
  }) async {
    ArgumentError.checkNotNull(modelEndpoint, 'modelEndpoint');
    _s.validateStringLength(
      'modelEndpoint',
      modelEndpoint,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelEndpoint',
      modelEndpoint,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteExternalModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelEndpoint': modelEndpoint,
      },
    );

    return DeleteExternalModelResult.fromJson(jsonResponse.body);
  }

  /// Deletes a label.
  ///
  /// You cannot delete labels that are included in an event type in Amazon
  /// Fraud Detector.
  ///
  /// You cannot delete a label assigned to an event ID. You must first delete
  /// the relevant event ID.
  ///
  /// When you delete a label, Amazon Fraud Detector permanently deletes that
  /// label from the evaluation history, and the data is no longer stored in
  /// Amazon Fraud Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the label to delete.
  Future<void> deleteLabel({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteLabel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteLabelResult.fromJson(jsonResponse.body);
  }

  /// Deletes a model.
  ///
  /// You can delete models and model versions in Amazon Fraud Detector,
  /// provided that they are not associated with a detector version.
  ///
  /// When you delete a model, Amazon Fraud Detector permanently deletes that
  /// model from the evaluation history, and the data is no longer stored in
  /// Amazon Fraud Detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [modelId] :
  /// The model ID of the model to delete.
  ///
  /// Parameter [modelType] :
  /// The model type of the model to delete.
  Future<void> deleteModel({
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType?.toValue() ?? '',
      },
    );

    return DeleteModelResult.fromJson(jsonResponse.body);
  }

  /// Deletes a model version.
  ///
  /// You can delete models and model versions in Amazon Fraud Detector,
  /// provided that they are not associated with a detector version.
  ///
  /// When you delete a model version, Amazon Fraud Detector permanently deletes
  /// that model version from the evaluation history, and the data is no longer
  /// stored in Amazon Fraud Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [modelId] :
  /// The model ID of the model version to delete.
  ///
  /// Parameter [modelType] :
  /// The model type of the model version to delete.
  ///
  /// Parameter [modelVersionNumber] :
  /// The model version number of the model version to delete.
  Future<void> deleteModelVersion({
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    @_s.required String modelVersionNumber,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    ArgumentError.checkNotNull(modelVersionNumber, 'modelVersionNumber');
    _s.validateStringLength(
      'modelVersionNumber',
      modelVersionNumber,
      3,
      7,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelVersionNumber',
      modelVersionNumber,
      r'''^[1-9][0-9]{0,3}\.[0-9]{1,2}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteModelVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType?.toValue() ?? '',
        'modelVersionNumber': modelVersionNumber,
      },
    );

    return DeleteModelVersionResult.fromJson(jsonResponse.body);
  }

  /// Deletes an outcome.
  ///
  /// You cannot delete an outcome that is used in a rule version.
  ///
  /// When you delete an outcome, Amazon Fraud Detector permanently deletes that
  /// outcome from the evaluation history, and the data is no longer stored in
  /// Amazon Fraud Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the outcome to delete.
  Future<void> deleteOutcome({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteOutcome'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteOutcomeResult.fromJson(jsonResponse.body);
  }

  /// Deletes the rule. You cannot delete a rule if it is used by an
  /// <code>ACTIVE</code> or <code>INACTIVE</code> detector version.
  ///
  /// When you delete a rule, Amazon Fraud Detector permanently deletes that
  /// rule from the evaluation history, and the data is no longer stored in
  /// Amazon Fraud Detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  Future<void> deleteRule({
    @_s.required Rule rule,
  }) async {
    ArgumentError.checkNotNull(rule, 'rule');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'rule': rule,
      },
    );

    return DeleteRuleResult.fromJson(jsonResponse.body);
  }

  /// Deletes a variable.
  ///
  /// You can't delete variables that are included in an event type in Amazon
  /// Fraud Detector.
  ///
  /// Amazon Fraud Detector automatically deletes model output variables and
  /// SageMaker model output variables when you delete the model. You can't
  /// delete these variables manually.
  ///
  /// When you delete a variable, Amazon Fraud Detector permanently deletes that
  /// variable from the evaluation history, and the data is no longer stored in
  /// Amazon Fraud Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the variable to delete.
  Future<void> deleteVariable({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteVariable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteVariableResult.fromJson(jsonResponse.body);
  }

  /// Gets all versions for a specified detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for the request.
  ///
  /// Parameter [nextToken] :
  /// The next token from the previous response.
  Future<DescribeDetectorResult> describeDetector({
    @_s.required String detectorId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1000,
      2500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DescribeDetector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeDetectorResult.fromJson(jsonResponse.body);
  }

  /// Gets all of the model versions for the specified model type or for the
  /// specified model type and model ID. You can also get details for a single,
  /// specified model version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [modelVersionNumber] :
  /// The model version number.
  ///
  /// Parameter [nextToken] :
  /// The next token from the previous results.
  Future<DescribeModelVersionsResult> describeModelVersions({
    int maxResults,
    String modelId,
    ModelTypeEnum modelType,
    String modelVersionNumber,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
    );
    _s.validateStringLength(
      'modelVersionNumber',
      modelVersionNumber,
      3,
      7,
    );
    _s.validateStringPattern(
      'modelVersionNumber',
      modelVersionNumber,
      r'''^[1-9][0-9]{0,3}\.[0-9]{1,2}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DescribeModelVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (modelId != null) 'modelId': modelId,
        if (modelType != null) 'modelType': modelType.toValue(),
        if (modelVersionNumber != null)
          'modelVersionNumber': modelVersionNumber,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeModelVersionsResult.fromJson(jsonResponse.body);
  }

  /// Gets a particular detector version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  Future<GetDetectorVersionResult> getDetectorVersion({
    @_s.required String detectorId,
    @_s.required String detectorVersionId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(detectorVersionId, 'detectorVersionId');
    _s.validateStringLength(
      'detectorVersionId',
      detectorVersionId,
      1,
      5,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorVersionId',
      detectorVersionId,
      r'''^([1-9][0-9]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetDetectorVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'detectorVersionId': detectorVersionId,
      },
    );

    return GetDetectorVersionResult.fromJson(jsonResponse.body);
  }

  /// Gets all detectors or a single detector if a <code>detectorId</code> is
  /// specified. This is a paginated API. If you provide a null
  /// <code>maxResults</code>, this action retrieves a maximum of 10 records per
  /// page. If you provide a <code>maxResults</code>, the value must be between
  /// 5 and 10. To get the next page results, provide the pagination token from
  /// the <code>GetDetectorsResponse</code> as part of your request. A null
  /// pagination token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [nextToken] :
  /// The next token for the subsequent request.
  Future<GetDetectorsResult> getDetectors({
    String detectorId,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetDetectors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (detectorId != null) 'detectorId': detectorId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetDetectorsResult.fromJson(jsonResponse.body);
  }

  /// Gets all entity types or a specific entity type if a name is specified.
  /// This is a paginated API. If you provide a null <code>maxResults</code>,
  /// this action retrieves a maximum of 10 records per page. If you provide a
  /// <code>maxResults</code>, the value must be between 5 and 10. To get the
  /// next page results, provide the pagination token from the
  /// <code>GetEntityTypesResponse</code> as part of your request. A null
  /// pagination token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [name] :
  /// The name.
  ///
  /// Parameter [nextToken] :
  /// The next token for the subsequent request.
  Future<GetEntityTypesResult> getEntityTypes({
    int maxResults,
    String name,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      10,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetEntityTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (name != null) 'name': name,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetEntityTypesResult.fromJson(jsonResponse.body);
  }

  /// Evaluates an event against a detector version. If a version ID is not
  /// provided, the detector’s (<code>ACTIVE</code>) version is used.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [entities] :
  /// The entity type (associated with the detector's event type) and specific
  /// entity ID representing who performed the event. If an entity id is not
  /// available, use "UNKNOWN."
  ///
  /// Parameter [eventId] :
  /// The unique ID used to identify the event.
  ///
  /// Parameter [eventTimestamp] :
  /// Timestamp that defines when the event under evaluation occurred.
  ///
  /// Parameter [eventTypeName] :
  /// The event type associated with the detector specified for the prediction.
  ///
  /// Parameter [eventVariables] :
  /// Names of the event type's variables you defined in Amazon Fraud Detector
  /// to represent data elements and their corresponding values for the event
  /// you are sending for evaluation.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  ///
  /// Parameter [externalModelEndpointDataBlobs] :
  /// The Amazon SageMaker model endpoint input data blobs.
  Future<GetEventPredictionResult> getEventPrediction({
    @_s.required String detectorId,
    @_s.required List<Entity> entities,
    @_s.required String eventId,
    @_s.required String eventTimestamp,
    @_s.required String eventTypeName,
    @_s.required Map<String, String> eventVariables,
    String detectorVersionId,
    Map<String, ModelEndpointDataBlob> externalModelEndpointDataBlobs,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    ArgumentError.checkNotNull(entities, 'entities');
    ArgumentError.checkNotNull(eventId, 'eventId');
    ArgumentError.checkNotNull(eventTimestamp, 'eventTimestamp');
    ArgumentError.checkNotNull(eventTypeName, 'eventTypeName');
    ArgumentError.checkNotNull(eventVariables, 'eventVariables');
    _s.validateStringLength(
      'detectorVersionId',
      detectorVersionId,
      1,
      5,
    );
    _s.validateStringPattern(
      'detectorVersionId',
      detectorVersionId,
      r'''^([1-9][0-9]*)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetEventPrediction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'entities': entities,
        'eventId': eventId,
        'eventTimestamp': eventTimestamp,
        'eventTypeName': eventTypeName,
        'eventVariables': eventVariables,
        if (detectorVersionId != null) 'detectorVersionId': detectorVersionId,
        if (externalModelEndpointDataBlobs != null)
          'externalModelEndpointDataBlobs': externalModelEndpointDataBlobs,
      },
    );

    return GetEventPredictionResult.fromJson(jsonResponse.body);
  }

  /// Gets all event types or a specific event type if name is provided. This is
  /// a paginated API. If you provide a null <code>maxResults</code>, this
  /// action retrieves a maximum of 10 records per page. If you provide a
  /// <code>maxResults</code>, the value must be between 5 and 10. To get the
  /// next page results, provide the pagination token from the
  /// <code>GetEventTypesResponse</code> as part of your request. A null
  /// pagination token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [name] :
  /// The name.
  ///
  /// Parameter [nextToken] :
  /// The next token for the subsequent request.
  Future<GetEventTypesResult> getEventTypes({
    int maxResults,
    String name,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      10,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetEventTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (name != null) 'name': name,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetEventTypesResult.fromJson(jsonResponse.body);
  }

  /// Gets the details for one or more Amazon SageMaker models that have been
  /// imported into the service. This is a paginated API. If you provide a null
  /// <code>maxResults</code>, this actions retrieves a maximum of 10 records
  /// per page. If you provide a <code>maxResults</code>, the value must be
  /// between 5 and 10. To get the next page results, provide the pagination
  /// token from the <code>GetExternalModelsResult</code> as part of your
  /// request. A null pagination token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [modelEndpoint] :
  /// The Amazon SageMaker model endpoint.
  ///
  /// Parameter [nextToken] :
  /// The next page token for the request.
  Future<GetExternalModelsResult> getExternalModels({
    int maxResults,
    String modelEndpoint,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetExternalModels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (modelEndpoint != null) 'modelEndpoint': modelEndpoint,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetExternalModelsResult.fromJson(jsonResponse.body);
  }

  /// Gets the encryption key if a Key Management Service (KMS) customer master
  /// key (CMK) has been specified to be used to encrypt content in Amazon Fraud
  /// Detector.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  Future<GetKMSEncryptionKeyResult> getKMSEncryptionKey() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetKMSEncryptionKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetKMSEncryptionKeyResult.fromJson(jsonResponse.body);
  }

  /// Gets all labels or a specific label if name is provided. This is a
  /// paginated API. If you provide a null <code>maxResults</code>, this action
  /// retrieves a maximum of 50 records per page. If you provide a
  /// <code>maxResults</code>, the value must be between 10 and 50. To get the
  /// next page results, provide the pagination token from the
  /// <code>GetGetLabelsResponse</code> as part of your request. A null
  /// pagination token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [name] :
  /// The name of the label or labels to get.
  ///
  /// Parameter [nextToken] :
  /// The next token for the subsequent request.
  Future<GetLabelsResult> getLabels({
    int maxResults,
    String name,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      50,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetLabels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (name != null) 'name': name,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetLabelsResult.fromJson(jsonResponse.body);
  }

  /// Gets the details of the specified model version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [modelVersionNumber] :
  /// The model version number.
  Future<GetModelVersionResult> getModelVersion({
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    @_s.required String modelVersionNumber,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    ArgumentError.checkNotNull(modelVersionNumber, 'modelVersionNumber');
    _s.validateStringLength(
      'modelVersionNumber',
      modelVersionNumber,
      3,
      7,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelVersionNumber',
      modelVersionNumber,
      r'''^[1-9][0-9]{0,3}\.[0-9]{1,2}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetModelVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType?.toValue() ?? '',
        'modelVersionNumber': modelVersionNumber,
      },
    );

    return GetModelVersionResult.fromJson(jsonResponse.body);
  }

  /// Gets one or more models. Gets all models for the AWS account if no model
  /// type and no model id provided. Gets all models for the AWS account and
  /// model type, if the model type is specified but model id is not provided.
  /// Gets a specific model if (model type, model id) tuple is specified.
  ///
  /// This is a paginated API. If you provide a null <code>maxResults</code>,
  /// this action retrieves a maximum of 10 records per page. If you provide a
  /// <code>maxResults</code>, the value must be between 1 and 10. To get the
  /// next page results, provide the pagination token from the response as part
  /// of your request. A null pagination token fetches the records from the
  /// beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [nextToken] :
  /// The next token for the subsequent request.
  Future<GetModelsResult> getModels({
    int maxResults,
    String modelId,
    ModelTypeEnum modelType,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetModels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (modelId != null) 'modelId': modelId,
        if (modelType != null) 'modelType': modelType.toValue(),
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetModelsResult.fromJson(jsonResponse.body);
  }

  /// Gets one or more outcomes. This is a paginated API. If you provide a null
  /// <code>maxResults</code>, this actions retrieves a maximum of 100 records
  /// per page. If you provide a <code>maxResults</code>, the value must be
  /// between 50 and 100. To get the next page results, provide the pagination
  /// token from the <code>GetOutcomesResult</code> as part of your request. A
  /// null pagination token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [name] :
  /// The name of the outcome or outcomes to get.
  ///
  /// Parameter [nextToken] :
  /// The next page token for the request.
  Future<GetOutcomesResult> getOutcomes({
    int maxResults,
    String name,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      100,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetOutcomes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (name != null) 'name': name,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetOutcomesResult.fromJson(jsonResponse.body);
  }

  /// Get all rules for a detector (paginated) if <code>ruleId</code> and
  /// <code>ruleVersion</code> are not specified. Gets all rules for the
  /// detector and the <code>ruleId</code> if present (paginated). Gets a
  /// specific rule if both the <code>ruleId</code> and the
  /// <code>ruleVersion</code> are specified.
  ///
  /// This is a paginated API. Providing null maxResults results in retrieving
  /// maximum of 100 records per page. If you provide maxResults the value must
  /// be between 50 and 100. To get the next page result, a provide a pagination
  /// token from GetRulesResult as part of your request. Null pagination token
  /// fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of rules to return for the request.
  ///
  /// Parameter [nextToken] :
  /// The next page token.
  ///
  /// Parameter [ruleId] :
  /// The rule ID.
  ///
  /// Parameter [ruleVersion] :
  /// The rule version.
  Future<GetRulesResult> getRules({
    @_s.required String detectorId,
    int maxResults,
    String nextToken,
    String ruleId,
    String ruleVersion,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      100,
    );
    _s.validateStringLength(
      'ruleId',
      ruleId,
      1,
      64,
    );
    _s.validateStringPattern(
      'ruleId',
      ruleId,
      r'''^[0-9a-z_-]+$''',
    );
    _s.validateStringLength(
      'ruleVersion',
      ruleVersion,
      1,
      5,
    );
    _s.validateStringPattern(
      'ruleVersion',
      ruleVersion,
      r'''^([1-9][0-9]*)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (ruleId != null) 'ruleId': ruleId,
        if (ruleVersion != null) 'ruleVersion': ruleVersion,
      },
    );

    return GetRulesResult.fromJson(jsonResponse.body);
  }

  /// Gets all of the variables or the specific variable. This is a paginated
  /// API. Providing null <code>maxSizePerPage</code> results in retrieving
  /// maximum of 100 records per page. If you provide
  /// <code>maxSizePerPage</code> the value must be between 50 and 100. To get
  /// the next page result, a provide a pagination token from
  /// <code>GetVariablesResult</code> as part of your request. Null pagination
  /// token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The max size per page determined for the get variable request.
  ///
  /// Parameter [name] :
  /// The name of the variable.
  ///
  /// Parameter [nextToken] :
  /// The next page token of the get variable request.
  Future<GetVariablesResult> getVariables({
    int maxResults,
    String name,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetVariables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (name != null) 'name': name,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetVariablesResult.fromJson(jsonResponse.body);
  }

  /// Lists all tags associated with the resource. This is a paginated API. To
  /// get the next page results, provide the pagination token from the response
  /// as part of your request. A null pagination token fetches the records from
  /// the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN that specifies the resource whose tags you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [nextToken] :
  /// The next token from the previous results.
  Future<ListTagsForResourceResult> listTagsForResource({
    @_s.required String resourceARN,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn\:aws[a-z-]{0,15}\:frauddetector\:[a-z0-9-]{3,20}\:[0-9]{12}\:[^\s]{2,128}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceARN': resourceARN,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTagsForResourceResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates a detector.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [eventTypeName] :
  /// The name of the event type.
  ///
  /// Parameter [description] :
  /// The description of the detector.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<void> putDetector({
    @_s.required String detectorId,
    @_s.required String eventTypeName,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(eventTypeName, 'eventTypeName');
    _s.validateStringLength(
      'eventTypeName',
      eventTypeName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventTypeName',
      eventTypeName,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutDetector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'eventTypeName': eventTypeName,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return PutDetectorResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates an entity type. An entity represents who is performing
  /// the event. As part of a fraud prediction, you pass the entity ID to
  /// indicate the specific entity who performed the event. An entity type
  /// classifies the entity. Example classifications include customer, merchant,
  /// or account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the entity type.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<void> putEntityType({
    @_s.required String name,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutEntityType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return PutEntityTypeResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates an event type. An event is a business activity that is
  /// evaluated for fraud risk. With Amazon Fraud Detector, you generate fraud
  /// predictions for events. An event type defines the structure for an event
  /// sent to Amazon Fraud Detector. This includes the variables sent as part of
  /// the event, the entity performing the event (such as a customer), and the
  /// labels that classify the event. Example event types include online payment
  /// transactions, account registrations, and authentications.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [entityTypes] :
  /// The entity type for the event type. Example entity types: customer,
  /// merchant, account.
  ///
  /// Parameter [eventVariables] :
  /// The event type variables.
  ///
  /// Parameter [name] :
  /// The name.
  ///
  /// Parameter [description] :
  /// The description of the event type.
  ///
  /// Parameter [labels] :
  /// The event type labels.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<void> putEventType({
    @_s.required List<String> entityTypes,
    @_s.required List<String> eventVariables,
    @_s.required String name,
    String description,
    List<String> labels,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(entityTypes, 'entityTypes');
    ArgumentError.checkNotNull(eventVariables, 'eventVariables');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutEventType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'entityTypes': entityTypes,
        'eventVariables': eventVariables,
        'name': name,
        if (description != null) 'description': description,
        if (labels != null) 'labels': labels,
        if (tags != null) 'tags': tags,
      },
    );

    return PutEventTypeResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates an Amazon SageMaker model endpoint. You can also use
  /// this action to update the configuration of the model endpoint, including
  /// the IAM role and/or the mapped variables.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [inputConfiguration] :
  /// The model endpoint input configuration.
  ///
  /// Parameter [invokeModelEndpointRoleArn] :
  /// The IAM role used to invoke the model endpoint.
  ///
  /// Parameter [modelEndpoint] :
  /// The model endpoints name.
  ///
  /// Parameter [modelEndpointStatus] :
  /// The model endpoint’s status in Amazon Fraud Detector.
  ///
  /// Parameter [modelSource] :
  /// The source of the model.
  ///
  /// Parameter [outputConfiguration] :
  /// The model endpoint output configuration.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<void> putExternalModel({
    @_s.required ModelInputConfiguration inputConfiguration,
    @_s.required String invokeModelEndpointRoleArn,
    @_s.required String modelEndpoint,
    @_s.required ModelEndpointStatus modelEndpointStatus,
    @_s.required ModelSource modelSource,
    @_s.required ModelOutputConfiguration outputConfiguration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(inputConfiguration, 'inputConfiguration');
    ArgumentError.checkNotNull(
        invokeModelEndpointRoleArn, 'invokeModelEndpointRoleArn');
    ArgumentError.checkNotNull(modelEndpoint, 'modelEndpoint');
    _s.validateStringLength(
      'modelEndpoint',
      modelEndpoint,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelEndpoint',
      modelEndpoint,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelEndpointStatus, 'modelEndpointStatus');
    ArgumentError.checkNotNull(modelSource, 'modelSource');
    ArgumentError.checkNotNull(outputConfiguration, 'outputConfiguration');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutExternalModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'inputConfiguration': inputConfiguration,
        'invokeModelEndpointRoleArn': invokeModelEndpointRoleArn,
        'modelEndpoint': modelEndpoint,
        'modelEndpointStatus': modelEndpointStatus?.toValue() ?? '',
        'modelSource': modelSource?.toValue() ?? '',
        'outputConfiguration': outputConfiguration,
        if (tags != null) 'tags': tags,
      },
    );

    return PutExternalModelResult.fromJson(jsonResponse.body);
  }

  /// Specifies the Key Management Service (KMS) customer master key (CMK) to be
  /// used to encrypt content in Amazon Fraud Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [kmsEncryptionKeyArn] :
  /// The KMS encryption key ARN.
  Future<void> putKMSEncryptionKey({
    @_s.required String kmsEncryptionKeyArn,
  }) async {
    ArgumentError.checkNotNull(kmsEncryptionKeyArn, 'kmsEncryptionKeyArn');
    _s.validateStringLength(
      'kmsEncryptionKeyArn',
      kmsEncryptionKeyArn,
      7,
      90,
      isRequired: true,
    );
    _s.validateStringPattern(
      'kmsEncryptionKeyArn',
      kmsEncryptionKeyArn,
      r'''^DEFAULT|arn:[a-zA-Z0-9-]+:kms:[a-zA-Z0-9-]+:\d{12}:key\/\w{8}-\w{4}-\w{4}-\w{4}-\w{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutKMSEncryptionKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'kmsEncryptionKeyArn': kmsEncryptionKeyArn,
      },
    );

    return PutKMSEncryptionKeyResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates label. A label classifies an event as fraudulent or
  /// legitimate. Labels are associated with event types and used to train
  /// supervised machine learning models in Amazon Fraud Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The label name.
  ///
  /// Parameter [description] :
  /// The label description.
  ///
  /// Parameter [tags] :
  /// <p/>
  Future<void> putLabel({
    @_s.required String name,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutLabel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return PutLabelResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates an outcome.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the outcome.
  ///
  /// Parameter [description] :
  /// The outcome description.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<void> putOutcome({
    @_s.required String name,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutOutcome'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return PutOutcomeResult.fromJson(jsonResponse.body);
  }

  /// Assigns tags to a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the resource.
  Future<void> tagResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn\:aws[a-z-]{0,15}\:frauddetector\:[a-z0-9-]{3,20}\:[0-9]{12}\:[^\s]{2,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceARN': resourceARN,
        'tags': tags,
      },
    );

    return TagResourceResult.fromJson(jsonResponse.body);
  }

  /// Removes tags from a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource from which to remove the tag.
  ///
  /// Parameter [tagKeys] :
  /// The resource ARN.
  Future<void> untagResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn\:aws[a-z-]{0,15}\:frauddetector\:[a-z0-9-]{3,20}\:[0-9]{12}\:[^\s]{2,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceARN': resourceARN,
        'tagKeys': tagKeys,
      },
    );

    return UntagResourceResult.fromJson(jsonResponse.body);
  }

  /// Updates a detector version. The detector version attributes that you can
  /// update include models, external model endpoints, rules, rule execution
  /// mode, and description. You can only update a <code>DRAFT</code> detector
  /// version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The parent detector ID for the detector version you want to update.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  ///
  /// Parameter [externalModelEndpoints] :
  /// The Amazon SageMaker model endpoints to include in the detector version.
  ///
  /// Parameter [rules] :
  /// The rules to include in the detector version.
  ///
  /// Parameter [description] :
  /// The detector version description.
  ///
  /// Parameter [modelVersions] :
  /// The model versions to include in the detector version.
  ///
  /// Parameter [ruleExecutionMode] :
  /// The rule execution mode to add to the detector.
  ///
  /// If you specify <code>FIRST_MATCHED</code>, Amazon Fraud Detector evaluates
  /// rules sequentially, first to last, stopping at the first matched rule.
  /// Amazon Fraud dectector then provides the outcomes for that single rule.
  ///
  /// If you specifiy <code>ALL_MATCHED</code>, Amazon Fraud Detector evaluates
  /// all rules and returns the outcomes for all matched rules. You can define
  /// and edit the rule mode at the detector version level, when it is in draft
  /// status.
  ///
  /// The default behavior is <code>FIRST_MATCHED</code>.
  Future<void> updateDetectorVersion({
    @_s.required String detectorId,
    @_s.required String detectorVersionId,
    @_s.required List<String> externalModelEndpoints,
    @_s.required List<Rule> rules,
    String description,
    List<ModelVersion> modelVersions,
    RuleExecutionMode ruleExecutionMode,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(detectorVersionId, 'detectorVersionId');
    _s.validateStringLength(
      'detectorVersionId',
      detectorVersionId,
      1,
      5,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorVersionId',
      detectorVersionId,
      r'''^([1-9][0-9]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        externalModelEndpoints, 'externalModelEndpoints');
    ArgumentError.checkNotNull(rules, 'rules');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateDetectorVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'detectorVersionId': detectorVersionId,
        'externalModelEndpoints': externalModelEndpoints,
        'rules': rules,
        if (description != null) 'description': description,
        if (modelVersions != null) 'modelVersions': modelVersions,
        if (ruleExecutionMode != null)
          'ruleExecutionMode': ruleExecutionMode.toValue(),
      },
    );

    return UpdateDetectorVersionResult.fromJson(jsonResponse.body);
  }

  /// Updates the detector version's description. You can update the metadata
  /// for any detector version (<code>DRAFT, ACTIVE,</code> or
  /// <code>INACTIVE</code>).
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  Future<void> updateDetectorVersionMetadata({
    @_s.required String description,
    @_s.required String detectorId,
    @_s.required String detectorVersionId,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(detectorVersionId, 'detectorVersionId');
    _s.validateStringLength(
      'detectorVersionId',
      detectorVersionId,
      1,
      5,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorVersionId',
      detectorVersionId,
      r'''^([1-9][0-9]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateDetectorVersionMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'description': description,
        'detectorId': detectorId,
        'detectorVersionId': detectorVersionId,
      },
    );

    return UpdateDetectorVersionMetadataResult.fromJson(jsonResponse.body);
  }

  /// Updates the detector version’s status. You can perform the following
  /// promotions or demotions using <code>UpdateDetectorVersionStatus</code>:
  /// <code>DRAFT</code> to <code>ACTIVE</code>, <code>ACTIVE</code> to
  /// <code>INACTIVE</code>, and <code>INACTIVE</code> to <code>ACTIVE</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  ///
  /// Parameter [status] :
  /// The new status.
  Future<void> updateDetectorVersionStatus({
    @_s.required String detectorId,
    @_s.required String detectorVersionId,
    @_s.required DetectorVersionStatus status,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorId',
      detectorId,
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(detectorVersionId, 'detectorVersionId');
    _s.validateStringLength(
      'detectorVersionId',
      detectorVersionId,
      1,
      5,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorVersionId',
      detectorVersionId,
      r'''^([1-9][0-9]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateDetectorVersionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'detectorVersionId': detectorVersionId,
        'status': status?.toValue() ?? '',
      },
    );

    return UpdateDetectorVersionStatusResult.fromJson(jsonResponse.body);
  }

  /// Updates a model. You can update the description attribute using this
  /// action.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [description] :
  /// The new model description.
  Future<void> updateModel({
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    String description,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType?.toValue() ?? '',
        if (description != null) 'description': description,
      },
    );

    return UpdateModelResult.fromJson(jsonResponse.body);
  }

  /// Updates a model version. Updating a model version retrains an existing
  /// model version using updated training data and produces a new minor version
  /// of the model. You can update the training data set location and data
  /// access role attributes using this action. This action creates and trains a
  /// new minor version of the model, for example version 1.01, 1.02, 1.03.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [majorVersionNumber] :
  /// The major version number.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [externalEventsDetail] :
  /// The event details.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<UpdateModelVersionResult> updateModelVersion({
    @_s.required String majorVersionNumber,
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    ExternalEventsDetail externalEventsDetail,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(majorVersionNumber, 'majorVersionNumber');
    _s.validateStringLength(
      'majorVersionNumber',
      majorVersionNumber,
      1,
      5,
      isRequired: true,
    );
    _s.validateStringPattern(
      'majorVersionNumber',
      majorVersionNumber,
      r'''^([1-9][0-9]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateModelVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'majorVersionNumber': majorVersionNumber,
        'modelId': modelId,
        'modelType': modelType?.toValue() ?? '',
        if (externalEventsDetail != null)
          'externalEventsDetail': externalEventsDetail,
        if (tags != null) 'tags': tags,
      },
    );

    return UpdateModelVersionResult.fromJson(jsonResponse.body);
  }

  /// Updates the status of a model version.
  ///
  /// You can perform the following status updates:
  /// <ol>
  /// <li>
  /// Change the <code>TRAINING_COMPLETE</code> status to <code>ACTIVE</code>.
  /// </li>
  /// <li>
  /// Change <code>ACTIVE</code>to <code>INACTIVE</code>.
  /// </li> </ol>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [modelId] :
  /// The model ID of the model version to update.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [modelVersionNumber] :
  /// The model version number.
  ///
  /// Parameter [status] :
  /// The model version status.
  Future<void> updateModelVersionStatus({
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    @_s.required String modelVersionNumber,
    @_s.required ModelVersionStatus status,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelId',
      modelId,
      r'''^[0-9a-z_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    ArgumentError.checkNotNull(modelVersionNumber, 'modelVersionNumber');
    _s.validateStringLength(
      'modelVersionNumber',
      modelVersionNumber,
      3,
      7,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelVersionNumber',
      modelVersionNumber,
      r'''^[1-9][0-9]{0,3}\.[0-9]{1,2}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateModelVersionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType?.toValue() ?? '',
        'modelVersionNumber': modelVersionNumber,
        'status': status?.toValue() ?? '',
      },
    );

    return UpdateModelVersionStatusResult.fromJson(jsonResponse.body);
  }

  /// Updates a rule's metadata. The description attribute can be updated.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [description] :
  /// The rule description.
  ///
  /// Parameter [rule] :
  /// The rule to update.
  Future<void> updateRuleMetadata({
    @_s.required String description,
    @_s.required Rule rule,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(rule, 'rule');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateRuleMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'description': description,
        'rule': rule,
      },
    );

    return UpdateRuleMetadataResult.fromJson(jsonResponse.body);
  }

  /// Updates a rule version resulting in a new rule version. Updates a rule
  /// version resulting in a new rule version (version 1, 2, 3 ...).
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [expression] :
  /// The rule expression.
  ///
  /// Parameter [language] :
  /// The language.
  ///
  /// Parameter [outcomes] :
  /// The outcomes.
  ///
  /// Parameter [rule] :
  /// The rule to update.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the rule version.
  Future<UpdateRuleVersionResult> updateRuleVersion({
    @_s.required String expression,
    @_s.required Language language,
    @_s.required List<String> outcomes,
    @_s.required Rule rule,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(expression, 'expression');
    _s.validateStringLength(
      'expression',
      expression,
      1,
      4096,
      isRequired: true,
    );
    ArgumentError.checkNotNull(language, 'language');
    ArgumentError.checkNotNull(outcomes, 'outcomes');
    ArgumentError.checkNotNull(rule, 'rule');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateRuleVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'expression': expression,
        'language': language?.toValue() ?? '',
        'outcomes': outcomes,
        'rule': rule,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return UpdateRuleVersionResult.fromJson(jsonResponse.body);
  }

  /// Updates a variable.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the variable.
  ///
  /// Parameter [defaultValue] :
  /// The new default value of the variable.
  ///
  /// Parameter [description] :
  /// The new description.
  ///
  /// Parameter [variableType] :
  /// The variable type. For more information see <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types">Variable
  /// types</a>.
  Future<void> updateVariable({
    @_s.required String name,
    String defaultValue,
    String description,
    String variableType,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateVariable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (defaultValue != null) 'defaultValue': defaultValue,
        if (description != null) 'description': description,
        if (variableType != null) 'variableType': variableType,
      },
    );

    return UpdateVariableResult.fromJson(jsonResponse.body);
  }
}

/// Provides the error of the batch create variable API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateVariableError {
  /// The error code.
  @_s.JsonKey(name: 'code')
  final int code;

  /// The error message.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The name.
  @_s.JsonKey(name: 'name')
  final String name;

  BatchCreateVariableError({
    this.code,
    this.message,
    this.name,
  });
  factory BatchCreateVariableError.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateVariableErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateVariableResult {
  /// Provides the errors for the <code>BatchCreateVariable</code> request.
  @_s.JsonKey(name: 'errors')
  final List<BatchCreateVariableError> errors;

  BatchCreateVariableResult({
    this.errors,
  });
  factory BatchCreateVariableResult.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateVariableResultFromJson(json);
}

/// Provides the error of the batch get variable API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetVariableError {
  /// The error code.
  @_s.JsonKey(name: 'code')
  final int code;

  /// The error message.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The error name.
  @_s.JsonKey(name: 'name')
  final String name;

  BatchGetVariableError({
    this.code,
    this.message,
    this.name,
  });
  factory BatchGetVariableError.fromJson(Map<String, dynamic> json) =>
      _$BatchGetVariableErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetVariableResult {
  /// The errors from the request.
  @_s.JsonKey(name: 'errors')
  final List<BatchGetVariableError> errors;

  /// The returned variables.
  @_s.JsonKey(name: 'variables')
  final List<Variable> variables;

  BatchGetVariableResult({
    this.errors,
    this.variables,
  });
  factory BatchGetVariableResult.fromJson(Map<String, dynamic> json) =>
      _$BatchGetVariableResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDetectorVersionResult {
  /// The ID for the created version's parent detector.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The ID for the created detector.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  /// The status of the detector version.
  @_s.JsonKey(name: 'status')
  final DetectorVersionStatus status;

  CreateDetectorVersionResult({
    this.detectorId,
    this.detectorVersionId,
    this.status,
  });
  factory CreateDetectorVersionResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDetectorVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateModelResult {
  CreateModelResult();
  factory CreateModelResult.fromJson(Map<String, dynamic> json) =>
      _$CreateModelResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateModelVersionResult {
  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version number of the model version created.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The model version status.
  @_s.JsonKey(name: 'status')
  final String status;

  CreateModelVersionResult({
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.status,
  });
  factory CreateModelVersionResult.fromJson(Map<String, dynamic> json) =>
      _$CreateModelVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRuleResult {
  /// The created rule.
  @_s.JsonKey(name: 'rule')
  final Rule rule;

  CreateRuleResult({
    this.rule,
  });
  factory CreateRuleResult.fromJson(Map<String, dynamic> json) =>
      _$CreateRuleResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVariableResult {
  CreateVariableResult();
  factory CreateVariableResult.fromJson(Map<String, dynamic> json) =>
      _$CreateVariableResultFromJson(json);
}

enum DataSource {
  @_s.JsonValue('EVENT')
  event,
  @_s.JsonValue('MODEL_SCORE')
  modelScore,
  @_s.JsonValue('EXTERNAL_MODEL_SCORE')
  externalModelScore,
}

extension on DataSource {
  String toValue() {
    switch (this) {
      case DataSource.event:
        return 'EVENT';
      case DataSource.modelScore:
        return 'MODEL_SCORE';
      case DataSource.externalModelScore:
        return 'EXTERNAL_MODEL_SCORE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DataType {
  @_s.JsonValue('STRING')
  string,
  @_s.JsonValue('INTEGER')
  integer,
  @_s.JsonValue('FLOAT')
  float,
  @_s.JsonValue('BOOLEAN')
  boolean,
}

extension on DataType {
  String toValue() {
    switch (this) {
      case DataType.string:
        return 'STRING';
      case DataType.integer:
        return 'INTEGER';
      case DataType.float:
        return 'FLOAT';
      case DataType.boolean:
        return 'BOOLEAN';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The model training validation messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataValidationMetrics {
  /// The field-specific model training validation messages.
  @_s.JsonKey(name: 'fieldLevelMessages')
  final List<FieldValidationMessage> fieldLevelMessages;

  /// The file-specific model training validation messages.
  @_s.JsonKey(name: 'fileLevelMessages')
  final List<FileValidationMessage> fileLevelMessages;

  DataValidationMetrics({
    this.fieldLevelMessages,
    this.fileLevelMessages,
  });
  factory DataValidationMetrics.fromJson(Map<String, dynamic> json) =>
      _$DataValidationMetricsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDetectorResult {
  DeleteDetectorResult();
  factory DeleteDetectorResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDetectorResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDetectorVersionResult {
  DeleteDetectorVersionResult();
  factory DeleteDetectorVersionResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDetectorVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEntityTypeResult {
  DeleteEntityTypeResult();
  factory DeleteEntityTypeResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteEntityTypeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEventResult {
  DeleteEventResult();
  factory DeleteEventResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteEventResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEventTypeResult {
  DeleteEventTypeResult();
  factory DeleteEventTypeResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteEventTypeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteExternalModelResult {
  DeleteExternalModelResult();
  factory DeleteExternalModelResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteExternalModelResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLabelResult {
  DeleteLabelResult();
  factory DeleteLabelResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteLabelResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteModelResult {
  DeleteModelResult();
  factory DeleteModelResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteModelResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteModelVersionResult {
  DeleteModelVersionResult();
  factory DeleteModelVersionResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteModelVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteOutcomeResult {
  DeleteOutcomeResult();
  factory DeleteOutcomeResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteOutcomeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRuleResult {
  DeleteRuleResult();
  factory DeleteRuleResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteRuleResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVariableResult {
  DeleteVariableResult();
  factory DeleteVariableResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteVariableResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDetectorResult {
  /// The detector ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The status and description for each detector version.
  @_s.JsonKey(name: 'detectorVersionSummaries')
  final List<DetectorVersionSummary> detectorVersionSummaries;

  /// The next token to be used for subsequent requests.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeDetectorResult({
    this.arn,
    this.detectorId,
    this.detectorVersionSummaries,
    this.nextToken,
  });
  factory DescribeDetectorResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeDetectorResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeModelVersionsResult {
  /// The model version details.
  @_s.JsonKey(name: 'modelVersionDetails')
  final List<ModelVersionDetail> modelVersionDetails;

  /// The next token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeModelVersionsResult({
    this.modelVersionDetails,
    this.nextToken,
  });
  factory DescribeModelVersionsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeModelVersionsResultFromJson(json);
}

/// The detector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Detector {
  /// The detector ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Timestamp of when the detector was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The detector description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The name of the event type.
  @_s.JsonKey(name: 'eventTypeName')
  final String eventTypeName;

  /// Timestamp of when the detector was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  Detector({
    this.arn,
    this.createdTime,
    this.description,
    this.detectorId,
    this.eventTypeName,
    this.lastUpdatedTime,
  });
  factory Detector.fromJson(Map<String, dynamic> json) =>
      _$DetectorFromJson(json);
}

enum DetectorVersionStatus {
  @_s.JsonValue('DRAFT')
  draft,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
}

extension on DetectorVersionStatus {
  String toValue() {
    switch (this) {
      case DetectorVersionStatus.draft:
        return 'DRAFT';
      case DetectorVersionStatus.active:
        return 'ACTIVE';
      case DetectorVersionStatus.inactive:
        return 'INACTIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The summary of the detector version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectorVersionSummary {
  /// The detector version description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The detector version ID.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  /// Timestamp of when the detector version was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The detector version status.
  @_s.JsonKey(name: 'status')
  final DetectorVersionStatus status;

  DetectorVersionSummary({
    this.description,
    this.detectorVersionId,
    this.lastUpdatedTime,
    this.status,
  });
  factory DetectorVersionSummary.fromJson(Map<String, dynamic> json) =>
      _$DetectorVersionSummaryFromJson(json);
}

/// The entity details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Entity {
  /// The entity ID. If you do not know the <code>entityId</code>, you can pass
  /// <code>unknown</code>, which is areserved string literal.
  @_s.JsonKey(name: 'entityId')
  final String entityId;

  /// The entity type.
  @_s.JsonKey(name: 'entityType')
  final String entityType;

  Entity({
    @_s.required this.entityId,
    @_s.required this.entityType,
  });
  Map<String, dynamic> toJson() => _$EntityToJson(this);
}

/// The entity type details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EntityType {
  /// The entity type ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Timestamp of when the entity type was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The entity type description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Timestamp of when the entity type was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The entity type name.
  @_s.JsonKey(name: 'name')
  final String name;

  EntityType({
    this.arn,
    this.createdTime,
    this.description,
    this.lastUpdatedTime,
    this.name,
  });
  factory EntityType.fromJson(Map<String, dynamic> json) =>
      _$EntityTypeFromJson(json);
}

/// The event type details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventType {
  /// The entity type ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Timestamp of when the event type was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The event type description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The event type entity types.
  @_s.JsonKey(name: 'entityTypes')
  final List<String> entityTypes;

  /// The event type event variables.
  @_s.JsonKey(name: 'eventVariables')
  final List<String> eventVariables;

  /// The event type labels.
  @_s.JsonKey(name: 'labels')
  final List<String> labels;

  /// Timestamp of when the event type was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The event type name.
  @_s.JsonKey(name: 'name')
  final String name;

  EventType({
    this.arn,
    this.createdTime,
    this.description,
    this.entityTypes,
    this.eventVariables,
    this.labels,
    this.lastUpdatedTime,
    this.name,
  });
  factory EventType.fromJson(Map<String, dynamic> json) =>
      _$EventTypeFromJson(json);
}

/// Details for the external events data used for model version training.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExternalEventsDetail {
  /// The ARN of the role that provides Amazon Fraud Detector access to the data
  /// location.
  @_s.JsonKey(name: 'dataAccessRoleArn')
  final String dataAccessRoleArn;

  /// The Amazon S3 bucket location for the data.
  @_s.JsonKey(name: 'dataLocation')
  final String dataLocation;

  ExternalEventsDetail({
    @_s.required this.dataAccessRoleArn,
    @_s.required this.dataLocation,
  });
  factory ExternalEventsDetail.fromJson(Map<String, dynamic> json) =>
      _$ExternalEventsDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalEventsDetailToJson(this);
}

/// The Amazon SageMaker model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExternalModel {
  /// The model ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Timestamp of when the model was last created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The input configuration.
  @_s.JsonKey(name: 'inputConfiguration')
  final ModelInputConfiguration inputConfiguration;

  /// The role used to invoke the model.
  @_s.JsonKey(name: 'invokeModelEndpointRoleArn')
  final String invokeModelEndpointRoleArn;

  /// Timestamp of when the model was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The Amazon SageMaker model endpoints.
  @_s.JsonKey(name: 'modelEndpoint')
  final String modelEndpoint;

  /// The Amazon Fraud Detector status for the external model endpoint
  @_s.JsonKey(name: 'modelEndpointStatus')
  final ModelEndpointStatus modelEndpointStatus;

  /// The source of the model.
  @_s.JsonKey(name: 'modelSource')
  final ModelSource modelSource;

  /// The output configuration.
  @_s.JsonKey(name: 'outputConfiguration')
  final ModelOutputConfiguration outputConfiguration;

  ExternalModel({
    this.arn,
    this.createdTime,
    this.inputConfiguration,
    this.invokeModelEndpointRoleArn,
    this.lastUpdatedTime,
    this.modelEndpoint,
    this.modelEndpointStatus,
    this.modelSource,
    this.outputConfiguration,
  });
  factory ExternalModel.fromJson(Map<String, dynamic> json) =>
      _$ExternalModelFromJson(json);
}

/// The message details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FieldValidationMessage {
  /// The message content.
  @_s.JsonKey(name: 'content')
  final String content;

  /// The field name.
  @_s.JsonKey(name: 'fieldName')
  final String fieldName;

  /// The message ID.
  @_s.JsonKey(name: 'identifier')
  final String identifier;

  /// The message title.
  @_s.JsonKey(name: 'title')
  final String title;

  /// The message type.
  @_s.JsonKey(name: 'type')
  final String type;

  FieldValidationMessage({
    this.content,
    this.fieldName,
    this.identifier,
    this.title,
    this.type,
  });
  factory FieldValidationMessage.fromJson(Map<String, dynamic> json) =>
      _$FieldValidationMessageFromJson(json);
}

/// The message details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FileValidationMessage {
  /// The message content.
  @_s.JsonKey(name: 'content')
  final String content;

  /// The message title.
  @_s.JsonKey(name: 'title')
  final String title;

  /// The message type.
  @_s.JsonKey(name: 'type')
  final String type;

  FileValidationMessage({
    this.content,
    this.title,
    this.type,
  });
  factory FileValidationMessage.fromJson(Map<String, dynamic> json) =>
      _$FileValidationMessageFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDetectorVersionResult {
  /// The detector version ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp when the detector version was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The detector version description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The detector version ID.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  /// The Amazon SageMaker model endpoints included in the detector version.
  @_s.JsonKey(name: 'externalModelEndpoints')
  final List<String> externalModelEndpoints;

  /// The timestamp when the detector version was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The model versions included in the detector version.
  @_s.JsonKey(name: 'modelVersions')
  final List<ModelVersion> modelVersions;

  /// The execution mode of the rule in the dectector
  ///
  /// <code>FIRST_MATCHED</code> indicates that Amazon Fraud Detector evaluates
  /// rules sequentially, first to last, stopping at the first matched rule.
  /// Amazon Fraud dectector then provides the outcomes for that single rule.
  ///
  /// <code>ALL_MATCHED</code> indicates that Amazon Fraud Detector evaluates all
  /// rules and returns the outcomes for all matched rules. You can define and
  /// edit the rule mode at the detector version level, when it is in draft
  /// status.
  @_s.JsonKey(name: 'ruleExecutionMode')
  final RuleExecutionMode ruleExecutionMode;

  /// The rules included in the detector version.
  @_s.JsonKey(name: 'rules')
  final List<Rule> rules;

  /// The status of the detector version.
  @_s.JsonKey(name: 'status')
  final DetectorVersionStatus status;

  GetDetectorVersionResult({
    this.arn,
    this.createdTime,
    this.description,
    this.detectorId,
    this.detectorVersionId,
    this.externalModelEndpoints,
    this.lastUpdatedTime,
    this.modelVersions,
    this.ruleExecutionMode,
    this.rules,
    this.status,
  });
  factory GetDetectorVersionResult.fromJson(Map<String, dynamic> json) =>
      _$GetDetectorVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDetectorsResult {
  /// The detectors.
  @_s.JsonKey(name: 'detectors')
  final List<Detector> detectors;

  /// The next page token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetDetectorsResult({
    this.detectors,
    this.nextToken,
  });
  factory GetDetectorsResult.fromJson(Map<String, dynamic> json) =>
      _$GetDetectorsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEntityTypesResult {
  /// An array of entity types.
  @_s.JsonKey(name: 'entityTypes')
  final List<EntityType> entityTypes;

  /// The next page token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetEntityTypesResult({
    this.entityTypes,
    this.nextToken,
  });
  factory GetEntityTypesResult.fromJson(Map<String, dynamic> json) =>
      _$GetEntityTypesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEventPredictionResult {
  /// The model scores. Amazon Fraud Detector generates model scores between 0 and
  /// 1000, where 0 is low fraud risk and 1000 is high fraud risk. Model scores
  /// are directly related to the false positive rate (FPR). For example, a score
  /// of 600 corresponds to an estimated 10% false positive rate whereas a score
  /// of 900 corresponds to an estimated 2% false positive rate.
  @_s.JsonKey(name: 'modelScores')
  final List<ModelScores> modelScores;

  /// The results.
  @_s.JsonKey(name: 'ruleResults')
  final List<RuleResult> ruleResults;

  GetEventPredictionResult({
    this.modelScores,
    this.ruleResults,
  });
  factory GetEventPredictionResult.fromJson(Map<String, dynamic> json) =>
      _$GetEventPredictionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEventTypesResult {
  /// An array of event types.
  @_s.JsonKey(name: 'eventTypes')
  final List<EventType> eventTypes;

  /// The next page token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetEventTypesResult({
    this.eventTypes,
    this.nextToken,
  });
  factory GetEventTypesResult.fromJson(Map<String, dynamic> json) =>
      _$GetEventTypesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetExternalModelsResult {
  /// Gets the Amazon SageMaker models.
  @_s.JsonKey(name: 'externalModels')
  final List<ExternalModel> externalModels;

  /// The next page token to be used in subsequent requests.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetExternalModelsResult({
    this.externalModels,
    this.nextToken,
  });
  factory GetExternalModelsResult.fromJson(Map<String, dynamic> json) =>
      _$GetExternalModelsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetKMSEncryptionKeyResult {
  /// The KMS encryption key.
  @_s.JsonKey(name: 'kmsKey')
  final KMSKey kmsKey;

  GetKMSEncryptionKeyResult({
    this.kmsKey,
  });
  factory GetKMSEncryptionKeyResult.fromJson(Map<String, dynamic> json) =>
      _$GetKMSEncryptionKeyResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLabelsResult {
  /// An array of labels.
  @_s.JsonKey(name: 'labels')
  final List<Label> labels;

  /// The next page token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetLabelsResult({
    this.labels,
    this.nextToken,
  });
  factory GetLabelsResult.fromJson(Map<String, dynamic> json) =>
      _$GetLabelsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetModelVersionResult {
  /// The model version ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The event details.
  @_s.JsonKey(name: 'externalEventsDetail')
  final ExternalEventsDetail externalEventsDetail;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version number.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The model version status.
  ///
  /// Possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>TRAINING_IN_PROGRESS</code>
  /// </li>
  /// <li>
  /// <code>TRAINING_COMPLETE</code>
  /// </li>
  /// <li>
  /// <code>ACTIVATE_REQUESTED</code>
  /// </li>
  /// <li>
  /// <code>ACTIVATE_IN_PROGRESS</code>
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>INACTIVATE_REQUESTED</code>
  /// </li>
  /// <li>
  /// <code>INACTIVATE_IN_PROGRESS</code>
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>
  /// </li>
  /// <li>
  /// <code>ERROR</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final String status;

  /// The training data schema.
  @_s.JsonKey(name: 'trainingDataSchema')
  final TrainingDataSchema trainingDataSchema;

  /// The training data source.
  @_s.JsonKey(name: 'trainingDataSource')
  final TrainingDataSourceEnum trainingDataSource;

  GetModelVersionResult({
    this.arn,
    this.externalEventsDetail,
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.status,
    this.trainingDataSchema,
    this.trainingDataSource,
  });
  factory GetModelVersionResult.fromJson(Map<String, dynamic> json) =>
      _$GetModelVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetModelsResult {
  /// The array of models.
  @_s.JsonKey(name: 'models')
  final List<Model> models;

  /// The next page token to be used in subsequent requests.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetModelsResult({
    this.models,
    this.nextToken,
  });
  factory GetModelsResult.fromJson(Map<String, dynamic> json) =>
      _$GetModelsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOutcomesResult {
  /// The next page token for subsequent requests.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The outcomes.
  @_s.JsonKey(name: 'outcomes')
  final List<Outcome> outcomes;

  GetOutcomesResult({
    this.nextToken,
    this.outcomes,
  });
  factory GetOutcomesResult.fromJson(Map<String, dynamic> json) =>
      _$GetOutcomesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRulesResult {
  /// The next page token to be used in subsequent requests.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The details of the requested rule.
  @_s.JsonKey(name: 'ruleDetails')
  final List<RuleDetail> ruleDetails;

  GetRulesResult({
    this.nextToken,
    this.ruleDetails,
  });
  factory GetRulesResult.fromJson(Map<String, dynamic> json) =>
      _$GetRulesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVariablesResult {
  /// The next page token to be used in subsequent requests.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The names of the variables returned.
  @_s.JsonKey(name: 'variables')
  final List<Variable> variables;

  GetVariablesResult({
    this.nextToken,
    this.variables,
  });
  factory GetVariablesResult.fromJson(Map<String, dynamic> json) =>
      _$GetVariablesResultFromJson(json);
}

/// The KMS key details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KMSKey {
  /// The encryption key ARN.
  @_s.JsonKey(name: 'kmsEncryptionKeyArn')
  final String kmsEncryptionKeyArn;

  KMSKey({
    this.kmsEncryptionKeyArn,
  });
  factory KMSKey.fromJson(Map<String, dynamic> json) => _$KMSKeyFromJson(json);
}

/// The label details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Label {
  /// The label ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Timestamp of when the event type was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The label description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Timestamp of when the label was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The label name.
  @_s.JsonKey(name: 'name')
  final String name;

  Label({
    this.arn,
    this.createdTime,
    this.description,
    this.lastUpdatedTime,
    this.name,
  });
  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
}

/// The label schema.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelSchema {
  /// The label mapper maps the Amazon Fraud Detector supported model
  /// classification labels (<code>FRAUD</code>, <code>LEGIT</code>) to the
  /// appropriate event type labels. For example, if "<code>FRAUD</code>" and
  /// "<code>LEGIT</code>" are Amazon Fraud Detector supported labels, this mapper
  /// could be: <code>{"FRAUD" =&gt; ["0"]</code>, <code>"LEGIT" =&gt;
  /// ["1"]}</code> or <code>{"FRAUD" =&gt; ["false"]</code>, <code>"LEGIT" =&gt;
  /// ["true"]}</code> or <code>{"FRAUD" =&gt; ["fraud", "abuse"]</code>,
  /// <code>"LEGIT" =&gt; ["legit", "safe"]}</code>. The value part of the mapper
  /// is a list, because you may have multiple label variants from your event type
  /// for a single Amazon Fraud Detector label.
  @_s.JsonKey(name: 'labelMapper')
  final Map<String, List<String>> labelMapper;

  LabelSchema({
    @_s.required this.labelMapper,
  });
  factory LabelSchema.fromJson(Map<String, dynamic> json) =>
      _$LabelSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$LabelSchemaToJson(this);
}

enum Language {
  @_s.JsonValue('DETECTORPL')
  detectorpl,
}

extension on Language {
  String toValue() {
    switch (this) {
      case Language.detectorpl:
        return 'DETECTORPL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResult {
  /// The next token for subsequent requests.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A collection of key and value pairs.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ListTagsForResourceResult({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResultFromJson(json);
}

/// Model performance metrics data points.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricDataPoint {
  /// The false positive rate. This is the percentage of total legitimate events
  /// that are incorrectly predicted as fraud.
  @_s.JsonKey(name: 'fpr')
  final double fpr;

  /// The percentage of fraud events correctly predicted as fraudulent as compared
  /// to all events predicted as fraudulent.
  @_s.JsonKey(name: 'precision')
  final double precision;

  /// The model threshold that specifies an acceptable fraud capture rate. For
  /// example, a threshold of 500 means any model score 500 or above is labeled as
  /// fraud.
  @_s.JsonKey(name: 'threshold')
  final double threshold;

  /// The true positive rate. This is the percentage of total fraud the model
  /// detects. Also known as capture rate.
  @_s.JsonKey(name: 'tpr')
  final double tpr;

  MetricDataPoint({
    this.fpr,
    this.precision,
    this.threshold,
    this.tpr,
  });
  factory MetricDataPoint.fromJson(Map<String, dynamic> json) =>
      _$MetricDataPointFromJson(json);
}

/// The model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Model {
  /// The ARN of the model.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Timestamp of when the model was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The model description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the event type.
  @_s.JsonKey(name: 'eventTypeName')
  final String eventTypeName;

  /// Timestamp of last time the model was updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  Model({
    this.arn,
    this.createdTime,
    this.description,
    this.eventTypeName,
    this.lastUpdatedTime,
    this.modelId,
    this.modelType,
  });
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

/// A pre-formed Amazon SageMaker model input you can include if your detector
/// version includes an imported Amazon SageMaker model endpoint with
/// pass-through input configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ModelEndpointDataBlob {
  /// The byte buffer of the Amazon SageMaker model endpoint input data blob.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'byteBuffer')
  final Uint8List byteBuffer;

  /// The content type of the Amazon SageMaker model endpoint input data blob.
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  ModelEndpointDataBlob({
    this.byteBuffer,
    this.contentType,
  });
  Map<String, dynamic> toJson() => _$ModelEndpointDataBlobToJson(this);
}

enum ModelEndpointStatus {
  @_s.JsonValue('ASSOCIATED')
  associated,
  @_s.JsonValue('DISSOCIATED')
  dissociated,
}

extension on ModelEndpointStatus {
  String toValue() {
    switch (this) {
      case ModelEndpointStatus.associated:
        return 'ASSOCIATED';
      case ModelEndpointStatus.dissociated:
        return 'DISSOCIATED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The Amazon SageMaker model input configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelInputConfiguration {
  /// The event variables.
  @_s.JsonKey(name: 'useEventVariables')
  final bool useEventVariables;

  /// Template for constructing the CSV input-data sent to SageMaker. At
  /// event-evaluation, the placeholders for variable-names in the template will
  /// be replaced with the variable values before being sent to SageMaker.
  @_s.JsonKey(name: 'csvInputTemplate')
  final String csvInputTemplate;

  /// The event type name.
  @_s.JsonKey(name: 'eventTypeName')
  final String eventTypeName;

  /// The format of the model input configuration. The format differs depending on
  /// if it is passed through to SageMaker or constructed by Amazon Fraud
  /// Detector.
  @_s.JsonKey(name: 'format')
  final ModelInputDataFormat format;

  /// Template for constructing the JSON input-data sent to SageMaker. At
  /// event-evaluation, the placeholders for variable names in the template will
  /// be replaced with the variable values before being sent to SageMaker.
  @_s.JsonKey(name: 'jsonInputTemplate')
  final String jsonInputTemplate;

  ModelInputConfiguration({
    @_s.required this.useEventVariables,
    this.csvInputTemplate,
    this.eventTypeName,
    this.format,
    this.jsonInputTemplate,
  });
  factory ModelInputConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ModelInputConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ModelInputConfigurationToJson(this);
}

enum ModelInputDataFormat {
  @_s.JsonValue('TEXT_CSV')
  textCsv,
  @_s.JsonValue('APPLICATION_JSON')
  applicationJson,
}

/// Provides the Amazon Sagemaker model output configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelOutputConfiguration {
  /// The format of the model output configuration.
  @_s.JsonKey(name: 'format')
  final ModelOutputDataFormat format;

  /// A map of CSV index values in the SageMaker response to the Amazon Fraud
  /// Detector variables.
  @_s.JsonKey(name: 'csvIndexToVariableMap')
  final Map<String, String> csvIndexToVariableMap;

  /// A map of JSON keys in response from SageMaker to the Amazon Fraud Detector
  /// variables.
  @_s.JsonKey(name: 'jsonKeyToVariableMap')
  final Map<String, String> jsonKeyToVariableMap;

  ModelOutputConfiguration({
    @_s.required this.format,
    this.csvIndexToVariableMap,
    this.jsonKeyToVariableMap,
  });
  factory ModelOutputConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ModelOutputConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ModelOutputConfigurationToJson(this);
}

enum ModelOutputDataFormat {
  @_s.JsonValue('TEXT_CSV')
  textCsv,
  @_s.JsonValue('APPLICATION_JSONLINES')
  applicationJsonlines,
}

/// The fraud prediction scores.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelScores {
  /// The model version.
  @_s.JsonKey(name: 'modelVersion')
  final ModelVersion modelVersion;

  /// The model's fraud prediction scores.
  @_s.JsonKey(name: 'scores')
  final Map<String, double> scores;

  ModelScores({
    this.modelVersion,
    this.scores,
  });
  factory ModelScores.fromJson(Map<String, dynamic> json) =>
      _$ModelScoresFromJson(json);
}

enum ModelSource {
  @_s.JsonValue('SAGEMAKER')
  sagemaker,
}

extension on ModelSource {
  String toValue() {
    switch (this) {
      case ModelSource.sagemaker:
        return 'SAGEMAKER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ModelTypeEnum {
  @_s.JsonValue('ONLINE_FRAUD_INSIGHTS')
  onlineFraudInsights,
}

extension on ModelTypeEnum {
  String toValue() {
    switch (this) {
      case ModelTypeEnum.onlineFraudInsights:
        return 'ONLINE_FRAUD_INSIGHTS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The model version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelVersion {
  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version number.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The model version ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  ModelVersion({
    @_s.required this.modelId,
    @_s.required this.modelType,
    @_s.required this.modelVersionNumber,
    this.arn,
  });
  factory ModelVersion.fromJson(Map<String, dynamic> json) =>
      _$ModelVersionFromJson(json);

  Map<String, dynamic> toJson() => _$ModelVersionToJson(this);
}

/// The details of the model version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelVersionDetail {
  /// The model version ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp when the model was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The event details.
  @_s.JsonKey(name: 'externalEventsDetail')
  final ExternalEventsDetail externalEventsDetail;

  /// The timestamp when the model was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version number.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The status of the model version.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The training data schema.
  @_s.JsonKey(name: 'trainingDataSchema')
  final TrainingDataSchema trainingDataSchema;

  /// The model version training data source.
  @_s.JsonKey(name: 'trainingDataSource')
  final TrainingDataSourceEnum trainingDataSource;

  /// The training results.
  @_s.JsonKey(name: 'trainingResult')
  final TrainingResult trainingResult;

  ModelVersionDetail({
    this.arn,
    this.createdTime,
    this.externalEventsDetail,
    this.lastUpdatedTime,
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.status,
    this.trainingDataSchema,
    this.trainingDataSource,
    this.trainingResult,
  });
  factory ModelVersionDetail.fromJson(Map<String, dynamic> json) =>
      _$ModelVersionDetailFromJson(json);
}

enum ModelVersionStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
}

extension on ModelVersionStatus {
  String toValue() {
    switch (this) {
      case ModelVersionStatus.active:
        return 'ACTIVE';
      case ModelVersionStatus.inactive:
        return 'INACTIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The outcome.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Outcome {
  /// The outcome ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp when the outcome was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The outcome description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The timestamp when the outcome was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The outcome name.
  @_s.JsonKey(name: 'name')
  final String name;

  Outcome({
    this.arn,
    this.createdTime,
    this.description,
    this.lastUpdatedTime,
    this.name,
  });
  factory Outcome.fromJson(Map<String, dynamic> json) =>
      _$OutcomeFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutDetectorResult {
  PutDetectorResult();
  factory PutDetectorResult.fromJson(Map<String, dynamic> json) =>
      _$PutDetectorResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEntityTypeResult {
  PutEntityTypeResult();
  factory PutEntityTypeResult.fromJson(Map<String, dynamic> json) =>
      _$PutEntityTypeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEventTypeResult {
  PutEventTypeResult();
  factory PutEventTypeResult.fromJson(Map<String, dynamic> json) =>
      _$PutEventTypeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutExternalModelResult {
  PutExternalModelResult();
  factory PutExternalModelResult.fromJson(Map<String, dynamic> json) =>
      _$PutExternalModelResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutKMSEncryptionKeyResult {
  PutKMSEncryptionKeyResult();
  factory PutKMSEncryptionKeyResult.fromJson(Map<String, dynamic> json) =>
      _$PutKMSEncryptionKeyResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutLabelResult {
  PutLabelResult();
  factory PutLabelResult.fromJson(Map<String, dynamic> json) =>
      _$PutLabelResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutOutcomeResult {
  PutOutcomeResult();
  factory PutOutcomeResult.fromJson(Map<String, dynamic> json) =>
      _$PutOutcomeResultFromJson(json);
}

/// A rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Rule {
  /// The detector for which the rule is associated.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The rule ID.
  @_s.JsonKey(name: 'ruleId')
  final String ruleId;

  /// The rule version.
  @_s.JsonKey(name: 'ruleVersion')
  final String ruleVersion;

  Rule({
    @_s.required this.detectorId,
    @_s.required this.ruleId,
    @_s.required this.ruleVersion,
  });
  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}

/// The details of the rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuleDetail {
  /// The rule ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp of when the rule was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The rule description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The detector for which the rule is associated.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The rule expression.
  @_s.JsonKey(name: 'expression')
  final String expression;

  /// The rule language.
  @_s.JsonKey(name: 'language')
  final Language language;

  /// Timestamp of the last time the rule was updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The rule outcomes.
  @_s.JsonKey(name: 'outcomes')
  final List<String> outcomes;

  /// The rule ID.
  @_s.JsonKey(name: 'ruleId')
  final String ruleId;

  /// The rule version.
  @_s.JsonKey(name: 'ruleVersion')
  final String ruleVersion;

  RuleDetail({
    this.arn,
    this.createdTime,
    this.description,
    this.detectorId,
    this.expression,
    this.language,
    this.lastUpdatedTime,
    this.outcomes,
    this.ruleId,
    this.ruleVersion,
  });
  factory RuleDetail.fromJson(Map<String, dynamic> json) =>
      _$RuleDetailFromJson(json);
}

enum RuleExecutionMode {
  @_s.JsonValue('ALL_MATCHED')
  allMatched,
  @_s.JsonValue('FIRST_MATCHED')
  firstMatched,
}

extension on RuleExecutionMode {
  String toValue() {
    switch (this) {
      case RuleExecutionMode.allMatched:
        return 'ALL_MATCHED';
      case RuleExecutionMode.firstMatched:
        return 'FIRST_MATCHED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The rule results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuleResult {
  /// The outcomes of the matched rule, based on the rule execution mode.
  @_s.JsonKey(name: 'outcomes')
  final List<String> outcomes;

  /// The rule ID that was matched, based on the rule execution mode.
  @_s.JsonKey(name: 'ruleId')
  final String ruleId;

  RuleResult({
    this.outcomes,
    this.ruleId,
  });
  factory RuleResult.fromJson(Map<String, dynamic> json) =>
      _$RuleResultFromJson(json);
}

/// A key and value pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A tag key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// A value assigned to a tag key.
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
class TagResourceResult {
  TagResourceResult();
  factory TagResourceResult.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResultFromJson(json);
}

/// The training data schema.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrainingDataSchema {
  @_s.JsonKey(name: 'labelSchema')
  final LabelSchema labelSchema;

  /// The training data schema variables.
  @_s.JsonKey(name: 'modelVariables')
  final List<String> modelVariables;

  TrainingDataSchema({
    @_s.required this.labelSchema,
    @_s.required this.modelVariables,
  });
  factory TrainingDataSchema.fromJson(Map<String, dynamic> json) =>
      _$TrainingDataSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDataSchemaToJson(this);
}

enum TrainingDataSourceEnum {
  @_s.JsonValue('EXTERNAL_EVENTS')
  externalEvents,
}

extension on TrainingDataSourceEnum {
  String toValue() {
    switch (this) {
      case TrainingDataSourceEnum.externalEvents:
        return 'EXTERNAL_EVENTS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The training metric details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrainingMetrics {
  /// The area under the curve. This summarizes true positive rate (TPR) and false
  /// positive rate (FPR) across all possible model score thresholds. A model with
  /// no predictive power has an AUC of 0.5, whereas a perfect model has a score
  /// of 1.0.
  @_s.JsonKey(name: 'auc')
  final double auc;

  /// The data points details.
  @_s.JsonKey(name: 'metricDataPoints')
  final List<MetricDataPoint> metricDataPoints;

  TrainingMetrics({
    this.auc,
    this.metricDataPoints,
  });
  factory TrainingMetrics.fromJson(Map<String, dynamic> json) =>
      _$TrainingMetricsFromJson(json);
}

/// The training result details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrainingResult {
  /// The validation metrics.
  @_s.JsonKey(name: 'dataValidationMetrics')
  final DataValidationMetrics dataValidationMetrics;

  /// The training metric details.
  @_s.JsonKey(name: 'trainingMetrics')
  final TrainingMetrics trainingMetrics;

  TrainingResult({
    this.dataValidationMetrics,
    this.trainingMetrics,
  });
  factory TrainingResult.fromJson(Map<String, dynamic> json) =>
      _$TrainingResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResult {
  UntagResourceResult();
  factory UntagResourceResult.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDetectorVersionMetadataResult {
  UpdateDetectorVersionMetadataResult();
  factory UpdateDetectorVersionMetadataResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDetectorVersionMetadataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDetectorVersionResult {
  UpdateDetectorVersionResult();
  factory UpdateDetectorVersionResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDetectorVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDetectorVersionStatusResult {
  UpdateDetectorVersionStatusResult();
  factory UpdateDetectorVersionStatusResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDetectorVersionStatusResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateModelResult {
  UpdateModelResult();
  factory UpdateModelResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateModelVersionResult {
  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version number of the model version updated.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The status of the updated model version.
  @_s.JsonKey(name: 'status')
  final String status;

  UpdateModelVersionResult({
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.status,
  });
  factory UpdateModelVersionResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateModelVersionStatusResult {
  UpdateModelVersionStatusResult();
  factory UpdateModelVersionStatusResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelVersionStatusResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRuleMetadataResult {
  UpdateRuleMetadataResult();
  factory UpdateRuleMetadataResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateRuleMetadataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRuleVersionResult {
  /// The new rule version that was created.
  @_s.JsonKey(name: 'rule')
  final Rule rule;

  UpdateRuleVersionResult({
    this.rule,
  });
  factory UpdateRuleVersionResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateRuleVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVariableResult {
  UpdateVariableResult();
  factory UpdateVariableResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateVariableResultFromJson(json);
}

/// The variable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Variable {
  /// The ARN of the variable.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time when the variable was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The data source of the variable.
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  /// The data type of the variable. For more information see <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types">Variable
  /// types</a>.
  @_s.JsonKey(name: 'dataType')
  final DataType dataType;

  /// The default value of the variable.
  @_s.JsonKey(name: 'defaultValue')
  final String defaultValue;

  /// The description of the variable.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The time when variable was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The name of the variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The variable type of the variable.
  ///
  /// Valid Values: <code>AUTH_CODE | AVS | BILLING_ADDRESS_L1 |
  /// BILLING_ADDRESS_L2 | BILLING_CITY | BILLING_COUNTRY | BILLING_NAME |
  /// BILLING_PHONE | BILLING_STATE | BILLING_ZIP | CARD_BIN | CATEGORICAL |
  /// CURRENCY_CODE | EMAIL_ADDRESS | FINGERPRINT | FRAUD_LABEL | FREE_FORM_TEXT |
  /// IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE | PHONE_NUMBER | PRICE |
  /// PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 | SHIPPING_CITY
  /// | SHIPPING_COUNTRY | SHIPPING_NAME | SHIPPING_PHONE | SHIPPING_STATE |
  /// SHIPPING_ZIP | USERAGENT </code>
  @_s.JsonKey(name: 'variableType')
  final String variableType;

  Variable({
    this.arn,
    this.createdTime,
    this.dataSource,
    this.dataType,
    this.defaultValue,
    this.description,
    this.lastUpdatedTime,
    this.name,
    this.variableType,
  });
  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);
}

/// A variable in the list of variables for the batch create variable request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VariableEntry {
  /// The data source of the variable.
  @_s.JsonKey(name: 'dataSource')
  final String dataSource;

  /// The data type of the variable.
  @_s.JsonKey(name: 'dataType')
  final String dataType;

  /// The default value of the variable.
  @_s.JsonKey(name: 'defaultValue')
  final String defaultValue;

  /// The description of the variable.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of the variable. For more information see <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types">Variable
  /// types</a>.
  ///
  /// Valid Values: <code>AUTH_CODE | AVS | BILLING_ADDRESS_L1 |
  /// BILLING_ADDRESS_L2 | BILLING_CITY | BILLING_COUNTRY | BILLING_NAME |
  /// BILLING_PHONE | BILLING_STATE | BILLING_ZIP | CARD_BIN | CATEGORICAL |
  /// CURRENCY_CODE | EMAIL_ADDRESS | FINGERPRINT | FRAUD_LABEL | FREE_FORM_TEXT |
  /// IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE | PHONE_NUMBER | PRICE |
  /// PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 | SHIPPING_CITY
  /// | SHIPPING_COUNTRY | SHIPPING_NAME | SHIPPING_PHONE | SHIPPING_STATE |
  /// SHIPPING_ZIP | USERAGENT </code>
  @_s.JsonKey(name: 'variableType')
  final String variableType;

  VariableEntry({
    this.dataSource,
    this.dataType,
    this.defaultValue,
    this.description,
    this.name,
    this.variableType,
  });
  Map<String, dynamic> toJson() => _$VariableEntryToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
