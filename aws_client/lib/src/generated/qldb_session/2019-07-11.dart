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

part '2019-07-11.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'session.qldb',
            signingName: 'qldb',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    AbortTransactionRequest abortTransaction,
    CommitTransactionRequest commitTransaction,
    EndSessionRequest endSession,
    ExecuteStatementRequest executeStatement,
    FetchPageRequest fetchPage,
    String sessionToken,
    StartSessionRequest startSession,
    StartTransactionRequest startTransaction,
  }) async {
    _s.validateStringLength(
      'sessionToken',
      sessionToken,
      4,
      1024,
    );
    _s.validateStringPattern(
      'sessionToken',
      sessionToken,
      r'''^[A-Za-z-0-9+/=]+$''',
    );
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AbortTransactionRequest {
  AbortTransactionRequest();
  Map<String, dynamic> toJson() => _$AbortTransactionRequestToJson(this);
}

/// Contains the details of the aborted transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AbortTransactionResult {
  /// Contains server-side performance information for the command.
  @_s.JsonKey(name: 'TimingInformation')
  final TimingInformation timingInformation;

  AbortTransactionResult({
    this.timingInformation,
  });
  factory AbortTransactionResult.fromJson(Map<String, dynamic> json) =>
      _$AbortTransactionResultFromJson(json);
}

/// Contains the details of the transaction to commit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @Uint8ListConverter()
  @_s.JsonKey(name: 'CommitDigest')
  final Uint8List commitDigest;

  /// Specifies the transaction ID of the transaction to commit.
  @_s.JsonKey(name: 'TransactionId')
  final String transactionId;

  CommitTransactionRequest({
    @_s.required this.commitDigest,
    @_s.required this.transactionId,
  });
  Map<String, dynamic> toJson() => _$CommitTransactionRequestToJson(this);
}

/// Contains the details of the committed transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CommitTransactionResult {
  /// The commit digest of the committed transaction.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'CommitDigest')
  final Uint8List commitDigest;

  /// Contains metrics about the number of I/O requests that were consumed.
  @_s.JsonKey(name: 'ConsumedIOs')
  final IOUsage consumedIOs;

  /// Contains server-side performance information for the command.
  @_s.JsonKey(name: 'TimingInformation')
  final TimingInformation timingInformation;

  /// The transaction ID of the committed transaction.
  @_s.JsonKey(name: 'TransactionId')
  final String transactionId;

  CommitTransactionResult({
    this.commitDigest,
    this.consumedIOs,
    this.timingInformation,
    this.transactionId,
  });
  factory CommitTransactionResult.fromJson(Map<String, dynamic> json) =>
      _$CommitTransactionResultFromJson(json);
}

/// Specifies a request to end the session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EndSessionRequest {
  EndSessionRequest();
  Map<String, dynamic> toJson() => _$EndSessionRequestToJson(this);
}

/// Contains the details of the ended session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndSessionResult {
  /// Contains server-side performance information for the command.
  @_s.JsonKey(name: 'TimingInformation')
  final TimingInformation timingInformation;

  EndSessionResult({
    this.timingInformation,
  });
  factory EndSessionResult.fromJson(Map<String, dynamic> json) =>
      _$EndSessionResultFromJson(json);
}

/// Specifies a request to execute a statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExecuteStatementRequest {
  /// Specifies the statement of the request.
  @_s.JsonKey(name: 'Statement')
  final String statement;

  /// Specifies the transaction ID of the request.
  @_s.JsonKey(name: 'TransactionId')
  final String transactionId;

  /// Specifies the parameters for the parameterized statement in the request.
  @_s.JsonKey(name: 'Parameters')
  final List<ValueHolder> parameters;

  ExecuteStatementRequest({
    @_s.required this.statement,
    @_s.required this.transactionId,
    this.parameters,
  });
  Map<String, dynamic> toJson() => _$ExecuteStatementRequestToJson(this);
}

/// Contains the details of the executed statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecuteStatementResult {
  /// Contains metrics about the number of I/O requests that were consumed.
  @_s.JsonKey(name: 'ConsumedIOs')
  final IOUsage consumedIOs;

  /// Contains the details of the first fetched page.
  @_s.JsonKey(name: 'FirstPage')
  final Page firstPage;

  /// Contains server-side performance information for the command.
  @_s.JsonKey(name: 'TimingInformation')
  final TimingInformation timingInformation;

  ExecuteStatementResult({
    this.consumedIOs,
    this.firstPage,
    this.timingInformation,
  });
  factory ExecuteStatementResult.fromJson(Map<String, dynamic> json) =>
      _$ExecuteStatementResultFromJson(json);
}

/// Specifies the details of the page to be fetched.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FetchPageRequest {
  /// Specifies the next page token of the page to be fetched.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Specifies the transaction ID of the page to be fetched.
  @_s.JsonKey(name: 'TransactionId')
  final String transactionId;

  FetchPageRequest({
    @_s.required this.nextPageToken,
    @_s.required this.transactionId,
  });
  Map<String, dynamic> toJson() => _$FetchPageRequestToJson(this);
}

/// Contains the page that was fetched.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FetchPageResult {
  /// Contains metrics about the number of I/O requests that were consumed.
  @_s.JsonKey(name: 'ConsumedIOs')
  final IOUsage consumedIOs;

  /// Contains details of the fetched page.
  @_s.JsonKey(name: 'Page')
  final Page page;

  /// Contains server-side performance information for the command.
  @_s.JsonKey(name: 'TimingInformation')
  final TimingInformation timingInformation;

  FetchPageResult({
    this.consumedIOs,
    this.page,
    this.timingInformation,
  });
  factory FetchPageResult.fromJson(Map<String, dynamic> json) =>
      _$FetchPageResultFromJson(json);
}

