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

part '2019-01-02.g.dart';

/// The control plane for Amazon QLDB
class Qldb {
  final _s.RestJsonProtocol _protocol;
  Qldb({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
  /// The unique ID that QLDB assigns to each QLDB journal stream.
  Future<CancelJournalKinesisStreamResponse> cancelJournalKinesisStream({
    @_s.required String ledgerName,
    @_s.required String streamId,
  }) async {
    ArgumentError.checkNotNull(ledgerName, 'ledgerName');
    _s.validateStringLength(
      'ledgerName',
      ledgerName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ledgerName',
      ledgerName,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    _s.validateStringPattern(
      'streamId',
      streamId,
      r'''^[A-Za-z-0-9]+$''',
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

  /// Creates a new ledger in your AWS account.
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
  /// The permissions mode to assign to the ledger that you want to create.
  ///
  /// Parameter [deletionProtection] :
  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>)
  /// by default.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the <code>UpdateLedger</code>
  /// operation to set the flag to <code>false</code>. The QLDB console disables
  /// deletion protection for you when you use it to delete a ledger.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to add as tags to the ledger that you want to create.
  /// Tag keys are case sensitive. Tag values are case sensitive and can be
  /// null.
  Future<CreateLedgerResponse> createLedger({
    @_s.required String name,
    @_s.required PermissionsMode permissionsMode,
    bool deletionProtection,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionsMode, 'permissionsMode');
    final $payload = <String, dynamic>{
      'Name': name,
      'PermissionsMode': permissionsMode?.toValue() ?? '',
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
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the <code>UpdateLedger</code>
  /// operation to set the flag to <code>false</code>. The QLDB console disables
  /// deletion protection for you when you use it to delete a ledger.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [name] :
  /// The name of the ledger that you want to delete.
  Future<void> deleteLedger({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
  /// status, creation time, and the parameters of your original stream creation
  /// request.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePreconditionNotMetException].
  ///
  /// Parameter [ledgerName] :
  /// The name of the ledger.
  ///
  /// Parameter [streamId] :
  /// The unique ID that QLDB assigns to each QLDB journal stream.
  Future<DescribeJournalKinesisStreamResponse> describeJournalKinesisStream({
    @_s.required String ledgerName,
    @_s.required String streamId,
  }) async {
    ArgumentError.checkNotNull(ledgerName, 'ledgerName');
    _s.validateStringLength(
      'ledgerName',
      ledgerName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ledgerName',
      ledgerName,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    _s.validateStringPattern(
      'streamId',
      streamId,
      r'''^[A-Za-z-0-9]+$''',
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
  /// export ID, when it was created, current status, and its start and end time
  /// export parameters.
  ///
  /// This action does not return any expired export jobs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export
  /// Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.
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
  /// The unique ID of the journal export job that you want to describe.
  ///
  /// Parameter [name] :
  /// The name of the ledger.
  Future<DescribeJournalS3ExportResponse> describeJournalS3Export({
    @_s.required String exportId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(exportId, 'exportId');
    _s.validateStringLength(
      'exportId',
      exportId,
      22,
      22,
      isRequired: true,
    );
    _s.validateStringPattern(
      'exportId',
      exportId,
      r'''^[A-Za-z-0-9]+$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
  /// The exclusive end date and time for the range of journal contents that you
  /// want to export.
  ///
  /// The <code>ExclusiveEndTime</code> must be in <code>ISO 8601</code> date
  /// and time format and in Universal Coordinated Time (UTC). For example:
  /// <code>2019-06-13T21:36:34Z</code>
  ///
  /// The <code>ExclusiveEndTime</code> must be less than or equal to the
  /// current UTC date and time.
  ///
  /// Parameter [inclusiveStartTime] :
  /// The inclusive start date and time for the range of journal contents that
  /// you want to export.
  ///
  /// The <code>InclusiveStartTime</code> must be in <code>ISO 8601</code> date
  /// and time format and in Universal Coordinated Time (UTC). For example:
  /// <code>2019-06-13T21:36:34Z</code>
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
    @_s.required DateTime exclusiveEndTime,
    @_s.required DateTime inclusiveStartTime,
    @_s.required String name,
    @_s.required String roleArn,
    @_s.required S3ExportConfiguration s3ExportConfiguration,
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
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
  /// <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:14}</code>
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
  /// <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:49}</code>
  Future<GetBlockResponse> getBlock({
    @_s.required ValueHolder blockAddress,
    @_s.required String name,
    ValueHolder digestTipAddress,
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
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
  /// <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:14}</code>
  ///
  /// Parameter [documentId] :
  /// The unique ID of the document to be verified.
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
  /// <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:49}</code>
  Future<GetRevisionResponse> getRevision({
    @_s.required ValueHolder blockAddress,
    @_s.required String documentId,
    @_s.required String name,
    ValueHolder digestTipAddress,
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
    _s.validateStringPattern(
      'documentId',
      documentId,
      r'''^[A-Za-z-0-9]+$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    @_s.required String ledgerName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(ledgerName, 'ledgerName');
    _s.validateStringLength(
      'ledgerName',
      ledgerName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ledgerName',
      ledgerName,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z-0-9+/=]+$''',
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
  /// Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z-0-9+/=]+$''',
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
  /// Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.
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
    @_s.required String name,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z-0-9+/=]+$''',
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z-0-9+/=]+$''',
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
  /// The Amazon Resource Name (ARN) for which you want to list the tags. For
  /// example:
  ///
  /// <code>arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger</code>
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
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
  /// <code>2019-06-13T21:36:34Z</code>
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
  /// <code>2019-06-13T21:36:34Z</code>
  ///
  /// Parameter [tags] :
  /// The key-value pairs to add as tags to the stream that you want to create.
  /// Tag keys are case sensitive. Tag values are case sensitive and can be
  /// null.
  Future<StreamJournalToKinesisResponse> streamJournalToKinesis({
    @_s.required DateTime inclusiveStartTime,
    @_s.required KinesisConfiguration kinesisConfiguration,
    @_s.required String ledgerName,
    @_s.required String roleArn,
    @_s.required String streamName,
    DateTime exclusiveEndTime,
    Map<String, String> tags,
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
    _s.validateStringPattern(
      'ledgerName',
      ledgerName,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
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
    return TagResourceResponse.fromJson(response);
  }

  /// Removes one or more tags from a specified Amazon QLDB resource. You can
  /// specify up to 50 tag keys to remove.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) from which you want to remove the tags. For
  /// example:
  ///
  /// <code>arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger</code>
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys that you want to remove.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
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
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the <code>UpdateLedger</code>
  /// operation to set the flag to <code>false</code>. The QLDB console disables
  /// deletion protection for you when you use it to delete a ledger.
  Future<UpdateLedgerResponse> updateLedger({
    @_s.required String name,
    bool deletionProtection,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^.*--)(?!^[0-9]+$)(?!^-)(?!.*-$)^[A-Za-z0-9-]+$''',
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
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelJournalKinesisStreamResponse {
  /// The unique ID that QLDB assigns to each QLDB journal stream.
  @_s.JsonKey(name: 'StreamId')
  final String streamId;

  CancelJournalKinesisStreamResponse({
    this.streamId,
  });
  factory CancelJournalKinesisStreamResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelJournalKinesisStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLedgerResponse {
  /// The Amazon Resource Name (ARN) for the ledger.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time, in epoch time format, when the ledger was created. (Epoch
  /// time format is the number of seconds elapsed since 12:00:00 AM January 1,
  /// 1970 UTC.)
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>) by
  /// default.
  ///
  /// If deletion protection is enabled, you must first disable it before you can
  /// delete the ledger using the QLDB API or the AWS Command Line Interface (AWS
  /// CLI). You can disable it by calling the <code>UpdateLedger</code> operation
  /// to set the flag to <code>false</code>. The QLDB console disables deletion
  /// protection for you when you use it to delete a ledger.
  @_s.JsonKey(name: 'DeletionProtection')
  final bool deletionProtection;

  /// The name of the ledger.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status of the ledger.
  @_s.JsonKey(name: 'State')
  final LedgerState state;

  CreateLedgerResponse({
    this.arn,
    this.creationDateTime,
    this.deletionProtection,
    this.name,
    this.state,
  });
  factory CreateLedgerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLedgerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJournalKinesisStreamResponse {
  /// Information about the QLDB journal stream returned by a
  /// <code>DescribeJournalS3Export</code> request.
  @_s.JsonKey(name: 'Stream')
  final JournalKinesisStreamDescription stream;

  DescribeJournalKinesisStreamResponse({
    this.stream,
  });
  factory DescribeJournalKinesisStreamResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeJournalKinesisStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJournalS3ExportResponse {
  /// Information about the journal export job returned by a
  /// <code>DescribeJournalS3Export</code> request.
  @_s.JsonKey(name: 'ExportDescription')
  final JournalS3ExportDescription exportDescription;

  DescribeJournalS3ExportResponse({
    @_s.required this.exportDescription,
  });
  factory DescribeJournalS3ExportResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJournalS3ExportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLedgerResponse {
  /// The Amazon Resource Name (ARN) for the ledger.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time, in epoch time format, when the ledger was created. (Epoch
  /// time format is the number of seconds elapsed since 12:00:00 AM January 1,
  /// 1970 UTC.)
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>) by
  /// default.
  ///
  /// If deletion protection is enabled, you must first disable it before you can
  /// delete the ledger using the QLDB API or the AWS Command Line Interface (AWS
  /// CLI). You can disable it by calling the <code>UpdateLedger</code> operation
  /// to set the flag to <code>false</code>. The QLDB console disables deletion
  /// protection for you when you use it to delete a ledger.
  @_s.JsonKey(name: 'DeletionProtection')
  final bool deletionProtection;

  /// The name of the ledger.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status of the ledger.
  @_s.JsonKey(name: 'State')
  final LedgerState state;

  DescribeLedgerResponse({
    this.arn,
    this.creationDateTime,
    this.deletionProtection,
    this.name,
    this.state,
  });
  factory DescribeLedgerResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLedgerResponseFromJson(json);
}

enum ErrorCause {
  @_s.JsonValue('KINESIS_STREAM_NOT_FOUND')
  kinesisStreamNotFound,
  @_s.JsonValue('IAM_PERMISSION_REVOKED')
  iamPermissionRevoked,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportJournalToS3Response {
  /// The unique ID that QLDB assigns to each journal export job.
  ///
  /// To describe your export request and check the status of the job, you can use
  /// <code>ExportId</code> to call <code>DescribeJournalS3Export</code>.
  @_s.JsonKey(name: 'ExportId')
  final String exportId;

  ExportJournalToS3Response({
    @_s.required this.exportId,
  });
  factory ExportJournalToS3Response.fromJson(Map<String, dynamic> json) =>
      _$ExportJournalToS3ResponseFromJson(json);
}

enum ExportStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('CANCELLED')
  cancelled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBlockResponse {
  /// The block data object in Amazon Ion format.
  @_s.JsonKey(name: 'Block')
  final ValueHolder block;

  /// The proof object in Amazon Ion format returned by a <code>GetBlock</code>
  /// request. A proof contains the list of hash values required to recalculate
  /// the specified digest using a Merkle tree, starting with the specified block.
  @_s.JsonKey(name: 'Proof')
  final ValueHolder proof;

  GetBlockResponse({
    @_s.required this.block,
    this.proof,
  });
  factory GetBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBlockResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDigestResponse {
  /// The 256-bit hash value representing the digest returned by a
  /// <code>GetDigest</code> request.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Digest')
  final Uint8List digest;

  /// The latest block location covered by the digest that you requested. An
  /// address is an Amazon Ion structure that has two fields:
  /// <code>strandId</code> and <code>sequenceNo</code>.
  @_s.JsonKey(name: 'DigestTipAddress')
  final ValueHolder digestTipAddress;

  GetDigestResponse({
    @_s.required this.digest,
    @_s.required this.digestTipAddress,
  });
  factory GetDigestResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDigestResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRevisionResponse {
  /// The document revision data object in Amazon Ion format.
  @_s.JsonKey(name: 'Revision')
  final ValueHolder revision;

  /// The proof object in Amazon Ion format returned by a <code>GetRevision</code>
  /// request. A proof contains the list of hash values that are required to
  /// recalculate the specified digest using a Merkle tree, starting with the
  /// specified document revision.
  @_s.JsonKey(name: 'Proof')
  final ValueHolder proof;

  GetRevisionResponse({
    @_s.required this.revision,
    this.proof,
  });
  factory GetRevisionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRevisionResponseFromJson(json);
}

/// The information about an Amazon QLDB journal stream, including the Amazon
/// Resource Name (ARN), stream name, creation time, current status, and the
/// parameters of your original stream creation request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JournalKinesisStreamDescription {
  /// The configuration settings of the Amazon Kinesis Data Streams destination
  /// for your QLDB journal stream.
  @_s.JsonKey(name: 'KinesisConfiguration')
  final KinesisConfiguration kinesisConfiguration;

  /// The name of the ledger.
  @_s.JsonKey(name: 'LedgerName')
  final String ledgerName;

  /// The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions
  /// for a journal stream to write data records to a Kinesis Data Streams
  /// resource.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The current state of the QLDB journal stream.
  @_s.JsonKey(name: 'Status')
  final StreamStatus status;

  /// The unique ID that QLDB assigns to each QLDB journal stream.
  @_s.JsonKey(name: 'StreamId')
  final String streamId;

  /// The user-defined name of the QLDB journal stream.
  @_s.JsonKey(name: 'StreamName')
  final String streamName;

  /// The Amazon Resource Name (ARN) of the QLDB journal stream.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time, in epoch time format, when the QLDB journal stream was
  /// created. (Epoch time format is the number of seconds elapsed since 12:00:00
  /// AM January 1, 1970 UTC.)
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The error message that describes the reason that a stream has a status of
  /// <code>IMPAIRED</code> or <code>FAILED</code>. This is not applicable to
  /// streams that have other status values.
  @_s.JsonKey(name: 'ErrorCause')
  final ErrorCause errorCause;

  /// The exclusive date and time that specifies when the stream ends. If this
  /// parameter is blank, the stream runs indefinitely until you cancel it.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExclusiveEndTime')
  final DateTime exclusiveEndTime;

  /// The inclusive start date and time from which to start streaming journal
  /// data.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'InclusiveStartTime')
  final DateTime inclusiveStartTime;

  JournalKinesisStreamDescription({
    @_s.required this.kinesisConfiguration,
    @_s.required this.ledgerName,
    @_s.required this.roleArn,
    @_s.required this.status,
    @_s.required this.streamId,
    @_s.required this.streamName,
    this.arn,
    this.creationTime,
    this.errorCause,
    this.exclusiveEndTime,
    this.inclusiveStartTime,
  });
  factory JournalKinesisStreamDescription.fromJson(Map<String, dynamic> json) =>
      _$JournalKinesisStreamDescriptionFromJson(json);
}

/// The information about a journal export job, including the ledger name,
/// export ID, when it was created, current status, and its start and end time
/// export parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JournalS3ExportDescription {
  /// The exclusive end date and time for the range of journal contents that are
  /// specified in the original export request.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExclusiveEndTime')
  final DateTime exclusiveEndTime;

  /// The date and time, in epoch time format, when the export job was created.
  /// (Epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.)
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExportCreationTime')
  final DateTime exportCreationTime;

  /// The unique ID of the journal export job.
  @_s.JsonKey(name: 'ExportId')
  final String exportId;

  /// The inclusive start date and time for the range of journal contents that are
  /// specified in the original export request.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'InclusiveStartTime')
  final DateTime inclusiveStartTime;

  /// The name of the ledger.
  @_s.JsonKey(name: 'LedgerName')
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
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;
  @_s.JsonKey(name: 'S3ExportConfiguration')
  final S3ExportConfiguration s3ExportConfiguration;

  /// The current state of the journal export job.
  @_s.JsonKey(name: 'Status')
  final ExportStatus status;

  JournalS3ExportDescription({
    @_s.required this.exclusiveEndTime,
    @_s.required this.exportCreationTime,
    @_s.required this.exportId,
    @_s.required this.inclusiveStartTime,
    @_s.required this.ledgerName,
    @_s.required this.roleArn,
    @_s.required this.s3ExportConfiguration,
    @_s.required this.status,
  });
  factory JournalS3ExportDescription.fromJson(Map<String, dynamic> json) =>
      _$JournalS3ExportDescriptionFromJson(json);
}

/// The configuration settings of the Amazon Kinesis Data Streams destination
/// for your Amazon QLDB journal stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisConfiguration {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream resource.
  @_s.JsonKey(name: 'StreamArn')
  final String streamArn;

  /// Enables QLDB to publish multiple data records in a single Kinesis Data
  /// Streams record. To learn more, see <a
  /// href="https://docs.aws.amazon.com/streams/latest/dev/kinesis-kpl-concepts.html">KPL
  /// Key Concepts</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>.
  @_s.JsonKey(name: 'AggregationEnabled')
  final bool aggregationEnabled;

  KinesisConfiguration({
    @_s.required this.streamArn,
    this.aggregationEnabled,
  });
  factory KinesisConfiguration.fromJson(Map<String, dynamic> json) =>
      _$KinesisConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisConfigurationToJson(this);
}

enum LedgerState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Information about a ledger, including its name, state, and when it was
/// created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LedgerSummary {
  /// The date and time, in epoch time format, when the ledger was created. (Epoch
  /// time format is the number of seconds elapsed since 12:00:00 AM January 1,
  /// 1970 UTC.)
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The name of the ledger.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status of the ledger.
  @_s.JsonKey(name: 'State')
  final LedgerState state;

  LedgerSummary({
    this.creationDateTime,
    this.name,
    this.state,
  });
  factory LedgerSummary.fromJson(Map<String, dynamic> json) =>
      _$LedgerSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The array of QLDB journal stream descriptors that are associated with the
  /// given ledger.
  @_s.JsonKey(name: 'Streams')
  final List<JournalKinesisStreamDescription> streams;

  ListJournalKinesisStreamsForLedgerResponse({
    this.nextToken,
    this.streams,
  });
  factory ListJournalKinesisStreamsForLedgerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListJournalKinesisStreamsForLedgerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJournalS3ExportsForLedgerResponse {
  /// The array of journal export job descriptions that are associated with the
  /// specified ledger.
  @_s.JsonKey(name: 'JournalS3Exports')
  final List<JournalS3ExportDescription> journalS3Exports;

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
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListJournalS3ExportsForLedgerResponse({
    this.journalS3Exports,
    this.nextToken,
  });
  factory ListJournalS3ExportsForLedgerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListJournalS3ExportsForLedgerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJournalS3ExportsResponse {
  /// The array of journal export job descriptions for all ledgers that are
  /// associated with the current AWS account and Region.
  @_s.JsonKey(name: 'JournalS3Exports')
  final List<JournalS3ExportDescription> journalS3Exports;

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
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListJournalS3ExportsResponse({
    this.journalS3Exports,
    this.nextToken,
  });
  factory ListJournalS3ExportsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJournalS3ExportsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLedgersResponse {
  /// The array of ledger summaries that are associated with the current AWS
  /// account and Region.
  @_s.JsonKey(name: 'Ledgers')
  final List<LedgerSummary> ledgers;

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
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLedgersResponse({
    this.ledgers,
    this.nextToken,
  });
  factory ListLedgersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLedgersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags that are currently associated with the specified Amazon QLDB
  /// resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum PermissionsMode {
  @_s.JsonValue('ALLOW_ALL')
  allowAll,
}

extension on PermissionsMode {
  String toValue() {
    switch (this) {
      case PermissionsMode.allowAll:
        return 'ALLOW_ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The encryption settings that are used by a journal export job to write data
/// in an Amazon Simple Storage Service (Amazon S3) bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3EncryptionConfiguration {
  /// The Amazon S3 object encryption type.
  ///
  /// To learn more about server-side encryption options in Amazon S3, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting
  /// Data Using Server-Side Encryption</a> in the <i>Amazon S3 Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'ObjectEncryptionType')
  final S3ObjectEncryptionType objectEncryptionType;

  /// The Amazon Resource Name (ARN) for a symmetric customer master key (CMK) in
  /// AWS Key Management Service (AWS KMS). Amazon QLDB does not support
  /// asymmetric CMKs.
  ///
  /// You must provide a <code>KmsKeyArn</code> if you specify
  /// <code>SSE_KMS</code> as the <code>ObjectEncryptionType</code>.
  ///
  /// <code>KmsKeyArn</code> is not required if you specify <code>SSE_S3</code> as
  /// the <code>ObjectEncryptionType</code>.
  @_s.JsonKey(name: 'KmsKeyArn')
  final String kmsKeyArn;

  S3EncryptionConfiguration({
    @_s.required this.objectEncryptionType,
    this.kmsKeyArn,
  });
  factory S3EncryptionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$S3EncryptionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$S3EncryptionConfigurationToJson(this);
}

/// The Amazon Simple Storage Service (Amazon S3) bucket location in which a
/// journal export job writes the journal contents.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3ExportConfiguration {
  /// The Amazon S3 bucket name in which a journal export job writes the journal
  /// contents.
  ///
  /// The bucket name must comply with the Amazon S3 bucket naming conventions.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html">Bucket
  /// Restrictions and Limitations</a> in the <i>Amazon S3 Developer Guide</i>.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The encryption settings that are used by a journal export job to write data
  /// in an Amazon S3 bucket.
  @_s.JsonKey(name: 'EncryptionConfiguration')
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
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  S3ExportConfiguration({
    @_s.required this.bucket,
    @_s.required this.encryptionConfiguration,
    @_s.required this.prefix,
  });
  factory S3ExportConfiguration.fromJson(Map<String, dynamic> json) =>
      _$S3ExportConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$S3ExportConfigurationToJson(this);
}

enum S3ObjectEncryptionType {
  @_s.JsonValue('SSE_KMS')
  sseKms,
  @_s.JsonValue('SSE_S3')
  sseS3,
  @_s.JsonValue('NO_ENCRYPTION')
  noEncryption,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamJournalToKinesisResponse {
  /// The unique ID that QLDB assigns to each QLDB journal stream.
  @_s.JsonKey(name: 'StreamId')
  final String streamId;

  StreamJournalToKinesisResponse({
    this.streamId,
  });
  factory StreamJournalToKinesisResponse.fromJson(Map<String, dynamic> json) =>
      _$StreamJournalToKinesisResponseFromJson(json);
}

enum StreamStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('IMPAIRED')
  impaired,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLedgerResponse {
  /// The Amazon Resource Name (ARN) for the ledger.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time, in epoch time format, when the ledger was created. (Epoch
  /// time format is the number of seconds elapsed since 12:00:00 AM January 1,
  /// 1970 UTC.)
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (<code>true</code>) by
  /// default.
  ///
  /// If deletion protection is enabled, you must first disable it before you can
  /// delete the ledger using the QLDB API or the AWS Command Line Interface (AWS
  /// CLI). You can disable it by calling the <code>UpdateLedger</code> operation
  /// to set the flag to <code>false</code>. The QLDB console disables deletion
  /// protection for you when you use it to delete a ledger.
  @_s.JsonKey(name: 'DeletionProtection')
  final bool deletionProtection;

  /// The name of the ledger.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status of the ledger.
  @_s.JsonKey(name: 'State')
  final LedgerState state;

  UpdateLedgerResponse({
    this.arn,
    this.creationDateTime,
    this.deletionProtection,
    this.name,
    this.state,
  });
  factory UpdateLedgerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateLedgerResponseFromJson(json);
}

/// A structure that can contain a value in multiple encoding formats.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ValueHolder {
  /// An Amazon Ion plaintext value contained in a <code>ValueHolder</code>
  /// structure.
  @_s.JsonKey(name: 'IonText')
  final String ionText;

  ValueHolder({
    this.ionText,
  });
  factory ValueHolder.fromJson(Map<String, dynamic> json) =>
      _$ValueHolderFromJson(json);

  Map<String, dynamic> toJson() => _$ValueHolderToJson(this);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourcePreconditionNotMetException extends _s.GenericAwsException {
  ResourcePreconditionNotMetException({String type, String message})
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
