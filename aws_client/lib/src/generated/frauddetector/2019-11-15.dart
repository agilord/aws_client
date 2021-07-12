// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// This is the Amazon Fraud Detector API Reference. This guide is for
/// developers who need detailed information about Amazon Fraud Detector API
/// actions, data types, and errors. For more information about Amazon Fraud
/// Detector features, see the <a
/// href="https://docs.aws.amazon.com/frauddetector/latest/ug/">Amazon Fraud
/// Detector User Guide</a>.
class FraudDetector {
  final _s.JsonProtocol _protocol;
  FraudDetector({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required List<VariableEntry> variableEntries,
    List<Tag>? tags,
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
    required List<String> names,
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

  /// Cancels the specified batch prediction job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The ID of the batch prediction job to cancel.
  Future<void> cancelBatchPredictionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CancelBatchPredictionJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'jobId': jobId,
      },
    );
  }

  /// Creates a batch prediction job.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [detectorName] :
  /// The name of the detector.
  ///
  /// Parameter [eventTypeName] :
  /// The name of the event type.
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of the IAM role to use for this job request.
  ///
  /// Parameter [inputPath] :
  /// The Amazon S3 location of your training file.
  ///
  /// Parameter [jobId] :
  /// The ID of the batch prediction job.
  ///
  /// Parameter [outputPath] :
  /// The Amazon S3 location of your output file.
  ///
  /// Parameter [detectorVersion] :
  /// The detector version.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<void> createBatchPredictionJob({
    required String detectorName,
    required String eventTypeName,
    required String iamRoleArn,
    required String inputPath,
    required String jobId,
    required String outputPath,
    String? detectorVersion,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(detectorName, 'detectorName');
    _s.validateStringLength(
      'detectorName',
      detectorName,
      1,
      64,
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
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    _s.validateStringLength(
      'iamRoleArn',
      iamRoleArn,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputPath, 'inputPath');
    _s.validateStringLength(
      'inputPath',
      inputPath,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputPath, 'outputPath');
    _s.validateStringLength(
      'outputPath',
      outputPath,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringLength(
      'detectorVersion',
      detectorVersion,
      1,
      5,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateBatchPredictionJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorName': detectorName,
        'eventTypeName': eventTypeName,
        'iamRoleArn': iamRoleArn,
        'inputPath': inputPath,
        'jobId': jobId,
        'outputPath': outputPath,
        if (detectorVersion != null) 'detectorVersion': detectorVersion,
        if (tags != null) 'tags': tags,
      },
    );
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
    required String detectorId,
    required List<Rule> rules,
    String? description,
    List<String>? externalModelEndpoints,
    List<ModelVersion>? modelVersions,
    RuleExecutionMode? ruleExecutionMode,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    required String eventTypeName,
    required String modelId,
    required ModelTypeEnum modelType,
    String? description,
    List<Tag>? tags,
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
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventTypeName': eventTypeName,
        'modelId': modelId,
        'modelType': modelType.toValue(),
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );
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
    required String modelId,
    required ModelTypeEnum modelType,
    required TrainingDataSchema trainingDataSchema,
    required TrainingDataSourceEnum trainingDataSource,
    ExternalEventsDetail? externalEventsDetail,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
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
        'modelType': modelType.toValue(),
        'trainingDataSchema': trainingDataSchema,
        'trainingDataSource': trainingDataSource.toValue(),
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
    required String detectorId,
    required String expression,
    required Language language,
    required List<String> outcomes,
    required String ruleId,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
        'language': language.toValue(),
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
    required DataSource dataSource,
    required DataType dataType,
    required String defaultValue,
    required String name,
    String? description,
    List<Tag>? tags,
    String? variableType,
  }) async {
    ArgumentError.checkNotNull(dataSource, 'dataSource');
    ArgumentError.checkNotNull(dataType, 'dataType');
    ArgumentError.checkNotNull(defaultValue, 'defaultValue');
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateVariable'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataSource': dataSource.toValue(),
        'dataType': dataType.toValue(),
        'defaultValue': defaultValue,
        'name': name,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
        if (variableType != null) 'variableType': variableType,
      },
    );
  }

  /// Deletes a batch prediction job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The ID of the batch prediction job to delete.
  Future<void> deleteBatchPredictionJob({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteBatchPredictionJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'jobId': jobId,
      },
    );
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
    required String detectorId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteDetector'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
      },
    );
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
    required String detectorId,
    required String detectorVersionId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteDetectorVersion'
    };
    await _protocol.send(
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
  }

  /// Deletes an entity type.
  ///
  /// You cannot delete an entity type that is included in an event type.
  ///
  /// When you delete an entity type, Amazon Fraud Detector permanently deletes
  /// that entity type and the data is no longer stored in Amazon Fraud
  /// Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the entity type to delete.
  Future<void> deleteEntityType({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteEntityType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Deletes the specified event.
  ///
  /// When you delete an event, Amazon Fraud Detector permanently deletes that
  /// event and the event data is no longer stored in Amazon Fraud Detector.
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
    required String eventId,
    required String eventTypeName,
  }) async {
    ArgumentError.checkNotNull(eventId, 'eventId');
    _s.validateStringLength(
      'eventId',
      eventId,
      1,
      64,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteEvent'
    };
    await _protocol.send(
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
  }

  /// Deletes an event type.
  ///
  /// You cannot delete an event type that is used in a detector or a model.
  ///
  /// When you delete an entity type, Amazon Fraud Detector permanently deletes
  /// that entity type and the data is no longer stored in Amazon Fraud
  /// Detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the event type to delete.
  Future<void> deleteEventType({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteEventType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
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
    required String modelEndpoint,
  }) async {
    ArgumentError.checkNotNull(modelEndpoint, 'modelEndpoint');
    _s.validateStringLength(
      'modelEndpoint',
      modelEndpoint,
      1,
      63,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteExternalModel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelEndpoint': modelEndpoint,
      },
    );
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
  /// label and the data is no longer stored in Amazon Fraud Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the label to delete.
  Future<void> deleteLabel({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteLabel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Deletes a model.
  ///
  /// You can delete models and model versions in Amazon Fraud Detector,
  /// provided that they are not associated with a detector version.
  ///
  /// When you delete a model, Amazon Fraud Detector permanently deletes that
  /// model and the data is no longer stored in Amazon Fraud Detector.
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
    required String modelId,
    required ModelTypeEnum modelType,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteModel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType.toValue(),
      },
    );
  }

  /// Deletes a model version.
  ///
  /// You can delete models and model versions in Amazon Fraud Detector,
  /// provided that they are not associated with a detector version.
  ///
  /// When you delete a model version, Amazon Fraud Detector permanently deletes
  /// that model version and the data is no longer stored in Amazon Fraud
  /// Detector.
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
    required String modelId,
    required ModelTypeEnum modelType,
    required String modelVersionNumber,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteModelVersion'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType.toValue(),
        'modelVersionNumber': modelVersionNumber,
      },
    );
  }

  /// Deletes an outcome.
  ///
  /// You cannot delete an outcome that is used in a rule version.
  ///
  /// When you delete an outcome, Amazon Fraud Detector permanently deletes that
  /// outcome and the data is no longer stored in Amazon Fraud Detector.
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteOutcome'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Deletes the rule. You cannot delete a rule if it is used by an
  /// <code>ACTIVE</code> or <code>INACTIVE</code> detector version.
  ///
  /// When you delete a rule, Amazon Fraud Detector permanently deletes that
  /// rule and the data is no longer stored in Amazon Fraud Detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  Future<void> deleteRule({
    required Rule rule,
  }) async {
    ArgumentError.checkNotNull(rule, 'rule');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'rule': rule,
      },
    );
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
  /// variable and the data is no longer stored in Amazon Fraud Detector.
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteVariable'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
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
    required String detectorId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    int? maxResults,
    String? modelId,
    ModelTypeEnum? modelType,
    String? modelVersionNumber,
    String? nextToken,
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
    _s.validateStringLength(
      'modelVersionNumber',
      modelVersionNumber,
      3,
      7,
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

  /// Gets all batch prediction jobs or a specific job if you specify a job ID.
  /// This is a paginated API. If you provide a null maxResults, this action
  /// retrieves a maximum of 50 records per page. If you provide a maxResults,
  /// the value must be between 1 and 50. To get the next page results, provide
  /// the pagination token from the GetBatchPredictionJobsResponse as part of
  /// your request. A null pagination token fetches the records from the
  /// beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The batch prediction job for which to get the details.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [nextToken] :
  /// The next token from the previous request.
  Future<GetBatchPredictionJobsResult> getBatchPredictionJobs({
    String? jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetBatchPredictionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (jobId != null) 'jobId': jobId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetBatchPredictionJobsResult.fromJson(jsonResponse.body);
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
    required String detectorId,
    required String detectorVersionId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    String? detectorId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    int? maxResults,
    String? name,
    String? nextToken,
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
  /// <important>
  /// <ul>
  /// <li>
  /// You must provide at least one eventVariable
  /// </li>
  /// <li>
  /// If detectorVersion is associated with a modelVersion, you must provide at
  /// least one associated eventVariable
  /// </li>
  /// </ul> </important>
  /// To ensure highest possible fraud prediction and to simplify your data
  /// preparation, Amazon Fraud Detector will replace all missing variables or
  /// values as follows:
  ///
  /// <b>For Amazon Fraud Detector trained models:</b>
  ///
  /// If a null value is provided explicitly for a variable or if a variable is
  /// missing, model will replace the null value or the missing variable (no
  /// variable name in the eventVariables map) with calculated default
  /// mean/medians for numeric variables and with special values for categorical
  /// variables.
  ///
  /// <b>For External models ( for example, imported SageMaker):</b>
  ///
  /// If a null value is provided explicitly for a variable, the model and rules
  /// will use “null” as the value. If a variable is not provided (no variable
  /// name in the eventVariables map), model and rules will use the default
  /// value that is provided for the variable.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  ///
  /// Parameter [externalModelEndpointDataBlobs] :
  /// The Amazon SageMaker model endpoint input data blobs.
  Future<GetEventPredictionResult> getEventPrediction({
    required String detectorId,
    required List<Entity> entities,
    required String eventId,
    required String eventTimestamp,
    required String eventTypeName,
    required Map<String, String> eventVariables,
    String? detectorVersionId,
    Map<String, ModelEndpointDataBlob>? externalModelEndpointDataBlobs,
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
    int? maxResults,
    String? name,
    String? nextToken,
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
    int? maxResults,
    String? modelEndpoint,
    String? nextToken,
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
    int? maxResults,
    String? name,
    String? nextToken,
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
    required String modelId,
    required ModelTypeEnum modelType,
    required String modelVersionNumber,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
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
        'modelType': modelType.toValue(),
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
    int? maxResults,
    String? modelId,
    ModelTypeEnum? modelType,
    String? nextToken,
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
    int? maxResults,
    String? name,
    String? nextToken,
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
    required String detectorId,
    int? maxResults,
    String? nextToken,
    String? ruleId,
    String? ruleVersion,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    _s.validateStringLength(
      'ruleVersion',
      ruleVersion,
      1,
      5,
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
    int? maxResults,
    String? name,
    String? nextToken,
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
    required String resourceARN,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      256,
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
    required String detectorId,
    required String eventTypeName,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    await _protocol.send(
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
    required String name,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
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
    await _protocol.send(
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
    required List<String> entityTypes,
    required List<String> eventVariables,
    required String name,
    String? description,
    List<String>? labels,
    List<Tag>? tags,
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
    await _protocol.send(
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
    required ModelInputConfiguration inputConfiguration,
    required String invokeModelEndpointRoleArn,
    required String modelEndpoint,
    required ModelEndpointStatus modelEndpointStatus,
    required ModelSource modelSource,
    required ModelOutputConfiguration outputConfiguration,
    List<Tag>? tags,
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
    ArgumentError.checkNotNull(modelEndpointStatus, 'modelEndpointStatus');
    ArgumentError.checkNotNull(modelSource, 'modelSource');
    ArgumentError.checkNotNull(outputConfiguration, 'outputConfiguration');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutExternalModel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'inputConfiguration': inputConfiguration,
        'invokeModelEndpointRoleArn': invokeModelEndpointRoleArn,
        'modelEndpoint': modelEndpoint,
        'modelEndpointStatus': modelEndpointStatus.toValue(),
        'modelSource': modelSource.toValue(),
        'outputConfiguration': outputConfiguration,
        if (tags != null) 'tags': tags,
      },
    );
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
    required String kmsEncryptionKeyArn,
  }) async {
    ArgumentError.checkNotNull(kmsEncryptionKeyArn, 'kmsEncryptionKeyArn');
    _s.validateStringLength(
      'kmsEncryptionKeyArn',
      kmsEncryptionKeyArn,
      7,
      90,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutKMSEncryptionKey'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'kmsEncryptionKeyArn': kmsEncryptionKeyArn,
      },
    );
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
    required String name,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
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
    await _protocol.send(
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
    required String name,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
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
    await _protocol.send(
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
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.TagResource'
    };
    await _protocol.send(
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
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UntagResource'
    };
    await _protocol.send(
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
    required String detectorId,
    required String detectorVersionId,
    required List<String> externalModelEndpoints,
    required List<Rule> rules,
    String? description,
    List<ModelVersion>? modelVersions,
    RuleExecutionMode? ruleExecutionMode,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    await _protocol.send(
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
    required String description,
    required String detectorId,
    required String detectorVersionId,
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
    ArgumentError.checkNotNull(detectorVersionId, 'detectorVersionId');
    _s.validateStringLength(
      'detectorVersionId',
      detectorVersionId,
      1,
      5,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateDetectorVersionMetadata'
    };
    await _protocol.send(
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
    required String detectorId,
    required String detectorVersionId,
    required DetectorVersionStatus status,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      64,
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
    ArgumentError.checkNotNull(status, 'status');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateDetectorVersionStatus'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'detectorId': detectorId,
        'detectorVersionId': detectorVersionId,
        'status': status.toValue(),
      },
    );
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
    required String modelId,
    required ModelTypeEnum modelType,
    String? description,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
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
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType.toValue(),
        if (description != null) 'description': description,
      },
    );
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
    required String majorVersionNumber,
    required String modelId,
    required ModelTypeEnum modelType,
    ExternalEventsDetail? externalEventsDetail,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(majorVersionNumber, 'majorVersionNumber');
    _s.validateStringLength(
      'majorVersionNumber',
      majorVersionNumber,
      1,
      5,
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
        'modelType': modelType.toValue(),
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
    required String modelId,
    required ModelTypeEnum modelType,
    required String modelVersionNumber,
    required ModelVersionStatus status,
  }) async {
    ArgumentError.checkNotNull(modelId, 'modelId');
    _s.validateStringLength(
      'modelId',
      modelId,
      1,
      64,
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
    ArgumentError.checkNotNull(status, 'status');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateModelVersionStatus'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelId': modelId,
        'modelType': modelType.toValue(),
        'modelVersionNumber': modelVersionNumber,
        'status': status.toValue(),
      },
    );
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
    required String description,
    required Rule rule,
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
    await _protocol.send(
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
    required String expression,
    required Language language,
    required List<String> outcomes,
    required Rule rule,
    String? description,
    List<Tag>? tags,
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
        'language': language.toValue(),
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
    required String name,
    String? defaultValue,
    String? description,
    String? variableType,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateVariable'
    };
    await _protocol.send(
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
  }
}

enum AsyncJobStatus {
  inProgressInitializing,
  inProgress,
  cancelInProgress,
  canceled,
  complete,
  failed,
}

extension on AsyncJobStatus {
  String toValue() {
    switch (this) {
      case AsyncJobStatus.inProgressInitializing:
        return 'IN_PROGRESS_INITIALIZING';
      case AsyncJobStatus.inProgress:
        return 'IN_PROGRESS';
      case AsyncJobStatus.cancelInProgress:
        return 'CANCEL_IN_PROGRESS';
      case AsyncJobStatus.canceled:
        return 'CANCELED';
      case AsyncJobStatus.complete:
        return 'COMPLETE';
      case AsyncJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  AsyncJobStatus toAsyncJobStatus() {
    switch (this) {
      case 'IN_PROGRESS_INITIALIZING':
        return AsyncJobStatus.inProgressInitializing;
      case 'IN_PROGRESS':
        return AsyncJobStatus.inProgress;
      case 'CANCEL_IN_PROGRESS':
        return AsyncJobStatus.cancelInProgress;
      case 'CANCELED':
        return AsyncJobStatus.canceled;
      case 'COMPLETE':
        return AsyncJobStatus.complete;
      case 'FAILED':
        return AsyncJobStatus.failed;
    }
    throw Exception('$this is not known in enum AsyncJobStatus');
  }
}

/// Provides the error of the batch create variable API.
class BatchCreateVariableError {
  /// The error code.
  final int? code;

  /// The error message.
  final String? message;

  /// The name.
  final String? name;

  BatchCreateVariableError({
    this.code,
    this.message,
    this.name,
  });

  factory BatchCreateVariableError.fromJson(Map<String, dynamic> json) {
    return BatchCreateVariableError(
      code: json['code'] as int?,
      message: json['message'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final name = this.name;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (name != null) 'name': name,
    };
  }
}

class BatchCreateVariableResult {
  /// Provides the errors for the <code>BatchCreateVariable</code> request.
  final List<BatchCreateVariableError>? errors;

  BatchCreateVariableResult({
    this.errors,
  });

  factory BatchCreateVariableResult.fromJson(Map<String, dynamic> json) {
    return BatchCreateVariableResult(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchCreateVariableError.fromJson(e as Map<String, dynamic>))
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

/// Provides the error of the batch get variable API.
class BatchGetVariableError {
  /// The error code.
  final int? code;

  /// The error message.
  final String? message;

  /// The error name.
  final String? name;

  BatchGetVariableError({
    this.code,
    this.message,
    this.name,
  });

  factory BatchGetVariableError.fromJson(Map<String, dynamic> json) {
    return BatchGetVariableError(
      code: json['code'] as int?,
      message: json['message'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final name = this.name;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (name != null) 'name': name,
    };
  }
}

class BatchGetVariableResult {
  /// The errors from the request.
  final List<BatchGetVariableError>? errors;

  /// The returned variables.
  final List<Variable>? variables;

  BatchGetVariableResult({
    this.errors,
    this.variables,
  });

  factory BatchGetVariableResult.fromJson(Map<String, dynamic> json) {
    return BatchGetVariableResult(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchGetVariableError.fromJson(e as Map<String, dynamic>))
          .toList(),
      variables: (json['variables'] as List?)
          ?.whereNotNull()
          .map((e) => Variable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final variables = this.variables;
    return {
      if (errors != null) 'errors': errors,
      if (variables != null) 'variables': variables,
    };
  }
}

/// The batch prediction details.
class BatchPrediction {
  /// The ARN of batch prediction job.
  final String? arn;

  /// Timestamp of when the batch prediction job comleted.
  final String? completionTime;

  /// The name of the detector.
  final String? detectorName;

  /// The detector version.
  final String? detectorVersion;

  /// The name of the event type.
  final String? eventTypeName;

  /// The reason a batch prediction job failed.
  final String? failureReason;

  /// The ARN of the IAM role to use for this job request.
  final String? iamRoleArn;

  /// The Amazon S3 location of your training file.
  final String? inputPath;

  /// The job ID for the batch prediction.
  final String? jobId;

  /// Timestamp of most recent heartbeat indicating the batch prediction job was
  /// making progress.
  final String? lastHeartbeatTime;

  /// The Amazon S3 location of your output file.
  final String? outputPath;

  /// The number of records processed by the batch prediction job.
  final int? processedRecordsCount;

  /// Timestamp of when the batch prediction job started.
  final String? startTime;

  /// The batch prediction status.
  final AsyncJobStatus? status;

  /// The total number of records in the batch prediction job.
  final int? totalRecordsCount;

  BatchPrediction({
    this.arn,
    this.completionTime,
    this.detectorName,
    this.detectorVersion,
    this.eventTypeName,
    this.failureReason,
    this.iamRoleArn,
    this.inputPath,
    this.jobId,
    this.lastHeartbeatTime,
    this.outputPath,
    this.processedRecordsCount,
    this.startTime,
    this.status,
    this.totalRecordsCount,
  });

  factory BatchPrediction.fromJson(Map<String, dynamic> json) {
    return BatchPrediction(
      arn: json['arn'] as String?,
      completionTime: json['completionTime'] as String?,
      detectorName: json['detectorName'] as String?,
      detectorVersion: json['detectorVersion'] as String?,
      eventTypeName: json['eventTypeName'] as String?,
      failureReason: json['failureReason'] as String?,
      iamRoleArn: json['iamRoleArn'] as String?,
      inputPath: json['inputPath'] as String?,
      jobId: json['jobId'] as String?,
      lastHeartbeatTime: json['lastHeartbeatTime'] as String?,
      outputPath: json['outputPath'] as String?,
      processedRecordsCount: json['processedRecordsCount'] as int?,
      startTime: json['startTime'] as String?,
      status: (json['status'] as String?)?.toAsyncJobStatus(),
      totalRecordsCount: json['totalRecordsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final completionTime = this.completionTime;
    final detectorName = this.detectorName;
    final detectorVersion = this.detectorVersion;
    final eventTypeName = this.eventTypeName;
    final failureReason = this.failureReason;
    final iamRoleArn = this.iamRoleArn;
    final inputPath = this.inputPath;
    final jobId = this.jobId;
    final lastHeartbeatTime = this.lastHeartbeatTime;
    final outputPath = this.outputPath;
    final processedRecordsCount = this.processedRecordsCount;
    final startTime = this.startTime;
    final status = this.status;
    final totalRecordsCount = this.totalRecordsCount;
    return {
      if (arn != null) 'arn': arn,
      if (completionTime != null) 'completionTime': completionTime,
      if (detectorName != null) 'detectorName': detectorName,
      if (detectorVersion != null) 'detectorVersion': detectorVersion,
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (failureReason != null) 'failureReason': failureReason,
      if (iamRoleArn != null) 'iamRoleArn': iamRoleArn,
      if (inputPath != null) 'inputPath': inputPath,
      if (jobId != null) 'jobId': jobId,
      if (lastHeartbeatTime != null) 'lastHeartbeatTime': lastHeartbeatTime,
      if (outputPath != null) 'outputPath': outputPath,
      if (processedRecordsCount != null)
        'processedRecordsCount': processedRecordsCount,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
      if (totalRecordsCount != null) 'totalRecordsCount': totalRecordsCount,
    };
  }
}

class CancelBatchPredictionJobResult {
  CancelBatchPredictionJobResult();

  factory CancelBatchPredictionJobResult.fromJson(Map<String, dynamic> _) {
    return CancelBatchPredictionJobResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateBatchPredictionJobResult {
  CreateBatchPredictionJobResult();

  factory CreateBatchPredictionJobResult.fromJson(Map<String, dynamic> _) {
    return CreateBatchPredictionJobResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateDetectorVersionResult {
  /// The ID for the created version's parent detector.
  final String? detectorId;

  /// The ID for the created detector.
  final String? detectorVersionId;

  /// The status of the detector version.
  final DetectorVersionStatus? status;

  CreateDetectorVersionResult({
    this.detectorId,
    this.detectorVersionId,
    this.status,
  });

  factory CreateDetectorVersionResult.fromJson(Map<String, dynamic> json) {
    return CreateDetectorVersionResult(
      detectorId: json['detectorId'] as String?,
      detectorVersionId: json['detectorVersionId'] as String?,
      status: (json['status'] as String?)?.toDetectorVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final detectorId = this.detectorId;
    final detectorVersionId = this.detectorVersionId;
    final status = this.status;
    return {
      if (detectorId != null) 'detectorId': detectorId,
      if (detectorVersionId != null) 'detectorVersionId': detectorVersionId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateModelResult {
  CreateModelResult();

  factory CreateModelResult.fromJson(Map<String, dynamic> _) {
    return CreateModelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateModelVersionResult {
  /// The model ID.
  final String? modelId;

  /// The model type.
  final ModelTypeEnum? modelType;

  /// The model version number of the model version created.
  final String? modelVersionNumber;

  /// The model version status.
  final String? status;

  CreateModelVersionResult({
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.status,
  });

  factory CreateModelVersionResult.fromJson(Map<String, dynamic> json) {
    return CreateModelVersionResult(
      modelId: json['modelId'] as String?,
      modelType: (json['modelType'] as String?)?.toModelTypeEnum(),
      modelVersionNumber: json['modelVersionNumber'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final modelType = this.modelType;
    final modelVersionNumber = this.modelVersionNumber;
    final status = this.status;
    return {
      if (modelId != null) 'modelId': modelId,
      if (modelType != null) 'modelType': modelType.toValue(),
      if (modelVersionNumber != null) 'modelVersionNumber': modelVersionNumber,
      if (status != null) 'status': status,
    };
  }
}

class CreateRuleResult {
  /// The created rule.
  final Rule? rule;

  CreateRuleResult({
    this.rule,
  });

  factory CreateRuleResult.fromJson(Map<String, dynamic> json) {
    return CreateRuleResult(
      rule: json['rule'] != null
          ? Rule.fromJson(json['rule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    return {
      if (rule != null) 'rule': rule,
    };
  }
}

class CreateVariableResult {
  CreateVariableResult();

  factory CreateVariableResult.fromJson(Map<String, dynamic> _) {
    return CreateVariableResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DataSource {
  event,
  modelScore,
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
  }
}

extension on String {
  DataSource toDataSource() {
    switch (this) {
      case 'EVENT':
        return DataSource.event;
      case 'MODEL_SCORE':
        return DataSource.modelScore;
      case 'EXTERNAL_MODEL_SCORE':
        return DataSource.externalModelScore;
    }
    throw Exception('$this is not known in enum DataSource');
  }
}

enum DataType {
  string,
  integer,
  float,
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
  }
}

extension on String {
  DataType toDataType() {
    switch (this) {
      case 'STRING':
        return DataType.string;
      case 'INTEGER':
        return DataType.integer;
      case 'FLOAT':
        return DataType.float;
      case 'BOOLEAN':
        return DataType.boolean;
    }
    throw Exception('$this is not known in enum DataType');
  }
}

/// The model training validation messages.
class DataValidationMetrics {
  /// The field-specific model training validation messages.
  final List<FieldValidationMessage>? fieldLevelMessages;

  /// The file-specific model training validation messages.
  final List<FileValidationMessage>? fileLevelMessages;

  DataValidationMetrics({
    this.fieldLevelMessages,
    this.fileLevelMessages,
  });

  factory DataValidationMetrics.fromJson(Map<String, dynamic> json) {
    return DataValidationMetrics(
      fieldLevelMessages: (json['fieldLevelMessages'] as List?)
          ?.whereNotNull()
          .map(
              (e) => FieldValidationMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileLevelMessages: (json['fileLevelMessages'] as List?)
          ?.whereNotNull()
          .map((e) => FileValidationMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldLevelMessages = this.fieldLevelMessages;
    final fileLevelMessages = this.fileLevelMessages;
    return {
      if (fieldLevelMessages != null) 'fieldLevelMessages': fieldLevelMessages,
      if (fileLevelMessages != null) 'fileLevelMessages': fileLevelMessages,
    };
  }
}

class DeleteBatchPredictionJobResult {
  DeleteBatchPredictionJobResult();

  factory DeleteBatchPredictionJobResult.fromJson(Map<String, dynamic> _) {
    return DeleteBatchPredictionJobResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDetectorResult {
  DeleteDetectorResult();

  factory DeleteDetectorResult.fromJson(Map<String, dynamic> _) {
    return DeleteDetectorResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDetectorVersionResult {
  DeleteDetectorVersionResult();

  factory DeleteDetectorVersionResult.fromJson(Map<String, dynamic> _) {
    return DeleteDetectorVersionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEntityTypeResult {
  DeleteEntityTypeResult();

  factory DeleteEntityTypeResult.fromJson(Map<String, dynamic> _) {
    return DeleteEntityTypeResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEventResult {
  DeleteEventResult();

  factory DeleteEventResult.fromJson(Map<String, dynamic> _) {
    return DeleteEventResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEventTypeResult {
  DeleteEventTypeResult();

  factory DeleteEventTypeResult.fromJson(Map<String, dynamic> _) {
    return DeleteEventTypeResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteExternalModelResult {
  DeleteExternalModelResult();

  factory DeleteExternalModelResult.fromJson(Map<String, dynamic> _) {
    return DeleteExternalModelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLabelResult {
  DeleteLabelResult();

  factory DeleteLabelResult.fromJson(Map<String, dynamic> _) {
    return DeleteLabelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteModelResult {
  DeleteModelResult();

  factory DeleteModelResult.fromJson(Map<String, dynamic> _) {
    return DeleteModelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteModelVersionResult {
  DeleteModelVersionResult();

  factory DeleteModelVersionResult.fromJson(Map<String, dynamic> _) {
    return DeleteModelVersionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteOutcomeResult {
  DeleteOutcomeResult();

  factory DeleteOutcomeResult.fromJson(Map<String, dynamic> _) {
    return DeleteOutcomeResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRuleResult {
  DeleteRuleResult();

  factory DeleteRuleResult.fromJson(Map<String, dynamic> _) {
    return DeleteRuleResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteVariableResult {
  DeleteVariableResult();

  factory DeleteVariableResult.fromJson(Map<String, dynamic> _) {
    return DeleteVariableResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeDetectorResult {
  /// The detector ARN.
  final String? arn;

  /// The detector ID.
  final String? detectorId;

  /// The status and description for each detector version.
  final List<DetectorVersionSummary>? detectorVersionSummaries;

  /// The next token to be used for subsequent requests.
  final String? nextToken;

  DescribeDetectorResult({
    this.arn,
    this.detectorId,
    this.detectorVersionSummaries,
    this.nextToken,
  });

  factory DescribeDetectorResult.fromJson(Map<String, dynamic> json) {
    return DescribeDetectorResult(
      arn: json['arn'] as String?,
      detectorId: json['detectorId'] as String?,
      detectorVersionSummaries: (json['detectorVersionSummaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DetectorVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final detectorId = this.detectorId;
    final detectorVersionSummaries = this.detectorVersionSummaries;
    final nextToken = this.nextToken;
    return {
      if (arn != null) 'arn': arn,
      if (detectorId != null) 'detectorId': detectorId,
      if (detectorVersionSummaries != null)
        'detectorVersionSummaries': detectorVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeModelVersionsResult {
  /// The model version details.
  final List<ModelVersionDetail>? modelVersionDetails;

  /// The next token.
  final String? nextToken;

  DescribeModelVersionsResult({
    this.modelVersionDetails,
    this.nextToken,
  });

  factory DescribeModelVersionsResult.fromJson(Map<String, dynamic> json) {
    return DescribeModelVersionsResult(
      modelVersionDetails: (json['modelVersionDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ModelVersionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelVersionDetails = this.modelVersionDetails;
    final nextToken = this.nextToken;
    return {
      if (modelVersionDetails != null)
        'modelVersionDetails': modelVersionDetails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The detector.
class Detector {
  /// The detector ARN.
  final String? arn;

  /// Timestamp of when the detector was created.
  final String? createdTime;

  /// The detector description.
  final String? description;

  /// The detector ID.
  final String? detectorId;

  /// The name of the event type.
  final String? eventTypeName;

  /// Timestamp of when the detector was last updated.
  final String? lastUpdatedTime;

  Detector({
    this.arn,
    this.createdTime,
    this.description,
    this.detectorId,
    this.eventTypeName,
    this.lastUpdatedTime,
  });

  factory Detector.fromJson(Map<String, dynamic> json) {
    return Detector(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      detectorId: json['detectorId'] as String?,
      eventTypeName: json['eventTypeName'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final detectorId = this.detectorId;
    final eventTypeName = this.eventTypeName;
    final lastUpdatedTime = this.lastUpdatedTime;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (detectorId != null) 'detectorId': detectorId,
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
    };
  }
}

enum DetectorVersionStatus {
  draft,
  active,
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
  }
}

extension on String {
  DetectorVersionStatus toDetectorVersionStatus() {
    switch (this) {
      case 'DRAFT':
        return DetectorVersionStatus.draft;
      case 'ACTIVE':
        return DetectorVersionStatus.active;
      case 'INACTIVE':
        return DetectorVersionStatus.inactive;
    }
    throw Exception('$this is not known in enum DetectorVersionStatus');
  }
}

/// The summary of the detector version.
class DetectorVersionSummary {
  /// The detector version description.
  final String? description;

  /// The detector version ID.
  final String? detectorVersionId;

  /// Timestamp of when the detector version was last updated.
  final String? lastUpdatedTime;

  /// The detector version status.
  final DetectorVersionStatus? status;

  DetectorVersionSummary({
    this.description,
    this.detectorVersionId,
    this.lastUpdatedTime,
    this.status,
  });

  factory DetectorVersionSummary.fromJson(Map<String, dynamic> json) {
    return DetectorVersionSummary(
      description: json['description'] as String?,
      detectorVersionId: json['detectorVersionId'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      status: (json['status'] as String?)?.toDetectorVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final detectorVersionId = this.detectorVersionId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final status = this.status;
    return {
      if (description != null) 'description': description,
      if (detectorVersionId != null) 'detectorVersionId': detectorVersionId,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The entity details.
class Entity {
  /// The entity ID. If you do not know the <code>entityId</code>, you can pass
  /// <code>unknown</code>, which is areserved string literal.
  final String entityId;

  /// The entity type.
  final String entityType;

  Entity({
    required this.entityId,
    required this.entityType,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      entityId: json['entityId'] as String,
      entityType: json['entityType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final entityType = this.entityType;
    return {
      'entityId': entityId,
      'entityType': entityType,
    };
  }
}

/// The entity type details.
class EntityType {
  /// The entity type ARN.
  final String? arn;

  /// Timestamp of when the entity type was created.
  final String? createdTime;

  /// The entity type description.
  final String? description;

  /// Timestamp of when the entity type was last updated.
  final String? lastUpdatedTime;

  /// The entity type name.
  final String? name;

  EntityType({
    this.arn,
    this.createdTime,
    this.description,
    this.lastUpdatedTime,
    this.name,
  });

  factory EntityType.fromJson(Map<String, dynamic> json) {
    return EntityType(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (name != null) 'name': name,
    };
  }
}

/// The event type details.
class EventType {
  /// The entity type ARN.
  final String? arn;

  /// Timestamp of when the event type was created.
  final String? createdTime;

  /// The event type description.
  final String? description;

  /// The event type entity types.
  final List<String>? entityTypes;

  /// The event type event variables.
  final List<String>? eventVariables;

  /// The event type labels.
  final List<String>? labels;

  /// Timestamp of when the event type was last updated.
  final String? lastUpdatedTime;

  /// The event type name.
  final String? name;

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

  factory EventType.fromJson(Map<String, dynamic> json) {
    return EventType(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      entityTypes: (json['entityTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      eventVariables: (json['eventVariables'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      labels: (json['labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final entityTypes = this.entityTypes;
    final eventVariables = this.eventVariables;
    final labels = this.labels;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (entityTypes != null) 'entityTypes': entityTypes,
      if (eventVariables != null) 'eventVariables': eventVariables,
      if (labels != null) 'labels': labels,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (name != null) 'name': name,
    };
  }
}

/// Details for the external events data used for model version training.
class ExternalEventsDetail {
  /// The ARN of the role that provides Amazon Fraud Detector access to the data
  /// location.
  final String dataAccessRoleArn;

  /// The Amazon S3 bucket location for the data.
  final String dataLocation;

  ExternalEventsDetail({
    required this.dataAccessRoleArn,
    required this.dataLocation,
  });

  factory ExternalEventsDetail.fromJson(Map<String, dynamic> json) {
    return ExternalEventsDetail(
      dataAccessRoleArn: json['dataAccessRoleArn'] as String,
      dataLocation: json['dataLocation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final dataLocation = this.dataLocation;
    return {
      'dataAccessRoleArn': dataAccessRoleArn,
      'dataLocation': dataLocation,
    };
  }
}

/// The Amazon SageMaker model.
class ExternalModel {
  /// The model ARN.
  final String? arn;

  /// Timestamp of when the model was last created.
  final String? createdTime;

  /// The input configuration.
  final ModelInputConfiguration? inputConfiguration;

  /// The role used to invoke the model.
  final String? invokeModelEndpointRoleArn;

  /// Timestamp of when the model was last updated.
  final String? lastUpdatedTime;

  /// The Amazon SageMaker model endpoints.
  final String? modelEndpoint;

  /// The Amazon Fraud Detector status for the external model endpoint
  final ModelEndpointStatus? modelEndpointStatus;

  /// The source of the model.
  final ModelSource? modelSource;

  /// The output configuration.
  final ModelOutputConfiguration? outputConfiguration;

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

  factory ExternalModel.fromJson(Map<String, dynamic> json) {
    return ExternalModel(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      inputConfiguration: json['inputConfiguration'] != null
          ? ModelInputConfiguration.fromJson(
              json['inputConfiguration'] as Map<String, dynamic>)
          : null,
      invokeModelEndpointRoleArn: json['invokeModelEndpointRoleArn'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      modelEndpoint: json['modelEndpoint'] as String?,
      modelEndpointStatus:
          (json['modelEndpointStatus'] as String?)?.toModelEndpointStatus(),
      modelSource: (json['modelSource'] as String?)?.toModelSource(),
      outputConfiguration: json['outputConfiguration'] != null
          ? ModelOutputConfiguration.fromJson(
              json['outputConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final inputConfiguration = this.inputConfiguration;
    final invokeModelEndpointRoleArn = this.invokeModelEndpointRoleArn;
    final lastUpdatedTime = this.lastUpdatedTime;
    final modelEndpoint = this.modelEndpoint;
    final modelEndpointStatus = this.modelEndpointStatus;
    final modelSource = this.modelSource;
    final outputConfiguration = this.outputConfiguration;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (inputConfiguration != null) 'inputConfiguration': inputConfiguration,
      if (invokeModelEndpointRoleArn != null)
        'invokeModelEndpointRoleArn': invokeModelEndpointRoleArn,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (modelEndpoint != null) 'modelEndpoint': modelEndpoint,
      if (modelEndpointStatus != null)
        'modelEndpointStatus': modelEndpointStatus.toValue(),
      if (modelSource != null) 'modelSource': modelSource.toValue(),
      if (outputConfiguration != null)
        'outputConfiguration': outputConfiguration,
    };
  }
}

/// The message details.
class FieldValidationMessage {
  /// The message content.
  final String? content;

  /// The field name.
  final String? fieldName;

  /// The message ID.
  final String? identifier;

  /// The message title.
  final String? title;

  /// The message type.
  final String? type;

  FieldValidationMessage({
    this.content,
    this.fieldName,
    this.identifier,
    this.title,
    this.type,
  });

  factory FieldValidationMessage.fromJson(Map<String, dynamic> json) {
    return FieldValidationMessage(
      content: json['content'] as String?,
      fieldName: json['fieldName'] as String?,
      identifier: json['identifier'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final fieldName = this.fieldName;
    final identifier = this.identifier;
    final title = this.title;
    final type = this.type;
    return {
      if (content != null) 'content': content,
      if (fieldName != null) 'fieldName': fieldName,
      if (identifier != null) 'identifier': identifier,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
    };
  }
}

/// The message details.
class FileValidationMessage {
  /// The message content.
  final String? content;

  /// The message title.
  final String? title;

  /// The message type.
  final String? type;

  FileValidationMessage({
    this.content,
    this.title,
    this.type,
  });

  factory FileValidationMessage.fromJson(Map<String, dynamic> json) {
    return FileValidationMessage(
      content: json['content'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final title = this.title;
    final type = this.type;
    return {
      if (content != null) 'content': content,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
    };
  }
}

class GetBatchPredictionJobsResult {
  /// An array containing the details of each batch prediction job.
  final List<BatchPrediction>? batchPredictions;

  /// The next token for the subsequent request.
  final String? nextToken;

  GetBatchPredictionJobsResult({
    this.batchPredictions,
    this.nextToken,
  });

  factory GetBatchPredictionJobsResult.fromJson(Map<String, dynamic> json) {
    return GetBatchPredictionJobsResult(
      batchPredictions: (json['batchPredictions'] as List?)
          ?.whereNotNull()
          .map((e) => BatchPrediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchPredictions = this.batchPredictions;
    final nextToken = this.nextToken;
    return {
      if (batchPredictions != null) 'batchPredictions': batchPredictions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetDetectorVersionResult {
  /// The detector version ARN.
  final String? arn;

  /// The timestamp when the detector version was created.
  final String? createdTime;

  /// The detector version description.
  final String? description;

  /// The detector ID.
  final String? detectorId;

  /// The detector version ID.
  final String? detectorVersionId;

  /// The Amazon SageMaker model endpoints included in the detector version.
  final List<String>? externalModelEndpoints;

  /// The timestamp when the detector version was last updated.
  final String? lastUpdatedTime;

  /// The model versions included in the detector version.
  final List<ModelVersion>? modelVersions;

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
  final RuleExecutionMode? ruleExecutionMode;

  /// The rules included in the detector version.
  final List<Rule>? rules;

  /// The status of the detector version.
  final DetectorVersionStatus? status;

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

  factory GetDetectorVersionResult.fromJson(Map<String, dynamic> json) {
    return GetDetectorVersionResult(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      detectorId: json['detectorId'] as String?,
      detectorVersionId: json['detectorVersionId'] as String?,
      externalModelEndpoints: (json['externalModelEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      modelVersions: (json['modelVersions'] as List?)
          ?.whereNotNull()
          .map((e) => ModelVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleExecutionMode:
          (json['ruleExecutionMode'] as String?)?.toRuleExecutionMode(),
      rules: (json['rules'] as List?)
          ?.whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toDetectorVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final detectorId = this.detectorId;
    final detectorVersionId = this.detectorVersionId;
    final externalModelEndpoints = this.externalModelEndpoints;
    final lastUpdatedTime = this.lastUpdatedTime;
    final modelVersions = this.modelVersions;
    final ruleExecutionMode = this.ruleExecutionMode;
    final rules = this.rules;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (detectorId != null) 'detectorId': detectorId,
      if (detectorVersionId != null) 'detectorVersionId': detectorVersionId,
      if (externalModelEndpoints != null)
        'externalModelEndpoints': externalModelEndpoints,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (modelVersions != null) 'modelVersions': modelVersions,
      if (ruleExecutionMode != null)
        'ruleExecutionMode': ruleExecutionMode.toValue(),
      if (rules != null) 'rules': rules,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetDetectorsResult {
  /// The detectors.
  final List<Detector>? detectors;

  /// The next page token.
  final String? nextToken;

  GetDetectorsResult({
    this.detectors,
    this.nextToken,
  });

  factory GetDetectorsResult.fromJson(Map<String, dynamic> json) {
    return GetDetectorsResult(
      detectors: (json['detectors'] as List?)
          ?.whereNotNull()
          .map((e) => Detector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detectors = this.detectors;
    final nextToken = this.nextToken;
    return {
      if (detectors != null) 'detectors': detectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetEntityTypesResult {
  /// An array of entity types.
  final List<EntityType>? entityTypes;

  /// The next page token.
  final String? nextToken;

  GetEntityTypesResult({
    this.entityTypes,
    this.nextToken,
  });

  factory GetEntityTypesResult.fromJson(Map<String, dynamic> json) {
    return GetEntityTypesResult(
      entityTypes: (json['entityTypes'] as List?)
          ?.whereNotNull()
          .map((e) => EntityType.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityTypes = this.entityTypes;
    final nextToken = this.nextToken;
    return {
      if (entityTypes != null) 'entityTypes': entityTypes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetEventPredictionResult {
  /// The model scores. Amazon Fraud Detector generates model scores between 0 and
  /// 1000, where 0 is low fraud risk and 1000 is high fraud risk. Model scores
  /// are directly related to the false positive rate (FPR). For example, a score
  /// of 600 corresponds to an estimated 10% false positive rate whereas a score
  /// of 900 corresponds to an estimated 2% false positive rate.
  final List<ModelScores>? modelScores;

  /// The results.
  final List<RuleResult>? ruleResults;

  GetEventPredictionResult({
    this.modelScores,
    this.ruleResults,
  });

  factory GetEventPredictionResult.fromJson(Map<String, dynamic> json) {
    return GetEventPredictionResult(
      modelScores: (json['modelScores'] as List?)
          ?.whereNotNull()
          .map((e) => ModelScores.fromJson(e as Map<String, dynamic>))
          .toList(),
      ruleResults: (json['ruleResults'] as List?)
          ?.whereNotNull()
          .map((e) => RuleResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelScores = this.modelScores;
    final ruleResults = this.ruleResults;
    return {
      if (modelScores != null) 'modelScores': modelScores,
      if (ruleResults != null) 'ruleResults': ruleResults,
    };
  }
}

class GetEventTypesResult {
  /// An array of event types.
  final List<EventType>? eventTypes;

  /// The next page token.
  final String? nextToken;

  GetEventTypesResult({
    this.eventTypes,
    this.nextToken,
  });

  factory GetEventTypesResult.fromJson(Map<String, dynamic> json) {
    return GetEventTypesResult(
      eventTypes: (json['eventTypes'] as List?)
          ?.whereNotNull()
          .map((e) => EventType.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTypes = this.eventTypes;
    final nextToken = this.nextToken;
    return {
      if (eventTypes != null) 'eventTypes': eventTypes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetExternalModelsResult {
  /// Gets the Amazon SageMaker models.
  final List<ExternalModel>? externalModels;

  /// The next page token to be used in subsequent requests.
  final String? nextToken;

  GetExternalModelsResult({
    this.externalModels,
    this.nextToken,
  });

  factory GetExternalModelsResult.fromJson(Map<String, dynamic> json) {
    return GetExternalModelsResult(
      externalModels: (json['externalModels'] as List?)
          ?.whereNotNull()
          .map((e) => ExternalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final externalModels = this.externalModels;
    final nextToken = this.nextToken;
    return {
      if (externalModels != null) 'externalModels': externalModels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetKMSEncryptionKeyResult {
  /// The KMS encryption key.
  final KMSKey? kmsKey;

  GetKMSEncryptionKeyResult({
    this.kmsKey,
  });

  factory GetKMSEncryptionKeyResult.fromJson(Map<String, dynamic> json) {
    return GetKMSEncryptionKeyResult(
      kmsKey: json['kmsKey'] != null
          ? KMSKey.fromJson(json['kmsKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKey = this.kmsKey;
    return {
      if (kmsKey != null) 'kmsKey': kmsKey,
    };
  }
}

class GetLabelsResult {
  /// An array of labels.
  final List<Label>? labels;

  /// The next page token.
  final String? nextToken;

  GetLabelsResult({
    this.labels,
    this.nextToken,
  });

  factory GetLabelsResult.fromJson(Map<String, dynamic> json) {
    return GetLabelsResult(
      labels: (json['labels'] as List?)
          ?.whereNotNull()
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final labels = this.labels;
    final nextToken = this.nextToken;
    return {
      if (labels != null) 'labels': labels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetModelVersionResult {
  /// The model version ARN.
  final String? arn;

  /// The event details.
  final ExternalEventsDetail? externalEventsDetail;

  /// The model ID.
  final String? modelId;

  /// The model type.
  final ModelTypeEnum? modelType;

  /// The model version number.
  final String? modelVersionNumber;

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
  final String? status;

  /// The training data schema.
  final TrainingDataSchema? trainingDataSchema;

  /// The training data source.
  final TrainingDataSourceEnum? trainingDataSource;

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

  factory GetModelVersionResult.fromJson(Map<String, dynamic> json) {
    return GetModelVersionResult(
      arn: json['arn'] as String?,
      externalEventsDetail: json['externalEventsDetail'] != null
          ? ExternalEventsDetail.fromJson(
              json['externalEventsDetail'] as Map<String, dynamic>)
          : null,
      modelId: json['modelId'] as String?,
      modelType: (json['modelType'] as String?)?.toModelTypeEnum(),
      modelVersionNumber: json['modelVersionNumber'] as String?,
      status: json['status'] as String?,
      trainingDataSchema: json['trainingDataSchema'] != null
          ? TrainingDataSchema.fromJson(
              json['trainingDataSchema'] as Map<String, dynamic>)
          : null,
      trainingDataSource:
          (json['trainingDataSource'] as String?)?.toTrainingDataSourceEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final externalEventsDetail = this.externalEventsDetail;
    final modelId = this.modelId;
    final modelType = this.modelType;
    final modelVersionNumber = this.modelVersionNumber;
    final status = this.status;
    final trainingDataSchema = this.trainingDataSchema;
    final trainingDataSource = this.trainingDataSource;
    return {
      if (arn != null) 'arn': arn,
      if (externalEventsDetail != null)
        'externalEventsDetail': externalEventsDetail,
      if (modelId != null) 'modelId': modelId,
      if (modelType != null) 'modelType': modelType.toValue(),
      if (modelVersionNumber != null) 'modelVersionNumber': modelVersionNumber,
      if (status != null) 'status': status,
      if (trainingDataSchema != null) 'trainingDataSchema': trainingDataSchema,
      if (trainingDataSource != null)
        'trainingDataSource': trainingDataSource.toValue(),
    };
  }
}

class GetModelsResult {
  /// The array of models.
  final List<Model>? models;

  /// The next page token to be used in subsequent requests.
  final String? nextToken;

  GetModelsResult({
    this.models,
    this.nextToken,
  });

  factory GetModelsResult.fromJson(Map<String, dynamic> json) {
    return GetModelsResult(
      models: (json['models'] as List?)
          ?.whereNotNull()
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final models = this.models;
    final nextToken = this.nextToken;
    return {
      if (models != null) 'models': models,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetOutcomesResult {
  /// The next page token for subsequent requests.
  final String? nextToken;

  /// The outcomes.
  final List<Outcome>? outcomes;

  GetOutcomesResult({
    this.nextToken,
    this.outcomes,
  });

  factory GetOutcomesResult.fromJson(Map<String, dynamic> json) {
    return GetOutcomesResult(
      nextToken: json['nextToken'] as String?,
      outcomes: (json['outcomes'] as List?)
          ?.whereNotNull()
          .map((e) => Outcome.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final outcomes = this.outcomes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (outcomes != null) 'outcomes': outcomes,
    };
  }
}

class GetRulesResult {
  /// The next page token to be used in subsequent requests.
  final String? nextToken;

  /// The details of the requested rule.
  final List<RuleDetail>? ruleDetails;

  GetRulesResult({
    this.nextToken,
    this.ruleDetails,
  });

  factory GetRulesResult.fromJson(Map<String, dynamic> json) {
    return GetRulesResult(
      nextToken: json['nextToken'] as String?,
      ruleDetails: (json['ruleDetails'] as List?)
          ?.whereNotNull()
          .map((e) => RuleDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final ruleDetails = this.ruleDetails;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (ruleDetails != null) 'ruleDetails': ruleDetails,
    };
  }
}

class GetVariablesResult {
  /// The next page token to be used in subsequent requests.
  final String? nextToken;

  /// The names of the variables returned.
  final List<Variable>? variables;

  GetVariablesResult({
    this.nextToken,
    this.variables,
  });

  factory GetVariablesResult.fromJson(Map<String, dynamic> json) {
    return GetVariablesResult(
      nextToken: json['nextToken'] as String?,
      variables: (json['variables'] as List?)
          ?.whereNotNull()
          .map((e) => Variable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final variables = this.variables;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (variables != null) 'variables': variables,
    };
  }
}

/// The KMS key details.
class KMSKey {
  /// The encryption key ARN.
  final String? kmsEncryptionKeyArn;

  KMSKey({
    this.kmsEncryptionKeyArn,
  });

  factory KMSKey.fromJson(Map<String, dynamic> json) {
    return KMSKey(
      kmsEncryptionKeyArn: json['kmsEncryptionKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsEncryptionKeyArn = this.kmsEncryptionKeyArn;
    return {
      if (kmsEncryptionKeyArn != null)
        'kmsEncryptionKeyArn': kmsEncryptionKeyArn,
    };
  }
}

/// The label details.
class Label {
  /// The label ARN.
  final String? arn;

  /// Timestamp of when the event type was created.
  final String? createdTime;

  /// The label description.
  final String? description;

  /// Timestamp of when the label was last updated.
  final String? lastUpdatedTime;

  /// The label name.
  final String? name;

  Label({
    this.arn,
    this.createdTime,
    this.description,
    this.lastUpdatedTime,
    this.name,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (name != null) 'name': name,
    };
  }
}

/// The label schema.
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
  final Map<String, List<String>> labelMapper;

  LabelSchema({
    required this.labelMapper,
  });

  factory LabelSchema.fromJson(Map<String, dynamic> json) {
    return LabelSchema(
      labelMapper: (json['labelMapper'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final labelMapper = this.labelMapper;
    return {
      'labelMapper': labelMapper,
    };
  }
}

enum Language {
  detectorpl,
}

extension on Language {
  String toValue() {
    switch (this) {
      case Language.detectorpl:
        return 'DETECTORPL';
    }
  }
}

extension on String {
  Language toLanguage() {
    switch (this) {
      case 'DETECTORPL':
        return Language.detectorpl;
    }
    throw Exception('$this is not known in enum Language');
  }
}

class ListTagsForResourceResult {
  /// The next token for subsequent requests.
  final String? nextToken;

  /// A collection of key and value pairs.
  final List<Tag>? tags;

  ListTagsForResourceResult({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The logit metric details.
class LogitMetric {
  /// The relative importance of the variable.
  final double variableImportance;

  /// The name of the variable.
  final String variableName;

  /// The type of variable.
  final String variableType;

  LogitMetric({
    required this.variableImportance,
    required this.variableName,
    required this.variableType,
  });

  factory LogitMetric.fromJson(Map<String, dynamic> json) {
    return LogitMetric(
      variableImportance: json['variableImportance'] as double,
      variableName: json['variableName'] as String,
      variableType: json['variableType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final variableImportance = this.variableImportance;
    final variableName = this.variableName;
    final variableType = this.variableType;
    return {
      'variableImportance': variableImportance,
      'variableName': variableName,
      'variableType': variableType,
    };
  }
}

/// Model performance metrics data points.
class MetricDataPoint {
  /// The false positive rate. This is the percentage of total legitimate events
  /// that are incorrectly predicted as fraud.
  final double? fpr;

  /// The percentage of fraud events correctly predicted as fraudulent as compared
  /// to all events predicted as fraudulent.
  final double? precision;

  /// The model threshold that specifies an acceptable fraud capture rate. For
  /// example, a threshold of 500 means any model score 500 or above is labeled as
  /// fraud.
  final double? threshold;

  /// The true positive rate. This is the percentage of total fraud the model
  /// detects. Also known as capture rate.
  final double? tpr;

  MetricDataPoint({
    this.fpr,
    this.precision,
    this.threshold,
    this.tpr,
  });

  factory MetricDataPoint.fromJson(Map<String, dynamic> json) {
    return MetricDataPoint(
      fpr: json['fpr'] as double?,
      precision: json['precision'] as double?,
      threshold: json['threshold'] as double?,
      tpr: json['tpr'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final fpr = this.fpr;
    final precision = this.precision;
    final threshold = this.threshold;
    final tpr = this.tpr;
    return {
      if (fpr != null) 'fpr': fpr,
      if (precision != null) 'precision': precision,
      if (threshold != null) 'threshold': threshold,
      if (tpr != null) 'tpr': tpr,
    };
  }
}

/// The model.
class Model {
  /// The ARN of the model.
  final String? arn;

  /// Timestamp of when the model was created.
  final String? createdTime;

  /// The model description.
  final String? description;

  /// The name of the event type.
  final String? eventTypeName;

  /// Timestamp of last time the model was updated.
  final String? lastUpdatedTime;

  /// The model ID.
  final String? modelId;

  /// The model type.
  final ModelTypeEnum? modelType;

  Model({
    this.arn,
    this.createdTime,
    this.description,
    this.eventTypeName,
    this.lastUpdatedTime,
    this.modelId,
    this.modelType,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      eventTypeName: json['eventTypeName'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      modelId: json['modelId'] as String?,
      modelType: (json['modelType'] as String?)?.toModelTypeEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final eventTypeName = this.eventTypeName;
    final lastUpdatedTime = this.lastUpdatedTime;
    final modelId = this.modelId;
    final modelType = this.modelType;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (modelId != null) 'modelId': modelId,
      if (modelType != null) 'modelType': modelType.toValue(),
    };
  }
}

/// A pre-formed Amazon SageMaker model input you can include if your detector
/// version includes an imported Amazon SageMaker model endpoint with
/// pass-through input configuration.
class ModelEndpointDataBlob {
  /// The byte buffer of the Amazon SageMaker model endpoint input data blob.
  final Uint8List? byteBuffer;

  /// The content type of the Amazon SageMaker model endpoint input data blob.
  final String? contentType;

  ModelEndpointDataBlob({
    this.byteBuffer,
    this.contentType,
  });

  factory ModelEndpointDataBlob.fromJson(Map<String, dynamic> json) {
    return ModelEndpointDataBlob(
      byteBuffer: _s.decodeNullableUint8List(json['byteBuffer'] as String?),
      contentType: json['contentType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final byteBuffer = this.byteBuffer;
    final contentType = this.contentType;
    return {
      if (byteBuffer != null) 'byteBuffer': base64Encode(byteBuffer),
      if (contentType != null) 'contentType': contentType,
    };
  }
}

enum ModelEndpointStatus {
  associated,
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
  }
}

extension on String {
  ModelEndpointStatus toModelEndpointStatus() {
    switch (this) {
      case 'ASSOCIATED':
        return ModelEndpointStatus.associated;
      case 'DISSOCIATED':
        return ModelEndpointStatus.dissociated;
    }
    throw Exception('$this is not known in enum ModelEndpointStatus');
  }
}

/// The Amazon SageMaker model input configuration.
class ModelInputConfiguration {
  /// The event variables.
  final bool useEventVariables;

  /// Template for constructing the CSV input-data sent to SageMaker. At
  /// event-evaluation, the placeholders for variable-names in the template will
  /// be replaced with the variable values before being sent to SageMaker.
  final String? csvInputTemplate;

  /// The event type name.
  final String? eventTypeName;

  /// The format of the model input configuration. The format differs depending on
  /// if it is passed through to SageMaker or constructed by Amazon Fraud
  /// Detector.
  final ModelInputDataFormat? format;

  /// Template for constructing the JSON input-data sent to SageMaker. At
  /// event-evaluation, the placeholders for variable names in the template will
  /// be replaced with the variable values before being sent to SageMaker.
  final String? jsonInputTemplate;

  ModelInputConfiguration({
    required this.useEventVariables,
    this.csvInputTemplate,
    this.eventTypeName,
    this.format,
    this.jsonInputTemplate,
  });

  factory ModelInputConfiguration.fromJson(Map<String, dynamic> json) {
    return ModelInputConfiguration(
      useEventVariables: json['useEventVariables'] as bool,
      csvInputTemplate: json['csvInputTemplate'] as String?,
      eventTypeName: json['eventTypeName'] as String?,
      format: (json['format'] as String?)?.toModelInputDataFormat(),
      jsonInputTemplate: json['jsonInputTemplate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final useEventVariables = this.useEventVariables;
    final csvInputTemplate = this.csvInputTemplate;
    final eventTypeName = this.eventTypeName;
    final format = this.format;
    final jsonInputTemplate = this.jsonInputTemplate;
    return {
      'useEventVariables': useEventVariables,
      if (csvInputTemplate != null) 'csvInputTemplate': csvInputTemplate,
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (format != null) 'format': format.toValue(),
      if (jsonInputTemplate != null) 'jsonInputTemplate': jsonInputTemplate,
    };
  }
}

enum ModelInputDataFormat {
  textCsv,
  applicationJson,
}

extension on ModelInputDataFormat {
  String toValue() {
    switch (this) {
      case ModelInputDataFormat.textCsv:
        return 'TEXT_CSV';
      case ModelInputDataFormat.applicationJson:
        return 'APPLICATION_JSON';
    }
  }
}

extension on String {
  ModelInputDataFormat toModelInputDataFormat() {
    switch (this) {
      case 'TEXT_CSV':
        return ModelInputDataFormat.textCsv;
      case 'APPLICATION_JSON':
        return ModelInputDataFormat.applicationJson;
    }
    throw Exception('$this is not known in enum ModelInputDataFormat');
  }
}

/// Provides the Amazon Sagemaker model output configuration.
class ModelOutputConfiguration {
  /// The format of the model output configuration.
  final ModelOutputDataFormat format;

  /// A map of CSV index values in the SageMaker response to the Amazon Fraud
  /// Detector variables.
  final Map<String, String>? csvIndexToVariableMap;

  /// A map of JSON keys in response from SageMaker to the Amazon Fraud Detector
  /// variables.
  final Map<String, String>? jsonKeyToVariableMap;

  ModelOutputConfiguration({
    required this.format,
    this.csvIndexToVariableMap,
    this.jsonKeyToVariableMap,
  });

  factory ModelOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return ModelOutputConfiguration(
      format: (json['format'] as String).toModelOutputDataFormat(),
      csvIndexToVariableMap:
          (json['csvIndexToVariableMap'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      jsonKeyToVariableMap:
          (json['jsonKeyToVariableMap'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final csvIndexToVariableMap = this.csvIndexToVariableMap;
    final jsonKeyToVariableMap = this.jsonKeyToVariableMap;
    return {
      'format': format.toValue(),
      if (csvIndexToVariableMap != null)
        'csvIndexToVariableMap': csvIndexToVariableMap,
      if (jsonKeyToVariableMap != null)
        'jsonKeyToVariableMap': jsonKeyToVariableMap,
    };
  }
}

enum ModelOutputDataFormat {
  textCsv,
  applicationJsonlines,
}

extension on ModelOutputDataFormat {
  String toValue() {
    switch (this) {
      case ModelOutputDataFormat.textCsv:
        return 'TEXT_CSV';
      case ModelOutputDataFormat.applicationJsonlines:
        return 'APPLICATION_JSONLINES';
    }
  }
}

extension on String {
  ModelOutputDataFormat toModelOutputDataFormat() {
    switch (this) {
      case 'TEXT_CSV':
        return ModelOutputDataFormat.textCsv;
      case 'APPLICATION_JSONLINES':
        return ModelOutputDataFormat.applicationJsonlines;
    }
    throw Exception('$this is not known in enum ModelOutputDataFormat');
  }
}

/// The fraud prediction scores.
class ModelScores {
  /// The model version.
  final ModelVersion? modelVersion;

  /// The model's fraud prediction scores.
  final Map<String, double>? scores;

  ModelScores({
    this.modelVersion,
    this.scores,
  });

  factory ModelScores.fromJson(Map<String, dynamic> json) {
    return ModelScores(
      modelVersion: json['modelVersion'] != null
          ? ModelVersion.fromJson(json['modelVersion'] as Map<String, dynamic>)
          : null,
      scores: (json['scores'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as double)),
    );
  }

  Map<String, dynamic> toJson() {
    final modelVersion = this.modelVersion;
    final scores = this.scores;
    return {
      if (modelVersion != null) 'modelVersion': modelVersion,
      if (scores != null) 'scores': scores,
    };
  }
}

enum ModelSource {
  sagemaker,
}

extension on ModelSource {
  String toValue() {
    switch (this) {
      case ModelSource.sagemaker:
        return 'SAGEMAKER';
    }
  }
}

extension on String {
  ModelSource toModelSource() {
    switch (this) {
      case 'SAGEMAKER':
        return ModelSource.sagemaker;
    }
    throw Exception('$this is not known in enum ModelSource');
  }
}

enum ModelTypeEnum {
  onlineFraudInsights,
}

extension on ModelTypeEnum {
  String toValue() {
    switch (this) {
      case ModelTypeEnum.onlineFraudInsights:
        return 'ONLINE_FRAUD_INSIGHTS';
    }
  }
}

extension on String {
  ModelTypeEnum toModelTypeEnum() {
    switch (this) {
      case 'ONLINE_FRAUD_INSIGHTS':
        return ModelTypeEnum.onlineFraudInsights;
    }
    throw Exception('$this is not known in enum ModelTypeEnum');
  }
}

/// The model version.
class ModelVersion {
  /// The model ID.
  final String modelId;

  /// The model type.
  final ModelTypeEnum modelType;

  /// The model version number.
  final String modelVersionNumber;

  /// The model version ARN.
  final String? arn;

  ModelVersion({
    required this.modelId,
    required this.modelType,
    required this.modelVersionNumber,
    this.arn,
  });

  factory ModelVersion.fromJson(Map<String, dynamic> json) {
    return ModelVersion(
      modelId: json['modelId'] as String,
      modelType: (json['modelType'] as String).toModelTypeEnum(),
      modelVersionNumber: json['modelVersionNumber'] as String,
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final modelType = this.modelType;
    final modelVersionNumber = this.modelVersionNumber;
    final arn = this.arn;
    return {
      'modelId': modelId,
      'modelType': modelType.toValue(),
      'modelVersionNumber': modelVersionNumber,
      if (arn != null) 'arn': arn,
    };
  }
}

/// The details of the model version.
class ModelVersionDetail {
  /// The model version ARN.
  final String? arn;

  /// The timestamp when the model was created.
  final String? createdTime;

  /// The event details.
  final ExternalEventsDetail? externalEventsDetail;

  /// The timestamp when the model was last updated.
  final String? lastUpdatedTime;

  /// The model ID.
  final String? modelId;

  /// The model type.
  final ModelTypeEnum? modelType;

  /// The model version number.
  final String? modelVersionNumber;

  /// The status of the model version.
  final String? status;

  /// The training data schema.
  final TrainingDataSchema? trainingDataSchema;

  /// The model version training data source.
  final TrainingDataSourceEnum? trainingDataSource;

  /// The training results.
  final TrainingResult? trainingResult;

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

  factory ModelVersionDetail.fromJson(Map<String, dynamic> json) {
    return ModelVersionDetail(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      externalEventsDetail: json['externalEventsDetail'] != null
          ? ExternalEventsDetail.fromJson(
              json['externalEventsDetail'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      modelId: json['modelId'] as String?,
      modelType: (json['modelType'] as String?)?.toModelTypeEnum(),
      modelVersionNumber: json['modelVersionNumber'] as String?,
      status: json['status'] as String?,
      trainingDataSchema: json['trainingDataSchema'] != null
          ? TrainingDataSchema.fromJson(
              json['trainingDataSchema'] as Map<String, dynamic>)
          : null,
      trainingDataSource:
          (json['trainingDataSource'] as String?)?.toTrainingDataSourceEnum(),
      trainingResult: json['trainingResult'] != null
          ? TrainingResult.fromJson(
              json['trainingResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final externalEventsDetail = this.externalEventsDetail;
    final lastUpdatedTime = this.lastUpdatedTime;
    final modelId = this.modelId;
    final modelType = this.modelType;
    final modelVersionNumber = this.modelVersionNumber;
    final status = this.status;
    final trainingDataSchema = this.trainingDataSchema;
    final trainingDataSource = this.trainingDataSource;
    final trainingResult = this.trainingResult;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (externalEventsDetail != null)
        'externalEventsDetail': externalEventsDetail,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (modelId != null) 'modelId': modelId,
      if (modelType != null) 'modelType': modelType.toValue(),
      if (modelVersionNumber != null) 'modelVersionNumber': modelVersionNumber,
      if (status != null) 'status': status,
      if (trainingDataSchema != null) 'trainingDataSchema': trainingDataSchema,
      if (trainingDataSource != null)
        'trainingDataSource': trainingDataSource.toValue(),
      if (trainingResult != null) 'trainingResult': trainingResult,
    };
  }
}

enum ModelVersionStatus {
  active,
  inactive,
  trainingCancelled,
}

extension on ModelVersionStatus {
  String toValue() {
    switch (this) {
      case ModelVersionStatus.active:
        return 'ACTIVE';
      case ModelVersionStatus.inactive:
        return 'INACTIVE';
      case ModelVersionStatus.trainingCancelled:
        return 'TRAINING_CANCELLED';
    }
  }
}

extension on String {
  ModelVersionStatus toModelVersionStatus() {
    switch (this) {
      case 'ACTIVE':
        return ModelVersionStatus.active;
      case 'INACTIVE':
        return ModelVersionStatus.inactive;
      case 'TRAINING_CANCELLED':
        return ModelVersionStatus.trainingCancelled;
    }
    throw Exception('$this is not known in enum ModelVersionStatus');
  }
}

/// The outcome.
class Outcome {
  /// The outcome ARN.
  final String? arn;

  /// The timestamp when the outcome was created.
  final String? createdTime;

  /// The outcome description.
  final String? description;

  /// The timestamp when the outcome was last updated.
  final String? lastUpdatedTime;

  /// The outcome name.
  final String? name;

  Outcome({
    this.arn,
    this.createdTime,
    this.description,
    this.lastUpdatedTime,
    this.name,
  });

  factory Outcome.fromJson(Map<String, dynamic> json) {
    return Outcome(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (name != null) 'name': name,
    };
  }
}

class PutDetectorResult {
  PutDetectorResult();

  factory PutDetectorResult.fromJson(Map<String, dynamic> _) {
    return PutDetectorResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutEntityTypeResult {
  PutEntityTypeResult();

  factory PutEntityTypeResult.fromJson(Map<String, dynamic> _) {
    return PutEntityTypeResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutEventTypeResult {
  PutEventTypeResult();

  factory PutEventTypeResult.fromJson(Map<String, dynamic> _) {
    return PutEventTypeResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutExternalModelResult {
  PutExternalModelResult();

  factory PutExternalModelResult.fromJson(Map<String, dynamic> _) {
    return PutExternalModelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutKMSEncryptionKeyResult {
  PutKMSEncryptionKeyResult();

  factory PutKMSEncryptionKeyResult.fromJson(Map<String, dynamic> _) {
    return PutKMSEncryptionKeyResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutLabelResult {
  PutLabelResult();

  factory PutLabelResult.fromJson(Map<String, dynamic> _) {
    return PutLabelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutOutcomeResult {
  PutOutcomeResult();

  factory PutOutcomeResult.fromJson(Map<String, dynamic> _) {
    return PutOutcomeResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A rule.
class Rule {
  /// The detector for which the rule is associated.
  final String detectorId;

  /// The rule ID.
  final String ruleId;

  /// The rule version.
  final String ruleVersion;

  Rule({
    required this.detectorId,
    required this.ruleId,
    required this.ruleVersion,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      detectorId: json['detectorId'] as String,
      ruleId: json['ruleId'] as String,
      ruleVersion: json['ruleVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorId = this.detectorId;
    final ruleId = this.ruleId;
    final ruleVersion = this.ruleVersion;
    return {
      'detectorId': detectorId,
      'ruleId': ruleId,
      'ruleVersion': ruleVersion,
    };
  }
}

/// The details of the rule.
class RuleDetail {
  /// The rule ARN.
  final String? arn;

  /// The timestamp of when the rule was created.
  final String? createdTime;

  /// The rule description.
  final String? description;

  /// The detector for which the rule is associated.
  final String? detectorId;

  /// The rule expression.
  final String? expression;

  /// The rule language.
  final Language? language;

  /// Timestamp of the last time the rule was updated.
  final String? lastUpdatedTime;

  /// The rule outcomes.
  final List<String>? outcomes;

  /// The rule ID.
  final String? ruleId;

  /// The rule version.
  final String? ruleVersion;

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

  factory RuleDetail.fromJson(Map<String, dynamic> json) {
    return RuleDetail(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      detectorId: json['detectorId'] as String?,
      expression: json['expression'] as String?,
      language: (json['language'] as String?)?.toLanguage(),
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      outcomes: (json['outcomes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ruleId: json['ruleId'] as String?,
      ruleVersion: json['ruleVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final detectorId = this.detectorId;
    final expression = this.expression;
    final language = this.language;
    final lastUpdatedTime = this.lastUpdatedTime;
    final outcomes = this.outcomes;
    final ruleId = this.ruleId;
    final ruleVersion = this.ruleVersion;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (detectorId != null) 'detectorId': detectorId,
      if (expression != null) 'expression': expression,
      if (language != null) 'language': language.toValue(),
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (outcomes != null) 'outcomes': outcomes,
      if (ruleId != null) 'ruleId': ruleId,
      if (ruleVersion != null) 'ruleVersion': ruleVersion,
    };
  }
}

enum RuleExecutionMode {
  allMatched,
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
  }
}

extension on String {
  RuleExecutionMode toRuleExecutionMode() {
    switch (this) {
      case 'ALL_MATCHED':
        return RuleExecutionMode.allMatched;
      case 'FIRST_MATCHED':
        return RuleExecutionMode.firstMatched;
    }
    throw Exception('$this is not known in enum RuleExecutionMode');
  }
}

/// The rule results.
class RuleResult {
  /// The outcomes of the matched rule, based on the rule execution mode.
  final List<String>? outcomes;

  /// The rule ID that was matched, based on the rule execution mode.
  final String? ruleId;

  RuleResult({
    this.outcomes,
    this.ruleId,
  });

  factory RuleResult.fromJson(Map<String, dynamic> json) {
    return RuleResult(
      outcomes: (json['outcomes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ruleId: json['ruleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outcomes = this.outcomes;
    final ruleId = this.ruleId;
    return {
      if (outcomes != null) 'outcomes': outcomes,
      if (ruleId != null) 'ruleId': ruleId,
    };
  }
}

/// A key and value pair.
class Tag {
  /// A tag key.
  final String key;

  /// A value assigned to a tag key.
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

class TagResourceResult {
  TagResourceResult();

  factory TagResourceResult.fromJson(Map<String, dynamic> _) {
    return TagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The training data schema.
class TrainingDataSchema {
  final LabelSchema labelSchema;

  /// The training data schema variables.
  final List<String> modelVariables;

  TrainingDataSchema({
    required this.labelSchema,
    required this.modelVariables,
  });

  factory TrainingDataSchema.fromJson(Map<String, dynamic> json) {
    return TrainingDataSchema(
      labelSchema:
          LabelSchema.fromJson(json['labelSchema'] as Map<String, dynamic>),
      modelVariables: (json['modelVariables'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final labelSchema = this.labelSchema;
    final modelVariables = this.modelVariables;
    return {
      'labelSchema': labelSchema,
      'modelVariables': modelVariables,
    };
  }
}

enum TrainingDataSourceEnum {
  externalEvents,
}

extension on TrainingDataSourceEnum {
  String toValue() {
    switch (this) {
      case TrainingDataSourceEnum.externalEvents:
        return 'EXTERNAL_EVENTS';
    }
  }
}

extension on String {
  TrainingDataSourceEnum toTrainingDataSourceEnum() {
    switch (this) {
      case 'EXTERNAL_EVENTS':
        return TrainingDataSourceEnum.externalEvents;
    }
    throw Exception('$this is not known in enum TrainingDataSourceEnum');
  }
}

/// The training metric details.
class TrainingMetrics {
  /// The area under the curve. This summarizes true positive rate (TPR) and false
  /// positive rate (FPR) across all possible model score thresholds. A model with
  /// no predictive power has an AUC of 0.5, whereas a perfect model has a score
  /// of 1.0.
  final double? auc;

  /// The data points details.
  final List<MetricDataPoint>? metricDataPoints;

  TrainingMetrics({
    this.auc,
    this.metricDataPoints,
  });

  factory TrainingMetrics.fromJson(Map<String, dynamic> json) {
    return TrainingMetrics(
      auc: json['auc'] as double?,
      metricDataPoints: (json['metricDataPoints'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final auc = this.auc;
    final metricDataPoints = this.metricDataPoints;
    return {
      if (auc != null) 'auc': auc,
      if (metricDataPoints != null) 'metricDataPoints': metricDataPoints,
    };
  }
}

/// The training result details.
class TrainingResult {
  /// The validation metrics.
  final DataValidationMetrics? dataValidationMetrics;

  /// The training metric details.
  final TrainingMetrics? trainingMetrics;

  /// The variable importance metrics.
  final VariableImportanceMetrics? variableImportanceMetrics;

  TrainingResult({
    this.dataValidationMetrics,
    this.trainingMetrics,
    this.variableImportanceMetrics,
  });

  factory TrainingResult.fromJson(Map<String, dynamic> json) {
    return TrainingResult(
      dataValidationMetrics: json['dataValidationMetrics'] != null
          ? DataValidationMetrics.fromJson(
              json['dataValidationMetrics'] as Map<String, dynamic>)
          : null,
      trainingMetrics: json['trainingMetrics'] != null
          ? TrainingMetrics.fromJson(
              json['trainingMetrics'] as Map<String, dynamic>)
          : null,
      variableImportanceMetrics: json['variableImportanceMetrics'] != null
          ? VariableImportanceMetrics.fromJson(
              json['variableImportanceMetrics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataValidationMetrics = this.dataValidationMetrics;
    final trainingMetrics = this.trainingMetrics;
    final variableImportanceMetrics = this.variableImportanceMetrics;
    return {
      if (dataValidationMetrics != null)
        'dataValidationMetrics': dataValidationMetrics,
      if (trainingMetrics != null) 'trainingMetrics': trainingMetrics,
      if (variableImportanceMetrics != null)
        'variableImportanceMetrics': variableImportanceMetrics,
    };
  }
}

class UntagResourceResult {
  UntagResourceResult();

  factory UntagResourceResult.fromJson(Map<String, dynamic> _) {
    return UntagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDetectorVersionMetadataResult {
  UpdateDetectorVersionMetadataResult();

  factory UpdateDetectorVersionMetadataResult.fromJson(Map<String, dynamic> _) {
    return UpdateDetectorVersionMetadataResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDetectorVersionResult {
  UpdateDetectorVersionResult();

  factory UpdateDetectorVersionResult.fromJson(Map<String, dynamic> _) {
    return UpdateDetectorVersionResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDetectorVersionStatusResult {
  UpdateDetectorVersionStatusResult();

  factory UpdateDetectorVersionStatusResult.fromJson(Map<String, dynamic> _) {
    return UpdateDetectorVersionStatusResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateModelResult {
  UpdateModelResult();

  factory UpdateModelResult.fromJson(Map<String, dynamic> _) {
    return UpdateModelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateModelVersionResult {
  /// The model ID.
  final String? modelId;

  /// The model type.
  final ModelTypeEnum? modelType;

  /// The model version number of the model version updated.
  final String? modelVersionNumber;

  /// The status of the updated model version.
  final String? status;

  UpdateModelVersionResult({
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.status,
  });

  factory UpdateModelVersionResult.fromJson(Map<String, dynamic> json) {
    return UpdateModelVersionResult(
      modelId: json['modelId'] as String?,
      modelType: (json['modelType'] as String?)?.toModelTypeEnum(),
      modelVersionNumber: json['modelVersionNumber'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final modelType = this.modelType;
    final modelVersionNumber = this.modelVersionNumber;
    final status = this.status;
    return {
      if (modelId != null) 'modelId': modelId,
      if (modelType != null) 'modelType': modelType.toValue(),
      if (modelVersionNumber != null) 'modelVersionNumber': modelVersionNumber,
      if (status != null) 'status': status,
    };
  }
}

class UpdateModelVersionStatusResult {
  UpdateModelVersionStatusResult();

  factory UpdateModelVersionStatusResult.fromJson(Map<String, dynamic> _) {
    return UpdateModelVersionStatusResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRuleMetadataResult {
  UpdateRuleMetadataResult();

  factory UpdateRuleMetadataResult.fromJson(Map<String, dynamic> _) {
    return UpdateRuleMetadataResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRuleVersionResult {
  /// The new rule version that was created.
  final Rule? rule;

  UpdateRuleVersionResult({
    this.rule,
  });

  factory UpdateRuleVersionResult.fromJson(Map<String, dynamic> json) {
    return UpdateRuleVersionResult(
      rule: json['rule'] != null
          ? Rule.fromJson(json['rule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    return {
      if (rule != null) 'rule': rule,
    };
  }
}

class UpdateVariableResult {
  UpdateVariableResult();

  factory UpdateVariableResult.fromJson(Map<String, dynamic> _) {
    return UpdateVariableResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The variable.
class Variable {
  /// The ARN of the variable.
  final String? arn;

  /// The time when the variable was created.
  final String? createdTime;

  /// The data source of the variable.
  final DataSource? dataSource;

  /// The data type of the variable. For more information see <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types">Variable
  /// types</a>.
  final DataType? dataType;

  /// The default value of the variable.
  final String? defaultValue;

  /// The description of the variable.
  final String? description;

  /// The time when variable was last updated.
  final String? lastUpdatedTime;

  /// The name of the variable.
  final String? name;

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
  final String? variableType;

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

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      dataSource: (json['dataSource'] as String?)?.toDataSource(),
      dataType: (json['dataType'] as String?)?.toDataType(),
      defaultValue: json['defaultValue'] as String?,
      description: json['description'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      name: json['name'] as String?,
      variableType: json['variableType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final dataSource = this.dataSource;
    final dataType = this.dataType;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final variableType = this.variableType;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (dataSource != null) 'dataSource': dataSource.toValue(),
      if (dataType != null) 'dataType': dataType.toValue(),
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (name != null) 'name': name,
      if (variableType != null) 'variableType': variableType,
    };
  }
}

/// A variable in the list of variables for the batch create variable request.
class VariableEntry {
  /// The data source of the variable.
  final String? dataSource;

  /// The data type of the variable.
  final String? dataType;

  /// The default value of the variable.
  final String? defaultValue;

  /// The description of the variable.
  final String? description;

  /// The name of the variable.
  final String? name;

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
  final String? variableType;

  VariableEntry({
    this.dataSource,
    this.dataType,
    this.defaultValue,
    this.description,
    this.name,
    this.variableType,
  });

  factory VariableEntry.fromJson(Map<String, dynamic> json) {
    return VariableEntry(
      dataSource: json['dataSource'] as String?,
      dataType: json['dataType'] as String?,
      defaultValue: json['defaultValue'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      variableType: json['variableType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final dataType = this.dataType;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final name = this.name;
    final variableType = this.variableType;
    return {
      if (dataSource != null) 'dataSource': dataSource,
      if (dataType != null) 'dataType': dataType,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (variableType != null) 'variableType': variableType,
    };
  }
}

/// The variable importance metrics details.
class VariableImportanceMetrics {
  /// List of variable metrics.
  final List<LogitMetric>? logitMetrics;

  VariableImportanceMetrics({
    this.logitMetrics,
  });

  factory VariableImportanceMetrics.fromJson(Map<String, dynamic> json) {
    return VariableImportanceMetrics(
      logitMetrics: (json['LogitMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => LogitMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logitMetrics = this.logitMetrics;
    return {
      if (logitMetrics != null) 'LogitMetrics': logitMetrics,
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
