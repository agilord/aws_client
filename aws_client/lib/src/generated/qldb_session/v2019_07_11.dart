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

/// The transactional data APIs for Amazon QLDB
/// <note>
/// Instead of interacting directly with this API, we recommend using the QLDB
/// driver or the QLDB shell to execute data transactions on a ledger.
///
/// <ul>
/// <li>
/// If you are working with an AWS SDK, use the QLDB driver. The driver provides
/// a high-level abstraction layer above this <i>QLDB Session</i> data plane and
/// manages <code>SendCommand</code> API calls for you. For information and a
/// list of supported programming languages, see <a
/// href="https://docs.aws.amazon.com/qldb/latest/developerguide/getting-started-driver.html">Getting
/// started with the driver</a> in the <i>Amazon QLDB Developer Guide</i>.
/// </li>
/// <li>
/// If you are working with the AWS Command Line Interface (AWS CLI), use the
/// QLDB shell. The shell is a command line interface that uses the QLDB driver
/// to interact with a ledger. For information, see <a
/// href="https://docs.aws.amazon.com/qldb/latest/developerguide/data-shell.html">Accessing
/// Amazon QLDB using the QLDB shell</a>.
/// </li>
/// </ul> </note>
class QldbSession {
  final _s.JsonProtocol _protocol;
  QldbSession({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'session.qldb',
            signingName: 'qldb',
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

  /// Sends a command to an Amazon QLDB ledger.
  /// <note>
  /// Instead of interacting directly with this API, we recommend using the QLDB
  /// driver or the QLDB shell to execute data transactions on a ledger.
  ///
  /// <ul>
  /// <li>
  /// If you are working with an AWS SDK, use the QLDB driver. The driver
  /// provides a high-level abstraction layer above this <i>QLDB Session</i>
  /// data plane and manages <code>SendCommand</code> API calls for you. For
  /// information and a list of supported programming languages, see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/getting-started-driver.html">Getting
  /// started with the driver</a> in the <i>Amazon QLDB Developer Guide</i>.
  /// </li>
  /// <li>
  /// If you are working with the AWS Command Line Interface (AWS CLI), use the
  /// QLDB shell. The shell is a command line interface that uses the QLDB
  /// driver to interact with a ledger. For information, see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/data-shell.html">Accessing
  /// Amazon QLDB using the QLDB shell</a>.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidSessionException].
  /// May throw [OccConflictException].
  /// May throw [RateExceededException].
  /// May throw [LimitExceededException].
  /// May throw [CapacityExceededException].
  ///
  /// Parameter [abortTransaction] :
  /// Command to abort the current transaction.
  ///
  /// Parameter [commitTransaction] :
  /// Command to commit the specified transaction.
  ///
  /// Parameter [endSession] :
  /// Command to end the current session.
  ///
  /// Parameter [executeStatement] :
  /// Command to execute a statement in the specified transaction.
  ///
  /// Parameter [fetchPage] :
  /// Command to fetch a page.
  ///
  /// Parameter [sessionToken] :
  /// Specifies the session token for the current command. A session token is
  /// constant throughout the life of the session.
  ///
  /// To obtain a session token, run the <code>StartSession</code> command. This
  /// <code>SessionToken</code> is required for every subsequent command that is
  /// issued during the current session.
  ///
  /// Parameter [startSession] :
  /// Command to start a new session. A session token is obtained as part of the
  /// response.
  ///
  /// Parameter [startTransaction] :
  /// Command to start a new transaction.
  Future<SendCommandResult> sendCommand({
    AbortTransactionRequest? abortTransaction,
    CommitTransactionRequest? commitTransaction,
    EndSessionRequest? endSession,
    ExecuteStatementRequest? executeStatement,
    FetchPageRequest? fetchPage,
    String? sessionToken,
    StartSessionRequest? startSession,
    StartTransactionRequest? startTransaction,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'QLDBSession.SendCommand'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (abortTransaction != null) 'AbortTransaction': abortTransaction,
        if (commitTransaction != null) 'CommitTransaction': commitTransaction,
        if (endSession != null) 'EndSession': endSession,
        if (executeStatement != null) 'ExecuteStatement': executeStatement,
        if (fetchPage != null) 'FetchPage': fetchPage,
        if (sessionToken != null) 'SessionToken': sessionToken,
        if (startSession != null) 'StartSession': startSession,
        if (startTransaction != null) 'StartTransaction': startTransaction,
      },
    );

    return SendCommandResult.fromJson(jsonResponse.body);
  }
}

/// Contains the details of the transaction to abort.
class AbortTransactionRequest {
  AbortTransactionRequest();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the details of the aborted transaction.
class AbortTransactionResult {
  /// Contains server-side performance information for the command.
  final TimingInformation? timingInformation;

