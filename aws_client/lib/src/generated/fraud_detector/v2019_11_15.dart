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

/// This is the Amazon Fraud Detector API Reference. This guide is for
/// developers who need detailed information about Amazon Fraud Detector API
/// actions, data types, and errors. For more information about Amazon Fraud
/// Detector features, see the <a
/// href="https://docs.aws.amazon.com/frauddetector/latest/ug/">Amazon Fraud
/// Detector User Guide</a>.
///
/// We provide the Query API as well as AWS software development kits (SDK) for
/// Amazon Fraud Detector in Java and Python programming languages.
///
/// The Amazon Fraud Detector Query API provides HTTPS requests that use the
/// HTTP verb GET or POST and a Query parameter <code>Action</code>. AWS SDK
/// provides libraries, sample code, tutorials, and other resources for software
/// developers who prefer to build applications using language-specific APIs
/// instead of submitting a request over HTTP or HTTPS. These libraries provide
/// basic functions that automatically take care of tasks such as
/// cryptographically signing your requests, retrying requests, and handling
/// error responses, so that it is easier for you to get started. For more
/// information about the AWS SDKs, go to <a
/// href="https://aws.amazon.com/developer/tools/">Tools to build on AWS</a>
/// page, scroll down to the <b>SDK</b> section, and choose plus (+) sign to
/// expand the section.
class FraudDetector {
  final _s.JsonProtocol _protocol;
  FraudDetector({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'frauddetector',
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

  /// Cancels an in-progress batch import job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The ID of an in-progress batch import job to cancel.
  ///
  /// Amazon Fraud Detector will throw an error if the batch import job is in
  /// <code>FAILED</code>, <code>CANCELED</code>, or <code>COMPLETED</code>
  /// state.
  Future<void> cancelBatchImportJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CancelBatchImportJob'
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

  /// Cancels the specified batch prediction job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The ID of the batch prediction job to cancel.
  Future<void> cancelBatchPredictionJob({
    required String jobId,
  }) async {
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

  /// Creates a batch import job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventTypeName] :
  /// The name of the event type.
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of the IAM role created for Amazon S3 bucket that holds your data
  /// file.
  ///
  /// The IAM role must have read permissions to your input S3 bucket and write
  /// permissions to your output S3 bucket. For more information about bucket
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-policies-s3.html">User
  /// policy examples</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// Parameter [inputPath] :
  /// The URI that points to the Amazon S3 location of your data file.
  ///
  /// Parameter [jobId] :
  /// The ID of the batch import job. The ID cannot be of a past job, unless the
  /// job exists in <code>CREATE_FAILED</code> state.
  ///
  /// Parameter [outputPath] :
  /// The URI that points to the Amazon S3 location for storing your results.
  ///
  /// Parameter [tags] :
  /// A collection of key-value pairs associated with this request.
  Future<void> createBatchImportJob({
    required String eventTypeName,
    required String iamRoleArn,
    required String inputPath,
    required String jobId,
    required String outputPath,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateBatchImportJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventTypeName': eventTypeName,
        'iamRoleArn': iamRoleArn,
        'inputPath': inputPath,
        'jobId': jobId,
        'outputPath': outputPath,
        if (tags != null) 'tags': tags,
      },
    );
  }

  /// Creates a batch prediction job.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// The IAM Role must have read permissions to your input S3 bucket and write
  /// permissions to your output S3 bucket. For more information about bucket
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-policies-s3.html">User
  /// policy examples</a> in the <i>Amazon S3 User Guide</i>.
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

  /// Creates a list.
  ///
  /// List is a set of input data for a variable in your event dataset. You use
  /// the input data in a rule that's associated with your detector. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/ug/lists.html">Lists</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the list.
  ///
  /// Parameter [description] :
  /// The description of the list.
  ///
  /// Parameter [elements] :
  /// The names of the elements, if providing. You can also create an empty list
  /// and add elements later using the <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/api/API_Updatelist.html">UpdateList</a>
  /// API.
  ///
  /// Parameter [tags] :
  /// A collection of the key and value pairs.
  ///
  /// Parameter [variableType] :
  /// The variable type of the list. You can only assign the variable type with
  /// String data type. For more information, see <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types">Variable
  /// types</a>.
  Future<void> createList({
    required String name,
    String? description,
    List<String>? elements,
    List<Tag>? tags,
    String? variableType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateList'
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
        if (elements != null) 'elements': elements,
        if (tags != null) 'tags': tags,
        if (variableType != null) 'variableType': variableType,
      },
    );
  }

  /// Creates a model using the specified model type.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// May throw [ThrottlingException].
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
  /// Details of the external events data used for model version training.
  /// Required if <code>trainingDataSource</code> is
  /// <code>EXTERNAL_EVENTS</code>.
  ///
  /// Parameter [ingestedEventsDetail] :
  /// Details of the ingested events data used for model version training.
  /// Required if <code>trainingDataSource</code> is
  /// <code>INGESTED_EVENTS</code>.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<CreateModelVersionResult> createModelVersion({
    required String modelId,
    required ModelTypeEnum modelType,
    required TrainingDataSchema trainingDataSchema,
    required TrainingDataSourceEnum trainingDataSource,
    ExternalEventsDetail? externalEventsDetail,
    IngestedEventsDetail? ingestedEventsDetail,
    List<Tag>? tags,
  }) async {
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
        if (ingestedEventsDetail != null)
          'ingestedEventsDetail': ingestedEventsDetail,
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
  /// The data type of the variable.
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

  /// Deletes the specified batch import job ID record. This action does not
  /// delete the data that was batch imported.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The ID of the batch import job to delete.
  Future<void> deleteBatchImportJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteBatchImportJob'
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

  /// Deletes a batch prediction job.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The ID of the batch prediction job to delete.
  Future<void> deleteBatchPredictionJob({
    required String jobId,
  }) async {
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the entity type to delete.
  Future<void> deleteEntityType({
    required String name,
  }) async {
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
  /// event and the event data is no longer stored in Amazon Fraud Detector. If
  /// <code>deleteAuditHistory</code> is <code>True</code>, event data is
  /// available through search for up to 30 seconds after the delete operation
  /// is completed.
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
  ///
  /// Parameter [deleteAuditHistory] :
  /// Specifies whether or not to delete any predictions associated with the
  /// event. If set to <code>True</code>,
  Future<void> deleteEvent({
    required String eventId,
    required String eventTypeName,
    bool? deleteAuditHistory,
  }) async {
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
        if (deleteAuditHistory != null)
          'deleteAuditHistory': deleteAuditHistory,
      },
    );
  }

  /// Deletes an event type.
  ///
  /// You cannot delete an event type that is used in a detector or a model.
  ///
  /// When you delete an event type, Amazon Fraud Detector permanently deletes
  /// that event type and the data is no longer stored in Amazon Fraud Detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the event type to delete.
  Future<void> deleteEventType({
    required String name,
  }) async {
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

  /// Deletes all events of a particular event type.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventTypeName] :
  /// The name of the event type.
  Future<DeleteEventsByEventTypeResult> deleteEventsByEventType({
    required String eventTypeName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteEventsByEventType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventTypeName': eventTypeName,
      },
    );

    return DeleteEventsByEventTypeResult.fromJson(jsonResponse.body);
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the label to delete.
  Future<void> deleteLabel({
    required String name,
  }) async {
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

  /// Deletes the list, provided it is not used in a rule.
  ///
  /// When you delete a list, Amazon Fraud Detector permanently deletes that
  /// list and the elements in the list.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the list to delete.
  Future<void> deleteList({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteList'
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
  /// May throw [ThrottlingException].
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
  /// May throw [ThrottlingException].
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
  /// May throw [ThrottlingException].
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

  /// Gets all batch import jobs or a specific job of the specified ID. This is
  /// a paginated API. If you provide a null <code>maxResults</code>, this
  /// action retrieves a maximum of 50 records per page. If you provide a
  /// <code>maxResults</code>, the value must be between 1 and 50. To get the
  /// next page results, provide the pagination token from the
  /// <code>GetBatchImportJobsResponse</code> as part of your request. A null
  /// pagination token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The ID of the batch import job to get.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for request.
  ///
  /// Parameter [nextToken] :
  /// The next token from the previous request.
  Future<GetBatchImportJobsResult> getBatchImportJobs({
    String? jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetBatchImportJobs'
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

    return GetBatchImportJobsResult.fromJson(jsonResponse.body);
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
  /// May throw [ThrottlingException].
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

  /// Retrieves the status of a <code>DeleteEventsByEventType</code> action.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventTypeName] :
  /// Name of event type for which to get the deletion status.
  Future<GetDeleteEventsByEventTypeStatusResult>
      getDeleteEventsByEventTypeStatus({
    required String eventTypeName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSHawksNestServiceFacade.GetDeleteEventsByEventTypeStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventTypeName': eventTypeName,
      },
    );

    return GetDeleteEventsByEventTypeStatusResult.fromJson(jsonResponse.body);
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
  /// May throw [ThrottlingException].
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

  /// Retrieves details of events stored with Amazon Fraud Detector. This action
  /// does not retrieve prediction results.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventId] :
  /// The ID of the event to retrieve.
  ///
  /// Parameter [eventTypeName] :
  /// The event type of the event to retrieve.
  Future<GetEventResult> getEvent({
    required String eventId,
    required String eventTypeName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetEvent'
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

    return GetEventResult.fromJson(jsonResponse.body);
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
  /// May throw [ResourceUnavailableException].
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
  /// Timestamp that defines when the event under evaluation occurred. The
  /// timestamp must be specified using ISO 8601 standard in UTC.
  ///
  /// Parameter [eventTypeName] :
  /// The event type associated with the detector specified for the prediction.
  ///
  /// Parameter [eventVariables] :
  /// Names of the event type's variables you defined in Amazon Fraud Detector
  /// to represent data elements and their corresponding values for the event
  /// you are sending for evaluation.
  /// <important>
  /// You must provide at least one eventVariable
  /// </important>
  /// To ensure most accurate fraud prediction and to simplify your data
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
  /// <b>For imported SageMaker models:</b>
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

  /// Gets details of the past fraud predictions for the specified event ID,
  /// event type, detector ID, and detector version ID that was generated in the
  /// specified time period.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  ///
  /// Parameter [eventId] :
  /// The event ID.
  ///
  /// Parameter [eventTypeName] :
  /// The event type associated with the detector specified for the prediction.
  ///
  /// Parameter [predictionTimestamp] :
  /// The timestamp that defines when the prediction was generated. The
  /// timestamp must be specified using ISO 8601 standard in UTC.
  ///
  /// We recommend calling <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/api/API_ListEventPredictions.html">ListEventPredictions</a>
  /// first, and using the <code>predictionTimestamp</code> value in the
  /// response to provide an accurate prediction timestamp value.
  Future<GetEventPredictionMetadataResult> getEventPredictionMetadata({
    required String detectorId,
    required String detectorVersionId,
    required String eventId,
    required String eventTypeName,
    required String predictionTimestamp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetEventPredictionMetadata'
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
        'eventId': eventId,
        'eventTypeName': eventTypeName,
        'predictionTimestamp': predictionTimestamp,
      },
    );

    return GetEventPredictionMetadataResult.fromJson(jsonResponse.body);
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
  /// May throw [ThrottlingException].
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

  /// Gets the encryption key if a KMS key has been specified to be used to
  /// encrypt content in Amazon Fraud Detector.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// May throw [ThrottlingException].
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

  /// Gets all the elements in the specified list.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return for the request.
  ///
  /// Parameter [nextToken] :
  /// The next token for the subsequent request.
  Future<GetListElementsResult> getListElements({
    required String name,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      500,
      5000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetListElements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetListElementsResult.fromJson(jsonResponse.body);
  }

  /// Gets the metadata of either all the lists under the account or the
  /// specified list.
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
  /// The name of the list.
  ///
  /// Parameter [nextToken] :
  /// The next token for the subsequent request.
  Future<GetListsMetadataResult> getListsMetadata({
    int? maxResults,
    String? name,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetListsMetadata'
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

    return GetListsMetadataResult.fromJson(jsonResponse.body);
  }

  /// Gets the details of the specified model version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Gets one or more models. Gets all models for the Amazon Web Services
  /// account if no model type and no model id provided. Gets all models for the
  /// Amazon Web Services account and model type, if the model type is specified
  /// but model id is not provided. Gets a specific model if (model type, model
  /// id) tuple is specified.
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
  /// May throw [ThrottlingException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      100,
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

  /// Gets a list of past predictions. The list can be filtered by detector ID,
  /// detector version ID, event ID, event type, or by specifying a time period.
  /// If filter is not specified, the most recent prediction is returned.
  ///
  /// For example, the following filter lists all past predictions for
  /// <code>xyz</code> event type - <code>{ "eventType":{ "value": "xyz" }” }
  /// </code>
  ///
  /// This is a paginated API. If you provide a null <code>maxResults</code>,
  /// this action will retrieve a maximum of 10 records per page. If you provide
  /// a <code>maxResults</code>, the value must be between 50 and 100. To get
  /// the next page results, provide the <code>nextToken</code> from the
  /// response as part of your request. A null <code>nextToken</code> fetches
  /// the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  ///
  /// Parameter [eventId] :
  /// The event ID.
  ///
  /// Parameter [eventType] :
  /// The event type associated with the detector.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of predictions to return for the request.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return. Use the token to make the
  /// call again to retrieve the next page. Keep all other arguments unchanged.
  /// Each pagination token expires after 24 hours.
  ///
  /// Parameter [predictionTimeRange] :
  /// The time period for when the predictions were generated.
  Future<ListEventPredictionsResult> listEventPredictions({
    FilterCondition? detectorId,
    FilterCondition? detectorVersionId,
    FilterCondition? eventId,
    FilterCondition? eventType,
    int? maxResults,
    String? nextToken,
    PredictionTimeRange? predictionTimeRange,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.ListEventPredictions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (detectorId != null) 'detectorId': detectorId,
        if (detectorVersionId != null) 'detectorVersionId': detectorVersionId,
        if (eventId != null) 'eventId': eventId,
        if (eventType != null) 'eventType': eventType,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (predictionTimeRange != null)
          'predictionTimeRange': predictionTimeRange,
      },
    );

    return ListEventPredictionsResult.fromJson(jsonResponse.body);
  }

  /// Lists all tags associated with the resource. This is a paginated API. To
  /// get the next page results, provide the pagination token from the response
  /// as part of your request. A null pagination token fetches the records from
  /// the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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
  /// May throw [ConflictException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// Parameter [eventIngestion] :
  /// Specifies if ingestion is enabled or disabled.
  ///
  /// Parameter [eventOrchestration] :
  /// Enables or disables event orchestration. If enabled, you can send event
  /// predictions to select AWS services for downstream processing of the
  /// events.
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
    EventIngestion? eventIngestion,
    EventOrchestration? eventOrchestration,
    List<String>? labels,
    List<Tag>? tags,
  }) async {
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
        if (eventIngestion != null) 'eventIngestion': eventIngestion.toValue(),
        if (eventOrchestration != null)
          'eventOrchestration': eventOrchestration,
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
  /// May throw [ConflictException].
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

  /// Specifies the KMS key to be used to encrypt content in Amazon Fraud
  /// Detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [kmsEncryptionKeyArn] :
  /// The KMS encryption key ARN.
  ///
  /// The KMS key must be single-Region key. Amazon Fraud Detector does not
  /// support multi-Region KMS key.
  Future<void> putKMSEncryptionKey({
    required String kmsEncryptionKeyArn,
  }) async {
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The label name.
  ///
  /// Parameter [description] :
  /// The label description.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<void> putLabel({
    required String name,
    String? description,
    List<Tag>? tags,
  }) async {
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
  /// May throw [ConflictException].
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

  /// Stores events in Amazon Fraud Detector without generating fraud
  /// predictions for those events. For example, you can use
  /// <code>SendEvent</code> to upload a historical dataset, which you can then
  /// later use to train a model.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [entities] :
  /// An array of entities.
  ///
  /// Parameter [eventId] :
  /// The event ID to upload.
  ///
  /// Parameter [eventTimestamp] :
  /// The timestamp that defines when the event under evaluation occurred. The
  /// timestamp must be specified using ISO 8601 standard in UTC.
  ///
  /// Parameter [eventTypeName] :
  /// The event type name of the event.
  ///
  /// Parameter [eventVariables] :
  /// Names of the event type's variables you defined in Amazon Fraud Detector
  /// to represent data elements and their corresponding values for the event
  /// you are sending for evaluation.
  ///
  /// Parameter [assignedLabel] :
  /// The label to associate with the event. Required if specifying
  /// <code>labelTimestamp</code>.
  ///
  /// Parameter [labelTimestamp] :
  /// The timestamp associated with the label. Required if specifying
  /// <code>assignedLabel</code>.
  Future<void> sendEvent({
    required List<Entity> entities,
    required String eventId,
    required String eventTimestamp,
    required String eventTypeName,
    required Map<String, String> eventVariables,
    String? assignedLabel,
    String? labelTimestamp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.SendEvent'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'entities': entities,
        'eventId': eventId,
        'eventTimestamp': eventTimestamp,
        'eventTypeName': eventTypeName,
        'eventVariables': eventVariables,
        if (assignedLabel != null) 'assignedLabel': assignedLabel,
        if (labelTimestamp != null) 'labelTimestamp': labelTimestamp,
      },
    );
  }

  /// Assigns tags to a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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
  /// May throw [ThrottlingException].
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
  /// May throw [ConflictException].
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
  /// May throw [ConflictException].
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
  /// May throw [ConflictException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  ///
  /// Parameter [status] :
  /// The new status.
  ///
  /// The only supported values are <code>ACTIVE</code> and
  /// <code>INACTIVE</code>
  Future<void> updateDetectorVersionStatus({
    required String detectorId,
    required String detectorVersionId,
    required DetectorVersionStatus status,
  }) async {
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

  /// Updates the specified event with a new label.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [assignedLabel] :
  /// The new label to assign to the event.
  ///
  /// Parameter [eventId] :
  /// The ID of the event associated with the label to update.
  ///
  /// Parameter [eventTypeName] :
  /// The event type of the event associated with the label to update.
  ///
  /// Parameter [labelTimestamp] :
  /// The timestamp associated with the label. The timestamp must be specified
  /// using ISO 8601 standard in UTC.
  Future<void> updateEventLabel({
    required String assignedLabel,
    required String eventId,
    required String eventTypeName,
    required String labelTimestamp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateEventLabel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'assignedLabel': assignedLabel,
        'eventId': eventId,
        'eventTypeName': eventTypeName,
        'labelTimestamp': labelTimestamp,
      },
    );
  }

  /// Updates a list.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the list to update.
  ///
  /// Parameter [description] :
  /// The new description.
  ///
  /// Parameter [elements] :
  /// One or more list elements to add or replace. If you are providing the
  /// elements, make sure to specify the <code>updateMode</code> to use.
  ///
  /// If you are deleting all elements from the list, use <code>REPLACE</code>
  /// for the <code>updateMode</code> and provide an empty list (0 elements).
  ///
  /// Parameter [updateMode] :
  /// The update mode (type).
  ///
  /// <ul>
  /// <li>
  /// Use <code>APPEND</code> if you are adding elements to the list.
  /// </li>
  /// <li>
  /// Use <code>REPLACE</code> if you replacing existing elements in the list.
  /// </li>
  /// <li>
  /// Use <code>REMOVE</code> if you are removing elements from the list.
  /// </li>
  /// </ul>
  ///
  /// Parameter [variableType] :
  /// The variable type you want to assign to the list.
  /// <note>
  /// You cannot update a variable type of a list that already has a variable
  /// type assigned to it. You can assign a variable type to a list only if the
  /// list does not already have a variable type.
  /// </note>
  Future<void> updateList({
    required String name,
    String? description,
    List<String>? elements,
    ListUpdateMode? updateMode,
    String? variableType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.UpdateList'
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
        if (elements != null) 'elements': elements,
        if (updateMode != null) 'updateMode': updateMode.toValue(),
        if (variableType != null) 'variableType': variableType,
      },
    );
  }

  /// Updates model description.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
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
  /// The details of the external events data used for training the model
  /// version. Required if <code>trainingDataSource</code> is
  /// <code>EXTERNAL_EVENTS</code>.
  ///
  /// Parameter [ingestedEventsDetail] :
  /// The details of the ingested event used for training the model version.
  /// Required if your <code>trainingDataSource</code> is
  /// <code>INGESTED_EVENTS</code>.
  ///
  /// Parameter [tags] :
  /// A collection of key and value pairs.
  Future<UpdateModelVersionResult> updateModelVersion({
    required String majorVersionNumber,
    required String modelId,
    required ModelTypeEnum modelType,
    ExternalEventsDetail? externalEventsDetail,
    IngestedEventsDetail? ingestedEventsDetail,
    List<Tag>? tags,
  }) async {
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
        if (ingestedEventsDetail != null)
          'ingestedEventsDetail': ingestedEventsDetail,
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
  /// Change the <code>TRAINING_IN_PROGRESS</code> status to
  /// <code>TRAINING_CANCELLED</code>.
  /// </li>
  /// <li>
  /// Change the <code>TRAINING_COMPLETE</code> status to <code>ACTIVE</code>.
  /// </li>
  /// <li>
  /// Change <code>ACTIVE</code> to <code>INACTIVE</code>.
  /// </li> </ol>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// May throw [ConflictException].
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
  /// May throw [ConflictException].
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
  /// May throw [ConflictException].
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

/// The Account Takeover Insights (ATI) model performance metrics data points.
class ATIMetricDataPoint {
  /// The anomaly discovery rate. This metric quantifies the percentage of
  /// anomalies that can be detected by the model at the selected score threshold.
  /// A lower score threshold increases the percentage of anomalies captured by
  /// the model, but would also require challenging a larger percentage of login
  /// events, leading to a higher customer friction.
  final double? adr;

  /// The account takeover discovery rate. This metric quantifies the percentage
  /// of account compromise events that can be detected by the model at the
  /// selected score threshold. This metric is only available if 50 or more
  /// entities with at-least one labeled account takeover event is present in the
  /// ingested dataset.
  final double? atodr;

  /// The challenge rate. This indicates the percentage of login events that the
  /// model recommends to challenge such as one-time password, multi-factor
  /// authentication, and investigations.
  final double? cr;

  /// The model's threshold that specifies an acceptable fraud capture rate. For
  /// example, a threshold of 500 means any model score 500 or above is labeled as
  /// fraud.
  final double? threshold;

  ATIMetricDataPoint({
    this.adr,
    this.atodr,
    this.cr,
    this.threshold,
  });

  factory ATIMetricDataPoint.fromJson(Map<String, dynamic> json) {
    return ATIMetricDataPoint(
      adr: json['adr'] as double?,
      atodr: json['atodr'] as double?,
      cr: json['cr'] as double?,
      threshold: json['threshold'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final adr = this.adr;
    final atodr = this.atodr;
    final cr = this.cr;
    final threshold = this.threshold;
    return {
      if (adr != null) 'adr': adr,
      if (atodr != null) 'atodr': atodr,
      if (cr != null) 'cr': cr,
      if (threshold != null) 'threshold': threshold,
    };
  }
}

/// The Account Takeover Insights (ATI) model performance score.
class ATIModelPerformance {
  /// The anomaly separation index (ASI) score. This metric summarizes the overall
  /// ability of the model to separate anomalous activities from the normal
  /// behavior. Depending on the business, a large fraction of these anomalous
  /// activities can be malicious and correspond to the account takeover attacks.
  /// A model with no separability power will have the lowest possible ASI score
  /// of 0.5, whereas the a model with a high separability power will have the
  /// highest possible ASI score of 1.0
  final double? asi;

  ATIModelPerformance({
    this.asi,
  });

  factory ATIModelPerformance.fromJson(Map<String, dynamic> json) {
    return ATIModelPerformance(
      asi: json['asi'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final asi = this.asi;
    return {
      if (asi != null) 'asi': asi,
    };
  }
}

/// The Account Takeover Insights (ATI) model training metric details.
class ATITrainingMetricsValue {
  /// The model's performance metrics data points.
  final List<ATIMetricDataPoint>? metricDataPoints;

  /// The model's overall performance scores.
  final ATIModelPerformance? modelPerformance;

  ATITrainingMetricsValue({
    this.metricDataPoints,
    this.modelPerformance,
  });

  factory ATITrainingMetricsValue.fromJson(Map<String, dynamic> json) {
    return ATITrainingMetricsValue(
      metricDataPoints: (json['metricDataPoints'] as List?)
          ?.whereNotNull()
          .map((e) => ATIMetricDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelPerformance: json['modelPerformance'] != null
          ? ATIModelPerformance.fromJson(
              json['modelPerformance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDataPoints = this.metricDataPoints;
    final modelPerformance = this.modelPerformance;
    return {
      if (metricDataPoints != null) 'metricDataPoints': metricDataPoints,
      if (modelPerformance != null) 'modelPerformance': modelPerformance,
    };
  }
}

/// The log odds metric details.
///
/// Account Takeover Insights (ATI) model uses event variables from the login
/// data you provide to continuously calculate a set of variables (aggregated
/// variables) based on historical events. For example, your ATI model might
/// calculate the number of times an user has logged in using the same IP
/// address. In this case, event variables used to derive the aggregated
/// variables are <code>IP address</code> and <code>user</code>.
class AggregatedLogOddsMetric {
  /// The relative importance of the variables in the list to the other event
  /// variable.
  final double aggregatedVariablesImportance;

  /// The names of all the variables.
  final List<String> variableNames;

  AggregatedLogOddsMetric({
    required this.aggregatedVariablesImportance,
    required this.variableNames,
  });

  factory AggregatedLogOddsMetric.fromJson(Map<String, dynamic> json) {
    return AggregatedLogOddsMetric(
      aggregatedVariablesImportance:
          json['aggregatedVariablesImportance'] as double,
      variableNames: (json['variableNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedVariablesImportance = this.aggregatedVariablesImportance;
    final variableNames = this.variableNames;
    return {
      'aggregatedVariablesImportance': aggregatedVariablesImportance,
      'variableNames': variableNames,
    };
  }
}

/// The details of the impact of aggregated variables on the prediction score.
///
/// Account Takeover Insights (ATI) model uses the login data you provide to
/// continuously calculate a set of variables (aggregated variables) based on
/// historical events. For example, the model might calculate the number of
/// times an user has logged in using the same IP address. In this case, event
/// variables used to derive the aggregated variables are <code>IP
/// address</code> and <code>user</code>.
class AggregatedVariablesImpactExplanation {
  /// The names of all the event variables that were used to derive the aggregated
  /// variables.
  final List<String>? eventVariableNames;

  /// The raw, uninterpreted value represented as log-odds of the fraud. These
  /// values are usually between -10 to +10, but range from -infinity to
  /// +infinity.
  ///
  /// <ul>
  /// <li>
  /// A positive value indicates that the variables drove the risk score up.
  /// </li>
  /// <li>
  /// A negative value indicates that the variables drove the risk score down.
  /// </li>
  /// </ul>
  final double? logOddsImpact;

  /// The relative impact of the aggregated variables in terms of magnitude on the
  /// prediction scores.
  final String? relativeImpact;

  AggregatedVariablesImpactExplanation({
    this.eventVariableNames,
    this.logOddsImpact,
    this.relativeImpact,
  });

  factory AggregatedVariablesImpactExplanation.fromJson(
      Map<String, dynamic> json) {
    return AggregatedVariablesImpactExplanation(
      eventVariableNames: (json['eventVariableNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      logOddsImpact: json['logOddsImpact'] as double?,
      relativeImpact: json['relativeImpact'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventVariableNames = this.eventVariableNames;
    final logOddsImpact = this.logOddsImpact;
    final relativeImpact = this.relativeImpact;
    return {
      if (eventVariableNames != null) 'eventVariableNames': eventVariableNames,
      if (logOddsImpact != null) 'logOddsImpact': logOddsImpact,
      if (relativeImpact != null) 'relativeImpact': relativeImpact,
    };
  }
}

/// The details of the relative importance of the aggregated variables.
///
/// Account Takeover Insights (ATI) model uses event variables from the login
/// data you provide to continuously calculate a set of variables (aggregated
/// variables) based on historical events. For example, your ATI model might
/// calculate the number of times an user has logged in using the same IP
/// address. In this case, event variables used to derive the aggregated
/// variables are <code>IP address</code> and <code>user</code>.
class AggregatedVariablesImportanceMetrics {
  /// List of variables' metrics.
  final List<AggregatedLogOddsMetric>? logOddsMetrics;

  AggregatedVariablesImportanceMetrics({
    this.logOddsMetrics,
  });

  factory AggregatedVariablesImportanceMetrics.fromJson(
      Map<String, dynamic> json) {
    return AggregatedVariablesImportanceMetrics(
      logOddsMetrics: (json['logOddsMetrics'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AggregatedLogOddsMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logOddsMetrics = this.logOddsMetrics;
    return {
      if (logOddsMetrics != null) 'logOddsMetrics': logOddsMetrics,
    };
  }
}

/// The metadata of a list.
class AllowDenyList {
  /// The name of the list.
  final String name;

  /// The ARN of the list.
  final String? arn;

  /// The time the list was created.
  final String? createdTime;

  /// The description of the list.
  final String? description;

  /// The time the list was last updated.
  final String? updatedTime;

  /// The variable type of the list.
  final String? variableType;

  AllowDenyList({
    required this.name,
    this.arn,
    this.createdTime,
    this.description,
    this.updatedTime,
    this.variableType,
  });

  factory AllowDenyList.fromJson(Map<String, dynamic> json) {
    return AllowDenyList(
      name: json['name'] as String,
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      description: json['description'] as String?,
      updatedTime: json['updatedTime'] as String?,
      variableType: json['variableType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final updatedTime = this.updatedTime;
    final variableType = this.variableType;
    return {
      'name': name,
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (updatedTime != null) 'updatedTime': updatedTime,
      if (variableType != null) 'variableType': variableType,
    };
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

extension AsyncJobStatusValueExtension on AsyncJobStatus {
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

extension AsyncJobStatusFromString on String {
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

/// The batch import job details.
class BatchImport {
  /// The ARN of the batch import job.
  final String? arn;

  /// Timestamp of when batch import job completed.
  final String? completionTime;

  /// The name of the event type.
  final String? eventTypeName;

  /// The number of records that failed to import.
  final int? failedRecordsCount;

  /// The reason batch import job failed.
  final String? failureReason;

  /// The ARN of the IAM role to use for this job request.
  final String? iamRoleArn;

  /// The Amazon S3 location of your data file for batch import.
  final String? inputPath;

  /// The ID of the batch import job.
  final String? jobId;

  /// The Amazon S3 location of your output file.
  final String? outputPath;

  /// The number of records processed by batch import job.
  final int? processedRecordsCount;

  /// Timestamp of when the batch import job started.
  final String? startTime;

  /// The status of the batch import job.
  final AsyncJobStatus? status;

  /// The total number of records in the batch import job.
  final int? totalRecordsCount;

  BatchImport({
    this.arn,
    this.completionTime,
    this.eventTypeName,
    this.failedRecordsCount,
    this.failureReason,
    this.iamRoleArn,
    this.inputPath,
    this.jobId,
    this.outputPath,
    this.processedRecordsCount,
    this.startTime,
    this.status,
    this.totalRecordsCount,
  });

  factory BatchImport.fromJson(Map<String, dynamic> json) {
    return BatchImport(
      arn: json['arn'] as String?,
      completionTime: json['completionTime'] as String?,
      eventTypeName: json['eventTypeName'] as String?,
      failedRecordsCount: json['failedRecordsCount'] as int?,
      failureReason: json['failureReason'] as String?,
      iamRoleArn: json['iamRoleArn'] as String?,
      inputPath: json['inputPath'] as String?,
      jobId: json['jobId'] as String?,
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
    final eventTypeName = this.eventTypeName;
    final failedRecordsCount = this.failedRecordsCount;
    final failureReason = this.failureReason;
    final iamRoleArn = this.iamRoleArn;
    final inputPath = this.inputPath;
    final jobId = this.jobId;
    final outputPath = this.outputPath;
    final processedRecordsCount = this.processedRecordsCount;
    final startTime = this.startTime;
    final status = this.status;
    final totalRecordsCount = this.totalRecordsCount;
    return {
      if (arn != null) 'arn': arn,
      if (completionTime != null) 'completionTime': completionTime,
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (failedRecordsCount != null) 'failedRecordsCount': failedRecordsCount,
      if (failureReason != null) 'failureReason': failureReason,
      if (iamRoleArn != null) 'iamRoleArn': iamRoleArn,
      if (inputPath != null) 'inputPath': inputPath,
      if (jobId != null) 'jobId': jobId,
      if (outputPath != null) 'outputPath': outputPath,
      if (processedRecordsCount != null)
        'processedRecordsCount': processedRecordsCount,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
      if (totalRecordsCount != null) 'totalRecordsCount': totalRecordsCount,
    };
  }
}

/// The batch prediction details.
class BatchPrediction {
  /// The ARN of batch prediction job.
  final String? arn;

  /// Timestamp of when the batch prediction job completed.
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

class CancelBatchImportJobResult {
  CancelBatchImportJobResult();

  factory CancelBatchImportJobResult.fromJson(Map<String, dynamic> _) {
    return CancelBatchImportJobResult();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class CreateBatchImportJobResult {
  CreateBatchImportJobResult();

  factory CreateBatchImportJobResult.fromJson(Map<String, dynamic> _) {
    return CreateBatchImportJobResult();
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

class CreateListResult {
  CreateListResult();

  factory CreateListResult.fromJson(Map<String, dynamic> _) {
    return CreateListResult();
  }

  Map<String, dynamic> toJson() {
    return {};
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

extension DataSourceValueExtension on DataSource {
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

extension DataSourceFromString on String {
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
  datetime,
}

extension DataTypeValueExtension on DataType {
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
      case DataType.datetime:
        return 'DATETIME';
    }
  }
}

extension DataTypeFromString on String {
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
      case 'DATETIME':
        return DataType.datetime;
    }
    throw Exception('$this is not known in enum DataType');
  }
}

/// The model training data validation metrics.
class DataValidationMetrics {
  /// The field-specific model training validation messages.
  final List<FieldValidationMessage>? fieldLevelMessages;

  /// The file-specific model training data validation messages.
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

class DeleteBatchImportJobResult {
  DeleteBatchImportJobResult();

  factory DeleteBatchImportJobResult.fromJson(Map<String, dynamic> _) {
    return DeleteBatchImportJobResult();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class DeleteEventsByEventTypeResult {
  /// Name of event type for which to delete the events.
  final String? eventTypeName;

  /// The status of the delete request.
  final String? eventsDeletionStatus;

  DeleteEventsByEventTypeResult({
    this.eventTypeName,
    this.eventsDeletionStatus,
  });

  factory DeleteEventsByEventTypeResult.fromJson(Map<String, dynamic> json) {
    return DeleteEventsByEventTypeResult(
      eventTypeName: json['eventTypeName'] as String?,
      eventsDeletionStatus: json['eventsDeletionStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTypeName = this.eventTypeName;
    final eventsDeletionStatus = this.eventsDeletionStatus;
    return {
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (eventsDeletionStatus != null)
        'eventsDeletionStatus': eventsDeletionStatus,
    };
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

class DeleteListResult {
  DeleteListResult();

  factory DeleteListResult.fromJson(Map<String, dynamic> _) {
    return DeleteListResult();
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

extension DetectorVersionStatusValueExtension on DetectorVersionStatus {
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

extension DetectorVersionStatusFromString on String {
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

/// The details of the external (Amazon Sagemaker) model evaluated for
/// generating predictions.
class EvaluatedExternalModel {
  /// Input variables use for generating predictions.
  final Map<String, String>? inputVariables;

  /// The endpoint of the external (Amazon Sagemaker) model.
  final String? modelEndpoint;

  /// Output variables.
  final Map<String, String>? outputVariables;

  /// Indicates whether event variables were used to generate predictions.
  final bool? useEventVariables;

  EvaluatedExternalModel({
    this.inputVariables,
    this.modelEndpoint,
    this.outputVariables,
    this.useEventVariables,
  });

  factory EvaluatedExternalModel.fromJson(Map<String, dynamic> json) {
    return EvaluatedExternalModel(
      inputVariables: (json['inputVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      modelEndpoint: json['modelEndpoint'] as String?,
      outputVariables: (json['outputVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useEventVariables: json['useEventVariables'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputVariables = this.inputVariables;
    final modelEndpoint = this.modelEndpoint;
    final outputVariables = this.outputVariables;
    final useEventVariables = this.useEventVariables;
    return {
      if (inputVariables != null) 'inputVariables': inputVariables,
      if (modelEndpoint != null) 'modelEndpoint': modelEndpoint,
      if (outputVariables != null) 'outputVariables': outputVariables,
      if (useEventVariables != null) 'useEventVariables': useEventVariables,
    };
  }
}

/// The model version evaluated for generating prediction.
class EvaluatedModelVersion {
  /// Evaluations generated for the model version.
  final List<ModelVersionEvaluation>? evaluations;

  /// The model ID.
  final String? modelId;

  /// The model type.
  ///
  /// Valid values: <code>ONLINE_FRAUD_INSIGHTS</code> |
  /// <code>TRANSACTION_FRAUD_INSIGHTS</code>
  final String? modelType;

  /// The model version.
  final String? modelVersion;

  EvaluatedModelVersion({
    this.evaluations,
    this.modelId,
    this.modelType,
    this.modelVersion,
  });

  factory EvaluatedModelVersion.fromJson(Map<String, dynamic> json) {
    return EvaluatedModelVersion(
      evaluations: (json['evaluations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ModelVersionEvaluation.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelId: json['modelId'] as String?,
      modelType: json['modelType'] as String?,
      modelVersion: json['modelVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluations = this.evaluations;
    final modelId = this.modelId;
    final modelType = this.modelType;
    final modelVersion = this.modelVersion;
    return {
      if (evaluations != null) 'evaluations': evaluations,
      if (modelId != null) 'modelId': modelId,
      if (modelType != null) 'modelType': modelType,
      if (modelVersion != null) 'modelVersion': modelVersion,
    };
  }
}

/// The details of the rule used for evaluating variable values.
class EvaluatedRule {
  /// Indicates whether the rule was evaluated.
  final bool? evaluated;

  /// The rule expression.
  final String? expression;

  /// The rule expression value.
  final String? expressionWithValues;

  /// Indicates whether the rule matched.
  final bool? matched;

  /// The rule outcome.
  final List<String>? outcomes;

  /// The rule ID.
  final String? ruleId;

  /// The rule version.
  final String? ruleVersion;

  EvaluatedRule({
    this.evaluated,
    this.expression,
    this.expressionWithValues,
    this.matched,
    this.outcomes,
    this.ruleId,
    this.ruleVersion,
  });

  factory EvaluatedRule.fromJson(Map<String, dynamic> json) {
    return EvaluatedRule(
      evaluated: json['evaluated'] as bool?,
      expression: json['expression'] as String?,
      expressionWithValues: json['expressionWithValues'] as String?,
      matched: json['matched'] as bool?,
      outcomes: (json['outcomes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ruleId: json['ruleId'] as String?,
      ruleVersion: json['ruleVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluated = this.evaluated;
    final expression = this.expression;
    final expressionWithValues = this.expressionWithValues;
    final matched = this.matched;
    final outcomes = this.outcomes;
    final ruleId = this.ruleId;
    final ruleVersion = this.ruleVersion;
    return {
      if (evaluated != null) 'evaluated': evaluated,
      if (expression != null) 'expression': expression,
      if (expressionWithValues != null)
        'expressionWithValues': expressionWithValues,
      if (matched != null) 'matched': matched,
      if (outcomes != null) 'outcomes': outcomes,
      if (ruleId != null) 'ruleId': ruleId,
      if (ruleVersion != null) 'ruleVersion': ruleVersion,
    };
  }
}

/// The event details.
class Event {
  /// The label associated with the event.
  final String? currentLabel;

  /// The event entities.
  final List<Entity>? entities;

  /// The event ID.
  final String? eventId;

  /// The timestamp that defines when the event under evaluation occurred. The
  /// timestamp must be specified using ISO 8601 standard in UTC.
  final String? eventTimestamp;

  /// The event type.
  final String? eventTypeName;

  /// Names of the event type's variables you defined in Amazon Fraud Detector to
  /// represent data elements and their corresponding values for the event you are
  /// sending for evaluation.
  final Map<String, String>? eventVariables;

  /// The timestamp associated with the label to update. The timestamp must be
  /// specified using ISO 8601 standard in UTC.
  final String? labelTimestamp;

  Event({
    this.currentLabel,
    this.entities,
    this.eventId,
    this.eventTimestamp,
    this.eventTypeName,
    this.eventVariables,
    this.labelTimestamp,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      currentLabel: json['currentLabel'] as String?,
      entities: (json['entities'] as List?)
          ?.whereNotNull()
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventId: json['eventId'] as String?,
      eventTimestamp: json['eventTimestamp'] as String?,
      eventTypeName: json['eventTypeName'] as String?,
      eventVariables: (json['eventVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      labelTimestamp: json['labelTimestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentLabel = this.currentLabel;
    final entities = this.entities;
    final eventId = this.eventId;
    final eventTimestamp = this.eventTimestamp;
    final eventTypeName = this.eventTypeName;
    final eventVariables = this.eventVariables;
    final labelTimestamp = this.labelTimestamp;
    return {
      if (currentLabel != null) 'currentLabel': currentLabel,
      if (entities != null) 'entities': entities,
      if (eventId != null) 'eventId': eventId,
      if (eventTimestamp != null) 'eventTimestamp': eventTimestamp,
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (eventVariables != null) 'eventVariables': eventVariables,
      if (labelTimestamp != null) 'labelTimestamp': labelTimestamp,
    };
  }
}

enum EventIngestion {
  enabled,
  disabled,
}

extension EventIngestionValueExtension on EventIngestion {
  String toValue() {
    switch (this) {
      case EventIngestion.enabled:
        return 'ENABLED';
      case EventIngestion.disabled:
        return 'DISABLED';
    }
  }
}

extension EventIngestionFromString on String {
  EventIngestion toEventIngestion() {
    switch (this) {
      case 'ENABLED':
        return EventIngestion.enabled;
      case 'DISABLED':
        return EventIngestion.disabled;
    }
    throw Exception('$this is not known in enum EventIngestion');
  }
}

/// The event orchestration status.
class EventOrchestration {
  /// Specifies if event orchestration is enabled through Amazon EventBridge.
  final bool eventBridgeEnabled;

  EventOrchestration({
    required this.eventBridgeEnabled,
  });

  factory EventOrchestration.fromJson(Map<String, dynamic> json) {
    return EventOrchestration(
      eventBridgeEnabled: json['eventBridgeEnabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final eventBridgeEnabled = this.eventBridgeEnabled;
    return {
      'eventBridgeEnabled': eventBridgeEnabled,
    };
  }
}

/// Information about the summary of an event prediction.
class EventPredictionSummary {
  /// The detector ID.
  final String? detectorId;

  /// The detector version ID.
  final String? detectorVersionId;

  /// The event ID.
  final String? eventId;

  /// The timestamp of the event.
  final String? eventTimestamp;

  /// The event type.
  final String? eventTypeName;

  /// The timestamp when the prediction was generated.
  final String? predictionTimestamp;

  EventPredictionSummary({
    this.detectorId,
    this.detectorVersionId,
    this.eventId,
    this.eventTimestamp,
    this.eventTypeName,
    this.predictionTimestamp,
  });

  factory EventPredictionSummary.fromJson(Map<String, dynamic> json) {
    return EventPredictionSummary(
      detectorId: json['detectorId'] as String?,
      detectorVersionId: json['detectorVersionId'] as String?,
      eventId: json['eventId'] as String?,
      eventTimestamp: json['eventTimestamp'] as String?,
      eventTypeName: json['eventTypeName'] as String?,
      predictionTimestamp: json['predictionTimestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorId = this.detectorId;
    final detectorVersionId = this.detectorVersionId;
    final eventId = this.eventId;
    final eventTimestamp = this.eventTimestamp;
    final eventTypeName = this.eventTypeName;
    final predictionTimestamp = this.predictionTimestamp;
    return {
      if (detectorId != null) 'detectorId': detectorId,
      if (detectorVersionId != null) 'detectorVersionId': detectorVersionId,
      if (eventId != null) 'eventId': eventId,
      if (eventTimestamp != null) 'eventTimestamp': eventTimestamp,
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (predictionTimestamp != null)
        'predictionTimestamp': predictionTimestamp,
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

  /// If <code>Enabled</code>, Amazon Fraud Detector stores event data when you
  /// generate a prediction and uses that data to update calculated variables in
  /// near real-time. Amazon Fraud Detector uses this data, known as
  /// <code>INGESTED_EVENTS</code>, to train your model and improve fraud
  /// predictions.
  final EventIngestion? eventIngestion;

  /// The event orchestration status.
  final EventOrchestration? eventOrchestration;

  /// The event type event variables.
  final List<String>? eventVariables;

  /// Data about the stored events.
  final IngestedEventStatistics? ingestedEventStatistics;

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
    this.eventIngestion,
    this.eventOrchestration,
    this.eventVariables,
    this.ingestedEventStatistics,
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
      eventIngestion: (json['eventIngestion'] as String?)?.toEventIngestion(),
      eventOrchestration: json['eventOrchestration'] != null
          ? EventOrchestration.fromJson(
              json['eventOrchestration'] as Map<String, dynamic>)
          : null,
      eventVariables: (json['eventVariables'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ingestedEventStatistics: json['ingestedEventStatistics'] != null
          ? IngestedEventStatistics.fromJson(
              json['ingestedEventStatistics'] as Map<String, dynamic>)
          : null,
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
    final eventIngestion = this.eventIngestion;
    final eventOrchestration = this.eventOrchestration;
    final eventVariables = this.eventVariables;
    final ingestedEventStatistics = this.ingestedEventStatistics;
    final labels = this.labels;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (description != null) 'description': description,
      if (entityTypes != null) 'entityTypes': entityTypes,
      if (eventIngestion != null) 'eventIngestion': eventIngestion.toValue(),
      if (eventOrchestration != null) 'eventOrchestration': eventOrchestration,
      if (eventVariables != null) 'eventVariables': eventVariables,
      if (ingestedEventStatistics != null)
        'ingestedEventStatistics': ingestedEventStatistics,
      if (labels != null) 'labels': labels,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (name != null) 'name': name,
    };
  }
}

/// Information about the summary of an event variable that was evaluated for
/// generating prediction.
class EventVariableSummary {
  /// The event variable name.
  final String? name;

  /// The event variable source.
  final String? source;

  /// The value of the event variable.
  final String? value;

  EventVariableSummary({
    this.name,
    this.source,
    this.value,
  });

  factory EventVariableSummary.fromJson(Map<String, dynamic> json) {
    return EventVariableSummary(
      name: json['name'] as String?,
      source: json['source'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final source = this.source;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (source != null) 'source': source,
      if (value != null) 'value': value,
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

/// The fraud prediction scores from Amazon SageMaker model.
class ExternalModelOutputs {
  /// The Amazon SageMaker model.
  final ExternalModelSummary? externalModel;

  /// The fraud prediction scores from Amazon SageMaker model.
  final Map<String, String>? outputs;

  ExternalModelOutputs({
    this.externalModel,
    this.outputs,
  });

  factory ExternalModelOutputs.fromJson(Map<String, dynamic> json) {
    return ExternalModelOutputs(
      externalModel: json['externalModel'] != null
          ? ExternalModelSummary.fromJson(
              json['externalModel'] as Map<String, dynamic>)
          : null,
      outputs: (json['outputs'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final externalModel = this.externalModel;
    final outputs = this.outputs;
    return {
      if (externalModel != null) 'externalModel': externalModel,
      if (outputs != null) 'outputs': outputs,
    };
  }
}

/// The Amazon SageMaker model.
class ExternalModelSummary {
  /// The endpoint of the Amazon SageMaker model.
  final String? modelEndpoint;

  /// The source of the model.
  final ModelSource? modelSource;

  ExternalModelSummary({
    this.modelEndpoint,
    this.modelSource,
  });

  factory ExternalModelSummary.fromJson(Map<String, dynamic> json) {
    return ExternalModelSummary(
      modelEndpoint: json['modelEndpoint'] as String?,
      modelSource: (json['modelSource'] as String?)?.toModelSource(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelEndpoint = this.modelEndpoint;
    final modelSource = this.modelSource;
    return {
      if (modelEndpoint != null) 'modelEndpoint': modelEndpoint,
      if (modelSource != null) 'modelSource': modelSource.toValue(),
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

/// A conditional statement for filtering a list of past predictions.
class FilterCondition {
  /// A statement containing a resource property and a value to specify filter
  /// condition.
  final String? value;

  FilterCondition({
    this.value,
  });

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'value': value,
    };
  }
}

class GetBatchImportJobsResult {
  /// An array containing the details of each batch import job.
  final List<BatchImport>? batchImports;

  /// The next token for the subsequent resquest.
  final String? nextToken;

  GetBatchImportJobsResult({
    this.batchImports,
    this.nextToken,
  });

  factory GetBatchImportJobsResult.fromJson(Map<String, dynamic> json) {
    return GetBatchImportJobsResult(
      batchImports: (json['batchImports'] as List?)
          ?.whereNotNull()
          .map((e) => BatchImport.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchImports = this.batchImports;
    final nextToken = this.nextToken;
    return {
      if (batchImports != null) 'batchImports': batchImports,
      if (nextToken != null) 'nextToken': nextToken,
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

class GetDeleteEventsByEventTypeStatusResult {
  /// The event type name.
  final String? eventTypeName;

  /// The deletion status.
  final AsyncJobStatus? eventsDeletionStatus;

  GetDeleteEventsByEventTypeStatusResult({
    this.eventTypeName,
    this.eventsDeletionStatus,
  });

  factory GetDeleteEventsByEventTypeStatusResult.fromJson(
      Map<String, dynamic> json) {
    return GetDeleteEventsByEventTypeStatusResult(
      eventTypeName: json['eventTypeName'] as String?,
      eventsDeletionStatus:
          (json['eventsDeletionStatus'] as String?)?.toAsyncJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventTypeName = this.eventTypeName;
    final eventsDeletionStatus = this.eventsDeletionStatus;
    return {
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (eventsDeletionStatus != null)
        'eventsDeletionStatus': eventsDeletionStatus.toValue(),
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

class GetEventPredictionMetadataResult {
  /// The detector ID.
  final String? detectorId;

  /// The detector version ID.
  final String? detectorVersionId;

  /// The status of the detector version.
  final String? detectorVersionStatus;

  /// The entity ID.
  final String? entityId;

  /// The entity type.
  final String? entityType;

  /// External (Amazon SageMaker) models that were evaluated for generating
  /// predictions.
  final List<EvaluatedExternalModel>? evaluatedExternalModels;

  /// Model versions that were evaluated for generating predictions.
  final List<EvaluatedModelVersion>? evaluatedModelVersions;

  /// The event ID.
  final String? eventId;

  /// The timestamp for when the prediction was generated for the associated event
  /// ID.
  final String? eventTimestamp;

  /// The event type associated with the detector specified for this prediction.
  final String? eventTypeName;

  /// A list of event variables that influenced the prediction scores.
  final List<EventVariableSummary>? eventVariables;

  /// The outcomes of the matched rule, based on the rule execution mode.
  final List<String>? outcomes;

  /// The timestamp that defines when the prediction was generated.
  final String? predictionTimestamp;

  /// The execution mode of the rule used for evaluating variable values.
  final RuleExecutionMode? ruleExecutionMode;

  /// List of rules associated with the detector version that were used for
  /// evaluating variable values.
  final List<EvaluatedRule>? rules;

  GetEventPredictionMetadataResult({
    this.detectorId,
    this.detectorVersionId,
    this.detectorVersionStatus,
    this.entityId,
    this.entityType,
    this.evaluatedExternalModels,
    this.evaluatedModelVersions,
    this.eventId,
    this.eventTimestamp,
    this.eventTypeName,
    this.eventVariables,
    this.outcomes,
    this.predictionTimestamp,
    this.ruleExecutionMode,
    this.rules,
  });

  factory GetEventPredictionMetadataResult.fromJson(Map<String, dynamic> json) {
    return GetEventPredictionMetadataResult(
      detectorId: json['detectorId'] as String?,
      detectorVersionId: json['detectorVersionId'] as String?,
      detectorVersionStatus: json['detectorVersionStatus'] as String?,
      entityId: json['entityId'] as String?,
      entityType: json['entityType'] as String?,
      evaluatedExternalModels: (json['evaluatedExternalModels'] as List?)
          ?.whereNotNull()
          .map(
              (e) => EvaluatedExternalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      evaluatedModelVersions: (json['evaluatedModelVersions'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluatedModelVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventId: json['eventId'] as String?,
      eventTimestamp: json['eventTimestamp'] as String?,
      eventTypeName: json['eventTypeName'] as String?,
      eventVariables: (json['eventVariables'] as List?)
          ?.whereNotNull()
          .map((e) => EventVariableSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      outcomes: (json['outcomes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      predictionTimestamp: json['predictionTimestamp'] as String?,
      ruleExecutionMode:
          (json['ruleExecutionMode'] as String?)?.toRuleExecutionMode(),
      rules: (json['rules'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluatedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final detectorId = this.detectorId;
    final detectorVersionId = this.detectorVersionId;
    final detectorVersionStatus = this.detectorVersionStatus;
    final entityId = this.entityId;
    final entityType = this.entityType;
    final evaluatedExternalModels = this.evaluatedExternalModels;
    final evaluatedModelVersions = this.evaluatedModelVersions;
    final eventId = this.eventId;
    final eventTimestamp = this.eventTimestamp;
    final eventTypeName = this.eventTypeName;
    final eventVariables = this.eventVariables;
    final outcomes = this.outcomes;
    final predictionTimestamp = this.predictionTimestamp;
    final ruleExecutionMode = this.ruleExecutionMode;
    final rules = this.rules;
    return {
      if (detectorId != null) 'detectorId': detectorId,
      if (detectorVersionId != null) 'detectorVersionId': detectorVersionId,
      if (detectorVersionStatus != null)
        'detectorVersionStatus': detectorVersionStatus,
      if (entityId != null) 'entityId': entityId,
      if (entityType != null) 'entityType': entityType,
      if (evaluatedExternalModels != null)
        'evaluatedExternalModels': evaluatedExternalModels,
      if (evaluatedModelVersions != null)
        'evaluatedModelVersions': evaluatedModelVersions,
      if (eventId != null) 'eventId': eventId,
      if (eventTimestamp != null) 'eventTimestamp': eventTimestamp,
      if (eventTypeName != null) 'eventTypeName': eventTypeName,
      if (eventVariables != null) 'eventVariables': eventVariables,
      if (outcomes != null) 'outcomes': outcomes,
      if (predictionTimestamp != null)
        'predictionTimestamp': predictionTimestamp,
      if (ruleExecutionMode != null)
        'ruleExecutionMode': ruleExecutionMode.toValue(),
      if (rules != null) 'rules': rules,
    };
  }
}

class GetEventPredictionResult {
  /// The model scores for Amazon SageMaker models.
  final List<ExternalModelOutputs>? externalModelOutputs;

  /// The model scores. Amazon Fraud Detector generates model scores between 0 and
  /// 1000, where 0 is low fraud risk and 1000 is high fraud risk. Model scores
  /// are directly related to the false positive rate (FPR). For example, a score
  /// of 600 corresponds to an estimated 10% false positive rate whereas a score
  /// of 900 corresponds to an estimated 2% false positive rate.
  final List<ModelScores>? modelScores;

  /// The results from the rules.
  final List<RuleResult>? ruleResults;

  GetEventPredictionResult({
    this.externalModelOutputs,
    this.modelScores,
    this.ruleResults,
  });

  factory GetEventPredictionResult.fromJson(Map<String, dynamic> json) {
    return GetEventPredictionResult(
      externalModelOutputs: (json['externalModelOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => ExternalModelOutputs.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final externalModelOutputs = this.externalModelOutputs;
    final modelScores = this.modelScores;
    final ruleResults = this.ruleResults;
    return {
      if (externalModelOutputs != null)
        'externalModelOutputs': externalModelOutputs,
      if (modelScores != null) 'modelScores': modelScores,
      if (ruleResults != null) 'ruleResults': ruleResults,
    };
  }
}

class GetEventResult {
  /// The details of the event.
  final Event? event;

  GetEventResult({
    this.event,
  });

  factory GetEventResult.fromJson(Map<String, dynamic> json) {
    return GetEventResult(
      event: json['event'] != null
          ? Event.fromJson(json['event'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    return {
      if (event != null) 'event': event,
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

class GetListElementsResult {
  /// The list elements.
  final List<String>? elements;

  /// The next page token.
  final String? nextToken;

  GetListElementsResult({
    this.elements,
    this.nextToken,
  });

  factory GetListElementsResult.fromJson(Map<String, dynamic> json) {
    return GetListElementsResult(
      elements: (json['elements'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final elements = this.elements;
    final nextToken = this.nextToken;
    return {
      if (elements != null) 'elements': elements,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetListsMetadataResult {
  /// The metadata of the specified list or all lists under the account.
  final List<AllowDenyList>? lists;

  /// The next page token.
  final String? nextToken;

  GetListsMetadataResult({
    this.lists,
    this.nextToken,
  });

  factory GetListsMetadataResult.fromJson(Map<String, dynamic> json) {
    return GetListsMetadataResult(
      lists: (json['lists'] as List?)
          ?.whereNotNull()
          .map((e) => AllowDenyList.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lists = this.lists;
    final nextToken = this.nextToken;
    return {
      if (lists != null) 'lists': lists,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetModelVersionResult {
  /// The model version ARN.
  final String? arn;

  /// The details of the external events data used for training the model version.
  /// This will be populated if the <code>trainingDataSource</code> is
  /// <code>EXTERNAL_EVENTS</code>
  final ExternalEventsDetail? externalEventsDetail;

  /// The details of the ingested events data used for training the model version.
  /// This will be populated if the <code>trainingDataSource</code> is
  /// <code>INGESTED_EVENTS</code>.
  final IngestedEventsDetail? ingestedEventsDetail;

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
    this.ingestedEventsDetail,
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
      ingestedEventsDetail: json['ingestedEventsDetail'] != null
          ? IngestedEventsDetail.fromJson(
              json['ingestedEventsDetail'] as Map<String, dynamic>)
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
    final ingestedEventsDetail = this.ingestedEventsDetail;
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
      if (ingestedEventsDetail != null)
        'ingestedEventsDetail': ingestedEventsDetail,
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

/// Data about the stored events.
class IngestedEventStatistics {
  /// The total size of the stored events.
  final int? eventDataSizeInBytes;

  /// Timestamp of when the stored event was last updated.
  final String? lastUpdatedTime;

  /// The oldest stored event.
  final String? leastRecentEvent;

  /// The newest stored event.
  final String? mostRecentEvent;

  /// The number of stored events.
  final int? numberOfEvents;

  IngestedEventStatistics({
    this.eventDataSizeInBytes,
    this.lastUpdatedTime,
    this.leastRecentEvent,
    this.mostRecentEvent,
    this.numberOfEvents,
  });

  factory IngestedEventStatistics.fromJson(Map<String, dynamic> json) {
    return IngestedEventStatistics(
      eventDataSizeInBytes: json['eventDataSizeInBytes'] as int?,
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      leastRecentEvent: json['leastRecentEvent'] as String?,
      mostRecentEvent: json['mostRecentEvent'] as String?,
      numberOfEvents: json['numberOfEvents'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventDataSizeInBytes = this.eventDataSizeInBytes;
    final lastUpdatedTime = this.lastUpdatedTime;
    final leastRecentEvent = this.leastRecentEvent;
    final mostRecentEvent = this.mostRecentEvent;
    final numberOfEvents = this.numberOfEvents;
    return {
      if (eventDataSizeInBytes != null)
        'eventDataSizeInBytes': eventDataSizeInBytes,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (leastRecentEvent != null) 'leastRecentEvent': leastRecentEvent,
      if (mostRecentEvent != null) 'mostRecentEvent': mostRecentEvent,
      if (numberOfEvents != null) 'numberOfEvents': numberOfEvents,
    };
  }
}

/// The details of the ingested event.
class IngestedEventsDetail {
  /// The start and stop time of the ingested events.
  final IngestedEventsTimeWindow ingestedEventsTimeWindow;

  IngestedEventsDetail({
    required this.ingestedEventsTimeWindow,
  });

  factory IngestedEventsDetail.fromJson(Map<String, dynamic> json) {
    return IngestedEventsDetail(
      ingestedEventsTimeWindow: IngestedEventsTimeWindow.fromJson(
          json['ingestedEventsTimeWindow'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestedEventsTimeWindow = this.ingestedEventsTimeWindow;
    return {
      'ingestedEventsTimeWindow': ingestedEventsTimeWindow,
    };
  }
}

/// The start and stop time of the ingested events.
class IngestedEventsTimeWindow {
  /// Timestamp of the final ingested event.
  final String endTime;

  /// Timestamp of the first ingensted event.
  final String startTime;

  IngestedEventsTimeWindow({
    required this.endTime,
    required this.startTime,
  });

  factory IngestedEventsTimeWindow.fromJson(Map<String, dynamic> json) {
    return IngestedEventsTimeWindow(
      endTime: json['endTime'] as String,
      startTime: json['startTime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'endTime': endTime,
      'startTime': startTime,
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
  final Map<String, List<String>>? labelMapper;

  /// The action to take for unlabeled events.
  ///
  /// <ul>
  /// <li>
  /// Use <code>IGNORE</code> if you want the unlabeled events to be ignored. This
  /// is recommended when the majority of the events in the dataset are labeled.
  /// </li>
  /// <li>
  /// Use <code>FRAUD</code> if you want to categorize all unlabeled events as
  /// “Fraud”. This is recommended when most of the events in your dataset are
  /// fraudulent.
  /// </li>
  /// <li>
  /// Use <code>LEGIT</code> if you want to categorize all unlabeled events as
  /// “Legit”. This is recommended when most of the events in your dataset are
  /// legitimate.
  /// </li>
  /// <li>
  /// Use <code>AUTO</code> if you want Amazon Fraud Detector to decide how to use
  /// the unlabeled data. This is recommended when there is significant unlabeled
  /// events in the dataset.
  /// </li>
  /// </ul>
  /// By default, Amazon Fraud Detector ignores the unlabeled data.
  final UnlabeledEventsTreatment? unlabeledEventsTreatment;

  LabelSchema({
    this.labelMapper,
    this.unlabeledEventsTreatment,
  });

  factory LabelSchema.fromJson(Map<String, dynamic> json) {
    return LabelSchema(
      labelMapper: (json['labelMapper'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      unlabeledEventsTreatment: (json['unlabeledEventsTreatment'] as String?)
          ?.toUnlabeledEventsTreatment(),
    );
  }

  Map<String, dynamic> toJson() {
    final labelMapper = this.labelMapper;
    final unlabeledEventsTreatment = this.unlabeledEventsTreatment;
    return {
      if (labelMapper != null) 'labelMapper': labelMapper,
      if (unlabeledEventsTreatment != null)
        'unlabeledEventsTreatment': unlabeledEventsTreatment.toValue(),
    };
  }
}

enum Language {
  detectorpl,
}

extension LanguageValueExtension on Language {
  String toValue() {
    switch (this) {
      case Language.detectorpl:
        return 'DETECTORPL';
    }
  }
}

extension LanguageFromString on String {
  Language toLanguage() {
    switch (this) {
      case 'DETECTORPL':
        return Language.detectorpl;
    }
    throw Exception('$this is not known in enum Language');
  }
}

class ListEventPredictionsResult {
  /// The summary of the past predictions.
  final List<EventPredictionSummary>? eventPredictionSummaries;

  /// Identifies the next page of results to return. Use the token to make the
  /// call again to retrieve the next page. Keep all other arguments unchanged.
  /// Each pagination token expires after 24 hours.
  final String? nextToken;

  ListEventPredictionsResult({
    this.eventPredictionSummaries,
    this.nextToken,
  });

  factory ListEventPredictionsResult.fromJson(Map<String, dynamic> json) {
    return ListEventPredictionsResult(
      eventPredictionSummaries: (json['eventPredictionSummaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => EventPredictionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventPredictionSummaries = this.eventPredictionSummaries;
    final nextToken = this.nextToken;
    return {
      if (eventPredictionSummaries != null)
        'eventPredictionSummaries': eventPredictionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

enum ListUpdateMode {
  replace,
  append,
  remove,
}

extension ListUpdateModeValueExtension on ListUpdateMode {
  String toValue() {
    switch (this) {
      case ListUpdateMode.replace:
        return 'REPLACE';
      case ListUpdateMode.append:
        return 'APPEND';
      case ListUpdateMode.remove:
        return 'REMOVE';
    }
  }
}

extension ListUpdateModeFromString on String {
  ListUpdateMode toListUpdateMode() {
    switch (this) {
      case 'REPLACE':
        return ListUpdateMode.replace;
      case 'APPEND':
        return ListUpdateMode.append;
      case 'REMOVE':
        return ListUpdateMode.remove;
    }
    throw Exception('$this is not known in enum ListUpdateMode');
  }
}

/// The log odds metric details.
class LogOddsMetric {
  /// The relative importance of the variable. For more information, see <a
  /// href="https://docs.aws.amazon.com/frauddetector/latest/ug/model-variable-importance.html">Model
  /// variable importance</a>.
  final double variableImportance;

  /// The name of the variable.
  final String variableName;

  /// The type of variable.
  final String variableType;

  LogOddsMetric({
    required this.variableImportance,
    required this.variableName,
    required this.variableType,
  });

  factory LogOddsMetric.fromJson(Map<String, dynamic> json) {
    return LogOddsMetric(
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

extension ModelEndpointStatusValueExtension on ModelEndpointStatus {
  String toValue() {
    switch (this) {
      case ModelEndpointStatus.associated:
        return 'ASSOCIATED';
      case ModelEndpointStatus.dissociated:
        return 'DISSOCIATED';
    }
  }
}

extension ModelEndpointStatusFromString on String {
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

extension ModelInputDataFormatValueExtension on ModelInputDataFormat {
  String toValue() {
    switch (this) {
      case ModelInputDataFormat.textCsv:
        return 'TEXT_CSV';
      case ModelInputDataFormat.applicationJson:
        return 'APPLICATION_JSON';
    }
  }
}

extension ModelInputDataFormatFromString on String {
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

extension ModelOutputDataFormatValueExtension on ModelOutputDataFormat {
  String toValue() {
    switch (this) {
      case ModelOutputDataFormat.textCsv:
        return 'TEXT_CSV';
      case ModelOutputDataFormat.applicationJsonlines:
        return 'APPLICATION_JSONLINES';
    }
  }
}

extension ModelOutputDataFormatFromString on String {
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

extension ModelSourceValueExtension on ModelSource {
  String toValue() {
    switch (this) {
      case ModelSource.sagemaker:
        return 'SAGEMAKER';
    }
  }
}

extension ModelSourceFromString on String {
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
  transactionFraudInsights,
  accountTakeoverInsights,
}

extension ModelTypeEnumValueExtension on ModelTypeEnum {
  String toValue() {
    switch (this) {
      case ModelTypeEnum.onlineFraudInsights:
        return 'ONLINE_FRAUD_INSIGHTS';
      case ModelTypeEnum.transactionFraudInsights:
        return 'TRANSACTION_FRAUD_INSIGHTS';
      case ModelTypeEnum.accountTakeoverInsights:
        return 'ACCOUNT_TAKEOVER_INSIGHTS';
    }
  }
}

extension ModelTypeEnumFromString on String {
  ModelTypeEnum toModelTypeEnum() {
    switch (this) {
      case 'ONLINE_FRAUD_INSIGHTS':
        return ModelTypeEnum.onlineFraudInsights;
      case 'TRANSACTION_FRAUD_INSIGHTS':
        return ModelTypeEnum.transactionFraudInsights;
      case 'ACCOUNT_TAKEOVER_INSIGHTS':
        return ModelTypeEnum.accountTakeoverInsights;
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

  /// The external events data details. This will be populated if the
  /// <code>trainingDataSource</code> for the model version is specified as
  /// <code>EXTERNAL_EVENTS</code>.
  final ExternalEventsDetail? externalEventsDetail;

  /// The ingested events data details. This will be populated if the
  /// <code>trainingDataSource</code> for the model version is specified as
  /// <code>INGESTED_EVENTS</code>.
  final IngestedEventsDetail? ingestedEventsDetail;

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

  /// The training result details. The details include the relative importance of
  /// the variables.
  final TrainingResultV2? trainingResultV2;

  ModelVersionDetail({
    this.arn,
    this.createdTime,
    this.externalEventsDetail,
    this.ingestedEventsDetail,
    this.lastUpdatedTime,
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.status,
    this.trainingDataSchema,
    this.trainingDataSource,
    this.trainingResult,
    this.trainingResultV2,
  });

  factory ModelVersionDetail.fromJson(Map<String, dynamic> json) {
    return ModelVersionDetail(
      arn: json['arn'] as String?,
      createdTime: json['createdTime'] as String?,
      externalEventsDetail: json['externalEventsDetail'] != null
          ? ExternalEventsDetail.fromJson(
              json['externalEventsDetail'] as Map<String, dynamic>)
          : null,
      ingestedEventsDetail: json['ingestedEventsDetail'] != null
          ? IngestedEventsDetail.fromJson(
              json['ingestedEventsDetail'] as Map<String, dynamic>)
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
      trainingResultV2: json['trainingResultV2'] != null
          ? TrainingResultV2.fromJson(
              json['trainingResultV2'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final externalEventsDetail = this.externalEventsDetail;
    final ingestedEventsDetail = this.ingestedEventsDetail;
    final lastUpdatedTime = this.lastUpdatedTime;
    final modelId = this.modelId;
    final modelType = this.modelType;
    final modelVersionNumber = this.modelVersionNumber;
    final status = this.status;
    final trainingDataSchema = this.trainingDataSchema;
    final trainingDataSource = this.trainingDataSource;
    final trainingResult = this.trainingResult;
    final trainingResultV2 = this.trainingResultV2;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': createdTime,
      if (externalEventsDetail != null)
        'externalEventsDetail': externalEventsDetail,
      if (ingestedEventsDetail != null)
        'ingestedEventsDetail': ingestedEventsDetail,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (modelId != null) 'modelId': modelId,
      if (modelType != null) 'modelType': modelType.toValue(),
      if (modelVersionNumber != null) 'modelVersionNumber': modelVersionNumber,
      if (status != null) 'status': status,
      if (trainingDataSchema != null) 'trainingDataSchema': trainingDataSchema,
      if (trainingDataSource != null)
        'trainingDataSource': trainingDataSource.toValue(),
      if (trainingResult != null) 'trainingResult': trainingResult,
      if (trainingResultV2 != null) 'trainingResultV2': trainingResultV2,
    };
  }
}

/// The model version evalutions.
class ModelVersionEvaluation {
  /// The evaluation score generated for the model version.
  final String? evaluationScore;

  /// The output variable name.
  final String? outputVariableName;

  /// The prediction explanations generated for the model version.
  final PredictionExplanations? predictionExplanations;

  ModelVersionEvaluation({
    this.evaluationScore,
    this.outputVariableName,
    this.predictionExplanations,
  });

  factory ModelVersionEvaluation.fromJson(Map<String, dynamic> json) {
    return ModelVersionEvaluation(
      evaluationScore: json['evaluationScore'] as String?,
      outputVariableName: json['outputVariableName'] as String?,
      predictionExplanations: json['predictionExplanations'] != null
          ? PredictionExplanations.fromJson(
              json['predictionExplanations'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationScore = this.evaluationScore;
    final outputVariableName = this.outputVariableName;
    final predictionExplanations = this.predictionExplanations;
    return {
      if (evaluationScore != null) 'evaluationScore': evaluationScore,
      if (outputVariableName != null) 'outputVariableName': outputVariableName,
      if (predictionExplanations != null)
        'predictionExplanations': predictionExplanations,
    };
  }
}

enum ModelVersionStatus {
  active,
  inactive,
  trainingCancelled,
}

extension ModelVersionStatusValueExtension on ModelVersionStatus {
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

extension ModelVersionStatusFromString on String {
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

/// The Online Fraud Insights (OFI) model performance metrics data points.
class OFIMetricDataPoint {
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

  OFIMetricDataPoint({
    this.fpr,
    this.precision,
    this.threshold,
    this.tpr,
  });

  factory OFIMetricDataPoint.fromJson(Map<String, dynamic> json) {
    return OFIMetricDataPoint(
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

/// The Online Fraud Insights (OFI) model performance score.
class OFIModelPerformance {
  /// The area under the curve (auc). This summarizes the total positive rate
  /// (tpr) and false positive rate (FPR) across all possible model score
  /// thresholds.
  final double? auc;

  /// Indicates the range of area under curve (auc) expected from the OFI model. A
  /// range greater than 0.1 indicates higher model uncertainity.
  final UncertaintyRange? uncertaintyRange;

  OFIModelPerformance({
    this.auc,
    this.uncertaintyRange,
  });

  factory OFIModelPerformance.fromJson(Map<String, dynamic> json) {
    return OFIModelPerformance(
      auc: json['auc'] as double?,
      uncertaintyRange: json['uncertaintyRange'] != null
          ? UncertaintyRange.fromJson(
              json['uncertaintyRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final auc = this.auc;
    final uncertaintyRange = this.uncertaintyRange;
    return {
      if (auc != null) 'auc': auc,
      if (uncertaintyRange != null) 'uncertaintyRange': uncertaintyRange,
    };
  }
}

/// The Online Fraud Insights (OFI) model training metric details.
class OFITrainingMetricsValue {
  /// The model's performance metrics data points.
  final List<OFIMetricDataPoint>? metricDataPoints;

  /// The model's overall performance score.
  final OFIModelPerformance? modelPerformance;

  OFITrainingMetricsValue({
    this.metricDataPoints,
    this.modelPerformance,
  });

  factory OFITrainingMetricsValue.fromJson(Map<String, dynamic> json) {
    return OFITrainingMetricsValue(
      metricDataPoints: (json['metricDataPoints'] as List?)
          ?.whereNotNull()
          .map((e) => OFIMetricDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelPerformance: json['modelPerformance'] != null
          ? OFIModelPerformance.fromJson(
              json['modelPerformance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDataPoints = this.metricDataPoints;
    final modelPerformance = this.modelPerformance;
    return {
      if (metricDataPoints != null) 'metricDataPoints': metricDataPoints,
      if (modelPerformance != null) 'modelPerformance': modelPerformance,
    };
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

/// The prediction explanations that provide insight into how each event
/// variable impacted the model version's fraud prediction score.
class PredictionExplanations {
  /// The details of the aggregated variables impact on the prediction score.
  ///
  /// Account Takeover Insights (ATI) model uses event variables from the login
  /// data you provide to continuously calculate a set of variables (aggregated
  /// variables) based on historical events. For example, your ATI model might
  /// calculate the number of times an user has logged in using the same IP
  /// address. In this case, event variables used to derive the aggregated
  /// variables are <code>IP address</code> and <code>user</code>.
  final List<AggregatedVariablesImpactExplanation>?
      aggregatedVariablesImpactExplanations;

  /// The details of the event variable's impact on the prediction score.
  final List<VariableImpactExplanation>? variableImpactExplanations;

  PredictionExplanations({
    this.aggregatedVariablesImpactExplanations,
    this.variableImpactExplanations,
  });

  factory PredictionExplanations.fromJson(Map<String, dynamic> json) {
    return PredictionExplanations(
      aggregatedVariablesImpactExplanations:
          (json['aggregatedVariablesImpactExplanations'] as List?)
              ?.whereNotNull()
              .map((e) => AggregatedVariablesImpactExplanation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      variableImpactExplanations: (json['variableImpactExplanations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              VariableImpactExplanation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedVariablesImpactExplanations =
        this.aggregatedVariablesImpactExplanations;
    final variableImpactExplanations = this.variableImpactExplanations;
    return {
      if (aggregatedVariablesImpactExplanations != null)
        'aggregatedVariablesImpactExplanations':
            aggregatedVariablesImpactExplanations,
      if (variableImpactExplanations != null)
        'variableImpactExplanations': variableImpactExplanations,
    };
  }
}

/// The time period for when the predictions were generated.
class PredictionTimeRange {
  /// The end time of the time period for when the predictions were generated.
  final String endTime;

  /// The start time of the time period for when the predictions were generated.
  final String startTime;

  PredictionTimeRange({
    required this.endTime,
    required this.startTime,
  });

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'endTime': endTime,
      'startTime': startTime,
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

extension RuleExecutionModeValueExtension on RuleExecutionMode {
  String toValue() {
    switch (this) {
      case RuleExecutionMode.allMatched:
        return 'ALL_MATCHED';
      case RuleExecutionMode.firstMatched:
        return 'FIRST_MATCHED';
    }
  }
}

extension RuleExecutionModeFromString on String {
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

class SendEventResult {
  SendEventResult();

  factory SendEventResult.fromJson(Map<String, dynamic> _) {
    return SendEventResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The performance metrics data points for Transaction Fraud Insights (TFI)
/// model.
class TFIMetricDataPoint {
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

  TFIMetricDataPoint({
    this.fpr,
    this.precision,
    this.threshold,
    this.tpr,
  });

  factory TFIMetricDataPoint.fromJson(Map<String, dynamic> json) {
    return TFIMetricDataPoint(
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

/// The Transaction Fraud Insights (TFI) model performance score.
class TFIModelPerformance {
  /// The area under the curve (auc). This summarizes the total positive rate
  /// (tpr) and false positive rate (FPR) across all possible model score
  /// thresholds.
  final double? auc;

  /// Indicates the range of area under curve (auc) expected from the TFI model. A
  /// range greater than 0.1 indicates higher model uncertainity.
  final UncertaintyRange? uncertaintyRange;

  TFIModelPerformance({
    this.auc,
    this.uncertaintyRange,
  });

  factory TFIModelPerformance.fromJson(Map<String, dynamic> json) {
    return TFIModelPerformance(
      auc: json['auc'] as double?,
      uncertaintyRange: json['uncertaintyRange'] != null
          ? UncertaintyRange.fromJson(
              json['uncertaintyRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final auc = this.auc;
    final uncertaintyRange = this.uncertaintyRange;
    return {
      if (auc != null) 'auc': auc,
      if (uncertaintyRange != null) 'uncertaintyRange': uncertaintyRange,
    };
  }
}

/// The Transaction Fraud Insights (TFI) model training metric details.
class TFITrainingMetricsValue {
  /// The model's performance metrics data points.
  final List<TFIMetricDataPoint>? metricDataPoints;

  /// The model performance score.
  final TFIModelPerformance? modelPerformance;

  TFITrainingMetricsValue({
    this.metricDataPoints,
    this.modelPerformance,
  });

  factory TFITrainingMetricsValue.fromJson(Map<String, dynamic> json) {
    return TFITrainingMetricsValue(
      metricDataPoints: (json['metricDataPoints'] as List?)
          ?.whereNotNull()
          .map((e) => TFIMetricDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelPerformance: json['modelPerformance'] != null
          ? TFIModelPerformance.fromJson(
              json['modelPerformance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDataPoints = this.metricDataPoints;
    final modelPerformance = this.modelPerformance;
    return {
      if (metricDataPoints != null) 'metricDataPoints': metricDataPoints,
      if (modelPerformance != null) 'modelPerformance': modelPerformance,
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
  /// The training data schema variables.
  final List<String> modelVariables;
  final LabelSchema? labelSchema;

  TrainingDataSchema({
    required this.modelVariables,
    this.labelSchema,
  });

  factory TrainingDataSchema.fromJson(Map<String, dynamic> json) {
    return TrainingDataSchema(
      modelVariables: (json['modelVariables'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      labelSchema: json['labelSchema'] != null
          ? LabelSchema.fromJson(json['labelSchema'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelVariables = this.modelVariables;
    final labelSchema = this.labelSchema;
    return {
      'modelVariables': modelVariables,
      if (labelSchema != null) 'labelSchema': labelSchema,
    };
  }
}

enum TrainingDataSourceEnum {
  externalEvents,
  ingestedEvents,
}

extension TrainingDataSourceEnumValueExtension on TrainingDataSourceEnum {
  String toValue() {
    switch (this) {
      case TrainingDataSourceEnum.externalEvents:
        return 'EXTERNAL_EVENTS';
      case TrainingDataSourceEnum.ingestedEvents:
        return 'INGESTED_EVENTS';
    }
  }
}

extension TrainingDataSourceEnumFromString on String {
  TrainingDataSourceEnum toTrainingDataSourceEnum() {
    switch (this) {
      case 'EXTERNAL_EVENTS':
        return TrainingDataSourceEnum.externalEvents;
      case 'INGESTED_EVENTS':
        return TrainingDataSourceEnum.ingestedEvents;
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

/// The training metrics details.
class TrainingMetricsV2 {
  /// The Account Takeover Insights (ATI) model training metric details.
  final ATITrainingMetricsValue? ati;

  /// The Online Fraud Insights (OFI) model training metric details.
  final OFITrainingMetricsValue? ofi;

  /// The Transaction Fraud Insights (TFI) model training metric details.
  final TFITrainingMetricsValue? tfi;

  TrainingMetricsV2({
    this.ati,
    this.ofi,
    this.tfi,
  });

  factory TrainingMetricsV2.fromJson(Map<String, dynamic> json) {
    return TrainingMetricsV2(
      ati: json['ati'] != null
          ? ATITrainingMetricsValue.fromJson(
              json['ati'] as Map<String, dynamic>)
          : null,
      ofi: json['ofi'] != null
          ? OFITrainingMetricsValue.fromJson(
              json['ofi'] as Map<String, dynamic>)
          : null,
      tfi: json['tfi'] != null
          ? TFITrainingMetricsValue.fromJson(
              json['tfi'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ati = this.ati;
    final ofi = this.ofi;
    final tfi = this.tfi;
    return {
      if (ati != null) 'ati': ati,
      if (ofi != null) 'ofi': ofi,
      if (tfi != null) 'tfi': tfi,
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

/// The training result details.
class TrainingResultV2 {
  /// The variable importance metrics of the aggregated variables.
  ///
  /// Account Takeover Insights (ATI) model uses event variables from the login
  /// data you provide to continuously calculate a set of variables (aggregated
  /// variables) based on historical events. For example, your ATI model might
  /// calculate the number of times an user has logged in using the same IP
  /// address. In this case, event variables used to derive the aggregated
  /// variables are <code>IP address</code> and <code>user</code>.
  final AggregatedVariablesImportanceMetrics?
      aggregatedVariablesImportanceMetrics;
  final DataValidationMetrics? dataValidationMetrics;

  /// The training metric details.
  final TrainingMetricsV2? trainingMetricsV2;
  final VariableImportanceMetrics? variableImportanceMetrics;

  TrainingResultV2({
    this.aggregatedVariablesImportanceMetrics,
    this.dataValidationMetrics,
    this.trainingMetricsV2,
    this.variableImportanceMetrics,
  });

  factory TrainingResultV2.fromJson(Map<String, dynamic> json) {
    return TrainingResultV2(
      aggregatedVariablesImportanceMetrics:
          json['aggregatedVariablesImportanceMetrics'] != null
              ? AggregatedVariablesImportanceMetrics.fromJson(
                  json['aggregatedVariablesImportanceMetrics']
                      as Map<String, dynamic>)
              : null,
      dataValidationMetrics: json['dataValidationMetrics'] != null
          ? DataValidationMetrics.fromJson(
              json['dataValidationMetrics'] as Map<String, dynamic>)
          : null,
      trainingMetricsV2: json['trainingMetricsV2'] != null
          ? TrainingMetricsV2.fromJson(
              json['trainingMetricsV2'] as Map<String, dynamic>)
          : null,
      variableImportanceMetrics: json['variableImportanceMetrics'] != null
          ? VariableImportanceMetrics.fromJson(
              json['variableImportanceMetrics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedVariablesImportanceMetrics =
        this.aggregatedVariablesImportanceMetrics;
    final dataValidationMetrics = this.dataValidationMetrics;
    final trainingMetricsV2 = this.trainingMetricsV2;
    final variableImportanceMetrics = this.variableImportanceMetrics;
    return {
      if (aggregatedVariablesImportanceMetrics != null)
        'aggregatedVariablesImportanceMetrics':
            aggregatedVariablesImportanceMetrics,
      if (dataValidationMetrics != null)
        'dataValidationMetrics': dataValidationMetrics,
      if (trainingMetricsV2 != null) 'trainingMetricsV2': trainingMetricsV2,
      if (variableImportanceMetrics != null)
        'variableImportanceMetrics': variableImportanceMetrics,
    };
  }
}

/// Range of area under curve (auc) expected from the model. A range greater
/// than 0.1 indicates higher model uncertainity. A range is the difference
/// between upper and lower bound of auc.
class UncertaintyRange {
  /// The lower bound value of the area under curve (auc).
  final double lowerBoundValue;

  /// The upper bound value of the area under curve (auc).
  final double upperBoundValue;

  UncertaintyRange({
    required this.lowerBoundValue,
    required this.upperBoundValue,
  });

  factory UncertaintyRange.fromJson(Map<String, dynamic> json) {
    return UncertaintyRange(
      lowerBoundValue: json['lowerBoundValue'] as double,
      upperBoundValue: json['upperBoundValue'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final lowerBoundValue = this.lowerBoundValue;
    final upperBoundValue = this.upperBoundValue;
    return {
      'lowerBoundValue': lowerBoundValue,
      'upperBoundValue': upperBoundValue,
    };
  }
}

enum UnlabeledEventsTreatment {
  ignore,
  fraud,
  legit,
  auto,
}

extension UnlabeledEventsTreatmentValueExtension on UnlabeledEventsTreatment {
  String toValue() {
    switch (this) {
      case UnlabeledEventsTreatment.ignore:
        return 'IGNORE';
      case UnlabeledEventsTreatment.fraud:
        return 'FRAUD';
      case UnlabeledEventsTreatment.legit:
        return 'LEGIT';
      case UnlabeledEventsTreatment.auto:
        return 'AUTO';
    }
  }
}

extension UnlabeledEventsTreatmentFromString on String {
  UnlabeledEventsTreatment toUnlabeledEventsTreatment() {
    switch (this) {
      case 'IGNORE':
        return UnlabeledEventsTreatment.ignore;
      case 'FRAUD':
        return UnlabeledEventsTreatment.fraud;
      case 'LEGIT':
        return UnlabeledEventsTreatment.legit;
      case 'AUTO':
        return UnlabeledEventsTreatment.auto;
    }
    throw Exception('$this is not known in enum UnlabeledEventsTreatment');
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

class UpdateEventLabelResult {
  UpdateEventLabelResult();

  factory UpdateEventLabelResult.fromJson(Map<String, dynamic> _) {
    return UpdateEventLabelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateListResult {
  UpdateListResult();

  factory UpdateListResult.fromJson(Map<String, dynamic> _) {
    return UpdateListResult();
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

/// The details of the event variable's impact on the prediction score.
class VariableImpactExplanation {
  /// The event variable name.
  final String? eventVariableName;

  /// The raw, uninterpreted value represented as log-odds of the fraud. These
  /// values are usually between -10 to +10, but range from - infinity to +
  /// infinity.
  ///
  /// <ul>
  /// <li>
  /// A positive value indicates that the variable drove the risk score up.
  /// </li>
  /// <li>
  /// A negative value indicates that the variable drove the risk score down.
  /// </li>
  /// </ul>
  final double? logOddsImpact;

  /// The event variable's relative impact in terms of magnitude on the prediction
  /// scores. The relative impact values consist of a numerical rating (0-5, 5
  /// being the highest) and direction (increased/decreased) impact of the fraud
  /// risk.
  final String? relativeImpact;

  VariableImpactExplanation({
    this.eventVariableName,
    this.logOddsImpact,
    this.relativeImpact,
  });

  factory VariableImpactExplanation.fromJson(Map<String, dynamic> json) {
    return VariableImpactExplanation(
      eventVariableName: json['eventVariableName'] as String?,
      logOddsImpact: json['logOddsImpact'] as double?,
      relativeImpact: json['relativeImpact'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventVariableName = this.eventVariableName;
    final logOddsImpact = this.logOddsImpact;
    final relativeImpact = this.relativeImpact;
    return {
      if (eventVariableName != null) 'eventVariableName': eventVariableName,
      if (logOddsImpact != null) 'logOddsImpact': logOddsImpact,
      if (relativeImpact != null) 'relativeImpact': relativeImpact,
    };
  }
}

/// The variable importance metrics details.
class VariableImportanceMetrics {
  /// List of variable metrics.
  final List<LogOddsMetric>? logOddsMetrics;

  VariableImportanceMetrics({
    this.logOddsMetrics,
  });

  factory VariableImportanceMetrics.fromJson(Map<String, dynamic> json) {
    return VariableImportanceMetrics(
      logOddsMetrics: (json['logOddsMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => LogOddsMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logOddsMetrics = this.logOddsMetrics;
    return {
      if (logOddsMetrics != null) 'logOddsMetrics': logOddsMetrics,
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

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
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
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