/// Contains I/O usage metrics for a command that was invoked.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IOUsage {
  /// The number of read I/O requests that the command performed.
  @_s.JsonKey(name: 'ReadIOs')
  final int readIOs;

  /// The number of write I/O requests that the command performed.
  @_s.JsonKey(name: 'WriteIOs')
  final int writeIOs;

  IOUsage({
    this.readIOs,
    this.writeIOs,
  });
  factory IOUsage.fromJson(Map<String, dynamic> json) =>
      _$IOUsageFromJson(json);
}

/// Contains details of the fetched page.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Page {
  /// The token of the next page.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// A structure that contains values in multiple encoding formats.
  @_s.JsonKey(name: 'Values')
  final List<ValueHolder> values;

  Page({
    this.nextPageToken,
    this.values,
  });
  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendCommandResult {
  /// Contains the details of the aborted transaction.
  @_s.JsonKey(name: 'AbortTransaction')
  final AbortTransactionResult abortTransaction;

  /// Contains the details of the committed transaction.
  @_s.JsonKey(name: 'CommitTransaction')
  final CommitTransactionResult commitTransaction;

  /// Contains the details of the ended session.
  @_s.JsonKey(name: 'EndSession')
  final EndSessionResult endSession;

  /// Contains the details of the executed statement.
  @_s.JsonKey(name: 'ExecuteStatement')
  final ExecuteStatementResult executeStatement;

  /// Contains the details of the fetched page.
  @_s.JsonKey(name: 'FetchPage')
  final FetchPageResult fetchPage;

  /// Contains the details of the started session that includes a session token.
  /// This <code>SessionToken</code> is required for every subsequent command that
  /// is issued during the current session.
  @_s.JsonKey(name: 'StartSession')
  final StartSessionResult startSession;

  /// Contains the details of the started transaction.
  @_s.JsonKey(name: 'StartTransaction')
  final StartTransactionResult startTransaction;

  SendCommandResult({
    this.abortTransaction,
    this.commitTransaction,
    this.endSession,
    this.executeStatement,
    this.fetchPage,
    this.startSession,
    this.startTransaction,
  });
  factory SendCommandResult.fromJson(Map<String, dynamic> json) =>
      _$SendCommandResultFromJson(json);
}

/// Specifies a request to start a new session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartSessionRequest {
  /// The name of the ledger to start a new session against.
  @_s.JsonKey(name: 'LedgerName')
  final String ledgerName;

  StartSessionRequest({
    @_s.required this.ledgerName,
  });
  Map<String, dynamic> toJson() => _$StartSessionRequestToJson(this);
}

/// Contains the details of the started session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSessionResult {
  /// Session token of the started session. This <code>SessionToken</code> is
  /// required for every subsequent command that is issued during the current
  /// session.
  @_s.JsonKey(name: 'SessionToken')
  final String sessionToken;

  /// Contains server-side performance information for the command.
  @_s.JsonKey(name: 'TimingInformation')
  final TimingInformation timingInformation;

  StartSessionResult({
    this.sessionToken,
    this.timingInformation,
  });
  factory StartSessionResult.fromJson(Map<String, dynamic> json) =>
      _$StartSessionResultFromJson(json);
}

/// Specifies a request to start a transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartTransactionRequest {
  StartTransactionRequest();
  Map<String, dynamic> toJson() => _$StartTransactionRequestToJson(this);
}

/// Contains the details of the started transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTransactionResult {
  /// Contains server-side performance information for the command.
  @_s.JsonKey(name: 'TimingInformation')
  final TimingInformation timingInformation;

  /// The transaction ID of the started transaction.
  @_s.JsonKey(name: 'TransactionId')
  final String transactionId;

  StartTransactionResult({
    this.timingInformation,
    this.transactionId,
  });
  factory StartTransactionResult.fromJson(Map<String, dynamic> json) =>
      _$StartTransactionResultFromJson(json);
}

/// Contains server-side performance information for a command. Amazon QLDB
/// captures timing information between the times when it receives the request
/// and when it sends the corresponding response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimingInformation {
  /// The amount of time that was taken for the command to finish processing,
  /// measured in milliseconds.
  @_s.JsonKey(name: 'ProcessingTimeMilliseconds')
  final int processingTimeMilliseconds;

  TimingInformation({
    this.processingTimeMilliseconds,
  });
  factory TimingInformation.fromJson(Map<String, dynamic> json) =>
      _$TimingInformationFromJson(json);
}

/// A structure that can contain a value in multiple encoding formats.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ValueHolder {
  /// An Amazon Ion binary value contained in a <code>ValueHolder</code>
  /// structure.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'IonBinary')
  final Uint8List ionBinary;

  /// An Amazon Ion plaintext value contained in a <code>ValueHolder</code>
  /// structure.
  @_s.JsonKey(name: 'IonText')
  final String ionText;

  ValueHolder({
    this.ionBinary,
    this.ionText,
  });
  factory ValueHolder.fromJson(Map<String, dynamic> json) =>
      _$ValueHolderFromJson(json);

  Map<String, dynamic> toJson() => _$ValueHolderToJson(this);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InvalidSessionException extends _s.GenericAwsException {
  InvalidSessionException({String type, String message})
      : super(type: type, code: 'InvalidSessionException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OccConflictException extends _s.GenericAwsException {
  OccConflictException({String type, String message})
      : super(type: type, code: 'OccConflictException', message: message);
}

class RateExceededException extends _s.GenericAwsException {
  RateExceededException({String type, String message})
      : super(type: type, code: 'RateExceededException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InvalidSessionException': (type, message) =>
      InvalidSessionException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'OccConflictException': (type, message) =>
      OccConflictException(type: type, message: message),
  'RateExceededException': (type, message) =>
      RateExceededException(type: type, message: message),
};