  AbortTransactionResult({
    this.timingInformation,
  });

  factory AbortTransactionResult.fromJson(Map<String, dynamic> json) {
    return AbortTransactionResult(
      timingInformation: json['TimingInformation'] != null
          ? TimingInformation.fromJson(
              json['TimingInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final timingInformation = this.timingInformation;
    return {
      if (timingInformation != null) 'TimingInformation': timingInformation,
    };
  }
}

/// Contains the details of the transaction to commit.
class CommitTransactionRequest {
  /// Specifies the commit digest for the transaction to commit. For every active
  /// transaction, the commit digest must be passed. QLDB validates
  /// <code>CommitDigest</code> and rejects the commit with an error if the digest
  /// computed on the client does not match the digest computed by QLDB.
  ///
  /// The purpose of the <code>CommitDigest</code> parameter is to ensure that
  /// QLDB commits a transaction if and only if the server has processed the exact
  /// set of statements sent by the client, in the same order that client sent
  /// them, and with no duplicates.
  final Uint8List commitDigest;

  /// Specifies the transaction ID of the transaction to commit.
  final String transactionId;

  CommitTransactionRequest({
    required this.commitDigest,
    required this.transactionId,
  });

  Map<String, dynamic> toJson() {
    final commitDigest = this.commitDigest;
    final transactionId = this.transactionId;
    return {
      'CommitDigest': base64Encode(commitDigest),
      'TransactionId': transactionId,
    };
  }
}

/// Contains the details of the committed transaction.
class CommitTransactionResult {
  /// The commit digest of the committed transaction.
  final Uint8List? commitDigest;

  /// Contains metrics about the number of I/O requests that were consumed.
  final IOUsage? consumedIOs;

  /// Contains server-side performance information for the command.
  final TimingInformation? timingInformation;

  /// The transaction ID of the committed transaction.
  final String? transactionId;

  CommitTransactionResult({
    this.commitDigest,
    this.consumedIOs,
    this.timingInformation,
    this.transactionId,
  });

  factory CommitTransactionResult.fromJson(Map<String, dynamic> json) {
    return CommitTransactionResult(
      commitDigest: _s.decodeNullableUint8List(json['CommitDigest'] as String?),
      consumedIOs: json['ConsumedIOs'] != null
          ? IOUsage.fromJson(json['ConsumedIOs'] as Map<String, dynamic>)
          : null,
      timingInformation: json['TimingInformation'] != null
          ? TimingInformation.fromJson(
              json['TimingInformation'] as Map<String, dynamic>)
          : null,
      transactionId: json['TransactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitDigest = this.commitDigest;
    final consumedIOs = this.consumedIOs;
    final timingInformation = this.timingInformation;
    final transactionId = this.transactionId;
    return {
      if (commitDigest != null) 'CommitDigest': base64Encode(commitDigest),
      if (consumedIOs != null) 'ConsumedIOs': consumedIOs,
      if (timingInformation != null) 'TimingInformation': timingInformation,
      if (transactionId != null) 'TransactionId': transactionId,
    };
  }
}

/// Specifies a request to end the session.
class EndSessionRequest {
  EndSessionRequest();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the details of the ended session.
class EndSessionResult {
  /// Contains server-side performance information for the command.
  final TimingInformation? timingInformation;

  EndSessionResult({
    this.timingInformation,
  });

  factory EndSessionResult.fromJson(Map<String, dynamic> json) {
    return EndSessionResult(
      timingInformation: json['TimingInformation'] != null
          ? TimingInformation.fromJson(
              json['TimingInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final timingInformation = this.timingInformation;
    return {
      if (timingInformation != null) 'TimingInformation': timingInformation,
    };
  }
}

/// Specifies a request to execute a statement.
class ExecuteStatementRequest {
  /// Specifies the statement of the request.
  final String statement;

  /// Specifies the transaction ID of the request.
  final String transactionId;

  /// Specifies the parameters for the parameterized statement in the request.
  final List<ValueHolder>? parameters;

  ExecuteStatementRequest({
    required this.statement,
    required this.transactionId,
    this.parameters,
  });

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    final transactionId = this.transactionId;
    final parameters = this.parameters;
    return {
      'Statement': statement,
      'TransactionId': transactionId,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Contains the details of the executed statement.
class ExecuteStatementResult {
  /// Contains metrics about the number of I/O requests that were consumed.
  final IOUsage? consumedIOs;

  /// Contains the details of the first fetched page.
  final Page? firstPage;

  /// Contains server-side performance information for the command.
  final TimingInformation? timingInformation;

  ExecuteStatementResult({
    this.consumedIOs,
    this.firstPage,
    this.timingInformation,
  });

  factory ExecuteStatementResult.fromJson(Map<String, dynamic> json) {
    return ExecuteStatementResult(
      consumedIOs: json['ConsumedIOs'] != null
          ? IOUsage.fromJson(json['ConsumedIOs'] as Map<String, dynamic>)
          : null,
      firstPage: json['FirstPage'] != null
          ? Page.fromJson(json['FirstPage'] as Map<String, dynamic>)
          : null,
      timingInformation: json['TimingInformation'] != null
          ? TimingInformation.fromJson(
              json['TimingInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedIOs = this.consumedIOs;
    final firstPage = this.firstPage;
    final timingInformation = this.timingInformation;
    return {
      if (consumedIOs != null) 'ConsumedIOs': consumedIOs,
      if (firstPage != null) 'FirstPage': firstPage,
      if (timingInformation != null) 'TimingInformation': timingInformation,
    };
  }
}

/// Specifies the details of the page to be fetched.
class FetchPageRequest {
  /// Specifies the next page token of the page to be fetched.
  final String nextPageToken;

  /// Specifies the transaction ID of the page to be fetched.
  final String transactionId;

  FetchPageRequest({
    required this.nextPageToken,
    required this.transactionId,
  });

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final transactionId = this.transactionId;
    return {
      'NextPageToken': nextPageToken,
      'TransactionId': transactionId,
    };
  }
}

/// Contains the page that was fetched.
class FetchPageResult {
  /// Contains metrics about the number of I/O requests that were consumed.
  final IOUsage? consumedIOs;

  /// Contains details of the fetched page.
  final Page? page;

  /// Contains server-side performance information for the command.
  final TimingInformation? timingInformation;

  FetchPageResult({
    this.consumedIOs,
    this.page,
    this.timingInformation,
  });

  factory FetchPageResult.fromJson(Map<String, dynamic> json) {
    return FetchPageResult(
      consumedIOs: json['ConsumedIOs'] != null
          ? IOUsage.fromJson(json['ConsumedIOs'] as Map<String, dynamic>)
          : null,
      page: json['Page'] != null
          ? Page.fromJson(json['Page'] as Map<String, dynamic>)
          : null,
      timingInformation: json['TimingInformation'] != null
          ? TimingInformation.fromJson(
              json['TimingInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final consumedIOs = this.consumedIOs;
    final page = this.page;
    final timingInformation = this.timingInformation;
    return {
      if (consumedIOs != null) 'ConsumedIOs': consumedIOs,
      if (page != null) 'Page': page,
      if (timingInformation != null) 'TimingInformation': timingInformation,
    };
  }
}

/// Contains I/O usage metrics for a command that was invoked.
class IOUsage {
  /// The number of read I/O requests that the command made.
  final int? readIOs;

  /// The number of write I/O requests that the command made.
  final int? writeIOs;

  IOUsage({
    this.readIOs,
    this.writeIOs,
  });

  factory IOUsage.fromJson(Map<String, dynamic> json) {
    return IOUsage(
      readIOs: json['ReadIOs'] as int?,
      writeIOs: json['WriteIOs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final readIOs = this.readIOs;
    final writeIOs = this.writeIOs;
    return {
      if (readIOs != null) 'ReadIOs': readIOs,
      if (writeIOs != null) 'WriteIOs': writeIOs,
    };
  }
}

/// Contains details of the fetched page.
class Page {
  /// The token of the next page.
  final String? nextPageToken;

  /// A structure that contains values in multiple encoding formats.
  final List<ValueHolder>? values;

  Page({
    this.nextPageToken,
    this.values,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      nextPageToken: json['NextPageToken'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => ValueHolder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final values = this.values;
    return {
      if (nextPageToken != null) 'NextPageToken': nextPageToken,
      if (values != null) 'Values': values,
    };
  }
}

class SendCommandResult {
  /// Contains the details of the aborted transaction.
  final AbortTransactionResult? abortTransaction;

  /// Contains the details of the committed transaction.
  final CommitTransactionResult? commitTransaction;

  /// Contains the details of the ended session.
  final EndSessionResult? endSession;

  /// Contains the details of the executed statement.
  final ExecuteStatementResult? executeStatement;

  /// Contains the details of the fetched page.
  final FetchPageResult? fetchPage;

  /// Contains the details of the started session that includes a session token.
  /// This <code>SessionToken</code> is required for every subsequent command that
  /// is issued during the current session.
  final StartSessionResult? startSession;

  /// Contains the details of the started transaction.
  final StartTransactionResult? startTransaction;

  SendCommandResult({
    this.abortTransaction,
    this.commitTransaction,
    this.endSession,
    this.executeStatement,
    this.fetchPage,
    this.startSession,
    this.startTransaction,
  });

  factory SendCommandResult.fromJson(Map<String, dynamic> json) {
    return SendCommandResult(
      abortTransaction: json['AbortTransaction'] != null
          ? AbortTransactionResult.fromJson(
              json['AbortTransaction'] as Map<String, dynamic>)
          : null,
      commitTransaction: json['CommitTransaction'] != null
          ? CommitTransactionResult.fromJson(
              json['CommitTransaction'] as Map<String, dynamic>)
          : null,
      endSession: json['EndSession'] != null
          ? EndSessionResult.fromJson(
              json['EndSession'] as Map<String, dynamic>)
          : null,
      executeStatement: json['ExecuteStatement'] != null
          ? ExecuteStatementResult.fromJson(
              json['ExecuteStatement'] as Map<String, dynamic>)
          : null,
      fetchPage: json['FetchPage'] != null
          ? FetchPageResult.fromJson(json['FetchPage'] as Map<String, dynamic>)
          : null,
      startSession: json['StartSession'] != null
          ? StartSessionResult.fromJson(
              json['StartSession'] as Map<String, dynamic>)
          : null,
      startTransaction: json['StartTransaction'] != null
          ? StartTransactionResult.fromJson(
              json['StartTransaction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final abortTransaction = this.abortTransaction;
    final commitTransaction = this.commitTransaction;
    final endSession = this.endSession;
    final executeStatement = this.executeStatement;
    final fetchPage = this.fetchPage;
    final startSession = this.startSession;
    final startTransaction = this.startTransaction;
    return {
      if (abortTransaction != null) 'AbortTransaction': abortTransaction,
      if (commitTransaction != null) 'CommitTransaction': commitTransaction,
      if (endSession != null) 'EndSession': endSession,
      if (executeStatement != null) 'ExecuteStatement': executeStatement,
      if (fetchPage != null) 'FetchPage': fetchPage,
      if (startSession != null) 'StartSession': startSession,
      if (startTransaction != null) 'StartTransaction': startTransaction,
    };
  }
}

/// Specifies a request to start a new session.
class StartSessionRequest {
  /// The name of the ledger to start a new session against.
  final String ledgerName;

  StartSessionRequest({
    required this.ledgerName,
  });

  Map<String, dynamic> toJson() {
    final ledgerName = this.ledgerName;
    return {
      'LedgerName': ledgerName,
    };
  }
}

/// Contains the details of the started session.
class StartSessionResult {
  /// Session token of the started session. This <code>SessionToken</code> is
  /// required for every subsequent command that is issued during the current
  /// session.
  final String? sessionToken;

  /// Contains server-side performance information for the command.
  final TimingInformation? timingInformation;

  StartSessionResult({
    this.sessionToken,
    this.timingInformation,
  });

  factory StartSessionResult.fromJson(Map<String, dynamic> json) {
    return StartSessionResult(
      sessionToken: json['SessionToken'] as String?,
      timingInformation: json['TimingInformation'] != null
          ? TimingInformation.fromJson(
              json['TimingInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionToken = this.sessionToken;
    final timingInformation = this.timingInformation;
    return {
      if (sessionToken != null) 'SessionToken': sessionToken,
      if (timingInformation != null) 'TimingInformation': timingInformation,
    };
  }
}

/// Specifies a request to start a transaction.
class StartTransactionRequest {
  StartTransactionRequest();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the details of the started transaction.
class StartTransactionResult {
  /// Contains server-side performance information for the command.
  final TimingInformation? timingInformation;

  /// The transaction ID of the started transaction.
  final String? transactionId;

  StartTransactionResult({
    this.timingInformation,
    this.transactionId,
  });

  factory StartTransactionResult.fromJson(Map<String, dynamic> json) {
    return StartTransactionResult(
      timingInformation: json['TimingInformation'] != null
          ? TimingInformation.fromJson(
              json['TimingInformation'] as Map<String, dynamic>)
          : null,
      transactionId: json['TransactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final timingInformation = this.timingInformation;
    final transactionId = this.transactionId;
    return {
      if (timingInformation != null) 'TimingInformation': timingInformation,
      if (transactionId != null) 'TransactionId': transactionId,
    };
  }
}

/// Contains server-side performance information for a command. Amazon QLDB
/// captures timing information between the times when it receives the request
/// and when it sends the corresponding response.
class TimingInformation {
  /// The amount of time that QLDB spent on processing the command, measured in
  /// milliseconds.
  final int? processingTimeMilliseconds;

  TimingInformation({
    this.processingTimeMilliseconds,
  });

  factory TimingInformation.fromJson(Map<String, dynamic> json) {
    return TimingInformation(
      processingTimeMilliseconds: json['ProcessingTimeMilliseconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final processingTimeMilliseconds = this.processingTimeMilliseconds;
    return {
      if (processingTimeMilliseconds != null)
        'ProcessingTimeMilliseconds': processingTimeMilliseconds,
    };
  }
}

/// A structure that can contain a value in multiple encoding formats.
class ValueHolder {
  /// An Amazon Ion binary value contained in a <code>ValueHolder</code>
  /// structure.
  final Uint8List? ionBinary;

  /// An Amazon Ion plaintext value contained in a <code>ValueHolder</code>
  /// structure.
  final String? ionText;

  ValueHolder({
    this.ionBinary,
    this.ionText,
  });

  factory ValueHolder.fromJson(Map<String, dynamic> json) {
    return ValueHolder(
      ionBinary: _s.decodeNullableUint8List(json['IonBinary'] as String?),
      ionText: json['IonText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ionBinary = this.ionBinary;
    final ionText = this.ionText;
    return {
      if (ionBinary != null) 'IonBinary': base64Encode(ionBinary),
      if (ionText != null) 'IonText': ionText,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class CapacityExceededException extends _s.GenericAwsException {
  CapacityExceededException({String? type, String? message})
      : super(type: type, code: 'CapacityExceededException', message: message);
}

class InvalidSessionException extends _s.GenericAwsException {
  InvalidSessionException({String? type, String? message})
      : super(type: type, code: 'InvalidSessionException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OccConflictException extends _s.GenericAwsException {
  OccConflictException({String? type, String? message})
      : super(type: type, code: 'OccConflictException', message: message);
}

class RateExceededException extends _s.GenericAwsException {
  RateExceededException({String? type, String? message})
      : super(type: type, code: 'RateExceededException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'CapacityExceededException': (type, message) =>
      CapacityExceededException(type: type, message: message),
  'InvalidSessionException': (type, message) =>
      InvalidSessionException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'OccConflictException': (type, message) =>
      OccConflictException(type: type, message: message),
  'RateExceededException': (type, message) =>
      RateExceededException(type: type, message: message),
};
