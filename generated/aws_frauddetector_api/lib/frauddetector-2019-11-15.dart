// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'frauddetector-2019-11-15.g.dart';

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
          service: 'frauddetector',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a batch of variables.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [variableEntries] :
  /// The list of variables for the batch create variable request.
  Future<BatchCreateVariableResult> batchCreateVariable({
    @_s.required List<VariableEntry> variableEntries,
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
      payload: BatchCreateVariableRequest(
        variableEntries: variableEntries,
      ),
    );

    return BatchCreateVariableResult.fromJson(jsonResponse.body);
  }

  /// Gets a batch of variables.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      payload: BatchGetVariableRequest(
        names: names,
      ),
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
  Future<CreateDetectorVersionResult> createDetectorVersion({
    @_s.required String detectorId,
    @_s.required List<Rule> rules,
    String description,
    List<String> externalModelEndpoints,
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
      payload: CreateDetectorVersionRequest(
        detectorId: detectorId,
        rules: rules,
        description: description,
        externalModelEndpoints: externalModelEndpoints,
        modelVersions: modelVersions,
        ruleExecutionMode: ruleExecutionMode,
      ),
    );

    return CreateDetectorVersionResult.fromJson(jsonResponse.body);
  }

  /// Creates a version of the model using the specified model type.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [description] :
  /// The model version description.
  Future<CreateModelVersionResult> createModelVersion({
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
      r'''^[0-9a-z_-]+$''',
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
      'X-Amz-Target': 'AWSHawksNestServiceFacade.CreateModelVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateModelVersionRequest(
        modelId: modelId,
        modelType: modelType,
        description: description,
      ),
    );

    return CreateModelVersionResult.fromJson(jsonResponse.body);
  }

  /// Creates a rule for use with the specified detector.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  Future<CreateRuleResult> createRule({
    @_s.required String detectorId,
    @_s.required String expression,
    @_s.required Language language,
    @_s.required List<String> outcomes,
    @_s.required String ruleId,
    String description,
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
      payload: CreateRuleRequest(
        detectorId: detectorId,
        expression: expression,
        language: language,
        outcomes: outcomes,
        ruleId: ruleId,
        description: description,
      ),
    );

    return CreateRuleResult.fromJson(jsonResponse.body);
  }

  /// Creates a variable.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// Parameter [variableType] :
  /// The variable type.
  Future<void> createVariable({
    @_s.required DataSource dataSource,
    @_s.required DataType dataType,
    @_s.required String defaultValue,
    @_s.required String name,
    String description,
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
      payload: CreateVariableRequest(
        dataSource: dataSource,
        dataType: dataType,
        defaultValue: defaultValue,
        name: name,
        description: description,
        variableType: variableType,
      ),
    );

    return CreateVariableResult.fromJson(jsonResponse.body);
  }

  /// Deletes the detector. Before deleting a detector, you must first delete
  /// all detector versions and rule versions associated with the detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      payload: DeleteDetectorRequest(
        detectorId: detectorId,
      ),
    );

    return DeleteDetectorResult.fromJson(jsonResponse.body);
  }

  /// Deletes the detector version. You cannot delete detector versions that are
  /// in <code>ACTIVE</code> status.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
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
      1152921504606846976,
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
      payload: DeleteDetectorVersionRequest(
        detectorId: detectorId,
        detectorVersionId: detectorVersionId,
      ),
    );

    return DeleteDetectorVersionResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified event.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [eventId] :
  /// The ID of the event to delete.
  Future<void> deleteEvent({
    @_s.required String eventId,
  }) async {
    ArgumentError.checkNotNull(eventId, 'eventId');
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
      payload: DeleteEventRequest(
        eventId: eventId,
      ),
    );

    return DeleteEventResult.fromJson(jsonResponse.body);
  }

  /// Deletes the rule version. You cannot delete a rule version if it is used
  /// by an <code>ACTIVE</code> or <code>INACTIVE</code> detector version.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector that includes the rule version to delete.
  ///
  /// Parameter [ruleId] :
  /// The rule ID of the rule version to delete.
  ///
  /// Parameter [ruleVersion] :
  /// The rule version to delete.
  Future<void> deleteRuleVersion({
    @_s.required String detectorId,
    @_s.required String ruleId,
    @_s.required String ruleVersion,
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
    ArgumentError.checkNotNull(ruleVersion, 'ruleVersion');
    _s.validateStringLength(
      'ruleVersion',
      ruleVersion,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.DeleteRuleVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteRuleVersionRequest(
        detectorId: detectorId,
        ruleId: ruleId,
        ruleVersion: ruleVersion,
      ),
    );

    return DeleteRuleVersionResult.fromJson(jsonResponse.body);
  }

  /// Gets all versions for a specified detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      payload: DescribeDetectorRequest(
        detectorId: detectorId,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
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
  /// The model version.
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
      r'''^[0-9a-z_-]+$''',
    );
    _s.validateStringLength(
      'modelVersionNumber',
      modelVersionNumber,
      1,
      1152921504606846976,
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
      payload: DescribeModelVersionsRequest(
        maxResults: maxResults,
        modelId: modelId,
        modelType: modelType,
        modelVersionNumber: modelVersionNumber,
        nextToken: nextToken,
      ),
    );

    return DescribeModelVersionsResult.fromJson(jsonResponse.body);
  }

  /// Gets a particular detector version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      1152921504606846976,
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
      payload: GetDetectorVersionRequest(
        detectorId: detectorId,
        detectorVersionId: detectorVersionId,
      ),
    );

    return GetDetectorVersionResult.fromJson(jsonResponse.body);
  }

  /// Gets all of detectors. This is a paginated API. If you provide a null
  /// <code>maxSizePerPage</code>, this actions retrieves a maximum of 10
  /// records per page. If you provide a <code>maxSizePerPage</code>, the value
  /// must be between 5 and 10. To get the next page results, provide the
  /// pagination token from the <code>GetEventTypesResponse</code> as part of
  /// your request. A null pagination token fetches the records from the
  /// beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      payload: GetDetectorsRequest(
        detectorId: detectorId,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetDetectorsResult.fromJson(jsonResponse.body);
  }

  /// Gets the details for one or more Amazon SageMaker models that have been
  /// imported into the service. This is a paginated API. If you provide a null
  /// <code>maxSizePerPage</code>, this actions retrieves a maximum of 10
  /// records per page. If you provide a <code>maxSizePerPage</code>, the value
  /// must be between 5 and 10. To get the next page results, provide the
  /// pagination token from the <code>GetExternalModelsResult</code> as part of
  /// your request. A null pagination token fetches the records from the
  /// beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      payload: GetExternalModelsRequest(
        maxResults: maxResults,
        modelEndpoint: modelEndpoint,
        nextToken: nextToken,
      ),
    );

    return GetExternalModelsResult.fromJson(jsonResponse.body);
  }

  /// Gets a model version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [modelVersionNumber] :
  /// The model version.
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
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    ArgumentError.checkNotNull(modelVersionNumber, 'modelVersionNumber');
    _s.validateStringLength(
      'modelVersionNumber',
      modelVersionNumber,
      1,
      1152921504606846976,
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
      payload: GetModelVersionRequest(
        modelId: modelId,
        modelType: modelType,
        modelVersionNumber: modelVersionNumber,
      ),
    );

    return GetModelVersionResult.fromJson(jsonResponse.body);
  }

  /// Gets all of the models for the AWS account, or the specified model type,
  /// or gets a single model for the specified model type, model ID combination.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum results to return for the request.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [nextToken] :
  /// The next token for the request.
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
      r'''^[0-9a-z_-]+$''',
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
      payload: GetModelsRequest(
        maxResults: maxResults,
        modelId: modelId,
        modelType: modelType,
        nextToken: nextToken,
      ),
    );

    return GetModelsResult.fromJson(jsonResponse.body);
  }

  /// Gets one or more outcomes. This is a paginated API. If you provide a null
  /// <code>maxSizePerPage</code>, this actions retrieves a maximum of 10
  /// records per page. If you provide a <code>maxSizePerPage</code>, the value
  /// must be between 50 and 100. To get the next page results, provide the
  /// pagination token from the <code>GetOutcomesResult</code> as part of your
  /// request. A null pagination token fetches the records from the beginning.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      payload: GetOutcomesRequest(
        maxResults: maxResults,
        name: name,
        nextToken: nextToken,
      ),
    );

    return GetOutcomesResult.fromJson(jsonResponse.body);
  }

  /// Evaluates an event against a detector version. If a version ID is not
  /// provided, the detector’s (<code>ACTIVE</code>) version is used.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [eventId] :
  /// The unique ID used to identify the event.
  ///
  /// Parameter [detectorVersionId] :
  /// The detector version ID.
  ///
  /// Parameter [eventAttributes] :
  /// Names of variables you defined in Amazon Fraud Detector to represent event
  /// data elements and their corresponding values for the event you are sending
  /// for evaluation.
  ///
  /// Parameter [externalModelEndpointDataBlobs] :
  /// The Amazon SageMaker model endpoint input data blobs.
  Future<GetPredictionResult> getPrediction({
    @_s.required String detectorId,
    @_s.required String eventId,
    String detectorVersionId,
    Map<String, String> eventAttributes,
    Map<String, ModelEndpointDataBlob> externalModelEndpointDataBlobs,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    ArgumentError.checkNotNull(eventId, 'eventId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.GetPrediction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetPredictionRequest(
        detectorId: detectorId,
        eventId: eventId,
        detectorVersionId: detectorVersionId,
        eventAttributes: eventAttributes,
        externalModelEndpointDataBlobs: externalModelEndpointDataBlobs,
      ),
    );

    return GetPredictionResult.fromJson(jsonResponse.body);
  }

  /// Gets all rules available for the specified detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      1152921504606846976,
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
      payload: GetRulesRequest(
        detectorId: detectorId,
        maxResults: maxResults,
        nextToken: nextToken,
        ruleId: ruleId,
        ruleVersion: ruleVersion,
      ),
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
      payload: GetVariablesRequest(
        maxResults: maxResults,
        name: name,
        nextToken: nextToken,
      ),
    );

    return GetVariablesResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates a detector.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [detectorId] :
  /// The detector ID.
  ///
  /// Parameter [description] :
  /// The description of the detector.
  Future<void> putDetector({
    @_s.required String detectorId,
    String description,
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
      payload: PutDetectorRequest(
        detectorId: detectorId,
        description: description,
      ),
    );

    return PutDetectorResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates an Amazon SageMaker model endpoint. You can also use
  /// this action to update the configuration of the model endpoint, including
  /// the IAM role and/or the mapped variables.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [inputConfiguration] :
  /// The model endpoint input configuration.
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
  /// Parameter [role] :
  /// The IAM role used to invoke the model endpoint.
  Future<void> putExternalModel({
    @_s.required ModelInputConfiguration inputConfiguration,
    @_s.required String modelEndpoint,
    @_s.required ModelEndpointStatus modelEndpointStatus,
    @_s.required ModelSource modelSource,
    @_s.required ModelOutputConfiguration outputConfiguration,
    @_s.required Role role,
  }) async {
    ArgumentError.checkNotNull(inputConfiguration, 'inputConfiguration');
    ArgumentError.checkNotNull(modelEndpoint, 'modelEndpoint');
    ArgumentError.checkNotNull(modelEndpointStatus, 'modelEndpointStatus');
    ArgumentError.checkNotNull(modelSource, 'modelSource');
    ArgumentError.checkNotNull(outputConfiguration, 'outputConfiguration');
    ArgumentError.checkNotNull(role, 'role');
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
      payload: PutExternalModelRequest(
        inputConfiguration: inputConfiguration,
        modelEndpoint: modelEndpoint,
        modelEndpointStatus: modelEndpointStatus,
        modelSource: modelSource,
        outputConfiguration: outputConfiguration,
        role: role,
      ),
    );

    return PutExternalModelResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates a model.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [labelSchema] :
  /// The label schema.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [modelVariables] :
  /// The model input variables.
  ///
  /// Parameter [trainingDataSource] :
  /// The training data source location in Amazon S3.
  ///
  /// Parameter [description] :
  /// The model description.
  Future<void> putModel({
    @_s.required LabelSchema labelSchema,
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    @_s.required List<ModelVariable> modelVariables,
    @_s.required TrainingDataSource trainingDataSource,
    String description,
  }) async {
    ArgumentError.checkNotNull(labelSchema, 'labelSchema');
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
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    ArgumentError.checkNotNull(modelVariables, 'modelVariables');
    ArgumentError.checkNotNull(trainingDataSource, 'trainingDataSource');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSHawksNestServiceFacade.PutModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: PutModelRequest(
        labelSchema: labelSchema,
        modelId: modelId,
        modelType: modelType,
        modelVariables: modelVariables,
        trainingDataSource: trainingDataSource,
        description: description,
      ),
    );

    return PutModelResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates an outcome.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the outcome.
  ///
  /// Parameter [description] :
  /// The outcome description.
  Future<void> putOutcome({
    @_s.required String name,
    String description,
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
      payload: PutOutcomeRequest(
        name: name,
        description: description,
      ),
    );

    return PutOutcomeResult.fromJson(jsonResponse.body);
  }

  /// Updates a detector version. The detector version attributes that you can
  /// update include models, external model endpoints, rules, and description.
  /// You can only update a <code>DRAFT</code> detector version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      1152921504606846976,
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
      payload: UpdateDetectorVersionRequest(
        detectorId: detectorId,
        detectorVersionId: detectorVersionId,
        externalModelEndpoints: externalModelEndpoints,
        rules: rules,
        description: description,
        modelVersions: modelVersions,
        ruleExecutionMode: ruleExecutionMode,
      ),
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
      1152921504606846976,
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
      payload: UpdateDetectorVersionMetadataRequest(
        description: description,
        detectorId: detectorId,
        detectorVersionId: detectorVersionId,
      ),
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
      1152921504606846976,
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
      payload: UpdateDetectorVersionStatusRequest(
        detectorId: detectorId,
        detectorVersionId: detectorVersionId,
        status: status,
      ),
    );

    return UpdateDetectorVersionStatusResult.fromJson(jsonResponse.body);
  }

  /// Updates a model version. You can update the description and status
  /// attributes using this action. You can perform the following status
  /// updates:
  /// <ol>
  /// <li>
  /// Change the <code>TRAINING_COMPLETE</code> status to <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// Change <code>ACTIVE</code> back to <code>TRAINING_COMPLETE</code>
  /// </li> </ol>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [description] :
  /// The model description.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [modelType] :
  /// The model type.
  ///
  /// Parameter [modelVersionNumber] :
  /// The model version.
  ///
  /// Parameter [status] :
  /// The new model status.
  Future<void> updateModelVersion({
    @_s.required String description,
    @_s.required String modelId,
    @_s.required ModelTypeEnum modelType,
    @_s.required String modelVersionNumber,
    @_s.required ModelVersionStatus status,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      1,
      128,
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
      r'''^[0-9a-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelType, 'modelType');
    ArgumentError.checkNotNull(modelVersionNumber, 'modelVersionNumber');
    _s.validateStringLength(
      'modelVersionNumber',
      modelVersionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
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
      payload: UpdateModelVersionRequest(
        description: description,
        modelId: modelId,
        modelType: modelType,
        modelVersionNumber: modelVersionNumber,
        status: status,
      ),
    );

    return UpdateModelVersionResult.fromJson(jsonResponse.body);
  }

  /// Updates a rule's metadata.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      payload: UpdateRuleMetadataRequest(
        description: description,
        rule: rule,
      ),
    );

    return UpdateRuleMetadataResult.fromJson(jsonResponse.body);
  }

  /// Updates a rule version resulting in a new rule version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  Future<UpdateRuleVersionResult> updateRuleVersion({
    @_s.required String expression,
    @_s.required Language language,
    @_s.required List<String> outcomes,
    @_s.required Rule rule,
    String description,
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
      payload: UpdateRuleVersionRequest(
        expression: expression,
        language: language,
        outcomes: outcomes,
        rule: rule,
        description: description,
      ),
    );

    return UpdateRuleVersionResult.fromJson(jsonResponse.body);
  }

  /// Updates a variable.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// The variable type.
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
      payload: UpdateVariableRequest(
        name: name,
        defaultValue: defaultValue,
        description: description,
        variableType: variableType,
      ),
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
    createFactory: false,
    createToJson: true)
class BatchCreateVariableRequest {
  /// The list of variables for the batch create variable request.
  @_s.JsonKey(name: 'variableEntries')
  final List<VariableEntry> variableEntries;

  BatchCreateVariableRequest({
    @_s.required this.variableEntries,
  });
  Map<String, dynamic> toJson() => _$BatchCreateVariableRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class BatchGetVariableRequest {
  /// The list of variable names to get.
  @_s.JsonKey(name: 'names')
  final List<String> names;

  BatchGetVariableRequest({
    @_s.required this.names,
  });
  Map<String, dynamic> toJson() => _$BatchGetVariableRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class CreateDetectorVersionRequest {
  /// The ID of the detector under which you want to create a new version.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The rules to include in the detector version.
  @_s.JsonKey(name: 'rules')
  final List<Rule> rules;

  /// The description of the detector version.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The Amazon Sagemaker model endpoints to include in the detector version.
  @_s.JsonKey(name: 'externalModelEndpoints')
  final List<String> externalModelEndpoints;

  /// The model versions to include in the detector version.
  @_s.JsonKey(name: 'modelVersions')
  final List<ModelVersion> modelVersions;

  /// The rule execution mode for the rules included in the detector version.
  ///
  /// You can define and edit the rule mode at the detector version level, when it
  /// is in draft status.
  ///
  /// If you specify <code>FIRST_MATCHED</code>, Amazon Fraud Detector evaluates
  /// rules sequentially, first to last, stopping at the first matched rule.
  /// Amazon Fraud dectector then provides the outcomes for that single rule.
  ///
  /// If you specifiy <code>ALL_MATCHED</code>, Amazon Fraud Detector evaluates
  /// all rules and returns the outcomes for all matched rules.
  ///
  /// The default behavior is <code>FIRST_MATCHED</code>.
  @_s.JsonKey(name: 'ruleExecutionMode')
  final RuleExecutionMode ruleExecutionMode;

  CreateDetectorVersionRequest({
    @_s.required this.detectorId,
    @_s.required this.rules,
    this.description,
    this.externalModelEndpoints,
    this.modelVersions,
    this.ruleExecutionMode,
  });
  Map<String, dynamic> toJson() => _$CreateDetectorVersionRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class CreateModelVersionRequest {
  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version description.
  @_s.JsonKey(name: 'description')
  final String description;

  CreateModelVersionRequest({
    @_s.required this.modelId,
    @_s.required this.modelType,
    this.description,
  });
  Map<String, dynamic> toJson() => _$CreateModelVersionRequestToJson(this);
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

  /// The version of the model.
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
    createFactory: false,
    createToJson: true)
class CreateRuleRequest {
  /// The detector ID for the rule's parent detector.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The rule expression.
  @_s.JsonKey(name: 'expression')
  final String expression;

  /// The language of the rule.
  @_s.JsonKey(name: 'language')
  final Language language;

  /// The outcome or outcomes returned when the rule expression matches.
  @_s.JsonKey(name: 'outcomes')
  final List<String> outcomes;

  /// The rule ID.
  @_s.JsonKey(name: 'ruleId')
  final String ruleId;

  /// The rule description.
  @_s.JsonKey(name: 'description')
  final String description;

  CreateRuleRequest({
    @_s.required this.detectorId,
    @_s.required this.expression,
    @_s.required this.language,
    @_s.required this.outcomes,
    @_s.required this.ruleId,
    this.description,
  });
  Map<String, dynamic> toJson() => _$CreateRuleRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class CreateVariableRequest {
  /// The source of the data.
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  /// The data type.
  @_s.JsonKey(name: 'dataType')
  final DataType dataType;

  /// The default value for the variable when no value is received.
  @_s.JsonKey(name: 'defaultValue')
  final String defaultValue;

  /// The name of the variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The variable type.
  @_s.JsonKey(name: 'variableType')
  final String variableType;

  CreateVariableRequest({
    @_s.required this.dataSource,
    @_s.required this.dataType,
    @_s.required this.defaultValue,
    @_s.required this.name,
    this.description,
    this.variableType,
  });
  Map<String, dynamic> toJson() => _$CreateVariableRequestToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteDetectorRequest {
  /// The ID of the detector to delete.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  DeleteDetectorRequest({
    @_s.required this.detectorId,
  });
  Map<String, dynamic> toJson() => _$DeleteDetectorRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DeleteDetectorVersionRequest {
  /// The ID of the parent detector for the detector version to delete.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The ID of the detector version to delete.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  DeleteDetectorVersionRequest({
    @_s.required this.detectorId,
    @_s.required this.detectorVersionId,
  });
  Map<String, dynamic> toJson() => _$DeleteDetectorVersionRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DeleteEventRequest {
  /// The ID of the event to delete.
  @_s.JsonKey(name: 'eventId')
  final String eventId;

  DeleteEventRequest({
    @_s.required this.eventId,
  });
  Map<String, dynamic> toJson() => _$DeleteEventRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DeleteRuleVersionRequest {
  /// The ID of the detector that includes the rule version to delete.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The rule ID of the rule version to delete.
  @_s.JsonKey(name: 'ruleId')
  final String ruleId;

  /// The rule version to delete.
  @_s.JsonKey(name: 'ruleVersion')
  final String ruleVersion;

  DeleteRuleVersionRequest({
    @_s.required this.detectorId,
    @_s.required this.ruleId,
    @_s.required this.ruleVersion,
  });
  Map<String, dynamic> toJson() => _$DeleteRuleVersionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRuleVersionResult {
  DeleteRuleVersionResult();
  factory DeleteRuleVersionResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteRuleVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeDetectorRequest {
  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The maximum number of results to return for the request.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The next token from the previous response.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeDetectorRequest({
    @_s.required this.detectorId,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$DescribeDetectorRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDetectorResult {
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
    createFactory: false,
    createToJson: true)
class DescribeModelVersionsRequest {
  /// The maximum number of results to return.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The next token from the previous results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeModelVersionsRequest({
    this.maxResults,
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$DescribeModelVersionsRequestToJson(this);
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
  /// Timestamp of when the detector was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The detector description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// Timestamp of when the detector was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  Detector({
    this.createdTime,
    this.description,
    this.detectorId,
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

/// The Amazon SageMaker model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExternalModel {
  /// Timestamp of when the model was last created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The input configuration.
  @_s.JsonKey(name: 'inputConfiguration')
  final ModelInputConfiguration inputConfiguration;

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

  /// The role used to invoke the model.
  @_s.JsonKey(name: 'role')
  final Role role;

  ExternalModel({
    this.createdTime,
    this.inputConfiguration,
    this.lastUpdatedTime,
    this.modelEndpoint,
    this.modelEndpointStatus,
    this.modelSource,
    this.outputConfiguration,
    this.role,
  });
  factory ExternalModel.fromJson(Map<String, dynamic> json) =>
      _$ExternalModelFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetDetectorVersionRequest {
  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The detector version ID.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  GetDetectorVersionRequest({
    @_s.required this.detectorId,
    @_s.required this.detectorVersionId,
  });
  Map<String, dynamic> toJson() => _$GetDetectorVersionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDetectorVersionResult {
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
    createFactory: false,
    createToJson: true)
class GetDetectorsRequest {
  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The maximum number of objects to return for the request.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The next token for the subsequent request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetDetectorsRequest({
    this.detectorId,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetDetectorsRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class GetExternalModelsRequest {
  /// The maximum number of objects to return for the request.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The Amazon SageMaker model endpoint.
  @_s.JsonKey(name: 'modelEndpoint')
  final String modelEndpoint;

  /// The next page token for the request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetExternalModelsRequest({
    this.maxResults,
    this.modelEndpoint,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetExternalModelsRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class GetModelVersionRequest {
  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  GetModelVersionRequest({
    @_s.required this.modelId,
    @_s.required this.modelType,
    @_s.required this.modelVersionNumber,
  });
  Map<String, dynamic> toJson() => _$GetModelVersionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetModelVersionResult {
  /// The model version description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The model version status.
  @_s.JsonKey(name: 'status')
  final String status;

  GetModelVersionResult({
    this.description,
    this.modelId,
    this.modelType,
    this.modelVersionNumber,
    this.status,
  });
  factory GetModelVersionResult.fromJson(Map<String, dynamic> json) =>
      _$GetModelVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetModelsRequest {
  /// The maximum results to return for the request.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The next token for the request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetModelsRequest({
    this.maxResults,
    this.modelId,
    this.modelType,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetModelsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetModelsResult {
  /// The returned models.
  @_s.JsonKey(name: 'models')
  final List<Model> models;

  /// The next token for subsequent requests.
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
    createFactory: false,
    createToJson: true)
class GetOutcomesRequest {
  /// The maximum number of objects to return for the request.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The name of the outcome or outcomes to get.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next page token for the request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetOutcomesRequest({
    this.maxResults,
    this.name,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetOutcomesRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class GetPredictionRequest {
  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The unique ID used to identify the event.
  @_s.JsonKey(name: 'eventId')
  final String eventId;

  /// The detector version ID.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  /// Names of variables you defined in Amazon Fraud Detector to represent event
  /// data elements and their corresponding values for the event you are sending
  /// for evaluation.
  @_s.JsonKey(name: 'eventAttributes')
  final Map<String, String> eventAttributes;

  /// The Amazon SageMaker model endpoint input data blobs.
  @_s.JsonKey(name: 'externalModelEndpointDataBlobs')
  final Map<String, ModelEndpointDataBlob> externalModelEndpointDataBlobs;

  GetPredictionRequest({
    @_s.required this.detectorId,
    @_s.required this.eventId,
    this.detectorVersionId,
    this.eventAttributes,
    this.externalModelEndpointDataBlobs,
  });
  Map<String, dynamic> toJson() => _$GetPredictionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPredictionResult {
  /// The model scores for models used in the detector version.
  @_s.JsonKey(name: 'modelScores')
  final List<ModelScores> modelScores;

  /// The prediction outcomes.
  @_s.JsonKey(name: 'outcomes')
  final List<String> outcomes;

  /// The rule results in the prediction.
  @_s.JsonKey(name: 'ruleResults')
  final List<RuleResult> ruleResults;

  GetPredictionResult({
    this.modelScores,
    this.outcomes,
    this.ruleResults,
  });
  factory GetPredictionResult.fromJson(Map<String, dynamic> json) =>
      _$GetPredictionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetRulesRequest {
  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The maximum number of rules to return for the request.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The next page token.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The rule ID.
  @_s.JsonKey(name: 'ruleId')
  final String ruleId;

  /// The rule version.
  @_s.JsonKey(name: 'ruleVersion')
  final String ruleVersion;

  GetRulesRequest({
    @_s.required this.detectorId,
    this.maxResults,
    this.nextToken,
    this.ruleId,
    this.ruleVersion,
  });
  Map<String, dynamic> toJson() => _$GetRulesRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class GetVariablesRequest {
  /// The max size per page determined for the get variable request.
  @_s.JsonKey(name: 'maxResults')
  final int maxResults;

  /// The name of the variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next page token of the get variable request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetVariablesRequest({
    this.maxResults,
    this.name,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetVariablesRequestToJson(this);
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

/// The label schema.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelSchema {
  /// The label key.
  @_s.JsonKey(name: 'labelKey')
  final String labelKey;

  /// The label mapper maps the Amazon Fraud Detector supported label to the
  /// appropriate source labels. For example, if <code>"FRAUD"</code> and
  /// <code>"LEGIT"</code> are Amazon Fraud Detector supported labels, this mapper
  /// could be: <code>{"FRAUD" =&gt; ["0"]</code>, "LEGIT" =&gt; ["1"]} or
  /// <code>{"FRAUD" =&gt; ["false"], "LEGIT" =&gt; ["true"]}</code> or
  /// <code>{"FRAUD" =&gt; ["fraud", "abuse"], "LEGIT" =&gt; ["legit",
  /// "safe"]}</code>. The value part of the mapper is a list, because you may
  /// have multiple variants for a single Amazon Fraud Detector label.
  @_s.JsonKey(name: 'labelMapper')
  final Map<String, List<String>> labelMapper;

  LabelSchema({
    @_s.required this.labelKey,
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

/// The model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Model {
  /// Timestamp of when the model was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The model description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model label schema.
  @_s.JsonKey(name: 'labelSchema')
  final LabelSchema labelSchema;

  /// Timestamp of last time the model was updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model input variables.
  @_s.JsonKey(name: 'modelVariables')
  final List<ModelVariable> modelVariables;

  /// The model training data source in Amazon S3.
  @_s.JsonKey(name: 'trainingDataSource')
  final TrainingDataSource trainingDataSource;

  Model({
    this.createdTime,
    this.description,
    this.labelSchema,
    this.lastUpdatedTime,
    this.modelId,
    this.modelType,
    this.modelVariables,
    this.trainingDataSource,
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

/// The model input configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelInputConfiguration {
  /// For an opaque-model, the input to the model will be a ByteBuffer blob
  /// provided in the getPrediction request, and will be passed to SageMaker
  /// as-is. For non-opaque models, the input will be constructed by Amazon Fraud
  /// Detector based on the model-configuration.
  @_s.JsonKey(name: 'isOpaque')
  final bool isOpaque;

  /// Template for constructing the CSV input-data sent to SageMaker. At
  /// event-evaluation, the placeholders for variable-names in the template will
  /// be replaced with the variable values before being sent to SageMaker.
  @_s.JsonKey(name: 'csvInputTemplate')
  final String csvInputTemplate;

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
    @_s.required this.isOpaque,
    this.csvInputTemplate,
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

/// Provides the model output configuration.
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

enum ModelTypeEnum {
  @_s.JsonValue('ONLINE_FRAUD_INSIGHTS')
  onlineFraudInsights,
}

/// The model variable.&gt;
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelVariable {
  /// The model variable's name.&gt;
  @_s.JsonKey(name: 'name')
  final String name;

  /// The model variable's index.&gt;
  @_s.JsonKey(name: 'index')
  final int index;

  ModelVariable({
    @_s.required this.name,
    this.index,
  });
  factory ModelVariable.fromJson(Map<String, dynamic> json) =>
      _$ModelVariableFromJson(json);

  Map<String, dynamic> toJson() => _$ModelVariableToJson(this);
}

/// The model version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelVersion {
  /// The parent model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  ModelVersion({
    @_s.required this.modelId,
    @_s.required this.modelType,
    @_s.required this.modelVersionNumber,
  });
  factory ModelVersion.fromJson(Map<String, dynamic> json) =>
      _$ModelVersionFromJson(json);

  Map<String, dynamic> toJson() => _$ModelVersionToJson(this);
}

/// Provides the model version details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelVersionDetail {
  /// The timestamp when the model was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The model description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model label schema.
  @_s.JsonKey(name: 'labelSchema')
  final LabelSchema labelSchema;

  /// The timestamp when the model was last updated.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final String lastUpdatedTime;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model variables.
  @_s.JsonKey(name: 'modelVariables')
  final List<ModelVariable> modelVariables;

  /// The model version.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The model status.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The model training data source.
  @_s.JsonKey(name: 'trainingDataSource')
  final TrainingDataSource trainingDataSource;

  /// The model training metrics.
  @_s.JsonKey(name: 'trainingMetrics')
  final Map<String, String> trainingMetrics;

  /// The model validation metrics.
  @_s.JsonKey(name: 'validationMetrics')
  final Map<String, String> validationMetrics;

  ModelVersionDetail({
    this.createdTime,
    this.description,
    this.labelSchema,
    this.lastUpdatedTime,
    this.modelId,
    this.modelType,
    this.modelVariables,
    this.modelVersionNumber,
    this.status,
    this.trainingDataSource,
    this.trainingMetrics,
    this.validationMetrics,
  });
  factory ModelVersionDetail.fromJson(Map<String, dynamic> json) =>
      _$ModelVersionDetailFromJson(json);
}

enum ModelVersionStatus {
  @_s.JsonValue('TRAINING_IN_PROGRESS')
  trainingInProgress,
  @_s.JsonValue('TRAINING_COMPLETE')
  trainingComplete,
  @_s.JsonValue('ACTIVATE_REQUESTED')
  activateRequested,
  @_s.JsonValue('ACTIVATE_IN_PROGRESS')
  activateInProgress,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVATE_IN_PROGRESS')
  inactivateInProgress,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('ERROR')
  error,
}

/// The outcome.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Outcome {
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
    createFactory: false,
    createToJson: true)
class PutDetectorRequest {
  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The description of the detector.
  @_s.JsonKey(name: 'description')
  final String description;

  PutDetectorRequest({
    @_s.required this.detectorId,
    this.description,
  });
  Map<String, dynamic> toJson() => _$PutDetectorRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class PutExternalModelRequest {
  /// The model endpoint input configuration.
  @_s.JsonKey(name: 'inputConfiguration')
  final ModelInputConfiguration inputConfiguration;

  /// The model endpoints name.
  @_s.JsonKey(name: 'modelEndpoint')
  final String modelEndpoint;

  /// The model endpoint’s status in Amazon Fraud Detector.
  @_s.JsonKey(name: 'modelEndpointStatus')
  final ModelEndpointStatus modelEndpointStatus;

  /// The source of the model.
  @_s.JsonKey(name: 'modelSource')
  final ModelSource modelSource;

  /// The model endpoint output configuration.
  @_s.JsonKey(name: 'outputConfiguration')
  final ModelOutputConfiguration outputConfiguration;

  /// The IAM role used to invoke the model endpoint.
  @_s.JsonKey(name: 'role')
  final Role role;

  PutExternalModelRequest({
    @_s.required this.inputConfiguration,
    @_s.required this.modelEndpoint,
    @_s.required this.modelEndpointStatus,
    @_s.required this.modelSource,
    @_s.required this.outputConfiguration,
    @_s.required this.role,
  });
  Map<String, dynamic> toJson() => _$PutExternalModelRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class PutModelRequest {
  /// The label schema.
  @_s.JsonKey(name: 'labelSchema')
  final LabelSchema labelSchema;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model input variables.
  @_s.JsonKey(name: 'modelVariables')
  final List<ModelVariable> modelVariables;

  /// The training data source location in Amazon S3.
  @_s.JsonKey(name: 'trainingDataSource')
  final TrainingDataSource trainingDataSource;

  /// The model description.
  @_s.JsonKey(name: 'description')
  final String description;

  PutModelRequest({
    @_s.required this.labelSchema,
    @_s.required this.modelId,
    @_s.required this.modelType,
    @_s.required this.modelVariables,
    @_s.required this.trainingDataSource,
    this.description,
  });
  Map<String, dynamic> toJson() => _$PutModelRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutModelResult {
  PutModelResult();
  factory PutModelResult.fromJson(Map<String, dynamic> json) =>
      _$PutModelResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PutOutcomeRequest {
  /// The name of the outcome.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The outcome description.
  @_s.JsonKey(name: 'description')
  final String description;

  PutOutcomeRequest({
    @_s.required this.name,
    this.description,
  });
  Map<String, dynamic> toJson() => _$PutOutcomeRequestToJson(this);
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

/// The role used to invoke external model endpoints.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Role {
  /// The role ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The role name.
  @_s.JsonKey(name: 'name')
  final String name;

  Role({
    @_s.required this.arn,
    @_s.required this.name,
  });
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
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

/// The training data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrainingDataSource {
  /// The data access role ARN for the training data source.
  @_s.JsonKey(name: 'dataAccessRoleArn')
  final String dataAccessRoleArn;

  /// The data location of the training data source.
  @_s.JsonKey(name: 'dataLocation')
  final String dataLocation;

  TrainingDataSource({
    @_s.required this.dataAccessRoleArn,
    @_s.required this.dataLocation,
  });
  factory TrainingDataSource.fromJson(Map<String, dynamic> json) =>
      _$TrainingDataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDataSourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateDetectorVersionMetadataRequest {
  /// The description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The detector version ID.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  UpdateDetectorVersionMetadataRequest({
    @_s.required this.description,
    @_s.required this.detectorId,
    @_s.required this.detectorVersionId,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateDetectorVersionMetadataRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class UpdateDetectorVersionRequest {
  /// The parent detector ID for the detector version you want to update.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The detector version ID.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  /// The Amazon SageMaker model endpoints to include in the detector version.
  @_s.JsonKey(name: 'externalModelEndpoints')
  final List<String> externalModelEndpoints;

  /// The rules to include in the detector version.
  @_s.JsonKey(name: 'rules')
  final List<Rule> rules;

  /// The detector version description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model versions to include in the detector version.
  @_s.JsonKey(name: 'modelVersions')
  final List<ModelVersion> modelVersions;

  /// The rule execution mode to add to the detector.
  ///
  /// If you specify <code>FIRST_MATCHED</code>, Amazon Fraud Detector evaluates
  /// rules sequentially, first to last, stopping at the first matched rule.
  /// Amazon Fraud dectector then provides the outcomes for that single rule.
  ///
  /// If you specifiy <code>ALL_MATCHED</code>, Amazon Fraud Detector evaluates
  /// all rules and returns the outcomes for all matched rules. You can define and
  /// edit the rule mode at the detector version level, when it is in draft
  /// status.
  ///
  /// The default behavior is <code>FIRST_MATCHED</code>.
  @_s.JsonKey(name: 'ruleExecutionMode')
  final RuleExecutionMode ruleExecutionMode;

  UpdateDetectorVersionRequest({
    @_s.required this.detectorId,
    @_s.required this.detectorVersionId,
    @_s.required this.externalModelEndpoints,
    @_s.required this.rules,
    this.description,
    this.modelVersions,
    this.ruleExecutionMode,
  });
  Map<String, dynamic> toJson() => _$UpdateDetectorVersionRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class UpdateDetectorVersionStatusRequest {
  /// The detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The detector version ID.
  @_s.JsonKey(name: 'detectorVersionId')
  final String detectorVersionId;

  /// The new status.
  @_s.JsonKey(name: 'status')
  final DetectorVersionStatus status;

  UpdateDetectorVersionStatusRequest({
    @_s.required this.detectorId,
    @_s.required this.detectorVersionId,
    @_s.required this.status,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateDetectorVersionStatusRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class UpdateModelVersionRequest {
  /// The model description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model ID.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The model type.
  @_s.JsonKey(name: 'modelType')
  final ModelTypeEnum modelType;

  /// The model version.
  @_s.JsonKey(name: 'modelVersionNumber')
  final String modelVersionNumber;

  /// The new model status.
  @_s.JsonKey(name: 'status')
  final ModelVersionStatus status;

  UpdateModelVersionRequest({
    @_s.required this.description,
    @_s.required this.modelId,
    @_s.required this.modelType,
    @_s.required this.modelVersionNumber,
    @_s.required this.status,
  });
  Map<String, dynamic> toJson() => _$UpdateModelVersionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateModelVersionResult {
  UpdateModelVersionResult();
  factory UpdateModelVersionResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelVersionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateRuleMetadataRequest {
  /// The rule description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The rule to update.
  @_s.JsonKey(name: 'rule')
  final Rule rule;

  UpdateRuleMetadataRequest({
    @_s.required this.description,
    @_s.required this.rule,
  });
  Map<String, dynamic> toJson() => _$UpdateRuleMetadataRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class UpdateRuleVersionRequest {
  /// The rule expression.
  @_s.JsonKey(name: 'expression')
  final String expression;

  /// The language.
  @_s.JsonKey(name: 'language')
  final Language language;

  /// The outcomes.
  @_s.JsonKey(name: 'outcomes')
  final List<String> outcomes;

  /// The rule to update.
  @_s.JsonKey(name: 'rule')
  final Rule rule;

  /// The description.
  @_s.JsonKey(name: 'description')
  final String description;

  UpdateRuleVersionRequest({
    @_s.required this.expression,
    @_s.required this.language,
    @_s.required this.outcomes,
    @_s.required this.rule,
    this.description,
  });
  Map<String, dynamic> toJson() => _$UpdateRuleVersionRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class UpdateVariableRequest {
  /// The name of the variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The new default value of the variable.
  @_s.JsonKey(name: 'defaultValue')
  final String defaultValue;

  /// The new description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The variable type.
  @_s.JsonKey(name: 'variableType')
  final String variableType;

  UpdateVariableRequest({
    @_s.required this.name,
    this.defaultValue,
    this.description,
    this.variableType,
  });
  Map<String, dynamic> toJson() => _$UpdateVariableRequestToJson(this);
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
  /// The time when the variable was created.
  @_s.JsonKey(name: 'createdTime')
  final String createdTime;

  /// The data source of the variable.
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  /// The data type of the variable.
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
  @_s.JsonKey(name: 'variableType')
  final String variableType;

  Variable({
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

/// The variable entry in a list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VariableEntry {
  /// The data source of the variable entry.
  @_s.JsonKey(name: 'dataSource')
  final String dataSource;

  /// The data type of the variable entry.
  @_s.JsonKey(name: 'dataType')
  final String dataType;

  /// The default value of the variable entry.
  @_s.JsonKey(name: 'defaultValue')
  final String defaultValue;

  /// The description of the variable entry.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the variable entry.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of the variable entry.
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
