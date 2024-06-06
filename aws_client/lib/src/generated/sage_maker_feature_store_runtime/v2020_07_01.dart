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
  /// A list containing the name or Amazon Resource Name (ARN) of the
  /// <code>FeatureGroup</code>, the list of names of <code>Feature</code>s to
  /// be retrieved, and the corresponding <code>RecordIdentifier</code> values
  /// as strings.
  ///
  /// Parameter [expirationTimeResponse] :
  /// Parameter to request <code>ExpiresAt</code> in response. If
  /// <code>Enabled</code>, <code>BatchGetRecord</code> will return the value of
  /// <code>ExpiresAt</code>, if it is not null. If <code>Disabled</code> and
  /// null, <code>BatchGetRecord</code> will return null.
  Future<BatchGetRecordResponse> batchGetRecord({
    required List<BatchGetRecordIdentifier> identifiers,
    ExpirationTimeResponse? expirationTimeResponse,
  }) async {
    final $payload = <String, dynamic>{
      'Identifiers': identifiers,
      if (expirationTimeResponse != null)
        'ExpirationTimeResponse': expirationTimeResponse.toValue(),
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
  /// <code>SoftDelete</code> and <code>HardDelete</code>. For
  /// <code>SoftDelete</code> (default), feature columns are set to
  /// <code>null</code> and the record is no longer retrievable by
  /// <code>GetRecord</code> or <code>BatchGetRecord</code>. For
  /// <code>HardDelete</code>, the complete <code>Record</code> is removed from
  /// the <code>OnlineStore</code>. In both cases, Feature Store appends the
  /// deleted record marker to the <code>OfflineStore</code>. The deleted record
  /// marker is a record with the same <code>RecordIdentifer</code> as the
  /// original, but with <code>is_deleted</code> value set to <code>True</code>,
  /// <code>EventTime</code> set to the delete input <code>EventTime</code>, and
  /// other feature values set to <code>null</code>.
  ///
  /// Note that the <code>EventTime</code> specified in
  /// <code>DeleteRecord</code> should be set later than the
  /// <code>EventTime</code> of the existing record in the
  /// <code>OnlineStore</code> for that <code>RecordIdentifer</code>. If it is
  /// not, the deletion does not occur:
  ///
  /// <ul>
  /// <li>
  /// For <code>SoftDelete</code>, the existing (not deleted) record remains in
  /// the <code>OnlineStore</code>, though the delete record marker is still
  /// written to the <code>OfflineStore</code>.
  /// </li>
  /// <li>
  /// <code>HardDelete</code> returns <code>EventTime</code>: <code>400
  /// ValidationException</code> to indicate that the delete operation failed.
  /// No delete record marker is written to the <code>OfflineStore</code>.
  /// </li>
  /// </ul>
  /// When a record is deleted from the <code>OnlineStore</code>, the deleted
  /// record marker is appended to the <code>OfflineStore</code>. If you have
  /// the Iceberg table format enabled for your <code>OfflineStore</code>, you
  /// can remove all history of a record from the <code>OfflineStore</code>
  /// using Amazon Athena or Apache Spark. For information on how to hard delete
  /// a record from the <code>OfflineStore</code> with the Iceberg table format
  /// enabled, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/feature-store-delete-records-offline-store.html#feature-store-delete-records-offline-store">Delete
  /// records from the offline store</a>.
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
  /// The name or Amazon Resource Name (ARN) of the feature group to delete the
  /// record from.
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
  /// The name or Amazon Resource Name (ARN) of the feature group from which you
  /// want to retrieve a record.
  ///
  /// Parameter [recordIdentifierValueAsString] :
  /// The value that corresponds to <code>RecordIdentifier</code> type and
  /// uniquely identifies the record in the <code>FeatureGroup</code>.
  ///
  /// Parameter [expirationTimeResponse] :
  /// Parameter to request <code>ExpiresAt</code> in response. If
  /// <code>Enabled</code>, <code>GetRecord</code> will return the value of
  /// <code>ExpiresAt</code>, if it is not null. If <code>Disabled</code> and
  /// null, <code>GetRecord</code> will return null.
  ///
  /// Parameter [featureNames] :
  /// List of names of Features to be retrieved. If not specified, the latest
  /// value for all the Features are returned.
  Future<GetRecordResponse> getRecord({
    required String featureGroupName,
    required String recordIdentifierValueAsString,
    ExpirationTimeResponse? expirationTimeResponse,
    List<String>? featureNames,
  }) async {
    final $query = <String, List<String>>{
      'RecordIdentifierValueAsString': [recordIdentifierValueAsString],
      if (expirationTimeResponse != null)
        'ExpirationTimeResponse': [expirationTimeResponse.toValue()],
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

  /// The <code>PutRecord</code> API is used to ingest a list of
  /// <code>Records</code> into your feature group.
  ///
  /// If a new record’s <code>EventTime</code> is greater, the new record is
  /// written to both the <code>OnlineStore</code> and
  /// <code>OfflineStore</code>. Otherwise, the record is a historic record and
  /// it is written only to the <code>OfflineStore</code>.
  ///
  /// You can specify the ingestion to be applied to the
  /// <code>OnlineStore</code>, <code>OfflineStore</code>, or both by using the
  /// <code>TargetStores</code> request parameter.
  ///
  /// You can set the ingested record to expire at a given time to live (TTL)
  /// duration after the record’s event time, <code>ExpiresAt</code> =
  /// <code>EventTime</code> + <code>TtlDuration</code>, by specifying the
  /// <code>TtlDuration</code> parameter. A record level
  /// <code>TtlDuration</code> is set when specifying the
  /// <code>TtlDuration</code> parameter using the <code>PutRecord</code> API
  /// call. If the input <code>TtlDuration</code> is <code>null</code> or
  /// unspecified, <code>TtlDuration</code> is set to the default feature group
  /// level <code>TtlDuration</code>. A record level <code>TtlDuration</code>
  /// supersedes the group level <code>TtlDuration</code>.
  ///
  /// May throw [ValidationError].
  /// May throw [InternalFailure].
  /// May throw [ServiceUnavailable].
  /// May throw [AccessForbidden].
  ///
  /// Parameter [featureGroupName] :
  /// The name or Amazon Resource Name (ARN) of the feature group that you want
  /// to insert the record into.
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
  ///
  /// Parameter [ttlDuration] :
  /// Time to live duration, where the record is hard deleted after the
  /// expiration time is reached; <code>ExpiresAt</code> =
  /// <code>EventTime</code> + <code>TtlDuration</code>. For information on
  /// HardDelete, see the <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_feature_store_DeleteRecord.html">DeleteRecord</a>
  /// API in the Amazon SageMaker API Reference guide.
  Future<void> putRecord({
    required String featureGroupName,
    required List<FeatureValue> record,
    List<TargetStore>? targetStores,
    TtlDuration? ttlDuration,
  }) async {
    final $payload = <String, dynamic>{
      'Record': record,
      if (targetStores != null)
        'TargetStores': targetStores.map((e) => e.toValue()).toList(),
      if (ttlDuration != null) 'TtlDuration': ttlDuration,
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
  /// The name or Amazon Resource Name (ARN) of the <code>FeatureGroup</code>
  /// containing the records you are retrieving in a batch.
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

/// The output of records that have been retrieved in a batch.
class BatchGetRecordResultDetail {
  /// The <code>FeatureGroupName</code> containing Records you retrieved in a
  /// batch.
  final String featureGroupName;

  /// The <code>Record</code> retrieved.
  final List<FeatureValue> record;

  /// The value of the record identifier in string format.
  final String recordIdentifierValueAsString;

  /// The <code>ExpiresAt</code> ISO string of the requested record.
  final String? expiresAt;

  BatchGetRecordResultDetail({
    required this.featureGroupName,
    required this.record,
    required this.recordIdentifierValueAsString,
    this.expiresAt,
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
      expiresAt: json['ExpiresAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final featureGroupName = this.featureGroupName;
    final record = this.record;
    final recordIdentifierValueAsString = this.recordIdentifierValueAsString;
    final expiresAt = this.expiresAt;
    return {
      'FeatureGroupName': featureGroupName,
      'Record': record,
      'RecordIdentifierValueAsString': recordIdentifierValueAsString,
      if (expiresAt != null) 'ExpiresAt': expiresAt,
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

enum ExpirationTimeResponse {
  enabled,
  disabled,
}

extension ExpirationTimeResponseValueExtension on ExpirationTimeResponse {
  String toValue() {
    switch (this) {
      case ExpirationTimeResponse.enabled:
        return 'Enabled';
      case ExpirationTimeResponse.disabled:
        return 'Disabled';
    }
  }
}

extension ExpirationTimeResponseFromString on String {
  ExpirationTimeResponse toExpirationTimeResponse() {
    switch (this) {
      case 'Enabled':
        return ExpirationTimeResponse.enabled;
      case 'Disabled':
        return ExpirationTimeResponse.disabled;
    }
    throw Exception('$this is not known in enum ExpirationTimeResponse');
  }
}

/// The value associated with a feature.
class FeatureValue {
  /// The name of a feature that a feature value corresponds to.
  final String featureName;

  /// The value in string format associated with a feature. Used when your
  /// <code>CollectionType</code> is <code>None</code>. Note that features types
  /// can be <code>String</code>, <code>Integral</code>, or
  /// <code>Fractional</code>. This value represents all three types as a string.
  final String? valueAsString;

  /// The list of values in string format associated with a feature. Used when
  /// your <code>CollectionType</code> is a <code>List</code>, <code>Set</code>,
  /// or <code>Vector</code>. Note that features types can be <code>String</code>,
  /// <code>Integral</code>, or <code>Fractional</code>. These values represents
  /// all three types as a string.
  final List<String>? valueAsStringList;

  FeatureValue({
    required this.featureName,
    this.valueAsString,
    this.valueAsStringList,
  });

  factory FeatureValue.fromJson(Map<String, dynamic> json) {
    return FeatureValue(
      featureName: json['FeatureName'] as String,
      valueAsString: json['ValueAsString'] as String?,
      valueAsStringList: (json['ValueAsStringList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final featureName = this.featureName;
    final valueAsString = this.valueAsString;
    final valueAsStringList = this.valueAsStringList;
    return {
      'FeatureName': featureName,
      if (valueAsString != null) 'ValueAsString': valueAsString,
      if (valueAsStringList != null) 'ValueAsStringList': valueAsStringList,
    };
  }
}

class GetRecordResponse {
  /// The <code>ExpiresAt</code> ISO string of the requested record.
  final String? expiresAt;

  /// The record you requested. A list of <code>FeatureValues</code>.
  final List<FeatureValue>? record;

  GetRecordResponse({
    this.expiresAt,
    this.record,
  });

  factory GetRecordResponse.fromJson(Map<String, dynamic> json) {
    return GetRecordResponse(
      expiresAt: json['ExpiresAt'] as String?,
      record: (json['Record'] as List?)
          ?.whereNotNull()
          .map((e) => FeatureValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expiresAt = this.expiresAt;
    final record = this.record;
    return {
      if (expiresAt != null) 'ExpiresAt': expiresAt,
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

/// Time to live duration, where the record is hard deleted after the expiration
/// time is reached; <code>ExpiresAt</code> = <code>EventTime</code> +
/// <code>TtlDuration</code>. For information on HardDelete, see the <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_feature_store_DeleteRecord.html">DeleteRecord</a>
/// API in the Amazon SageMaker API Reference guide.
class TtlDuration {
  /// <code>TtlDuration</code> time unit.
  final TtlDurationUnit unit;

  /// <code>TtlDuration</code> time value.
  final int value;

  TtlDuration({
    required this.unit,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'Unit': unit.toValue(),
      'Value': value,
    };
  }
}

enum TtlDurationUnit {
  seconds,
  minutes,
  hours,
  days,
  weeks,
}

extension TtlDurationUnitValueExtension on TtlDurationUnit {
  String toValue() {
    switch (this) {
      case TtlDurationUnit.seconds:
        return 'Seconds';
      case TtlDurationUnit.minutes:
        return 'Minutes';
      case TtlDurationUnit.hours:
        return 'Hours';
      case TtlDurationUnit.days:
        return 'Days';
      case TtlDurationUnit.weeks:
        return 'Weeks';
    }
  }
}

extension TtlDurationUnitFromString on String {
  TtlDurationUnit toTtlDurationUnit() {
    switch (this) {
      case 'Seconds':
        return TtlDurationUnit.seconds;
      case 'Minutes':
        return TtlDurationUnit.minutes;
      case 'Hours':
        return TtlDurationUnit.hours;
      case 'Days':
        return TtlDurationUnit.days;
      case 'Weeks':
        return TtlDurationUnit.weeks;
    }
    throw Exception('$this is not known in enum TtlDurationUnit');
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
