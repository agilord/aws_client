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

/// Contains all data plane API operations and data types for the Amazon
/// SageMaker Feature Store. Use this API to put, delete, and retrieve (get)
/// features from a feature store.
///
/// Use the following operations to configure your <code>OnlineStore</code> and
/// <code>OfflineStore</code> features, and to create and manage feature groups:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateFeatureGroup.html">CreateFeatureGroup</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DeleteFeatureGroup.html">DeleteFeatureGroup</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeFeatureGroup.html">DescribeFeatureGroup</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListFeatureGroups.html">ListFeatureGroups</a>
/// </li>
/// </ul>
class SageMakerFeatureStoreRuntime {
  final _s.RestJsonProtocol _protocol;
  SageMakerFeatureStoreRuntime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'featurestore-runtime.sagemaker',
            signingName: 'sagemaker',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Retrieves a batch of <code>Records</code> from a
  /// <code>FeatureGroup</code>.
  ///
  /// May throw [ValidationError].
  /// May throw [InternalFailure].
  /// May throw [ServiceUnavailable].
  /// May throw [AccessForbidden].
  ///
  /// Parameter [identifiers] :
  /// A list of <code>FeatureGroup</code> names, with their corresponding
  /// <code>RecordIdentifier</code> value, and Feature name that have been
  /// requested to be retrieved in batch.
  Future<BatchGetRecordResponse> batchGetRecord({
    required List<BatchGetRecordIdentifier> identifiers,
  }) async {
    ArgumentError.checkNotNull(identifiers, 'identifiers');
    final $payload = <String, dynamic>{
      'Identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetRecord',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetRecordResponse.fromJson(response);
  }

  /// Deletes a <code>Record</code> from a <code>FeatureGroup</code>. A new
  /// record will show up in the <code>OfflineStore</code> when the
  /// <code>DeleteRecord</code> API is called. This record will have a value of
  /// <code>True</code> in the <code>is_deleted</code> column.
  ///
  /// May throw [ValidationError].
  /// May throw [InternalFailure].
  /// May throw [ServiceUnavailable].
  /// May throw [AccessForbidden].
  ///
  /// Parameter [eventTime] :
  /// Timestamp indicating when the deletion event occurred.
  /// <code>EventTime</code> can be used to query data at a certain point in
  /// time.
  ///
  /// Parameter [featureGroupName] :
  /// The name of the feature group to delete the record from.
  ///
  /// Parameter [recordIdentifierValueAsString] :
  /// The value for the <code>RecordIdentifier</code> that uniquely identifies
  /// the record, in string format.
  Future<void> deleteRecord({
    required String eventTime,
    required String featureGroupName,
    required String recordIdentifierValueAsString,
  }) async {
    ArgumentError.checkNotNull(eventTime, 'eventTime');
    _s.validateStringLength(
      'eventTime',
      eventTime,
      0,
      358400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(featureGroupName, 'featureGroupName');
    _s.validateStringLength(
      'featureGroupName',
      featureGroupName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        recordIdentifierValueAsString, 'recordIdentifierValueAsString');
    _s.validateStringLength(
      'recordIdentifierValueAsString',
      recordIdentifierValueAsString,
      0,
      358400,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'EventTime': [eventTime],
      'RecordIdentifierValueAsString': [recordIdentifierValueAsString],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/FeatureGroup/${Uri.encodeComponent(featureGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Use for <code>OnlineStore</code> serving from a <code>FeatureStore</code>.
  /// Only the latest records stored in the <code>OnlineStore</code> can be
  /// retrieved. If no Record with <code>RecordIdentifierValue</code> is found,
  /// then an empty result is returned.
  ///
  /// May throw [ValidationError].
  /// May throw [ResourceNotFound].
  /// May throw [InternalFailure].
  /// May throw [ServiceUnavailable].
  /// May throw [AccessForbidden].
  ///
  /// Parameter [featureGroupName] :
  /// The name of the feature group in which you want to put the records.
  ///
  /// Parameter [recordIdentifierValueAsString] :
  /// The value that corresponds to <code>RecordIdentifier</code> type and
  /// uniquely identifies the record in the <code>FeatureGroup</code>.
  ///
  /// Parameter [featureNames] :
  /// List of names of Features to be retrieved. If not specified, the latest
  /// value for all the Features are returned.
  Future<GetRecordResponse> getRecord({
    required String featureGroupName,
    required String recordIdentifierValueAsString,
    List<String>? featureNames,
  }) async {
    ArgumentError.checkNotNull(featureGroupName, 'featureGroupName');
    _s.validateStringLength(
      'featureGroupName',
      featureGroupName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        recordIdentifierValueAsString, 'recordIdentifierValueAsString');
    _s.validateStringLength(
      'recordIdentifierValueAsString',
      recordIdentifierValueAsString,
      0,
      358400,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'RecordIdentifierValueAsString': [recordIdentifierValueAsString],
      if (featureNames != null) 'FeatureName': featureNames,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/FeatureGroup/${Uri.encodeComponent(featureGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRecordResponse.fromJson(response);
  }

  /// Used for data ingestion into the <code>FeatureStore</code>. The
  /// <code>PutRecord</code> API writes to both the <code>OnlineStore</code> and
  /// <code>OfflineStore</code>. If the record is the latest record for the
  /// <code>recordIdentifier</code>, the record is written to both the
  /// <code>OnlineStore</code> and <code>OfflineStore</code>. If the record is a
  /// historic record, it is written only to the <code>OfflineStore</code>.
  ///
  /// May throw [ValidationError].
  /// May throw [InternalFailure].
  /// May throw [ServiceUnavailable].
  /// May throw [AccessForbidden].
  ///
  /// Parameter [featureGroupName] :
  /// The name of the feature group that you want to insert the record into.
  ///
  /// Parameter [record] :
  /// List of FeatureValues to be inserted. This will be a full over-write. If
  /// you only want to update few of the feature values, do the following:
  ///
  /// <ul>
  /// <li>
  /// Use <code>GetRecord</code> to retrieve the latest record.
  /// </li>
  /// <li>
  /// Update the record returned from <code>GetRecord</code>.
  /// </li>
  /// <li>
  /// Use <code>PutRecord</code> to update feature values.
  /// </li>
  /// </ul>
  Future<void> putRecord({
    required String featureGroupName,
    required List<FeatureValue> record,
  }) async {
    ArgumentError.checkNotNull(featureGroupName, 'featureGroupName');
    _s.validateStringLength(
      'featureGroupName',
      featureGroupName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(record, 'record');
    final $payload = <String, dynamic>{
      'Record': record,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/FeatureGroup/${Uri.encodeComponent(featureGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The error that has occurred when attempting to retrieve a batch of Records.
class BatchGetRecordError {
  /// The error code of an error that has occured when attempting to retrieve a
  /// batch of Records. For more information on errors, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_feature_store_GetRecord.html#API_feature_store_GetRecord_Errors">
  /// Errors</a>.
  final String errorCode;

  /// The error message of an error that has occured when attempting to retrieve a
  /// record in the batch.
  final String errorMessage;

  /// The name of the feature group that the record belongs to.
  final String featureGroupName;

  /// The value for the <code>RecordIdentifier</code> in string format of a Record
  /// from a <code>FeatureGroup</code> that is causing an error when attempting to
  /// be retrieved.
  final String recordIdentifierValueAsString;

  BatchGetRecordError({
    required this.errorCode,
    required this.errorMessage,
    required this.featureGroupName,
    required this.recordIdentifierValueAsString,
  });

  factory BatchGetRecordError.fromJson(Map<String, dynamic> json) {
    return BatchGetRecordError(
      errorCode: json['ErrorCode'] as String,
      errorMessage: json['ErrorMessage'] as String,
      featureGroupName: json['FeatureGroupName'] as String,
      recordIdentifierValueAsString:
          json['RecordIdentifierValueAsString'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final featureGroupName = this.featureGroupName;
    final recordIdentifierValueAsString = this.recordIdentifierValueAsString;
    return {
      'ErrorCode': errorCode,
      'ErrorMessage': errorMessage,
      'FeatureGroupName': featureGroupName,
      'RecordIdentifierValueAsString': recordIdentifierValueAsString,
    };
  }
}

/// The identifier that identifies the batch of Records you are retrieving in a
/// batch.
class BatchGetRecordIdentifier {
  /// A <code>FeatureGroupName</code> containing Records you are retrieving in a
  /// batch.
  final String featureGroupName;

  /// The value for a list of record identifiers in string format.
  final List<String> recordIdentifiersValueAsString;

  /// List of names of Features to be retrieved. If not specified, the latest
  /// value for all the Features are returned.
  final List<String>? featureNames;

  BatchGetRecordIdentifier({
    required this.featureGroupName,
    required this.recordIdentifiersValueAsString,
    this.featureNames,
  });

  factory BatchGetRecordIdentifier.fromJson(Map<String, dynamic> json) {
    return BatchGetRecordIdentifier(
      featureGroupName: json['FeatureGroupName'] as String,
      recordIdentifiersValueAsString:
          (json['RecordIdentifiersValueAsString'] as List)
              .whereNotNull()
              .map((e) => e as String)
              .toList(),
      featureNames: (json['FeatureNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final featureGroupName = this.featureGroupName;
    final recordIdentifiersValueAsString = this.recordIdentifiersValueAsString;
    final featureNames = this.featureNames;
    return {
      'FeatureGroupName': featureGroupName,
      'RecordIdentifiersValueAsString': recordIdentifiersValueAsString,
      if (featureNames != null) 'FeatureNames': featureNames,
    };
  }
}

class BatchGetRecordResponse {
  /// A list of errors that have occured when retrieving a batch of Records.
  final List<BatchGetRecordError> errors;

  /// A list of Records you requested to be retrieved in batch.
  final List<BatchGetRecordResultDetail> records;

  /// A unprocessed list of <code>FeatureGroup</code> names, with their
  /// corresponding <code>RecordIdentifier</code> value, and Feature name.
  final List<BatchGetRecordIdentifier> unprocessedIdentifiers;

  BatchGetRecordResponse({
    required this.errors,
    required this.records,
    required this.unprocessedIdentifiers,
  });

  factory BatchGetRecordResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetRecordResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) => BatchGetRecordError.fromJson(e as Map<String, dynamic>))
          .toList(),
      records: (json['Records'] as List)
          .whereNotNull()
          .map((e) =>
              BatchGetRecordResultDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedIdentifiers: (json['UnprocessedIdentifiers'] as List)
          .whereNotNull()
          .map((e) =>
              BatchGetRecordIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final records = this.records;
    final unprocessedIdentifiers = this.unprocessedIdentifiers;
    return {
      'Errors': errors,
      'Records': records,
      'UnprocessedIdentifiers': unprocessedIdentifiers,
    };
  }
}

/// The output of Records that have been retrieved in a batch.
class BatchGetRecordResultDetail {
  /// The <code>FeatureGroupName</code> containing Records you retrieved in a
  /// batch.
  final String featureGroupName;

  /// The <code>Record</code> retrieved.
  final List<FeatureValue> record;

  /// The value of the record identifer in string format.
  final String recordIdentifierValueAsString;

  BatchGetRecordResultDetail({
    required this.featureGroupName,
    required this.record,
    required this.recordIdentifierValueAsString,
  });

  factory BatchGetRecordResultDetail.fromJson(Map<String, dynamic> json) {
    return BatchGetRecordResultDetail(
      featureGroupName: json['FeatureGroupName'] as String,
      record: (json['Record'] as List)
          .whereNotNull()
          .map((e) => FeatureValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordIdentifierValueAsString:
          json['RecordIdentifierValueAsString'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final featureGroupName = this.featureGroupName;
    final record = this.record;
    final recordIdentifierValueAsString = this.recordIdentifierValueAsString;
    return {
      'FeatureGroupName': featureGroupName,
      'Record': record,
      'RecordIdentifierValueAsString': recordIdentifierValueAsString,
    };
  }
}

/// The value associated with a feature.
class FeatureValue {
  /// The name of a feature that a feature value corresponds to.
  final String featureName;

  /// The value associated with a feature, in string format. Note that features
  /// types can be String, Integral, or Fractional. This value represents all
  /// three types as a string.
  final String valueAsString;

  FeatureValue({
    required this.featureName,
    required this.valueAsString,
  });

  factory FeatureValue.fromJson(Map<String, dynamic> json) {
    return FeatureValue(
      featureName: json['FeatureName'] as String,
      valueAsString: json['ValueAsString'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final featureName = this.featureName;
    final valueAsString = this.valueAsString;
    return {
      'FeatureName': featureName,
      'ValueAsString': valueAsString,
    };
  }
}

class GetRecordResponse {
  /// The record you requested. A list of <code>FeatureValues</code>.
  final List<FeatureValue>? record;

  GetRecordResponse({
    this.record,
  });

  factory GetRecordResponse.fromJson(Map<String, dynamic> json) {
    return GetRecordResponse(
      record: (json['Record'] as List?)
          ?.whereNotNull()
          .map((e) => FeatureValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final record = this.record;
    return {
      if (record != null) 'Record': record,
    };
  }
}

class AccessForbidden extends _s.GenericAwsException {
  AccessForbidden({String? type, String? message})
      : super(type: type, code: 'AccessForbidden', message: message);
}

class InternalFailure extends _s.GenericAwsException {
  InternalFailure({String? type, String? message})
      : super(type: type, code: 'InternalFailure', message: message);
}

class ResourceNotFound extends _s.GenericAwsException {
  ResourceNotFound({String? type, String? message})
      : super(type: type, code: 'ResourceNotFound', message: message);
}

class ServiceUnavailable extends _s.GenericAwsException {
  ServiceUnavailable({String? type, String? message})
      : super(type: type, code: 'ServiceUnavailable', message: message);
}

class ValidationError extends _s.GenericAwsException {
  ValidationError({String? type, String? message})
      : super(type: type, code: 'ValidationError', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessForbidden': (type, message) =>
      AccessForbidden(type: type, message: message),
  'InternalFailure': (type, message) =>
      InternalFailure(type: type, message: message),
  'ResourceNotFound': (type, message) =>
      ResourceNotFound(type: type, message: message),
  'ServiceUnavailable': (type, message) =>
      ServiceUnavailable(type: type, message: message),
  'ValidationError': (type, message) =>
      ValidationError(type: type, message: message),
};
