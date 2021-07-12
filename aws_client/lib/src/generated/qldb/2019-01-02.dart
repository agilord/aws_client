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

/// The control plane for Amazon QLDB
class Qldb {
  final _s.RestJsonProtocol _protocol;
  Qldb({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'qldb',
            signingName: 'qldb',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Ends a given Amazon QLDB journal stream. Before a stream can be canceled,
  /// its current status must be <code>ACTIVE</code>.
  ///
  /// You can't restart a stream after you cancel it. Canceled QLDB stream
  /// resources are subject to a 7-day retention period, so they are
  /// automatically deleted after this limit expires.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [ledgerName] :
  /// The name of the ledger.
  ///
  /// Parameter [streamId] :
  /// The UUID (represented in Base62-encoded text) of the QLDB journal stream
  /// to be canceled.
  Future<CancelJournalKinesisStreamResponse> cancelJournalKinesisStream({
    required String ledgerName,
    required String streamId,
  }) async {
    ArgumentError.checkNotNull(ledgerName, 'ledgerName');
    _s.validateStringLength(
      'ledgerName',
      ledgerName,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamId, 'streamId');
    _s.validateStringLength(
      'streamId',
      streamId,
      22,
      22,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/ledgers/${Uri.encodeComponent(ledgerName)}/journal-kinesis-streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJournalKinesisStreamResponse.fromJson(response);
  }

  /// Creates a new ledger in your AWS account in the current Region.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [name] :
  /// The name of the ledger that you want to create. The name must be unique
  /// among all of your ledgers in the current AWS Region.
  ///
  /// Naming constraints for ledger names are defined in <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/limits.html#limits.naming">Quotas
  /// in Amazon QLDB</a> in the <i>Amazon QLDB Developer Guide</i>.
  ///
  /// Parameter [permissionsMode] :
  /// The permissions mode to assign to the ledger that you want to create. This
  /// parameter can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW_ALL</code>: A legacy permissions mode that enables access
  /// control with API-level granularity for ledgers.
  ///
  /// This mode allows users who have the <code>SendCommand</code> API
  /// permission for this ledger to run all PartiQL commands (hence,
  /// <code>ALLOW_ALL</code>) on any tables in the specified ledger. This mode
  /// disregards any table-level or command-level IAM permissions policies that
  /// you create for the ledger.
  /// </li>
  /// <li>
  /// <code>STANDARD</code>: (<i>Recommended</i>) A permissions mode that
  /// enables access control with finer granularity for ledgers, tables, and
  /// PartiQL commands.
  ///
  /// By default, this mode denies all user requests to run any PartiQL commands
  /// on any tables in this ledger. To allow PartiQL commands to run, you must
  /// create IAM permissions policies for specific table resources and PartiQL
  /// actions, in addition to the <code>SendCommand</code> API permission for
  /// the ledger. For information, see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/getting-started-standard-mode.html">Getting
  /// started with the standard permissions mode</a> in the <i>Amazon QLDB
  /// Developer Guide</i>.
  /// </li>
  /// </ul> <note>
  /// We strongly recommend using the <code>STANDARD</code> permissions mode to
  /// maximize the security of your ledger data.
  /// </note>
  ///
  /// Parameter [deletionProtection] :
  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>)
  /// by default.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger. You can disable it by calling the
  /// <code>UpdateLedger</code> operation to set the flag to <code>false</code>.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to add as tags to the ledger that you want to create.
  /// Tag keys are case sensitive. Tag values are case sensitive and can be
  /// null.
  Future<CreateLedgerResponse> createLedger({
    required String name,
    required PermissionsMode permissionsMode,
    bool? deletionProtection,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionsMode, 'permissionsMode');
    final $payload = <String, dynamic>{
      'Name': name,
      'PermissionsMode': permissionsMode.toValue(),
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ledgers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLedgerResponse.fromJson(response);
  }

  /// Deletes a ledger and all of its contents. This action is irreversible.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger. You can disable it by calling the
  /// <code>UpdateLedger</code> operation to set the flag to <code>false</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [name] :
  /// The name of the ledger that you want to delete.
  Future<void> deleteLedger({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns detailed information about a given Amazon QLDB journal stream. The
  /// output includes the Amazon Resource Name (ARN), stream name, current
  /// status, creation time, and the parameters of the original stream creation
  /// request.
  ///
  /// This action does not return any expired journal streams. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/streams.create.html#streams.create.states.expiration">Expiration
  /// for terminal streams</a> in the <i>Amazon QLDB Developer Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [ledgerName] :
  /// The name of the ledger.
  ///
  /// Parameter [streamId] :
  /// The UUID (represented in Base62-encoded text) of the QLDB journal stream
  /// to describe.
  Future<DescribeJournalKinesisStreamResponse> describeJournalKinesisStream({
    required String ledgerName,
    required String streamId,
  }) async {
    ArgumentError.checkNotNull(ledgerName, 'ledgerName');
    _s.validateStringLength(
      'ledgerName',
      ledgerName,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamId, 'streamId');
    _s.validateStringLength(
      'streamId',
      streamId,
      22,
      22,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/ledgers/${Uri.encodeComponent(ledgerName)}/journal-kinesis-streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJournalKinesisStreamResponse.fromJson(response);
  }

  /// Returns information about a journal export job, including the ledger name,
  /// export ID, creation time, current status, and the parameters of the
  /// original export creation request.
  ///
  /// This action does not return any expired export jobs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export
  /// job expiration</a> in the <i>Amazon QLDB Developer Guide</i>.
  ///
  /// If the export job with the given <code>ExportId</code> doesn't exist, then
  /// throws <code>ResourceNotFoundException</code>.
  ///
  /// If the ledger with the given <code>Name</code> doesn't exist, then throws
  /// <code>ResourceNotFoundException</code>.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [exportId] :
  /// The UUID (represented in Base62-encoded text) of the journal export job to
  /// describe.
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  Future<DescribeJournalS3ExportResponse> describeJournalS3Export({
    required String exportId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(exportId, 'exportId');
    _s.validateStringLength(
      'exportId',
      exportId,
      22,
      22,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/ledgers/${Uri.encodeComponent(name)}/journal-s3-exports/${Uri.encodeComponent(exportId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJournalS3ExportResponse.fromJson(response);
  }

  /// Returns information about a ledger, including its state and when it was
  /// created.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the ledger that you want to describe.
  Future<DescribeLedgerResponse> describeLedger({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLedgerResponse.fromJson(response);
  }

  /// Exports journal contents within a date and time range from a ledger into a
  /// specified Amazon Simple Storage Service (Amazon S3) bucket. The data is
  /// written as files in Amazon Ion format.
  ///
  /// If the ledger with the given <code>Name</code> doesn't exist, then throws
  /// <code>ResourceNotFoundException</code>.
  ///
  /// If the ledger with the given <code>Name</code> is in <code>CREATING</code>
  /// status, then throws <code>ResourcePreconditionNotMetException</code>.
  ///
  /// You can initiate up to two concurrent journal export requests for each
  /// ledger. Beyond this limit, journal export requests throw
  /// <code>LimitExceededException</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [exclusiveEndTime] :
  /// The exclusive end date and time for the range of journal contents to
  /// export.
  ///
  /// The <code>ExclusiveEndTime</code> must be in <code>ISO 8601</code> date
  /// and time format and in Universal Coordinated Time (UTC). For example:
  /// <code>2019-06-13T21:36:34Z</code>.
  ///
  /// The <code>ExclusiveEndTime</code> must be less than or equal to the
  /// current UTC date and time.
  ///
  /// Parameter [inclusiveStartTime] :
  /// The inclusive start date and time for the range of journal contents to
  /// export.
  ///
  /// The <code>InclusiveStartTime</code> must be in <code>ISO 8601</code> date
  /// and time format and in Universal Coordinated Time (UTC). For example:
  /// <code>2019-06-13T21:36:34Z</code>.
  ///
  /// The <code>InclusiveStartTime</code> must be before
  /// <code>ExclusiveEndTime</code>.
  ///
  /// If you provide an <code>InclusiveStartTime</code> that is before the
  /// ledger's <code>CreationDateTime</code>, Amazon QLDB defaults it to the
  /// ledger's <code>CreationDateTime</code>.
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants QLDB
  /// permissions for a journal export job to do the following:
  ///
  /// <ul>
  /// <li>
  /// Write objects into your Amazon Simple Storage Service (Amazon S3) bucket.
  /// </li>
  /// <li>
  /// (Optional) Use your customer master key (CMK) in AWS Key Management
  /// Service (AWS KMS) for server-side encryption of your exported data.
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3ExportConfiguration] :
  /// The configuration settings of the Amazon S3 bucket destination for your
  /// export request.
  Future<ExportJournalToS3Response> exportJournalToS3({
    required DateTime exclusiveEndTime,
    required DateTime inclusiveStartTime,
    required String name,
    required String roleArn,
    required S3ExportConfiguration s3ExportConfiguration,
  }) async {
    ArgumentError.checkNotNull(exclusiveEndTime, 'exclusiveEndTime');
    ArgumentError.checkNotNull(inclusiveStartTime, 'inclusiveStartTime');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(s3ExportConfiguration, 's3ExportConfiguration');
    final $payload = <String, dynamic>{
      'ExclusiveEndTime': unixTimestampToJson(exclusiveEndTime),
      'InclusiveStartTime': unixTimestampToJson(inclusiveStartTime),
      'RoleArn': roleArn,
      'S3ExportConfiguration': s3ExportConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}/journal-s3-exports',
      exceptionFnMap: _exceptionFns,
    );
    return ExportJournalToS3Response.fromJson(response);
  }

  /// Returns a block object at a specified address in a journal. Also returns a
  /// proof of the specified block for verification if
  /// <code>DigestTipAddress</code> is provided.
  ///
  /// For information about the data contents in a block, see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/journal-contents.html">Journal
  /// contents</a> in the <i>Amazon QLDB Developer Guide</i>.
  ///
  /// If the specified ledger doesn't exist or is in <code>DELETING</code>
  /// status, then throws <code>ResourceNotFoundException</code>.
  ///
  /// If the specified ledger is in <code>CREATING</code> status, then throws
  /// <code>ResourcePreconditionNotMetException</code>.
  ///
  /// If no block exists with the specified address, then throws
  /// <code>InvalidParameterException</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [blockAddress] :
  /// The location of the block that you want to request. An address is an
  /// Amazon Ion structure that has two fields: <code>strandId</code> and
  /// <code>sequenceNo</code>.
  ///
  /// For example:
  /// <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:14}</code>.
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  ///
  /// Parameter [digestTipAddress] :
  /// The latest block location covered by the digest for which to request a
  /// proof. An address is an Amazon Ion structure that has two fields:
  /// <code>strandId</code> and <code>sequenceNo</code>.
  ///
  /// For example:
  /// <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:49}</code>.
  Future<GetBlockResponse> getBlock({
    required ValueHolder blockAddress,
    required String name,
    ValueHolder? digestTipAddress,
  }) async {
    ArgumentError.checkNotNull(blockAddress, 'blockAddress');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'BlockAddress': blockAddress,
      if (digestTipAddress != null) 'DigestTipAddress': digestTipAddress,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}/block',
      exceptionFnMap: _exceptionFns,
    );
    return GetBlockResponse.fromJson(response);
  }

  /// Returns the digest of a ledger at the latest committed block in the
  /// journal. The response includes a 256-bit hash value and a block address.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  Future<GetDigestResponse> getDigest({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}/digest',
      exceptionFnMap: _exceptionFns,
    );
    return GetDigestResponse.fromJson(response);
  }

  /// Returns a revision data object for a specified document ID and block
  /// address. Also returns a proof of the specified revision for verification
  /// if <code>DigestTipAddress</code> is provided.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [blockAddress] :
  /// The block location of the document revision to be verified. An address is
  /// an Amazon Ion structure that has two fields: <code>strandId</code> and
  /// <code>sequenceNo</code>.
  ///
  /// For example:
  /// <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:14}</code>.
  ///
  /// Parameter [documentId] :
  /// The UUID (represented in Base62-encoded text) of the document to be
  /// verified.
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  ///
  /// Parameter [digestTipAddress] :
  /// The latest block location covered by the digest for which to request a
  /// proof. An address is an Amazon Ion structure that has two fields:
  /// <code>strandId</code> and <code>sequenceNo</code>.
  ///
  /// For example:
  /// <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:49}</code>.
  Future<GetRevisionResponse> getRevision({
    required ValueHolder blockAddress,
    required String documentId,
    required String name,
    ValueHolder? digestTipAddress,
  }) async {
    ArgumentError.checkNotNull(blockAddress, 'blockAddress');
    ArgumentError.checkNotNull(documentId, 'documentId');
    _s.validateStringLength(
      'documentId',
      documentId,
      22,
      22,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'BlockAddress': blockAddress,
      'DocumentId': documentId,
      if (digestTipAddress != null) 'DigestTipAddress': digestTipAddress,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}/revision',
      exceptionFnMap: _exceptionFns,
    );
    return GetRevisionResponse.fromJson(response);
  }

  /// Returns an array of all Amazon QLDB journal stream descriptors for a given
  /// ledger. The output of each stream descriptor includes the same details
  /// that are returned by <code>DescribeJournalKinesisStream</code>.
  ///
  /// This action does not return any expired journal streams. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/streams.create.html#streams.create.states.expiration">Expiration
  /// for terminal streams</a> in the <i>Amazon QLDB Developer Guide</i>.
  ///
  /// This action returns a maximum of <code>MaxResults</code> items. It is
  /// paginated so that you can retrieve all the items by calling
  /// <code>ListJournalKinesisStreamsForLedger</code> multiple times.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [ledgerName] :
  /// The name of the ledger.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single
  /// <code>ListJournalKinesisStreamsForLedger</code> request. (The actual
  /// number of results returned might be fewer.)
  ///
  /// Parameter [nextToken] :
  /// A pagination token, indicating that you want to retrieve the next page of
  /// results. If you received a value for <code>NextToken</code> in the
  /// response from a previous <code>ListJournalKinesisStreamsForLedger</code>
  /// call, you should use that value as input here.
  Future<ListJournalKinesisStreamsForLedgerResponse>
      listJournalKinesisStreamsForLedger({
    required String ledgerName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(ledgerName, 'ledgerName');
    _s.validateStringLength(
      'ledgerName',
      ledgerName,
      1,
      32,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/ledgers/${Uri.encodeComponent(ledgerName)}/journal-kinesis-streams',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJournalKinesisStreamsForLedgerResponse.fromJson(response);
  }

  /// Returns an array of journal export job descriptions for all ledgers that
  /// are associated with the current AWS account and Region.
  ///
  /// This action returns a maximum of <code>MaxResults</code> items, and is
  /// paginated so that you can retrieve all the items by calling
  /// <code>ListJournalS3Exports</code> multiple times.
  ///
  /// This action does not return any expired export jobs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export
  /// job expiration</a> in the <i>Amazon QLDB Developer Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single
  /// <code>ListJournalS3Exports</code> request. (The actual number of results
  /// returned might be fewer.)
  ///
  /// Parameter [nextToken] :
  /// A pagination token, indicating that you want to retrieve the next page of
  /// results. If you received a value for <code>NextToken</code> in the
  /// response from a previous <code>ListJournalS3Exports</code> call, then you
  /// should use that value as input here.
  Future<ListJournalS3ExportsResponse> listJournalS3Exports({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/journal-s3-exports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJournalS3ExportsResponse.fromJson(response);
  }

  /// Returns an array of journal export job descriptions for a specified
  /// ledger.
  ///
  /// This action returns a maximum of <code>MaxResults</code> items, and is
  /// paginated so that you can retrieve all the items by calling
  /// <code>ListJournalS3ExportsForLedger</code> multiple times.
  ///
  /// This action does not return any expired export jobs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export
  /// job expiration</a> in the <i>Amazon QLDB Developer Guide</i>.
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single
  /// <code>ListJournalS3ExportsForLedger</code> request. (The actual number of
  /// results returned might be fewer.)
  ///
  /// Parameter [nextToken] :
  /// A pagination token, indicating that you want to retrieve the next page of
  /// results. If you received a value for <code>NextToken</code> in the
  /// response from a previous <code>ListJournalS3ExportsForLedger</code> call,
  /// then you should use that value as input here.
  Future<ListJournalS3ExportsForLedgerResponse> listJournalS3ExportsForLedger({
    required String name,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}/journal-s3-exports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJournalS3ExportsForLedgerResponse.fromJson(response);
  }

  /// Returns an array of ledger summaries that are associated with the current
  /// AWS account and Region.
  ///
  /// This action returns a maximum of 100 items and is paginated so that you
  /// can retrieve all the items by calling <code>ListLedgers</code> multiple
  /// times.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single
  /// <code>ListLedgers</code> request. (The actual number of results returned
  /// might be fewer.)
  ///
  /// Parameter [nextToken] :
  /// A pagination token, indicating that you want to retrieve the next page of
  /// results. If you received a value for <code>NextToken</code> in the
  /// response from a previous <code>ListLedgers</code> call, then you should
  /// use that value as input here.
  Future<ListLedgersResponse> listLedgers({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ledgers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLedgersResponse.fromJson(response);
  }

  /// Returns all tags for a specified Amazon QLDB resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for which to list the tags. For example:
  ///
  /// <code>arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger</code>
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates a journal stream for a given Amazon QLDB ledger. The stream
  /// captures every document revision that is committed to the ledger's journal
  /// and delivers the data to a specified Amazon Kinesis Data Streams resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [inclusiveStartTime] :
  /// The inclusive start date and time from which to start streaming journal
  /// data. This parameter must be in <code>ISO 8601</code> date and time format
  /// and in Universal Coordinated Time (UTC). For example:
  /// <code>2019-06-13T21:36:34Z</code>.
  ///
  /// The <code>InclusiveStartTime</code> cannot be in the future and must be
  /// before <code>ExclusiveEndTime</code>.
  ///
  /// If you provide an <code>InclusiveStartTime</code> that is before the
  /// ledger's <code>CreationDateTime</code>, QLDB effectively defaults it to
  /// the ledger's <code>CreationDateTime</code>.
  ///
  /// Parameter [kinesisConfiguration] :
  /// The configuration settings of the Kinesis Data Streams destination for
  /// your stream request.
  ///
  /// Parameter [ledgerName] :
  /// The name of the ledger.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants QLDB
  /// permissions for a journal stream to write data records to a Kinesis Data
  /// Streams resource.
  ///
  /// Parameter [streamName] :
  /// The name that you want to assign to the QLDB journal stream. User-defined
  /// names can help identify and indicate the purpose of a stream.
  ///
  /// Your stream name must be unique among other <i>active</i> streams for a
  /// given ledger. Stream names have the same naming constraints as ledger
  /// names, as defined in <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/limits.html#limits.naming">Quotas
  /// in Amazon QLDB</a> in the <i>Amazon QLDB Developer Guide</i>.
  ///
  /// Parameter [exclusiveEndTime] :
  /// The exclusive date and time that specifies when the stream ends. If you
  /// don't define this parameter, the stream runs indefinitely until you cancel
  /// it.
  ///
  /// The <code>ExclusiveEndTime</code> must be in <code>ISO 8601</code> date
  /// and time format and in Universal Coordinated Time (UTC). For example:
  /// <code>2019-06-13T21:36:34Z</code>.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to add as tags to the stream that you want to create.
  /// Tag keys are case sensitive. Tag values are case sensitive and can be
  /// null.
  Future<StreamJournalToKinesisResponse> streamJournalToKinesis({
    required DateTime inclusiveStartTime,
    required KinesisConfiguration kinesisConfiguration,
    required String ledgerName,
    required String roleArn,
    required String streamName,
    DateTime? exclusiveEndTime,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(inclusiveStartTime, 'inclusiveStartTime');
    ArgumentError.checkNotNull(kinesisConfiguration, 'kinesisConfiguration');
    ArgumentError.checkNotNull(ledgerName, 'ledgerName');
    _s.validateStringLength(
      'ledgerName',
      ledgerName,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      32,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'InclusiveStartTime': unixTimestampToJson(inclusiveStartTime),
      'KinesisConfiguration': kinesisConfiguration,
      'RoleArn': roleArn,
      'StreamName': streamName,
      if (exclusiveEndTime != null)
        'ExclusiveEndTime': unixTimestampToJson(exclusiveEndTime),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/ledgers/${Uri.encodeComponent(ledgerName)}/journal-kinesis-streams',
      exceptionFnMap: _exceptionFns,
    );
    return StreamJournalToKinesisResponse.fromJson(response);
  }

  /// Adds one or more tags to a specified Amazon QLDB resource.
  ///
  /// A resource can have up to 50 tags. If you try to create more than 50 tags
  /// for a resource, your request fails and returns an error.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to which you want to add the tags. For
  /// example:
  ///
  /// <code>arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger</code>
  ///
  /// Parameter [tags] :
  /// The key-value pairs to add as tags to the specified QLDB resource. Tag
  /// keys are case sensitive. If you specify a key that already exists for the
  /// resource, your request fails and returns an error. Tag values are case
  /// sensitive and can be null.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from a specified Amazon QLDB resource. You can
  /// specify up to 50 tag keys to remove.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) from which to remove the tags. For example:
  ///
  /// <code>arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger</code>
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates properties on a ledger.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  ///
  /// Parameter [deletionProtection] :
  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>)
  /// by default.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger. You can disable it by calling the
  /// <code>UpdateLedger</code> operation to set the flag to <code>false</code>.
  Future<UpdateLedgerResponse> updateLedger({
    required String name,
    bool? deletionProtection,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLedgerResponse.fromJson(response);
  }

  /// Updates the permissions mode of a ledger.
  /// <important>
  /// Before you switch to the <code>STANDARD</code> permissions mode, you must
  /// first create all required IAM policies and table tags to avoid disruption
  /// to your users. To learn more, see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/ledger-management.basics.html#ledger-mgmt.basics.update-permissions.migrating">Migrating
  /// to the standard permissions mode</a> in the <i>Amazon QLDB Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  ///
  /// Parameter [permissionsMode] :
  /// The permissions mode to assign to the ledger. This parameter can have one
  /// of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW_ALL</code>: A legacy permissions mode that enables access
  /// control with API-level granularity for ledgers.
  ///
  /// This mode allows users who have the <code>SendCommand</code> API
  /// permission for this ledger to run all PartiQL commands (hence,
  /// <code>ALLOW_ALL</code>) on any tables in the specified ledger. This mode
  /// disregards any table-level or command-level IAM permissions policies that
  /// you create for the ledger.
  /// </li>
  /// <li>
  /// <code>STANDARD</code>: (<i>Recommended</i>) A permissions mode that
  /// enables access control with finer granularity for ledgers, tables, and
  /// PartiQL commands.
  ///
  /// By default, this mode denies all user requests to run any PartiQL commands
  /// on any tables in this ledger. To allow PartiQL commands to run, you must
  /// create IAM permissions policies for specific table resources and PartiQL
  /// actions, in addition to the <code>SendCommand</code> API permission for
  /// the ledger. For information, see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/getting-started-standard-mode.html">Getting
  /// started with the standard permissions mode</a> in the <i>Amazon QLDB
  /// Developer Guide</i>.
  /// </li>
  /// </ul> <note>
  /// We strongly recommend using the <code>STANDARD</code> permissions mode to
  /// maximize the security of your ledger data.
  /// </note>
  Future<UpdateLedgerPermissionsModeResponse> updateLedgerPermissionsMode({
    required String name,
    required PermissionsMode permissionsMode,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionsMode, 'permissionsMode');
    final $payload = <String, dynamic>{
      'PermissionsMode': permissionsMode.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/ledgers/${Uri.encodeComponent(name)}/permissions-mode',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLedgerPermissionsModeResponse.fromJson(response);
  }
}

class CancelJournalKinesisStreamResponse {
  /// The UUID (Base62-encoded text) of the canceled QLDB journal stream.
  final String? streamId;

  CancelJournalKinesisStreamResponse({
    this.streamId,
  });

  factory CancelJournalKinesisStreamResponse.fromJson(
      Map<String, dynamic> json) {
    return CancelJournalKinesisStreamResponse(
      streamId: json['StreamId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamId = this.streamId;
    return {
      if (streamId != null) 'StreamId': streamId,
    };
  }
}

class CreateLedgerResponse {
  /// The Amazon Resource Name (ARN) for the ledger.
  final String? arn;

  /// The date and time, in epoch time format, when the ledger was created. (Epoch
  /// time format is the number of seconds elapsed since 12:00:00 AM January 1,
  /// 1970 UTC.)
  final DateTime? creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>) by
  /// default.
  ///
  /// If deletion protection is enabled, you must first disable it before you can
  /// delete the ledger. You can disable it by calling the
  /// <code>UpdateLedger</code> operation to set the flag to <code>false</code>.
  final bool? deletionProtection;

  /// The name of the ledger.
  final String? name;

  /// The permissions mode of the ledger that you created.
  final PermissionsMode? permissionsMode;

  /// The current status of the ledger.
  final LedgerState? state;

  CreateLedgerResponse({
    this.arn,
    this.creationDateTime,
    this.deletionProtection,
    this.name,
    this.permissionsMode,
    this.state,
  });

  factory CreateLedgerResponse.fromJson(Map<String, dynamic> json) {
    return CreateLedgerResponse(
      arn: json['Arn'] as String?,
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      deletionProtection: json['DeletionProtection'] as bool?,
      name: json['Name'] as String?,
      permissionsMode:
          (json['PermissionsMode'] as String?)?.toPermissionsMode(),
      state: (json['State'] as String?)?.toLedgerState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final deletionProtection = this.deletionProtection;
    final name = this.name;
    final permissionsMode = this.permissionsMode;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (name != null) 'Name': name,
      if (permissionsMode != null) 'PermissionsMode': permissionsMode.toValue(),
      if (state != null) 'State': state.toValue(),
    };
  }
}

class DescribeJournalKinesisStreamResponse {
  /// Information about the QLDB journal stream returned by a
  /// <code>DescribeJournalS3Export</code> request.
  final JournalKinesisStreamDescription? stream;

  DescribeJournalKinesisStreamResponse({
    this.stream,
  });

  factory DescribeJournalKinesisStreamResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeJournalKinesisStreamResponse(
      stream: json['Stream'] != null
          ? JournalKinesisStreamDescription.fromJson(
              json['Stream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      if (stream != null) 'Stream': stream,
    };
  }
}

class DescribeJournalS3ExportResponse {
  /// Information about the journal export job returned by a
  /// <code>DescribeJournalS3Export</code> request.
  final JournalS3ExportDescription exportDescription;

  DescribeJournalS3ExportResponse({
    required this.exportDescription,
  });

  factory DescribeJournalS3ExportResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJournalS3ExportResponse(
      exportDescription: JournalS3ExportDescription.fromJson(
          json['ExportDescription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final exportDescription = this.exportDescription;
    return {
      'ExportDescription': exportDescription,
    };
  }
}

class DescribeLedgerResponse {
  /// The Amazon Resource Name (ARN) for the ledger.
  final String? arn;

  /// The date and time, in epoch time format, when the ledger was created. (Epoch
  /// time format is the number of seconds elapsed since 12:00:00 AM January 1,
  /// 1970 UTC.)
  final DateTime? creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>) by
  /// default.
  ///
  /// If deletion protection is enabled, you must first disable it before you can
  /// delete the ledger. You can disable it by calling the
  /// <code>UpdateLedger</code> operation to set the flag to <code>false</code>.
  final bool? deletionProtection;

  /// The name of the ledger.
  final String? name;

  /// The permissions mode of the ledger.
  final PermissionsMode? permissionsMode;

  /// The current status of the ledger.
  final LedgerState? state;

  DescribeLedgerResponse({
    this.arn,
    this.creationDateTime,
    this.deletionProtection,
    this.name,
    this.permissionsMode,
    this.state,
  });

  factory DescribeLedgerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLedgerResponse(
      arn: json['Arn'] as String?,
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      deletionProtection: json['DeletionProtection'] as bool?,
      name: json['Name'] as String?,
      permissionsMode:
          (json['PermissionsMode'] as String?)?.toPermissionsMode(),
      state: (json['State'] as String?)?.toLedgerState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final deletionProtection = this.deletionProtection;
    final name = this.name;
    final permissionsMode = this.permissionsMode;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (name != null) 'Name': name,
      if (permissionsMode != null) 'PermissionsMode': permissionsMode.toValue(),
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum ErrorCause {
  kinesisStreamNotFound,
  iamPermissionRevoked,
}

extension on ErrorCause {
  String toValue() {
    switch (this) {
      case ErrorCause.kinesisStreamNotFound:
        return 'KINESIS_STREAM_NOT_FOUND';
      case ErrorCause.iamPermissionRevoked:
        return 'IAM_PERMISSION_REVOKED';
    }
  }
}

extension on String {
  ErrorCause toErrorCause() {
    switch (this) {
      case 'KINESIS_STREAM_NOT_FOUND':
        return ErrorCause.kinesisStreamNotFound;
      case 'IAM_PERMISSION_REVOKED':
        return ErrorCause.iamPermissionRevoked;
    }
    throw Exception('$this is not known in enum ErrorCause');
  }
}

class ExportJournalToS3Response {
  /// The UUID (represented in Base62-encoded text) that QLDB assigns to each
  /// journal export job.
  ///
  /// To describe your export request and check the status of the job, you can use
  /// <code>ExportId</code> to call <code>DescribeJournalS3Export</code>.
  final String exportId;

  ExportJournalToS3Response({
    required this.exportId,
  });

  factory ExportJournalToS3Response.fromJson(Map<String, dynamic> json) {
    return ExportJournalToS3Response(
      exportId: json['ExportId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    return {
      'ExportId': exportId,
    };
  }
}

enum ExportStatus {
  inProgress,
  completed,
  cancelled,
}

extension on ExportStatus {
  String toValue() {
    switch (this) {
      case ExportStatus.inProgress:
        return 'IN_PROGRESS';
      case ExportStatus.completed:
        return 'COMPLETED';
      case ExportStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension on String {
  ExportStatus toExportStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ExportStatus.inProgress;
      case 'COMPLETED':
        return ExportStatus.completed;
      case 'CANCELLED':
        return ExportStatus.cancelled;
    }
    throw Exception('$this is not known in enum ExportStatus');
  }
}

class GetBlockResponse {
  /// The block data object in Amazon Ion format.
  final ValueHolder block;

  /// The proof object in Amazon Ion format returned by a <code>GetBlock</code>
  /// request. A proof contains the list of hash values required to recalculate
  /// the specified digest using a Merkle tree, starting with the specified block.
  final ValueHolder? proof;

  GetBlockResponse({
    required this.block,
    this.proof,
  });

  factory GetBlockResponse.fromJson(Map<String, dynamic> json) {
    return GetBlockResponse(
      block: ValueHolder.fromJson(json['Block'] as Map<String, dynamic>),
      proof: json['Proof'] != null
          ? ValueHolder.fromJson(json['Proof'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final block = this.block;
    final proof = this.proof;
    return {
      'Block': block,
      if (proof != null) 'Proof': proof,
    };
  }
}

class GetDigestResponse {
  /// The 256-bit hash value representing the digest returned by a
  /// <code>GetDigest</code> request.
  final Uint8List digest;

  /// The latest block location covered by the digest that you requested. An
  /// address is an Amazon Ion structure that has two fields:
  /// <code>strandId</code> and <code>sequenceNo</code>.
  final ValueHolder digestTipAddress;

  GetDigestResponse({
    required this.digest,
    required this.digestTipAddress,
  });

  factory GetDigestResponse.fromJson(Map<String, dynamic> json) {
    return GetDigestResponse(
      digest: _s.decodeUint8List(json['Digest']! as String),
      digestTipAddress: ValueHolder.fromJson(
          json['DigestTipAddress'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final digest = this.digest;
    final digestTipAddress = this.digestTipAddress;
    return {
      'Digest': base64Encode(digest),
      'DigestTipAddress': digestTipAddress,
    };
  }
}

class GetRevisionResponse {
  /// The document revision data object in Amazon Ion format.
  final ValueHolder revision;

  /// The proof object in Amazon Ion format returned by a <code>GetRevision</code>
  /// request. A proof contains the list of hash values that are required to
  /// recalculate the specified digest using a Merkle tree, starting with the
  /// specified document revision.
  final ValueHolder? proof;

  GetRevisionResponse({
    required this.revision,
    this.proof,
  });

  factory GetRevisionResponse.fromJson(Map<String, dynamic> json) {
    return GetRevisionResponse(
      revision: ValueHolder.fromJson(json['Revision'] as Map<String, dynamic>),
      proof: json['Proof'] != null
          ? ValueHolder.fromJson(json['Proof'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final revision = this.revision;
    final proof = this.proof;
    return {
      'Revision': revision,
      if (proof != null) 'Proof': proof,
    };
  }
}

/// Information about an Amazon QLDB journal stream, including the Amazon
/// Resource Name (ARN), stream name, creation time, current status, and the
/// parameters of the original stream creation request.
class JournalKinesisStreamDescription {
  /// The configuration settings of the Amazon Kinesis Data Streams destination
  /// for a QLDB journal stream.
  final KinesisConfiguration kinesisConfiguration;

  /// The name of the ledger.
  final String ledgerName;

  /// The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions
  /// for a journal stream to write data records to a Kinesis Data Streams
  /// resource.
  final String roleArn;

  /// The current state of the QLDB journal stream.
  final StreamStatus status;

  /// The UUID (represented in Base62-encoded text) of the QLDB journal stream.
  final String streamId;

  /// The user-defined name of the QLDB journal stream.
  final String streamName;

  /// The Amazon Resource Name (ARN) of the QLDB journal stream.
  final String? arn;

  /// The date and time, in epoch time format, when the QLDB journal stream was
  /// created. (Epoch time format is the number of seconds elapsed since 12:00:00
  /// AM January 1, 1970 UTC.)
  final DateTime? creationTime;

  /// The error message that describes the reason that a stream has a status of
  /// <code>IMPAIRED</code> or <code>FAILED</code>. This is not applicable to
  /// streams that have other status values.
  final ErrorCause? errorCause;

  /// The exclusive date and time that specifies when the stream ends. If this
  /// parameter is blank, the stream runs indefinitely until you cancel it.
  final DateTime? exclusiveEndTime;

  /// The inclusive start date and time from which to start streaming journal
  /// data.
  final DateTime? inclusiveStartTime;

  JournalKinesisStreamDescription({
    required this.kinesisConfiguration,
    required this.ledgerName,
    required this.roleArn,
    required this.status,
    required this.streamId,
    required this.streamName,
    this.arn,
    this.creationTime,
    this.errorCause,
    this.exclusiveEndTime,
    this.inclusiveStartTime,
  });

  factory JournalKinesisStreamDescription.fromJson(Map<String, dynamic> json) {
    return JournalKinesisStreamDescription(
      kinesisConfiguration: KinesisConfiguration.fromJson(
          json['KinesisConfiguration'] as Map<String, dynamic>),
      ledgerName: json['LedgerName'] as String,
      roleArn: json['RoleArn'] as String,
      status: (json['Status'] as String).toStreamStatus(),
      streamId: json['StreamId'] as String,
      streamName: json['StreamName'] as String,
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      errorCause: (json['ErrorCause'] as String?)?.toErrorCause(),
      exclusiveEndTime: timeStampFromJson(json['ExclusiveEndTime']),
      inclusiveStartTime: timeStampFromJson(json['InclusiveStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisConfiguration = this.kinesisConfiguration;
    final ledgerName = this.ledgerName;
    final roleArn = this.roleArn;
    final status = this.status;
    final streamId = this.streamId;
    final streamName = this.streamName;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final errorCause = this.errorCause;
    final exclusiveEndTime = this.exclusiveEndTime;
    final inclusiveStartTime = this.inclusiveStartTime;
    return {
      'KinesisConfiguration': kinesisConfiguration,
      'LedgerName': ledgerName,
      'RoleArn': roleArn,
      'Status': status.toValue(),
      'StreamId': streamId,
      'StreamName': streamName,
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (errorCause != null) 'ErrorCause': errorCause.toValue(),
      if (exclusiveEndTime != null)
        'ExclusiveEndTime': unixTimestampToJson(exclusiveEndTime),
      if (inclusiveStartTime != null)
        'InclusiveStartTime': unixTimestampToJson(inclusiveStartTime),
    };
  }
}

/// Information about a journal export job, including the ledger name, export
/// ID, creation time, current status, and the parameters of the original export
/// creation request.
class JournalS3ExportDescription {
  /// The exclusive end date and time for the range of journal contents that are
  /// specified in the original export request.
  final DateTime exclusiveEndTime;

  /// The date and time, in epoch time format, when the export job was created.
  /// (Epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.)
  final DateTime exportCreationTime;

  /// The UUID (represented in Base62-encoded text) of the journal export job.
  final String exportId;

  /// The inclusive start date and time for the range of journal contents that are
  /// specified in the original export request.
  final DateTime inclusiveStartTime;

  /// The name of the ledger.
  final String ledgerName;

  /// The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions
  /// for a journal export job to do the following:
  ///
  /// <ul>
  /// <li>
  /// Write objects into your Amazon Simple Storage Service (Amazon S3) bucket.
  /// </li>
  /// <li>
  /// (Optional) Use your customer master key (CMK) in AWS Key Management Service
  /// (AWS KMS) for server-side encryption of your exported data.
  /// </li>
  /// </ul>
  final String roleArn;
  final S3ExportConfiguration s3ExportConfiguration;

  /// The current state of the journal export job.
  final ExportStatus status;

  JournalS3ExportDescription({
    required this.exclusiveEndTime,
    required this.exportCreationTime,
    required this.exportId,
    required this.inclusiveStartTime,
    required this.ledgerName,
    required this.roleArn,
    required this.s3ExportConfiguration,
    required this.status,
  });

  factory JournalS3ExportDescription.fromJson(Map<String, dynamic> json) {
    return JournalS3ExportDescription(
      exclusiveEndTime:
          nonNullableTimeStampFromJson(json['ExclusiveEndTime'] as Object),
      exportCreationTime:
          nonNullableTimeStampFromJson(json['ExportCreationTime'] as Object),
      exportId: json['ExportId'] as String,
      inclusiveStartTime:
          nonNullableTimeStampFromJson(json['InclusiveStartTime'] as Object),
      ledgerName: json['LedgerName'] as String,
      roleArn: json['RoleArn'] as String,
      s3ExportConfiguration: S3ExportConfiguration.fromJson(
          json['S3ExportConfiguration'] as Map<String, dynamic>),
      status: (json['Status'] as String).toExportStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final exclusiveEndTime = this.exclusiveEndTime;
    final exportCreationTime = this.exportCreationTime;
    final exportId = this.exportId;
    final inclusiveStartTime = this.inclusiveStartTime;
    final ledgerName = this.ledgerName;
    final roleArn = this.roleArn;
    final s3ExportConfiguration = this.s3ExportConfiguration;
    final status = this.status;
    return {
      'ExclusiveEndTime': unixTimestampToJson(exclusiveEndTime),
      'ExportCreationTime': unixTimestampToJson(exportCreationTime),
      'ExportId': exportId,
      'InclusiveStartTime': unixTimestampToJson(inclusiveStartTime),
      'LedgerName': ledgerName,
      'RoleArn': roleArn,
      'S3ExportConfiguration': s3ExportConfiguration,
      'Status': status.toValue(),
    };
  }
}

/// The configuration settings of the Amazon Kinesis Data Streams destination
/// for an Amazon QLDB journal stream.
class KinesisConfiguration {
  /// The Amazon Resource Name (ARN) of the Kinesis Data Streams resource.
  final String streamArn;

  /// Enables QLDB to publish multiple data records in a single Kinesis Data
  /// Streams record, increasing the number of records sent per API call.
  ///
  /// <i>This option is enabled by default.</i> Record aggregation has important
  /// implications for processing records and requires de-aggregation in your
  /// stream consumer. To learn more, see <a
  /// href="https://docs.aws.amazon.com/streams/latest/dev/kinesis-kpl-concepts.html">KPL
  /// Key Concepts</a> and <a
  /// href="https://docs.aws.amazon.com/streams/latest/dev/kinesis-kpl-consumer-deaggregation.html">Consumer
  /// De-aggregation</a> in the <i>Amazon Kinesis Data Streams Developer
  /// Guide</i>.
  final bool? aggregationEnabled;

  KinesisConfiguration({
    required this.streamArn,
    this.aggregationEnabled,
  });

  factory KinesisConfiguration.fromJson(Map<String, dynamic> json) {
    return KinesisConfiguration(
      streamArn: json['StreamArn'] as String,
      aggregationEnabled: json['AggregationEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamArn = this.streamArn;
    final aggregationEnabled = this.aggregationEnabled;
    return {
      'StreamArn': streamArn,
      if (aggregationEnabled != null) 'AggregationEnabled': aggregationEnabled,
    };
  }
}

enum LedgerState {
  creating,
  active,
  deleting,
  deleted,
}

extension on LedgerState {
  String toValue() {
    switch (this) {
      case LedgerState.creating:
        return 'CREATING';
      case LedgerState.active:
        return 'ACTIVE';
      case LedgerState.deleting:
        return 'DELETING';
      case LedgerState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  LedgerState toLedgerState() {
    switch (this) {
      case 'CREATING':
        return LedgerState.creating;
      case 'ACTIVE':
        return LedgerState.active;
      case 'DELETING':
        return LedgerState.deleting;
      case 'DELETED':
        return LedgerState.deleted;
    }
    throw Exception('$this is not known in enum LedgerState');
  }
}

/// Information about a ledger, including its name, state, and when it was
/// created.
class LedgerSummary {
  /// The date and time, in epoch time format, when the ledger was created. (Epoch
  /// time format is the number of seconds elapsed since 12:00:00 AM January 1,
  /// 1970 UTC.)
  final DateTime? creationDateTime;

  /// The name of the ledger.
  final String? name;

  /// The current status of the ledger.
  final LedgerState? state;

  LedgerSummary({
    this.creationDateTime,
    this.name,
    this.state,
  });

  factory LedgerSummary.fromJson(Map<String, dynamic> json) {
    return LedgerSummary(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toLedgerState(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final name = this.name;
    final state = this.state;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class ListJournalKinesisStreamsForLedgerResponse {
  /// <ul>
  /// <li>
  /// If <code>NextToken</code> is empty, the last page of results has been
  /// processed and there are no more results to be retrieved.
  /// </li>
  /// <li>
  /// If <code>NextToken</code> is <i>not</i> empty, more results are available.
  /// To retrieve the next page of results, use the value of
  /// <code>NextToken</code> in a subsequent
  /// <code>ListJournalKinesisStreamsForLedger</code> call.
  /// </li>
  /// </ul>
  final String? nextToken;

  /// The array of QLDB journal stream descriptors that are associated with the
  /// given ledger.
  final List<JournalKinesisStreamDescription>? streams;

  ListJournalKinesisStreamsForLedgerResponse({
    this.nextToken,
    this.streams,
  });

  factory ListJournalKinesisStreamsForLedgerResponse.fromJson(
      Map<String, dynamic> json) {
    return ListJournalKinesisStreamsForLedgerResponse(
      nextToken: json['NextToken'] as String?,
      streams: (json['Streams'] as List?)
          ?.whereNotNull()
          .map((e) => JournalKinesisStreamDescription.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final streams = this.streams;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (streams != null) 'Streams': streams,
    };
  }
}

class ListJournalS3ExportsForLedgerResponse {
  /// The array of journal export job descriptions that are associated with the
  /// specified ledger.
  final List<JournalS3ExportDescription>? journalS3Exports;

  /// <ul>
  /// <li>
  /// If <code>NextToken</code> is empty, then the last page of results has been
  /// processed and there are no more results to be retrieved.
  /// </li>
  /// <li>
  /// If <code>NextToken</code> is <i>not</i> empty, then there are more results
  /// available. To retrieve the next page of results, use the value of
  /// <code>NextToken</code> in a subsequent
  /// <code>ListJournalS3ExportsForLedger</code> call.
  /// </li>
  /// </ul>
  final String? nextToken;

  ListJournalS3ExportsForLedgerResponse({
    this.journalS3Exports,
    this.nextToken,
  });

  factory ListJournalS3ExportsForLedgerResponse.fromJson(
      Map<String, dynamic> json) {
    return ListJournalS3ExportsForLedgerResponse(
      journalS3Exports: (json['JournalS3Exports'] as List?)
          ?.whereNotNull()
          .map((e) =>
              JournalS3ExportDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final journalS3Exports = this.journalS3Exports;
    final nextToken = this.nextToken;
    return {
      if (journalS3Exports != null) 'JournalS3Exports': journalS3Exports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListJournalS3ExportsResponse {
  /// The array of journal export job descriptions for all ledgers that are
  /// associated with the current AWS account and Region.
  final List<JournalS3ExportDescription>? journalS3Exports;

  /// <ul>
  /// <li>
  /// If <code>NextToken</code> is empty, then the last page of results has been
  /// processed and there are no more results to be retrieved.
  /// </li>
  /// <li>
  /// If <code>NextToken</code> is <i>not</i> empty, then there are more results
  /// available. To retrieve the next page of results, use the value of
  /// <code>NextToken</code> in a subsequent <code>ListJournalS3Exports</code>
  /// call.
  /// </li>
  /// </ul>
  final String? nextToken;

  ListJournalS3ExportsResponse({
    this.journalS3Exports,
    this.nextToken,
  });

  factory ListJournalS3ExportsResponse.fromJson(Map<String, dynamic> json) {
    return ListJournalS3ExportsResponse(
      journalS3Exports: (json['JournalS3Exports'] as List?)
          ?.whereNotNull()
          .map((e) =>
              JournalS3ExportDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final journalS3Exports = this.journalS3Exports;
    final nextToken = this.nextToken;
    return {
      if (journalS3Exports != null) 'JournalS3Exports': journalS3Exports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLedgersResponse {
  /// The array of ledger summaries that are associated with the current AWS
  /// account and Region.
  final List<LedgerSummary>? ledgers;

  /// A pagination token, indicating whether there are more results available:
  ///
  /// <ul>
  /// <li>
  /// If <code>NextToken</code> is empty, then the last page of results has been
  /// processed and there are no more results to be retrieved.
  /// </li>
  /// <li>
  /// If <code>NextToken</code> is <i>not</i> empty, then there are more results
  /// available. To retrieve the next page of results, use the value of
  /// <code>NextToken</code> in a subsequent <code>ListLedgers</code> call.
  /// </li>
  /// </ul>
  final String? nextToken;

  ListLedgersResponse({
    this.ledgers,
    this.nextToken,
  });

  factory ListLedgersResponse.fromJson(Map<String, dynamic> json) {
    return ListLedgersResponse(
      ledgers: (json['Ledgers'] as List?)
          ?.whereNotNull()
          .map((e) => LedgerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ledgers = this.ledgers;
    final nextToken = this.nextToken;
    return {
      if (ledgers != null) 'Ledgers': ledgers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags that are currently associated with the specified Amazon QLDB
  /// resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum PermissionsMode {
  allowAll,
  standard,
}

extension on PermissionsMode {
  String toValue() {
    switch (this) {
      case PermissionsMode.allowAll:
        return 'ALLOW_ALL';
      case PermissionsMode.standard:
        return 'STANDARD';
    }
  }
}

extension on String {
  PermissionsMode toPermissionsMode() {
    switch (this) {
      case 'ALLOW_ALL':
        return PermissionsMode.allowAll;
      case 'STANDARD':
        return PermissionsMode.standard;
    }
    throw Exception('$this is not known in enum PermissionsMode');
  }
}

/// The encryption settings that are used by a journal export job to write data
/// in an Amazon Simple Storage Service (Amazon S3) bucket.
class S3EncryptionConfiguration {
  /// The Amazon S3 object encryption type.
  ///
  /// To learn more about server-side encryption options in Amazon S3, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting
  /// Data Using Server-Side Encryption</a> in the <i>Amazon S3 Developer
  /// Guide</i>.
  final S3ObjectEncryptionType objectEncryptionType;

  /// The Amazon Resource Name (ARN) for a symmetric customer master key (CMK) in
  /// AWS Key Management Service (AWS KMS). Amazon S3 does not support asymmetric
  /// CMKs.
  ///
  /// You must provide a <code>KmsKeyArn</code> if you specify
  /// <code>SSE_KMS</code> as the <code>ObjectEncryptionType</code>.
  ///
  /// <code>KmsKeyArn</code> is not required if you specify <code>SSE_S3</code> as
  /// the <code>ObjectEncryptionType</code>.
  final String? kmsKeyArn;

  S3EncryptionConfiguration({
    required this.objectEncryptionType,
    this.kmsKeyArn,
  });

  factory S3EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return S3EncryptionConfiguration(
      objectEncryptionType:
          (json['ObjectEncryptionType'] as String).toS3ObjectEncryptionType(),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectEncryptionType = this.objectEncryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'ObjectEncryptionType': objectEncryptionType.toValue(),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// The Amazon Simple Storage Service (Amazon S3) bucket location in which a
/// journal export job writes the journal contents.
class S3ExportConfiguration {
  /// The Amazon S3 bucket name in which a journal export job writes the journal
  /// contents.
  ///
  /// The bucket name must comply with the Amazon S3 bucket naming conventions.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html">Bucket
  /// Restrictions and Limitations</a> in the <i>Amazon S3 Developer Guide</i>.
  final String bucket;

  /// The encryption settings that are used by a journal export job to write data
  /// in an Amazon S3 bucket.
  final S3EncryptionConfiguration encryptionConfiguration;

  /// The prefix for the Amazon S3 bucket in which a journal export job writes the
  /// journal contents.
  ///
  /// The prefix must comply with Amazon S3 key naming rules and restrictions. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html">Object
  /// Key and Metadata</a> in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// The following are examples of valid <code>Prefix</code> values:
  ///
  /// <ul>
  /// <li>
  /// <code>JournalExports-ForMyLedger/Testing/</code>
  /// </li>
  /// <li>
  /// <code>JournalExports</code>
  /// </li>
  /// <li>
  /// <code>My:Tests/</code>
  /// </li>
  /// </ul>
  final String prefix;

  S3ExportConfiguration({
    required this.bucket,
    required this.encryptionConfiguration,
    required this.prefix,
  });

  factory S3ExportConfiguration.fromJson(Map<String, dynamic> json) {
    return S3ExportConfiguration(
      bucket: json['Bucket'] as String,
      encryptionConfiguration: S3EncryptionConfiguration.fromJson(
          json['EncryptionConfiguration'] as Map<String, dynamic>),
      prefix: json['Prefix'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final encryptionConfiguration = this.encryptionConfiguration;
    final prefix = this.prefix;
    return {
      'Bucket': bucket,
      'EncryptionConfiguration': encryptionConfiguration,
      'Prefix': prefix,
    };
  }
}

enum S3ObjectEncryptionType {
  sseKms,
  sseS3,
  noEncryption,
}

extension on S3ObjectEncryptionType {
  String toValue() {
    switch (this) {
      case S3ObjectEncryptionType.sseKms:
        return 'SSE_KMS';
      case S3ObjectEncryptionType.sseS3:
        return 'SSE_S3';
      case S3ObjectEncryptionType.noEncryption:
        return 'NO_ENCRYPTION';
    }
  }
}

extension on String {
  S3ObjectEncryptionType toS3ObjectEncryptionType() {
    switch (this) {
      case 'SSE_KMS':
        return S3ObjectEncryptionType.sseKms;
      case 'SSE_S3':
        return S3ObjectEncryptionType.sseS3;
      case 'NO_ENCRYPTION':
        return S3ObjectEncryptionType.noEncryption;
    }
    throw Exception('$this is not known in enum S3ObjectEncryptionType');
  }
}

class StreamJournalToKinesisResponse {
  /// The UUID (represented in Base62-encoded text) that QLDB assigns to each QLDB
  /// journal stream.
  final String? streamId;

  StreamJournalToKinesisResponse({
    this.streamId,
  });

  factory StreamJournalToKinesisResponse.fromJson(Map<String, dynamic> json) {
    return StreamJournalToKinesisResponse(
      streamId: json['StreamId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamId = this.streamId;
    return {
      if (streamId != null) 'StreamId': streamId,
    };
  }
}

enum StreamStatus {
  active,
  completed,
  canceled,
  failed,
  impaired,
}

extension on StreamStatus {
  String toValue() {
    switch (this) {
      case StreamStatus.active:
        return 'ACTIVE';
      case StreamStatus.completed:
        return 'COMPLETED';
      case StreamStatus.canceled:
        return 'CANCELED';
      case StreamStatus.failed:
        return 'FAILED';
      case StreamStatus.impaired:
        return 'IMPAIRED';
    }
  }
}

extension on String {
  StreamStatus toStreamStatus() {
    switch (this) {
      case 'ACTIVE':
        return StreamStatus.active;
      case 'COMPLETED':
        return StreamStatus.completed;
      case 'CANCELED':
        return StreamStatus.canceled;
      case 'FAILED':
        return StreamStatus.failed;
      case 'IMPAIRED':
        return StreamStatus.impaired;
    }
    throw Exception('$this is not known in enum StreamStatus');
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLedgerPermissionsModeResponse {
  /// The Amazon Resource Name (ARN) for the ledger.
  final String? arn;

  /// The name of the ledger.
  final String? name;

  /// The current permissions mode of the ledger.
  final PermissionsMode? permissionsMode;

  UpdateLedgerPermissionsModeResponse({
    this.arn,
    this.name,
    this.permissionsMode,
  });

  factory UpdateLedgerPermissionsModeResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateLedgerPermissionsModeResponse(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
      permissionsMode:
          (json['PermissionsMode'] as String?)?.toPermissionsMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final permissionsMode = this.permissionsMode;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
      if (permissionsMode != null) 'PermissionsMode': permissionsMode.toValue(),
    };
  }
}

class UpdateLedgerResponse {
  /// The Amazon Resource Name (ARN) for the ledger.
  final String? arn;

  /// The date and time, in epoch time format, when the ledger was created. (Epoch
  /// time format is the number of seconds elapsed since 12:00:00 AM January 1,
  /// 1970 UTC.)
  final DateTime? creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>) by
  /// default.
  ///
  /// If deletion protection is enabled, you must first disable it before you can
  /// delete the ledger. You can disable it by calling the
  /// <code>UpdateLedger</code> operation to set the flag to <code>false</code>.
  final bool? deletionProtection;

  /// The name of the ledger.
  final String? name;

  /// The current status of the ledger.
  final LedgerState? state;

  UpdateLedgerResponse({
    this.arn,
    this.creationDateTime,
    this.deletionProtection,
    this.name,
    this.state,
  });

  factory UpdateLedgerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLedgerResponse(
      arn: json['Arn'] as String?,
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      deletionProtection: json['DeletionProtection'] as bool?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toLedgerState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final deletionProtection = this.deletionProtection;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// A structure that can contain a value in multiple encoding formats.
class ValueHolder {
  /// An Amazon Ion plaintext value contained in a <code>ValueHolder</code>
  /// structure.
  final String? ionText;

  ValueHolder({
    this.ionText,
  });

  factory ValueHolder.fromJson(Map<String, dynamic> json) {
    return ValueHolder(
      ionText: json['IonText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ionText = this.ionText;
    return {
      if (ionText != null) 'IonText': ionText,
    };
  }
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourcePreconditionNotMetException extends _s.GenericAwsException {
  ResourcePreconditionNotMetException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourcePreconditionNotMetException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourcePreconditionNotMetException': (type, message) =>
      ResourcePreconditionNotMetException(type: type, message: message),
};
