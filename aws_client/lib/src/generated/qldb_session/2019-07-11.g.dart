// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-07-11.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AbortTransactionRequestToJson(
        AbortTransactionRequest instance) =>
    <String, dynamic>{};

AbortTransactionResult _$AbortTransactionResultFromJson(
    Map<String, dynamic> json) {
  return AbortTransactionResult(
    timingInformation: json['TimingInformation'] == null
        ? null
        : TimingInformation.fromJson(
            json['TimingInformation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommitTransactionRequestToJson(
    CommitTransactionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CommitDigest', const Uint8ListConverter().toJson(instance.commitDigest));
  writeNotNull('TransactionId', instance.transactionId);
  return val;
}

CommitTransactionResult _$CommitTransactionResultFromJson(
    Map<String, dynamic> json) {
  return CommitTransactionResult(
    commitDigest:
        const Uint8ListConverter().fromJson(json['CommitDigest'] as String),
    consumedIOs: json['ConsumedIOs'] == null
        ? null
        : IOUsage.fromJson(json['ConsumedIOs'] as Map<String, dynamic>),
    timingInformation: json['TimingInformation'] == null
        ? null
        : TimingInformation.fromJson(
            json['TimingInformation'] as Map<String, dynamic>),
    transactionId: json['TransactionId'] as String,
  );
}

Map<String, dynamic> _$EndSessionRequestToJson(EndSessionRequest instance) =>
    <String, dynamic>{};

EndSessionResult _$EndSessionResultFromJson(Map<String, dynamic> json) {
  return EndSessionResult(
    timingInformation: json['TimingInformation'] == null
        ? null
        : TimingInformation.fromJson(
            json['TimingInformation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExecuteStatementRequestToJson(
    ExecuteStatementRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Statement', instance.statement);
  writeNotNull('TransactionId', instance.transactionId);
  writeNotNull(
      'Parameters', instance.parameters?.map((e) => e?.toJson())?.toList());
  return val;
}

ExecuteStatementResult _$ExecuteStatementResultFromJson(
    Map<String, dynamic> json) {
  return ExecuteStatementResult(
    consumedIOs: json['ConsumedIOs'] == null
        ? null
        : IOUsage.fromJson(json['ConsumedIOs'] as Map<String, dynamic>),
    firstPage: json['FirstPage'] == null
        ? null
        : Page.fromJson(json['FirstPage'] as Map<String, dynamic>),
    timingInformation: json['TimingInformation'] == null
        ? null
        : TimingInformation.fromJson(
            json['TimingInformation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FetchPageRequestToJson(FetchPageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NextPageToken', instance.nextPageToken);
  writeNotNull('TransactionId', instance.transactionId);
  return val;
}

FetchPageResult _$FetchPageResultFromJson(Map<String, dynamic> json) {
  return FetchPageResult(
    consumedIOs: json['ConsumedIOs'] == null
        ? null
        : IOUsage.fromJson(json['ConsumedIOs'] as Map<String, dynamic>),
    page: json['Page'] == null
        ? null
        : Page.fromJson(json['Page'] as Map<String, dynamic>),
    timingInformation: json['TimingInformation'] == null
        ? null
        : TimingInformation.fromJson(
            json['TimingInformation'] as Map<String, dynamic>),
  );
}

IOUsage _$IOUsageFromJson(Map<String, dynamic> json) {
  return IOUsage(
    readIOs: json['ReadIOs'] as int,
    writeIOs: json['WriteIOs'] as int,
  );
}

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page(
    nextPageToken: json['NextPageToken'] as String,
    values: (json['Values'] as List)
        ?.map((e) =>
            e == null ? null : ValueHolder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SendCommandResult _$SendCommandResultFromJson(Map<String, dynamic> json) {
  return SendCommandResult(
    abortTransaction: json['AbortTransaction'] == null
        ? null
        : AbortTransactionResult.fromJson(
            json['AbortTransaction'] as Map<String, dynamic>),
    commitTransaction: json['CommitTransaction'] == null
        ? null
        : CommitTransactionResult.fromJson(
            json['CommitTransaction'] as Map<String, dynamic>),
    endSession: json['EndSession'] == null
        ? null
        : EndSessionResult.fromJson(json['EndSession'] as Map<String, dynamic>),
    executeStatement: json['ExecuteStatement'] == null
        ? null
        : ExecuteStatementResult.fromJson(
            json['ExecuteStatement'] as Map<String, dynamic>),
    fetchPage: json['FetchPage'] == null
        ? null
        : FetchPageResult.fromJson(json['FetchPage'] as Map<String, dynamic>),
    startSession: json['StartSession'] == null
        ? null
        : StartSessionResult.fromJson(
            json['StartSession'] as Map<String, dynamic>),
    startTransaction: json['StartTransaction'] == null
        ? null
        : StartTransactionResult.fromJson(
            json['StartTransaction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StartSessionRequestToJson(StartSessionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LedgerName', instance.ledgerName);
  return val;
}

StartSessionResult _$StartSessionResultFromJson(Map<String, dynamic> json) {
  return StartSessionResult(
    sessionToken: json['SessionToken'] as String,
    timingInformation: json['TimingInformation'] == null
        ? null
        : TimingInformation.fromJson(
            json['TimingInformation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StartTransactionRequestToJson(
        StartTransactionRequest instance) =>
    <String, dynamic>{};

StartTransactionResult _$StartTransactionResultFromJson(
    Map<String, dynamic> json) {
  return StartTransactionResult(
    timingInformation: json['TimingInformation'] == null
        ? null
        : TimingInformation.fromJson(
            json['TimingInformation'] as Map<String, dynamic>),
    transactionId: json['TransactionId'] as String,
  );
}

TimingInformation _$TimingInformationFromJson(Map<String, dynamic> json) {
  return TimingInformation(
    processingTimeMilliseconds: json['ProcessingTimeMilliseconds'] as int,
  );
}

ValueHolder _$ValueHolderFromJson(Map<String, dynamic> json) {
  return ValueHolder(
    ionBinary: const Uint8ListConverter().fromJson(json['IonBinary'] as String),
    ionText: json['IonText'] as String,
  );
}

Map<String, dynamic> _$ValueHolderToJson(ValueHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'IonBinary', const Uint8ListConverter().toJson(instance.ionBinary));
  writeNotNull('IonText', instance.ionText);
  return val;
}
