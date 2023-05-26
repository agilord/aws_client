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
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Deletes a <code>Record</code> from a <code>FeatureGroup</code> in the
  /// <code>OnlineStore</code>. Feature Store supports both
  /// <code>SOFT_DELETE</code> and <code>HARD_DELETE</code>. For
  /// <code>SOFT_DELETE</code> (default), feature columns are set to
  /// <code>null</code> and the record is no longer retrievable by
  /// <code>GetRecord</code> or <code>BatchGetRecord</code>. For<code>
  /// HARD_DELETE</code>, the complete <code>Record</code> is removed from the
  /// <code>OnlineStore</code>. In both cases, Feature Store appends the deleted
  /// record marker to the <code>OfflineStore</code> with feature values set to
  /// <code>null</code>, <code>is_deleted</code> value set to <code>True</code>,
  /// and <code>EventTime</code> set to the delete input <code>EventTime</code>.
  ///
  /// Note that the <code>EventTime</code> specified in
  /// <code>DeleteRecord</code> should be set later than the
  /// <code>EventTime</code> of the existing record in the
  /// <code>OnlineStore</code> for that <code>RecordIdentifer</code>. If it is
  /// not, the deletion does not occur:
  ///
  /// <ul>
  /// <li>
  /// For <code>SOFT_DELETE</code>, the existing (undeleted) record remains in
  /// the <code>OnlineStore</code>, though the delete record marker is still
  /// written to the <code>OfflineStore</code>.
  /// </li>
  /// <li>
  /// <code>HARD_DELETE</code> returns <code>EventTime</code>: <code>400
  /// ValidationException</code> to indicate that the delete operation failed.
  /// No delete record marker is written to the <code>OfflineStore</code>.
  /// </li>
  /// </ul>
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
  ///
  /// Parameter [deletionMode] :
  /// The name of the deletion mode for deleting the record. By default, the
  /// deletion mode is set to <code>SoftDelete</code>.
  ///
  /// Parameter [targetStores] :
  /// A list of stores from which you're deleting the record. By default,
  /// Feature Store deletes the record from all of the stores that you're using
  /// for the <code>FeatureGroup</code>.
  Future<void> deleteRecord({
    required String eventTime,
    required String featureGroupName,
    required String recordIdentifierValueAsString,
    DeletionMode? deletionMode,
    List<TargetStore>? targetStores,
  }) async {
    final $query = <String, List<String>>{
      'EventTime': [eventTime],
      'RecordIdentifierValueAsString': [recordIdentifierValueAsString],
      if (deletionMode != null) 'DeletionMode': [deletionMode.toValue()],
      if (targetStores != null)
        'TargetStores': targetStores.map((e) => e.toValue()).toList(),
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
  /// The name of the feature group from which you want to retrieve a record.
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
  ///
  /// Parameter [targetStores] :
  /// A list of stores to which you're adding the record. By default, Feature
  /// Store adds the record to all of the stores that you're using for the
  /// <code>FeatureGroup</code>.
  Future<void> putRecord({
    required String featureGroupName,
    required List<FeatureValue> record,
    List<TargetStore>? targetStores,
  }) async {
    final $payload = <String, dynamic>{
      'Record': record,
      if (targetStores != null)
        'TargetStores': targetStores.map((e) => e.toValue()).toList(),
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
  /// The error code of an error that has occurred when attempting to retrieve a
  /// batch of Records. For more information on errors, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_feature_store_GetRecord.html#API_feature_store_GetRecord_Errors">Errors</a>.
  final String errorCode;

  /// The error message of an error that has occurred when attempting to retrieve
  /// a record in the batch.
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
  /// A list of errors that have occurred when retrieving a batch of Records.
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

  /// The value of the record identifier in string format.
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

enum DeletionMode {
  softDelete,
  hardDelete,
}

extension DeletionModeValueExtension on DeletionMode {
  String toValue() {
    switch (this) {
      case DeletionMode.softDelete:
        return 'SoftDelete';
      case DeletionMode.hardDelete:
        return 'HardDelete';
    }
  }
}

extension DeletionModeFromString on String {
  DeletionMode toDeletionMode() {
    switch (this) {
      case 'SoftDelete':
        return DeletionMode.softDelete;
      case 'HardDelete':
        return DeletionMode.hardDelete;
    }
    throw Exception('$this is not known in enum DeletionMode');
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

enum TargetStore {
  onlineStore,
  offlineStore,
}

extension TargetStoreValueExtension on TargetStore {
  String toValue() {
    switch (this) {
      case TargetStore.onlineStore:
        return 'OnlineStore';
      case TargetStore.offlineStore:
        return 'OfflineStore';
    }
  }
}

extension TargetStoreFromString on String {
  TargetStore toTargetStore() {
    switch (this) {
      case 'OnlineStore':
        return TargetStore.onlineStore;
      case 'OfflineStore':
        return TargetStore.offlineStore;
    }
    throw Exception('$this is not known in enum TargetStore');
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
