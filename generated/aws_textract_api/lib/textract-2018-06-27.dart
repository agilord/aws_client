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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon Textract detects and analyzes text in documents and converts it into
/// machine-readable text. This is the API reference documentation for Amazon
/// Textract.
class Textract {
  final _s.JsonProtocol _protocol;
  Textract({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'textract',
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

  /// Analyzes an input document for relationships between detected items.
  ///
  /// The types of information returned are as follows:
  ///
  /// <ul>
  /// <li>
  /// Form data (key-value pairs). The related information is returned in two
  /// <a>Block</a> objects, each of type <code>KEY_VALUE_SET</code>: a KEY
  /// <code>Block</code> object and a VALUE <code>Block</code> object. For
  /// example, <i>Name: Ana Silva Carolina</i> contains a key and value.
  /// <i>Name:</i> is the key. <i>Ana Silva Carolina</i> is the value.
  /// </li>
  /// <li>
  /// Table and table cell data. A TABLE <code>Block</code> object contains
  /// information about a detected table. A CELL <code>Block</code> object is
  /// returned for each cell in a table.
  /// </li>
  /// <li>
  /// Lines and words of text. A LINE <code>Block</code> object contains one or
  /// more WORD <code>Block</code> objects. All lines and words that are
  /// detected in the document are returned (including text that doesn't have a
  /// relationship with the value of <code>FeatureTypes</code>).
  /// </li>
  /// <li>
  /// Signatures. A SIGNATURE <code>Block</code> object contains the location
  /// information of a signature in a document. If used in conjunction with
  /// forms or tables, a signature can be given a Key-Value pairing or be
  /// detected in the cell of a table.
  /// </li>
  /// <li>
  /// Query. A QUERY Block object contains the query text, alias and link to the
  /// associated Query results block object.
  /// </li>
  /// <li>
  /// Query Result. A QUERY_RESULT Block object contains the answer to the query
  /// and an ID that connects it to the query asked. This Block also contains a
  /// confidence score.
  /// </li>
  /// </ul>
  /// Selection elements such as check boxes and option buttons (radio buttons)
  /// can be detected in form data and in tables. A SELECTION_ELEMENT
  /// <code>Block</code> object contains information about a selection element,
  /// including the selection status.
  ///
  /// You can choose which type of analysis to perform by specifying the
  /// <code>FeatureTypes</code> list.
  ///
  /// The output is returned in a list of <code>Block</code> objects.
  ///
  /// <code>AnalyzeDocument</code> is a synchronous operation. To analyze
  /// documents asynchronously, use <a>StartDocumentAnalysis</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document
  /// Text Analysis</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [UnsupportedDocumentException].
  /// May throw [DocumentTooLargeException].
  /// May throw [BadDocumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [HumanLoopQuotaExceededException].
  ///
  /// Parameter [document] :
  /// The input document as base64-encoded bytes or an Amazon S3 object. If you
  /// use the AWS CLI to call Amazon Textract operations, you can't pass image
  /// bytes. The document must be an image in JPEG, PNG, PDF, or TIFF format.
  ///
  /// If you're using an AWS SDK to call Amazon Textract, you might not need to
  /// base64-encode image bytes that are passed using the <code>Bytes</code>
  /// field.
  ///
  /// Parameter [featureTypes] :
  /// A list of the types of analysis to perform. Add TABLES to the list to
  /// return information about the tables that are detected in the input
  /// document. Add FORMS to return detected form data. Add SIGNATURES to return
  /// the locations of detected signatures. To perform both forms and table
  /// analysis, add TABLES and FORMS to <code>FeatureTypes</code>. To detect
  /// signatures within form data and table data, add SIGNATURES to either
  /// TABLES or FORMS. All lines and words detected in the document are included
  /// in the response (including text that isn't related to the value of
  /// <code>FeatureTypes</code>).
  ///
  /// Parameter [humanLoopConfig] :
  /// Sets the configuration for the human in the loop workflow for analyzing
  /// documents.
  ///
  /// Parameter [queriesConfig] :
  /// Contains Queries and the alias for those Queries, as determined by the
  /// input.
  Future<AnalyzeDocumentResponse> analyzeDocument({
    required Document document,
    required List<FeatureType> featureTypes,
    HumanLoopConfig? humanLoopConfig,
    QueriesConfig? queriesConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.AnalyzeDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Document': document,
        'FeatureTypes': featureTypes.map((e) => e.toValue()).toList(),
        if (humanLoopConfig != null) 'HumanLoopConfig': humanLoopConfig,
        if (queriesConfig != null) 'QueriesConfig': queriesConfig,
      },
    );

    return AnalyzeDocumentResponse.fromJson(jsonResponse.body);
  }

  /// <code>AnalyzeExpense</code> synchronously analyzes an input document for
  /// financially related relationships between text.
  ///
  /// Information is returned as <code>ExpenseDocuments</code> and seperated as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// <code>LineItemGroups</code>- A data set containing <code>LineItems</code>
  /// which store information about the lines of text, such as an item purchased
  /// and its price on a receipt.
  /// </li>
  /// <li>
  /// <code>SummaryFields</code>- Contains all other information a receipt, such
  /// as header information or the vendors name.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [UnsupportedDocumentException].
  /// May throw [DocumentTooLargeException].
  /// May throw [BadDocumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  Future<AnalyzeExpenseResponse> analyzeExpense({
    required Document document,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.AnalyzeExpense'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Document': document,
      },
    );

    return AnalyzeExpenseResponse.fromJson(jsonResponse.body);
  }

  /// Analyzes identity documents for relevant information. This information is
  /// extracted and returned as <code>IdentityDocumentFields</code>, which
  /// records both the normalized field and value of the extracted text. Unlike
  /// other Amazon Textract operations, <code>AnalyzeID</code> doesn't return
  /// any Geometry data.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [UnsupportedDocumentException].
  /// May throw [DocumentTooLargeException].
  /// May throw [BadDocumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [documentPages] :
  /// The document being passed to AnalyzeID.
  Future<AnalyzeIDResponse> analyzeID({
    required List<Document> documentPages,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.AnalyzeID'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentPages': documentPages,
      },
    );

    return AnalyzeIDResponse.fromJson(jsonResponse.body);
  }

  /// Detects text in the input document. Amazon Textract can detect lines of
  /// text and the words that make up a line of text. The input document must be
  /// in one of the following image formats: JPEG, PNG, PDF, or TIFF.
  /// <code>DetectDocumentText</code> returns the detected text in an array of
  /// <a>Block</a> objects.
  ///
  /// Each document page has as an associated <code>Block</code> of type PAGE.
  /// Each PAGE <code>Block</code> object is the parent of LINE
  /// <code>Block</code> objects that represent the lines of detected text on a
  /// page. A LINE <code>Block</code> object is a parent for each word that
  /// makes up the line. Words are represented by <code>Block</code> objects of
  /// type WORD.
  ///
  /// <code>DetectDocumentText</code> is a synchronous operation. To analyze
  /// documents asynchronously, use <a>StartDocumentTextDetection</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document
  /// Text Detection</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [UnsupportedDocumentException].
  /// May throw [DocumentTooLargeException].
  /// May throw [BadDocumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [document] :
  /// The input document as base64-encoded bytes or an Amazon S3 object. If you
  /// use the AWS CLI to call Amazon Textract operations, you can't pass image
  /// bytes. The document must be an image in JPEG or PNG format.
  ///
  /// If you're using an AWS SDK to call Amazon Textract, you might not need to
  /// base64-encode image bytes that are passed using the <code>Bytes</code>
  /// field.
  Future<DetectDocumentTextResponse> detectDocumentText({
    required Document document,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.DetectDocumentText'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Document': document,
      },
    );

    return DetectDocumentTextResponse.fromJson(jsonResponse.body);
  }

  /// Gets the results for an Amazon Textract asynchronous operation that
  /// analyzes text in a document.
  ///
  /// You start asynchronous text analysis by calling
  /// <a>StartDocumentAnalysis</a>, which returns a job identifier
  /// (<code>JobId</code>). When the text analysis operation finishes, Amazon
  /// Textract publishes a completion status to the Amazon Simple Notification
  /// Service (Amazon SNS) topic that's registered in the initial call to
  /// <code>StartDocumentAnalysis</code>. To get the results of the
  /// text-detection operation, first check that the status value published to
  /// the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <code>GetDocumentAnalysis</code>, and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartDocumentAnalysis</code>.
  ///
  /// <code>GetDocumentAnalysis</code> returns an array of <a>Block</a> objects.
  /// The following types of information are returned:
  ///
  /// <ul>
  /// <li>
  /// Form data (key-value pairs). The related information is returned in two
  /// <a>Block</a> objects, each of type <code>KEY_VALUE_SET</code>: a KEY
  /// <code>Block</code> object and a VALUE <code>Block</code> object. For
  /// example, <i>Name: Ana Silva Carolina</i> contains a key and value.
  /// <i>Name:</i> is the key. <i>Ana Silva Carolina</i> is the value.
  /// </li>
  /// <li>
  /// Table and table cell data. A TABLE <code>Block</code> object contains
  /// information about a detected table. A CELL <code>Block</code> object is
  /// returned for each cell in a table.
  /// </li>
  /// <li>
  /// Lines and words of text. A LINE <code>Block</code> object contains one or
  /// more WORD <code>Block</code> objects. All lines and words that are
  /// detected in the document are returned (including text that doesn't have a
  /// relationship with the value of the <code>StartDocumentAnalysis</code>
  /// <code>FeatureTypes</code> input parameter).
  /// </li>
  /// <li>
  /// Query. A QUERY Block object contains the query text, alias and link to the
  /// associated Query results block object.
  /// </li>
  /// <li>
  /// Query Results. A QUERY_RESULT Block object contains the answer to the
  /// query and an ID that connects it to the query asked. This Block also
  /// contains a confidence score.
  /// </li>
  /// </ul> <note>
  /// While processing a document with queries, look out for
  /// <code>INVALID_REQUEST_PARAMETERS</code> output. This indicates that either
  /// the per page query limit has been exceeded or that the operation is trying
  /// to query a page in the document which doesn’t exist.
  /// </note>
  /// Selection elements such as check boxes and option buttons (radio buttons)
  /// can be detected in form data and in tables. A SELECTION_ELEMENT
  /// <code>Block</code> object contains information about a selection element,
  /// including the selection status.
  ///
  /// Use the <code>MaxResults</code> parameter to limit the number of blocks
  /// that are returned. If there are more results than specified in
  /// <code>MaxResults</code>, the value of <code>NextToken</code> in the
  /// operation response contains a pagination token for getting the next set of
  /// results. To get the next page of results, call
  /// <code>GetDocumentAnalysis</code>, and populate the <code>NextToken</code>
  /// request parameter with the token value that's returned from the previous
  /// call to <code>GetDocumentAnalysis</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document
  /// Text Analysis</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidJobIdException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  ///
  /// Parameter [jobId] :
  /// A unique identifier for the text-detection job. The <code>JobId</code> is
  /// returned from <code>StartDocumentAnalysis</code>. A <code>JobId</code>
  /// value is only valid for 7 days.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value that you can specify is 1,000. If you specify a value greater than
  /// 1,000, a maximum of 1,000 results is returned. The default value is 1,000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there are more blocks to
  /// retrieve), Amazon Textract returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of blocks.
  Future<GetDocumentAnalysisResponse> getDocumentAnalysis({
    required String jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.GetDocumentAnalysis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetDocumentAnalysisResponse.fromJson(jsonResponse.body);
  }

  /// Gets the results for an Amazon Textract asynchronous operation that
  /// detects text in a document. Amazon Textract can detect lines of text and
  /// the words that make up a line of text.
  ///
  /// You start asynchronous text detection by calling
  /// <a>StartDocumentTextDetection</a>, which returns a job identifier
  /// (<code>JobId</code>). When the text detection operation finishes, Amazon
  /// Textract publishes a completion status to the Amazon Simple Notification
  /// Service (Amazon SNS) topic that's registered in the initial call to
  /// <code>StartDocumentTextDetection</code>. To get the results of the
  /// text-detection operation, first check that the status value published to
  /// the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <code>GetDocumentTextDetection</code>, and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartDocumentTextDetection</code>.
  ///
  /// <code>GetDocumentTextDetection</code> returns an array of <a>Block</a>
  /// objects.
  ///
  /// Each document page has as an associated <code>Block</code> of type PAGE.
  /// Each PAGE <code>Block</code> object is the parent of LINE
  /// <code>Block</code> objects that represent the lines of detected text on a
  /// page. A LINE <code>Block</code> object is a parent for each word that
  /// makes up the line. Words are represented by <code>Block</code> objects of
  /// type WORD.
  ///
  /// Use the MaxResults parameter to limit the number of blocks that are
  /// returned. If there are more results than specified in
  /// <code>MaxResults</code>, the value of <code>NextToken</code> in the
  /// operation response contains a pagination token for getting the next set of
  /// results. To get the next page of results, call
  /// <code>GetDocumentTextDetection</code>, and populate the
  /// <code>NextToken</code> request parameter with the token value that's
  /// returned from the previous call to <code>GetDocumentTextDetection</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document
  /// Text Detection</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidJobIdException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  ///
  /// Parameter [jobId] :
  /// A unique identifier for the text detection job. The <code>JobId</code> is
  /// returned from <code>StartDocumentTextDetection</code>. A
  /// <code>JobId</code> value is only valid for 7 days.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 1,000. If you specify a value greater than 1,000,
  /// a maximum of 1,000 results is returned. The default value is 1,000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there are more blocks to
  /// retrieve), Amazon Textract returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of blocks.
  Future<GetDocumentTextDetectionResponse> getDocumentTextDetection({
    required String jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.GetDocumentTextDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetDocumentTextDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Gets the results for an Amazon Textract asynchronous operation that
  /// analyzes invoices and receipts. Amazon Textract finds contact information,
  /// items purchased, and vendor name, from input invoices and receipts.
  ///
  /// You start asynchronous invoice/receipt analysis by calling
  /// <a>StartExpenseAnalysis</a>, which returns a job identifier
  /// (<code>JobId</code>). Upon completion of the invoice/receipt analysis,
  /// Amazon Textract publishes the completion status to the Amazon Simple
  /// Notification Service (Amazon SNS) topic. This topic must be registered in
  /// the initial call to <code>StartExpenseAnalysis</code>. To get the results
  /// of the invoice/receipt analysis operation, first ensure that the status
  /// value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so,
  /// call <code>GetExpenseAnalysis</code>, and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartExpenseAnalysis</code>.
  ///
  /// Use the MaxResults parameter to limit the number of blocks that are
  /// returned. If there are more results than specified in
  /// <code>MaxResults</code>, the value of <code>NextToken</code> in the
  /// operation response contains a pagination token for getting the next set of
  /// results. To get the next page of results, call
  /// <code>GetExpenseAnalysis</code>, and populate the <code>NextToken</code>
  /// request parameter with the token value that's returned from the previous
  /// call to <code>GetExpenseAnalysis</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/invoices-receipts.html">Analyzing
  /// Invoices and Receipts</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidJobIdException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  ///
  /// Parameter [jobId] :
  /// A unique identifier for the text detection job. The <code>JobId</code> is
  /// returned from <code>StartExpenseAnalysis</code>. A <code>JobId</code>
  /// value is only valid for 7 days.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 20. If you specify a value greater than 20, a
  /// maximum of 20 results is returned. The default value is 20.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there are more blocks to
  /// retrieve), Amazon Textract returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of blocks.
  Future<GetExpenseAnalysisResponse> getExpenseAnalysis({
    required String jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.GetExpenseAnalysis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetExpenseAnalysisResponse.fromJson(jsonResponse.body);
  }

  /// Gets the results for an Amazon Textract asynchronous operation that
  /// analyzes text in a lending document.
  ///
  /// You start asynchronous text analysis by calling
  /// <code>StartLendingAnalysis</code>, which returns a job identifier
  /// (<code>JobId</code>). When the text analysis operation finishes, Amazon
  /// Textract publishes a completion status to the Amazon Simple Notification
  /// Service (Amazon SNS) topic that's registered in the initial call to
  /// <code>StartLendingAnalysis</code>.
  ///
  /// To get the results of the text analysis operation, first check that the
  /// status value published to the Amazon SNS topic is SUCCEEDED. If so, call
  /// GetLendingAnalysis, and pass the job identifier (<code>JobId</code>) from
  /// the initial call to <code>StartLendingAnalysis</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidJobIdException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  ///
  /// Parameter [jobId] :
  /// A unique identifier for the lending or text-detection job. The
  /// <code>JobId</code> is returned from <code>StartLendingAnalysis</code>. A
  /// <code>JobId</code> value is only valid for 7 days.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value that you can specify is 30. If you specify a value greater than 30,
  /// a maximum of 30 results is returned. The default value is 30.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete, Amazon Textract returns a
  /// pagination token in the response. You can use this pagination token to
  /// retrieve the next set of lending results.
  Future<GetLendingAnalysisResponse> getLendingAnalysis({
    required String jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.GetLendingAnalysis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetLendingAnalysisResponse.fromJson(jsonResponse.body);
  }

  /// Gets summarized results for the <code>StartLendingAnalysis</code>
  /// operation, which analyzes text in a lending document. The returned summary
  /// consists of information about documents grouped together by a common
  /// document type. Information like detected signatures, page numbers, and
  /// split documents is returned with respect to the type of grouped document.
  ///
  /// You start asynchronous text analysis by calling
  /// <code>StartLendingAnalysis</code>, which returns a job identifier
  /// (<code>JobId</code>). When the text analysis operation finishes, Amazon
  /// Textract publishes a completion status to the Amazon Simple Notification
  /// Service (Amazon SNS) topic that's registered in the initial call to
  /// <code>StartLendingAnalysis</code>.
  ///
  /// To get the results of the text analysis operation, first check that the
  /// status value published to the Amazon SNS topic is SUCCEEDED. If so, call
  /// <code>GetLendingAnalysisSummary</code>, and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartLendingAnalysis</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidJobIdException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  ///
  /// Parameter [jobId] :
  /// A unique identifier for the lending or text-detection job. The
  /// <code>JobId</code> is returned from StartLendingAnalysis. A
  /// <code>JobId</code> value is only valid for 7 days.
  Future<GetLendingAnalysisSummaryResponse> getLendingAnalysisSummary({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.GetLendingAnalysisSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return GetLendingAnalysisSummaryResponse.fromJson(jsonResponse.body);
  }

  /// Starts the asynchronous analysis of an input document for relationships
  /// between detected items such as key-value pairs, tables, and selection
  /// elements.
  ///
  /// <code>StartDocumentAnalysis</code> can analyze text in documents that are
  /// in JPEG, PNG, TIFF, and PDF format. The documents are stored in an Amazon
  /// S3 bucket. Use <a>DocumentLocation</a> to specify the bucket name and file
  /// name of the document.
  ///
  /// <code>StartDocumentAnalysis</code> returns a job identifier
  /// (<code>JobId</code>) that you use to get the results of the operation.
  /// When text analysis is finished, Amazon Textract publishes a completion
  /// status to the Amazon Simple Notification Service (Amazon SNS) topic that
  /// you specify in <code>NotificationChannel</code>. To get the results of the
  /// text analysis operation, first check that the status value published to
  /// the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <a>GetDocumentAnalysis</a>, and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartDocumentAnalysis</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document
  /// Text Analysis</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  /// May throw [UnsupportedDocumentException].
  /// May throw [DocumentTooLargeException].
  /// May throw [BadDocumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InternalServerError].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [documentLocation] :
  /// The location of the document to be processed.
  ///
  /// Parameter [featureTypes] :
  /// A list of the types of analysis to perform. Add TABLES to the list to
  /// return information about the tables that are detected in the input
  /// document. Add FORMS to return detected form data. To perform both types of
  /// analysis, add TABLES and FORMS to <code>FeatureTypes</code>. All lines and
  /// words detected in the document are included in the response (including
  /// text that isn't related to the value of <code>FeatureTypes</code>).
  ///
  /// Parameter [clientRequestToken] :
  /// The idempotent token that you use to identify the start request. If you
  /// use the same token with multiple <code>StartDocumentAnalysis</code>
  /// requests, the same <code>JobId</code> is returned. Use
  /// <code>ClientRequestToken</code> to prevent the same job from being
  /// accidentally started more than once. For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/api-async.html">Calling
  /// Amazon Textract Asynchronous Operations</a>.
  ///
  /// Parameter [jobTag] :
  /// An identifier that you specify that's included in the completion
  /// notification published to the Amazon SNS topic. For example, you can use
  /// <code>JobTag</code> to identify the type of document that the completion
  /// notification corresponds to (such as a tax form or a receipt).
  ///
  /// Parameter [kMSKeyId] :
  /// The KMS key used to encrypt the inference results. This can be in either
  /// Key ID or Key Alias format. When a KMS key is provided, the KMS key will
  /// be used for server-side encryption of the objects in the customer bucket.
  /// When this parameter is not enabled, the result will be encrypted server
  /// side,using SSE-S3.
  ///
  /// Parameter [notificationChannel] :
  /// The Amazon SNS topic ARN that you want Amazon Textract to publish the
  /// completion status of the operation to.
  ///
  /// Parameter [outputConfig] :
  /// Sets if the output will go to a customer defined bucket. By default,
  /// Amazon Textract will save the results internally to be accessed by the
  /// GetDocumentAnalysis operation.
  Future<StartDocumentAnalysisResponse> startDocumentAnalysis({
    required DocumentLocation documentLocation,
    required List<FeatureType> featureTypes,
    String? clientRequestToken,
    String? jobTag,
    String? kMSKeyId,
    NotificationChannel? notificationChannel,
    OutputConfig? outputConfig,
    QueriesConfig? queriesConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.StartDocumentAnalysis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentLocation': documentLocation,
        'FeatureTypes': featureTypes.map((e) => e.toValue()).toList(),
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (jobTag != null) 'JobTag': jobTag,
        if (kMSKeyId != null) 'KMSKeyId': kMSKeyId,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
        if (outputConfig != null) 'OutputConfig': outputConfig,
        if (queriesConfig != null) 'QueriesConfig': queriesConfig,
      },
    );

    return StartDocumentAnalysisResponse.fromJson(jsonResponse.body);
  }

  /// Starts the asynchronous detection of text in a document. Amazon Textract
  /// can detect lines of text and the words that make up a line of text.
  ///
  /// <code>StartDocumentTextDetection</code> can analyze text in documents that
  /// are in JPEG, PNG, TIFF, and PDF format. The documents are stored in an
  /// Amazon S3 bucket. Use <a>DocumentLocation</a> to specify the bucket name
  /// and file name of the document.
  ///
  /// <code>StartTextDetection</code> returns a job identifier
  /// (<code>JobId</code>) that you use to get the results of the operation.
  /// When text detection is finished, Amazon Textract publishes a completion
  /// status to the Amazon Simple Notification Service (Amazon SNS) topic that
  /// you specify in <code>NotificationChannel</code>. To get the results of the
  /// text detection operation, first check that the status value published to
  /// the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <a>GetDocumentTextDetection</a>, and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartDocumentTextDetection</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document
  /// Text Detection</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  /// May throw [UnsupportedDocumentException].
  /// May throw [DocumentTooLargeException].
  /// May throw [BadDocumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InternalServerError].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [documentLocation] :
  /// The location of the document to be processed.
  ///
  /// Parameter [clientRequestToken] :
  /// The idempotent token that's used to identify the start request. If you use
  /// the same token with multiple <code>StartDocumentTextDetection</code>
  /// requests, the same <code>JobId</code> is returned. Use
  /// <code>ClientRequestToken</code> to prevent the same job from being
  /// accidentally started more than once. For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/api-async.html">Calling
  /// Amazon Textract Asynchronous Operations</a>.
  ///
  /// Parameter [jobTag] :
  /// An identifier that you specify that's included in the completion
  /// notification published to the Amazon SNS topic. For example, you can use
  /// <code>JobTag</code> to identify the type of document that the completion
  /// notification corresponds to (such as a tax form or a receipt).
  ///
  /// Parameter [kMSKeyId] :
  /// The KMS key used to encrypt the inference results. This can be in either
  /// Key ID or Key Alias format. When a KMS key is provided, the KMS key will
  /// be used for server-side encryption of the objects in the customer bucket.
  /// When this parameter is not enabled, the result will be encrypted server
  /// side,using SSE-S3.
  ///
  /// Parameter [notificationChannel] :
  /// The Amazon SNS topic ARN that you want Amazon Textract to publish the
  /// completion status of the operation to.
  ///
  /// Parameter [outputConfig] :
  /// Sets if the output will go to a customer defined bucket. By default Amazon
  /// Textract will save the results internally to be accessed with the
  /// GetDocumentTextDetection operation.
  Future<StartDocumentTextDetectionResponse> startDocumentTextDetection({
    required DocumentLocation documentLocation,
    String? clientRequestToken,
    String? jobTag,
    String? kMSKeyId,
    NotificationChannel? notificationChannel,
    OutputConfig? outputConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.StartDocumentTextDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentLocation': documentLocation,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (jobTag != null) 'JobTag': jobTag,
        if (kMSKeyId != null) 'KMSKeyId': kMSKeyId,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
        if (outputConfig != null) 'OutputConfig': outputConfig,
      },
    );

    return StartDocumentTextDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Starts the asynchronous analysis of invoices or receipts for data like
  /// contact information, items purchased, and vendor names.
  ///
  /// <code>StartExpenseAnalysis</code> can analyze text in documents that are
  /// in JPEG, PNG, and PDF format. The documents must be stored in an Amazon S3
  /// bucket. Use the <a>DocumentLocation</a> parameter to specify the name of
  /// your S3 bucket and the name of the document in that bucket.
  ///
  /// <code>StartExpenseAnalysis</code> returns a job identifier
  /// (<code>JobId</code>) that you will provide to
  /// <code>GetExpenseAnalysis</code> to retrieve the results of the operation.
  /// When the analysis of the input invoices/receipts is finished, Amazon
  /// Textract publishes a completion status to the Amazon Simple Notification
  /// Service (Amazon SNS) topic that you provide to the
  /// <code>NotificationChannel</code>. To obtain the results of the invoice and
  /// receipt analysis operation, ensure that the status value published to the
  /// Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <a>GetExpenseAnalysis</a>, and pass the job identifier
  /// (<code>JobId</code>) that was returned by your call to
  /// <code>StartExpenseAnalysis</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/invoice-receipts.html">Analyzing
  /// Invoices and Receipts</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  /// May throw [UnsupportedDocumentException].
  /// May throw [DocumentTooLargeException].
  /// May throw [BadDocumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InternalServerError].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [documentLocation] :
  /// The location of the document to be processed.
  ///
  /// Parameter [clientRequestToken] :
  /// The idempotent token that's used to identify the start request. If you use
  /// the same token with multiple <code>StartDocumentTextDetection</code>
  /// requests, the same <code>JobId</code> is returned. Use
  /// <code>ClientRequestToken</code> to prevent the same job from being
  /// accidentally started more than once. For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/api-async.html">Calling
  /// Amazon Textract Asynchronous Operations</a>
  ///
  /// Parameter [jobTag] :
  /// An identifier you specify that's included in the completion notification
  /// published to the Amazon SNS topic. For example, you can use
  /// <code>JobTag</code> to identify the type of document that the completion
  /// notification corresponds to (such as a tax form or a receipt).
  ///
  /// Parameter [kMSKeyId] :
  /// The KMS key used to encrypt the inference results. This can be in either
  /// Key ID or Key Alias format. When a KMS key is provided, the KMS key will
  /// be used for server-side encryption of the objects in the customer bucket.
  /// When this parameter is not enabled, the result will be encrypted server
  /// side,using SSE-S3.
  ///
  /// Parameter [notificationChannel] :
  /// The Amazon SNS topic ARN that you want Amazon Textract to publish the
  /// completion status of the operation to.
  ///
  /// Parameter [outputConfig] :
  /// Sets if the output will go to a customer defined bucket. By default,
  /// Amazon Textract will save the results internally to be accessed by the
  /// <code>GetExpenseAnalysis</code> operation.
  Future<StartExpenseAnalysisResponse> startExpenseAnalysis({
    required DocumentLocation documentLocation,
    String? clientRequestToken,
    String? jobTag,
    String? kMSKeyId,
    NotificationChannel? notificationChannel,
    OutputConfig? outputConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.StartExpenseAnalysis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentLocation': documentLocation,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (jobTag != null) 'JobTag': jobTag,
        if (kMSKeyId != null) 'KMSKeyId': kMSKeyId,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
        if (outputConfig != null) 'OutputConfig': outputConfig,
      },
    );

    return StartExpenseAnalysisResponse.fromJson(jsonResponse.body);
  }

  /// Starts the classification and analysis of an input document.
  /// <code>StartLendingAnalysis</code> initiates the classification and
  /// analysis of a packet of lending documents.
  /// <code>StartLendingAnalysis</code> operates on a document file located in
  /// an Amazon S3 bucket.
  ///
  /// <code>StartLendingAnalysis</code> can analyze text in documents that are
  /// in one of the following formats: JPEG, PNG, TIFF, PDF. Use
  /// <code>DocumentLocation</code> to specify the bucket name and the file name
  /// of the document.
  ///
  /// <code>StartLendingAnalysis</code> returns a job identifier
  /// (<code>JobId</code>) that you use to get the results of the operation.
  /// When the text analysis is finished, Amazon Textract publishes a completion
  /// status to the Amazon Simple Notification Service (Amazon SNS) topic that
  /// you specify in <code>NotificationChannel</code>. To get the results of the
  /// text analysis operation, first check that the status value published to
  /// the Amazon SNS topic is SUCCEEDED. If the status is SUCCEEDED you can call
  /// either <code>GetLendingAnalysis</code> or
  /// <code>GetLendingAnalysisSummary</code> and provide the <code>JobId</code>
  /// to obtain the results of the analysis.
  ///
  /// If using <code>OutputConfig</code> to specify an Amazon S3 bucket, the
  /// output will be contained within the specified prefix in a directory
  /// labeled with the job-id. In the directory there are 3 sub-directories:
  ///
  /// <ul>
  /// <li>
  /// detailedResponse (contains the GetLendingAnalysis response)
  /// </li>
  /// <li>
  /// summaryResponse (for the GetLendingAnalysisSummary response)
  /// </li>
  /// <li>
  /// splitDocuments (documents split across logical boundaries)
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidKMSKeyException].
  /// May throw [UnsupportedDocumentException].
  /// May throw [DocumentTooLargeException].
  /// May throw [BadDocumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InternalServerError].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [clientRequestToken] :
  /// The idempotent token that you use to identify the start request. If you
  /// use the same token with multiple <code>StartLendingAnalysis</code>
  /// requests, the same <code>JobId</code> is returned. Use
  /// <code>ClientRequestToken</code> to prevent the same job from being
  /// accidentally started more than once. For more information, see <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/api-sync.html">Calling
  /// Amazon Textract Asynchronous Operations</a>.
  ///
  /// Parameter [jobTag] :
  /// An identifier that you specify to be included in the completion
  /// notification published to the Amazon SNS topic. For example, you can use
  /// <code>JobTag</code> to identify the type of document that the completion
  /// notification corresponds to (such as a tax form or a receipt).
  ///
  /// Parameter [kMSKeyId] :
  /// The KMS key used to encrypt the inference results. This can be in either
  /// Key ID or Key Alias format. When a KMS key is provided, the KMS key will
  /// be used for server-side encryption of the objects in the customer bucket.
  /// When this parameter is not enabled, the result will be encrypted server
  /// side, using SSE-S3.
  Future<StartLendingAnalysisResponse> startLendingAnalysis({
    required DocumentLocation documentLocation,
    String? clientRequestToken,
    String? jobTag,
    String? kMSKeyId,
    NotificationChannel? notificationChannel,
    OutputConfig? outputConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Textract.StartLendingAnalysis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentLocation': documentLocation,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (jobTag != null) 'JobTag': jobTag,
        if (kMSKeyId != null) 'KMSKeyId': kMSKeyId,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
        if (outputConfig != null) 'OutputConfig': outputConfig,
      },
    );

    return StartLendingAnalysisResponse.fromJson(jsonResponse.body);
  }
}

class AnalyzeDocumentResponse {
  /// The version of the model used to analyze the document.
  final String? analyzeDocumentModelVersion;

  /// The items that are detected and analyzed by <code>AnalyzeDocument</code>.
  final List<Block>? blocks;

  /// Metadata about the analyzed document. An example is the number of pages.
  final DocumentMetadata? documentMetadata;

  /// Shows the results of the human in the loop evaluation.
  final HumanLoopActivationOutput? humanLoopActivationOutput;

  AnalyzeDocumentResponse({
    this.analyzeDocumentModelVersion,
    this.blocks,
    this.documentMetadata,
    this.humanLoopActivationOutput,
  });

  factory AnalyzeDocumentResponse.fromJson(Map<String, dynamic> json) {
    return AnalyzeDocumentResponse(
      analyzeDocumentModelVersion:
          json['AnalyzeDocumentModelVersion'] as String?,
      blocks: (json['Blocks'] as List?)
          ?.whereNotNull()
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      humanLoopActivationOutput: json['HumanLoopActivationOutput'] != null
          ? HumanLoopActivationOutput.fromJson(
              json['HumanLoopActivationOutput'] as Map<String, dynamic>)
          : null,
    );
  }
}

class AnalyzeExpenseResponse {
  final DocumentMetadata? documentMetadata;

  /// The expenses detected by Amazon Textract.
  final List<ExpenseDocument>? expenseDocuments;

  AnalyzeExpenseResponse({
    this.documentMetadata,
    this.expenseDocuments,
  });

  factory AnalyzeExpenseResponse.fromJson(Map<String, dynamic> json) {
    return AnalyzeExpenseResponse(
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      expenseDocuments: (json['ExpenseDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => ExpenseDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Used to contain the information detected by an AnalyzeID operation.
class AnalyzeIDDetections {
  /// Text of either the normalized field or value associated with it.
  final String text;

  /// The confidence score of the detected text.
  final double? confidence;

  /// Only returned for dates, returns the type of value detected and the date
  /// written in a more machine readable way.
  final NormalizedValue? normalizedValue;

  AnalyzeIDDetections({
    required this.text,
    this.confidence,
    this.normalizedValue,
  });

  factory AnalyzeIDDetections.fromJson(Map<String, dynamic> json) {
    return AnalyzeIDDetections(
      text: json['Text'] as String,
      confidence: json['Confidence'] as double?,
      normalizedValue: json['NormalizedValue'] != null
          ? NormalizedValue.fromJson(
              json['NormalizedValue'] as Map<String, dynamic>)
          : null,
    );
  }
}

class AnalyzeIDResponse {
  /// The version of the AnalyzeIdentity API being used to process documents.
  final String? analyzeIDModelVersion;
  final DocumentMetadata? documentMetadata;

  /// The list of documents processed by AnalyzeID. Includes a number denoting
  /// their place in the list and the response structure for the document.
  final List<IdentityDocument>? identityDocuments;

  AnalyzeIDResponse({
    this.analyzeIDModelVersion,
    this.documentMetadata,
    this.identityDocuments,
  });

  factory AnalyzeIDResponse.fromJson(Map<String, dynamic> json) {
    return AnalyzeIDResponse(
      analyzeIDModelVersion: json['AnalyzeIDModelVersion'] as String?,
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      identityDocuments: (json['IdentityDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => IdentityDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// A <code>Block</code> represents items that are recognized in a document
/// within a group of pixels close to each other. The information returned in a
/// <code>Block</code> object depends on the type of operation. In text
/// detection for documents (for example <a>DetectDocumentText</a>), you get
/// information about the detected words and lines of text. In text analysis
/// (for example <a>AnalyzeDocument</a>), you can also get information about the
/// fields, tables, and selection elements that are detected in the document.
///
/// An array of <code>Block</code> objects is returned by both synchronous and
/// asynchronous operations. In synchronous operations, such as
/// <a>DetectDocumentText</a>, the array of <code>Block</code> objects is the
/// entire set of results. In asynchronous operations, such as
/// <a>GetDocumentAnalysis</a>, the array is returned over one or more
/// responses.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works.html">How
/// Amazon Textract Works</a>.
class Block {
  /// The type of text item that's recognized. In operations for text detection,
  /// the following types are returned:
  ///
  /// <ul>
  /// <li>
  /// <i>PAGE</i> - Contains a list of the LINE <code>Block</code> objects that
  /// are detected on a document page.
  /// </li>
  /// <li>
  /// <i>WORD</i> - A word detected on a document page. A word is one or more ISO
  /// basic Latin script characters that aren't separated by spaces.
  /// </li>
  /// <li>
  /// <i>LINE</i> - A string of tab-delimited, contiguous words that are detected
  /// on a document page.
  /// </li>
  /// </ul>
  /// In text analysis operations, the following types are returned:
  ///
  /// <ul>
  /// <li>
  /// <i>PAGE</i> - Contains a list of child <code>Block</code> objects that are
  /// detected on a document page.
  /// </li>
  /// <li>
  /// <i>KEY_VALUE_SET</i> - Stores the KEY and VALUE <code>Block</code> objects
  /// for linked text that's detected on a document page. Use the
  /// <code>EntityType</code> field to determine if a KEY_VALUE_SET object is a
  /// KEY <code>Block</code> object or a VALUE <code>Block</code> object.
  /// </li>
  /// <li>
  /// <i>WORD</i> - A word that's detected on a document page. A word is one or
  /// more ISO basic Latin script characters that aren't separated by spaces.
  /// </li>
  /// <li>
  /// <i>LINE</i> - A string of tab-delimited, contiguous words that are detected
  /// on a document page.
  /// </li>
  /// <li>
  /// <i>TABLE</i> - A table that's detected on a document page. A table is
  /// grid-based information with two or more rows or columns, with a cell span of
  /// one row and one column each.
  /// </li>
  /// <li>
  /// <i>TABLE_TITLE</i> - The title of a table. A title is typically a line of
  /// text above or below a table, or embedded as the first row of a table.
  /// </li>
  /// <li>
  /// <i>TABLE_FOOTER</i> - The footer associated with a table. A footer is
  /// typically a line or lines of text below a table or embedded as the last row
  /// of a table.
  /// </li>
  /// <li>
  /// <i>CELL</i> - A cell within a detected table. The cell is the parent of the
  /// block that contains the text in the cell.
  /// </li>
  /// <li>
  /// <i>MERGED_CELL</i> - A cell in a table whose content spans more than one row
  /// or column. The <code>Relationships</code> array for this cell contain data
  /// from individual cells.
  /// </li>
  /// <li>
  /// <i>SELECTION_ELEMENT</i> - A selection element such as an option button
  /// (radio button) or a check box that's detected on a document page. Use the
  /// value of <code>SelectionStatus</code> to determine the status of the
  /// selection element.
  /// </li>
  /// <li>
  /// <i>SIGNATURE</i> - The location and confidene score of a signature detected
  /// on a document page. Can be returned as part of a Key-Value pair or a
  /// detected cell.
  /// </li>
  /// <li>
  /// <i>QUERY</i> - A question asked during the call of AnalyzeDocument. Contains
  /// an alias and an ID that attaches it to its answer.
  /// </li>
  /// <li>
  /// <i>QUERY_RESULT</i> - A response to a question asked during the call of
  /// analyze document. Comes with an alias and ID for ease of locating in a
  /// response. Also contains location and confidence score.
  /// </li>
  /// </ul>
  final BlockType? blockType;

  /// The column in which a table cell appears. The first column position is 1.
  /// <code>ColumnIndex</code> isn't returned by <code>DetectDocumentText</code>
  /// and <code>GetDocumentTextDetection</code>.
  final int? columnIndex;

  /// The number of columns that a table cell spans. <code>ColumnSpan</code> isn't
  /// returned by <code>DetectDocumentText</code> and
  /// <code>GetDocumentTextDetection</code>.
  final int? columnSpan;

  /// The confidence score that Amazon Textract has in the accuracy of the
  /// recognized text and the accuracy of the geometry points around the
  /// recognized text.
  final double? confidence;

  /// The type of entity.
  ///
  /// The following entity types can be returned by FORMS analysis:
  ///
  /// <ul>
  /// <li>
  /// <i>KEY</i> - An identifier for a field on the document.
  /// </li>
  /// <li>
  /// <i>VALUE</i> - The field text.
  /// </li>
  /// </ul>
  /// The following entity types can be returned by TABLES analysis:
  ///
  /// <ul>
  /// <li>
  /// <i>COLUMN_HEADER</i> - Identifies a cell that is a header of a column.
  /// </li>
  /// <li>
  /// <i>TABLE_TITLE</i> - Identifies a cell that is a title within the table.
  /// </li>
  /// <li>
  /// <i>TABLE_SECTION_TITLE</i> - Identifies a cell that is a title of a section
  /// within a table. A section title is a cell that typically spans an entire row
  /// above a section.
  /// </li>
  /// <li>
  /// <i>TABLE_FOOTER</i> - Identifies a cell that is a footer of a table.
  /// </li>
  /// <li>
  /// <i>TABLE_SUMMARY</i> - Identifies a summary cell of a table. A summary cell
  /// can be a row of a table or an additional, smaller table that contains
  /// summary information for another table.
  /// </li>
  /// <li>
  /// <i>STRUCTURED_TABLE </i> - Identifies a table with column headers where the
  /// content of each row corresponds to the headers.
  /// </li>
  /// <li>
  /// <i>SEMI_STRUCTURED_TABLE</i> - Identifies a non-structured table.
  /// </li>
  /// </ul>
  /// <code>EntityTypes</code> isn't returned by <code>DetectDocumentText</code>
  /// and <code>GetDocumentTextDetection</code>.
  final List<EntityType>? entityTypes;

  /// The location of the recognized text on the image. It includes an
  /// axis-aligned, coarse bounding box that surrounds the text, and a finer-grain
  /// polygon for more accurate spatial information.
  final Geometry? geometry;

  /// The identifier for the recognized text. The identifier is only unique for a
  /// single operation.
  final String? id;

  /// The page on which a block was detected. <code>Page</code> is returned by
  /// synchronous and asynchronous operations. Page values greater than 1 are only
  /// returned for multipage documents that are in PDF or TIFF format. A scanned
  /// image (JPEG/PNG) provided to an asynchronous operation, even if it contains
  /// multiple document pages, is considered a single-page document. This means
  /// that for scanned images the value of <code>Page</code> is always 1.
  /// Synchronous operations will also return a <code>Page</code> value of 1
  /// because every input document is considered to be a single-page document.
  final int? page;

  /// <p/>
  final Query? query;

  /// A list of relationship objects that describe how blocks are related to each
  /// other. For example, a LINE block object contains a CHILD relationship type
  /// with the WORD blocks that make up the line of text. There aren't
  /// Relationship objects in the list for relationships that don't exist, such as
  /// when the current block has no child blocks.
  final List<Relationship>? relationships;

  /// The row in which a table cell is located. The first row position is 1.
  /// <code>RowIndex</code> isn't returned by <code>DetectDocumentText</code> and
  /// <code>GetDocumentTextDetection</code>.
  final int? rowIndex;

  /// The number of rows that a table cell spans. <code>RowSpan</code> isn't
  /// returned by <code>DetectDocumentText</code> and
  /// <code>GetDocumentTextDetection</code>.
  final int? rowSpan;

  /// The selection status of a selection element, such as an option button or
  /// check box.
  final SelectionStatus? selectionStatus;

  /// The word or line of text that's recognized by Amazon Textract.
  final String? text;

  /// The kind of text that Amazon Textract has detected. Can check for
  /// handwritten text and printed text.
  final TextType? textType;

  Block({
    this.blockType,
    this.columnIndex,
    this.columnSpan,
    this.confidence,
    this.entityTypes,
    this.geometry,
    this.id,
    this.page,
    this.query,
    this.relationships,
    this.rowIndex,
    this.rowSpan,
    this.selectionStatus,
    this.text,
    this.textType,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      blockType: (json['BlockType'] as String?)?.toBlockType(),
      columnIndex: json['ColumnIndex'] as int?,
      columnSpan: json['ColumnSpan'] as int?,
      confidence: json['Confidence'] as double?,
      entityTypes: (json['EntityTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEntityType())
          .toList(),
      geometry: json['Geometry'] != null
          ? Geometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      page: json['Page'] as int?,
      query: json['Query'] != null
          ? Query.fromJson(json['Query'] as Map<String, dynamic>)
          : null,
      relationships: (json['Relationships'] as List?)
          ?.whereNotNull()
          .map((e) => Relationship.fromJson(e as Map<String, dynamic>))
          .toList(),
      rowIndex: json['RowIndex'] as int?,
      rowSpan: json['RowSpan'] as int?,
      selectionStatus:
          (json['SelectionStatus'] as String?)?.toSelectionStatus(),
      text: json['Text'] as String?,
      textType: (json['TextType'] as String?)?.toTextType(),
    );
  }
}

enum BlockType {
  keyValueSet,
  page,
  line,
  word,
  table,
  cell,
  selectionElement,
  mergedCell,
  title,
  query,
  queryResult,
  signature,
  tableTitle,
  tableFooter,
}

extension BlockTypeValueExtension on BlockType {
  String toValue() {
    switch (this) {
      case BlockType.keyValueSet:
        return 'KEY_VALUE_SET';
      case BlockType.page:
        return 'PAGE';
      case BlockType.line:
        return 'LINE';
      case BlockType.word:
        return 'WORD';
      case BlockType.table:
        return 'TABLE';
      case BlockType.cell:
        return 'CELL';
      case BlockType.selectionElement:
        return 'SELECTION_ELEMENT';
      case BlockType.mergedCell:
        return 'MERGED_CELL';
      case BlockType.title:
        return 'TITLE';
      case BlockType.query:
        return 'QUERY';
      case BlockType.queryResult:
        return 'QUERY_RESULT';
      case BlockType.signature:
        return 'SIGNATURE';
      case BlockType.tableTitle:
        return 'TABLE_TITLE';
      case BlockType.tableFooter:
        return 'TABLE_FOOTER';
    }
  }
}

extension BlockTypeFromString on String {
  BlockType toBlockType() {
    switch (this) {
      case 'KEY_VALUE_SET':
        return BlockType.keyValueSet;
      case 'PAGE':
        return BlockType.page;
      case 'LINE':
        return BlockType.line;
      case 'WORD':
        return BlockType.word;
      case 'TABLE':
        return BlockType.table;
      case 'CELL':
        return BlockType.cell;
      case 'SELECTION_ELEMENT':
        return BlockType.selectionElement;
      case 'MERGED_CELL':
        return BlockType.mergedCell;
      case 'TITLE':
        return BlockType.title;
      case 'QUERY':
        return BlockType.query;
      case 'QUERY_RESULT':
        return BlockType.queryResult;
      case 'SIGNATURE':
        return BlockType.signature;
      case 'TABLE_TITLE':
        return BlockType.tableTitle;
      case 'TABLE_FOOTER':
        return BlockType.tableFooter;
    }
    throw Exception('$this is not known in enum BlockType');
  }
}

/// The bounding box around the detected page, text, key-value pair, table,
/// table cell, or selection element on a document page. The <code>left</code>
/// (x-coordinate) and <code>top</code> (y-coordinate) are coordinates that
/// represent the top and left sides of the bounding box. Note that the
/// upper-left corner of the image is the origin (0,0).
///
/// The <code>top</code> and <code>left</code> values returned are ratios of the
/// overall document page size. For example, if the input image is 700 x 200
/// pixels, and the top-left coordinate of the bounding box is 350 x 50 pixels,
/// the API returns a <code>left</code> value of 0.5 (350/700) and a
/// <code>top</code> value of 0.25 (50/200).
///
/// The <code>width</code> and <code>height</code> values represent the
/// dimensions of the bounding box as a ratio of the overall document page
/// dimension. For example, if the document page size is 700 x 200 pixels, and
/// the bounding box width is 70 pixels, the width returned is 0.1.
class BoundingBox {
  /// The height of the bounding box as a ratio of the overall document page
  /// height.
  final double? height;

  /// The left coordinate of the bounding box as a ratio of overall document page
  /// width.
  final double? left;

  /// The top coordinate of the bounding box as a ratio of overall document page
  /// height.
  final double? top;

  /// The width of the bounding box as a ratio of the overall document page width.
  final double? width;

  BoundingBox({
    this.height,
    this.left,
    this.top,
    this.width,
  });

  factory BoundingBox.fromJson(Map<String, dynamic> json) {
    return BoundingBox(
      height: json['Height'] as double?,
      left: json['Left'] as double?,
      top: json['Top'] as double?,
      width: json['Width'] as double?,
    );
  }
}

enum ContentClassifier {
  freeOfPersonallyIdentifiableInformation,
  freeOfAdultContent,
}

extension ContentClassifierValueExtension on ContentClassifier {
  String toValue() {
    switch (this) {
      case ContentClassifier.freeOfPersonallyIdentifiableInformation:
        return 'FreeOfPersonallyIdentifiableInformation';
      case ContentClassifier.freeOfAdultContent:
        return 'FreeOfAdultContent';
    }
  }
}

extension ContentClassifierFromString on String {
  ContentClassifier toContentClassifier() {
    switch (this) {
      case 'FreeOfPersonallyIdentifiableInformation':
        return ContentClassifier.freeOfPersonallyIdentifiableInformation;
      case 'FreeOfAdultContent':
        return ContentClassifier.freeOfAdultContent;
    }
    throw Exception('$this is not known in enum ContentClassifier');
  }
}

class DetectDocumentTextResponse {
  /// An array of <code>Block</code> objects that contain the text that's detected
  /// in the document.
  final List<Block>? blocks;

  /// <p/>
  final String? detectDocumentTextModelVersion;

  /// Metadata about the document. It contains the number of pages that are
  /// detected in the document.
  final DocumentMetadata? documentMetadata;

  DetectDocumentTextResponse({
    this.blocks,
    this.detectDocumentTextModelVersion,
    this.documentMetadata,
  });

  factory DetectDocumentTextResponse.fromJson(Map<String, dynamic> json) {
    return DetectDocumentTextResponse(
      blocks: (json['Blocks'] as List?)
          ?.whereNotNull()
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      detectDocumentTextModelVersion:
          json['DetectDocumentTextModelVersion'] as String?,
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// A structure that holds information regarding a detected signature on a page.
class DetectedSignature {
  /// The page a detected signature was found on.
  final int? page;

  DetectedSignature({
    this.page,
  });

  factory DetectedSignature.fromJson(Map<String, dynamic> json) {
    return DetectedSignature(
      page: json['Page'] as int?,
    );
  }
}

/// The input document, either as bytes or as an S3 object.
///
/// You pass image bytes to an Amazon Textract API operation by using the
/// <code>Bytes</code> property. For example, you would use the
/// <code>Bytes</code> property to pass a document loaded from a local file
/// system. Image bytes passed by using the <code>Bytes</code> property must be
/// base64 encoded. Your code might not need to encode document file bytes if
/// you're using an AWS SDK to call Amazon Textract API operations.
///
/// You pass images stored in an S3 bucket to an Amazon Textract API operation
/// by using the <code>S3Object</code> property. Documents stored in an S3
/// bucket don't need to be base64 encoded.
///
/// The AWS Region for the S3 bucket that contains the S3 object must match the
/// AWS Region that you use for Amazon Textract operations.
///
/// If you use the AWS CLI to call Amazon Textract operations, passing image
/// bytes using the Bytes property isn't supported. You must first upload the
/// document to an Amazon S3 bucket, and then call the operation using the
/// S3Object property.
///
/// For Amazon Textract to process an S3 object, the user must have permission
/// to access the S3 object.
class Document {
  /// A blob of base64-encoded document bytes. The maximum size of a document
  /// that's provided in a blob of bytes is 5 MB. The document bytes must be in
  /// PNG or JPEG format.
  ///
  /// If you're using an AWS SDK to call Amazon Textract, you might not need to
  /// base64-encode image bytes passed using the <code>Bytes</code> field.
  final Uint8List? bytes;

  /// Identifies an S3 object as the document source. The maximum size of a
  /// document that's stored in an S3 bucket is 5 MB.
  final S3Object? s3Object;

  Document({
    this.bytes,
    this.s3Object,
  });
  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final s3Object = this.s3Object;
    return {
      if (bytes != null) 'Bytes': base64Encode(bytes),
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// Summary information about documents grouped by the same document type.
class DocumentGroup {
  /// A list of the detected signatures found in a document group.
  final List<DetectedSignature>? detectedSignatures;

  /// An array that contains information about the pages of a document, defined by
  /// logical boundary.
  final List<SplitDocument>? splitDocuments;

  /// The type of document that Amazon Textract has detected. See <a
  /// href="https://docs.aws.amazon.com/textract/latest/dg/lending-response-objects.html">Analyze
  /// Lending Response Objects</a> for a list of all types returned by Textract.
  final String? type;

  /// A list of any expected signatures not found in a document group.
  final List<UndetectedSignature>? undetectedSignatures;

  DocumentGroup({
    this.detectedSignatures,
    this.splitDocuments,
    this.type,
    this.undetectedSignatures,
  });

  factory DocumentGroup.fromJson(Map<String, dynamic> json) {
    return DocumentGroup(
      detectedSignatures: (json['DetectedSignatures'] as List?)
          ?.whereNotNull()
          .map((e) => DetectedSignature.fromJson(e as Map<String, dynamic>))
          .toList(),
      splitDocuments: (json['SplitDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => SplitDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['Type'] as String?,
      undetectedSignatures: (json['UndetectedSignatures'] as List?)
          ?.whereNotNull()
          .map((e) => UndetectedSignature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The Amazon S3 bucket that contains the document to be processed. It's used
/// by asynchronous operations.
///
/// The input document can be an image file in JPEG or PNG format. It can also
/// be a file in PDF format.
class DocumentLocation {
  /// The Amazon S3 bucket that contains the input document.
  final S3Object? s3Object;

  DocumentLocation({
    this.s3Object,
  });
  Map<String, dynamic> toJson() {
    final s3Object = this.s3Object;
    return {
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// Information about the input document.
class DocumentMetadata {
  /// The number of pages that are detected in the document.
  final int? pages;

  DocumentMetadata({
    this.pages,
  });

  factory DocumentMetadata.fromJson(Map<String, dynamic> json) {
    return DocumentMetadata(
      pages: json['Pages'] as int?,
    );
  }
}

enum EntityType {
  key,
  value,
  columnHeader,
  tableTitle,
  tableFooter,
  tableSectionTitle,
  tableSummary,
  structuredTable,
  semiStructuredTable,
}

extension EntityTypeValueExtension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.key:
        return 'KEY';
      case EntityType.value:
        return 'VALUE';
      case EntityType.columnHeader:
        return 'COLUMN_HEADER';
      case EntityType.tableTitle:
        return 'TABLE_TITLE';
      case EntityType.tableFooter:
        return 'TABLE_FOOTER';
      case EntityType.tableSectionTitle:
        return 'TABLE_SECTION_TITLE';
      case EntityType.tableSummary:
        return 'TABLE_SUMMARY';
      case EntityType.structuredTable:
        return 'STRUCTURED_TABLE';
      case EntityType.semiStructuredTable:
        return 'SEMI_STRUCTURED_TABLE';
    }
  }
}

extension EntityTypeFromString on String {
  EntityType toEntityType() {
    switch (this) {
      case 'KEY':
        return EntityType.key;
      case 'VALUE':
        return EntityType.value;
      case 'COLUMN_HEADER':
        return EntityType.columnHeader;
      case 'TABLE_TITLE':
        return EntityType.tableTitle;
      case 'TABLE_FOOTER':
        return EntityType.tableFooter;
      case 'TABLE_SECTION_TITLE':
        return EntityType.tableSectionTitle;
      case 'TABLE_SUMMARY':
        return EntityType.tableSummary;
      case 'STRUCTURED_TABLE':
        return EntityType.structuredTable;
      case 'SEMI_STRUCTURED_TABLE':
        return EntityType.semiStructuredTable;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

/// Returns the kind of currency detected.
class ExpenseCurrency {
  /// Currency code for detected currency. the current supported codes are:
  ///
  /// <ul>
  /// <li>
  /// USD
  /// </li>
  /// <li>
  /// EUR
  /// </li>
  /// <li>
  /// GBP
  /// </li>
  /// <li>
  /// CAD
  /// </li>
  /// <li>
  /// INR
  /// </li>
  /// <li>
  /// JPY
  /// </li>
  /// <li>
  /// CHF
  /// </li>
  /// <li>
  /// AUD
  /// </li>
  /// <li>
  /// CNY
  /// </li>
  /// <li>
  /// BZR
  /// </li>
  /// <li>
  /// SEK
  /// </li>
  /// <li>
  /// HKD
  /// </li>
  /// </ul>
  final String? code;

  /// Percentage confideence in the detected currency.
  final double? confidence;

  ExpenseCurrency({
    this.code,
    this.confidence,
  });

  factory ExpenseCurrency.fromJson(Map<String, dynamic> json) {
    return ExpenseCurrency(
      code: json['Code'] as String?,
      confidence: json['Confidence'] as double?,
    );
  }
}

/// An object used to store information about the Value or Label detected by
/// Amazon Textract.
class ExpenseDetection {
  /// The confidence in detection, as a percentage
  final double? confidence;
  final Geometry? geometry;

  /// The word or line of text recognized by Amazon Textract
  final String? text;

  ExpenseDetection({
    this.confidence,
    this.geometry,
    this.text,
  });

  factory ExpenseDetection.fromJson(Map<String, dynamic> json) {
    return ExpenseDetection(
      confidence: json['Confidence'] as double?,
      geometry: json['Geometry'] != null
          ? Geometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
      text: json['Text'] as String?,
    );
  }
}

/// The structure holding all the information returned by AnalyzeExpense
class ExpenseDocument {
  /// This is a block object, the same as reported when DetectDocumentText is run
  /// on a document. It provides word level recognition of text.
  final List<Block>? blocks;

  /// Denotes which invoice or receipt in the document the information is coming
  /// from. First document will be 1, the second 2, and so on.
  final int? expenseIndex;

  /// Information detected on each table of a document, seperated into
  /// <code>LineItems</code>.
  final List<LineItemGroup>? lineItemGroups;

  /// Any information found outside of a table by Amazon Textract.
  final List<ExpenseField>? summaryFields;

  ExpenseDocument({
    this.blocks,
    this.expenseIndex,
    this.lineItemGroups,
    this.summaryFields,
  });

  factory ExpenseDocument.fromJson(Map<String, dynamic> json) {
    return ExpenseDocument(
      blocks: (json['Blocks'] as List?)
          ?.whereNotNull()
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenseIndex: json['ExpenseIndex'] as int?,
      lineItemGroups: (json['LineItemGroups'] as List?)
          ?.whereNotNull()
          .map((e) => LineItemGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      summaryFields: (json['SummaryFields'] as List?)
          ?.whereNotNull()
          .map((e) => ExpenseField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Breakdown of detected information, seperated into the catagories Type,
/// LabelDetection, and ValueDetection
class ExpenseField {
  /// Shows the kind of currency, both the code and confidence associated with any
  /// monatary value detected.
  final ExpenseCurrency? currency;

  /// Shows which group a response object belongs to, such as whether an address
  /// line belongs to the vendor's address or the recipent's address.
  final List<ExpenseGroupProperty>? groupProperties;

  /// The explicitly stated label of a detected element.
  final ExpenseDetection? labelDetection;

  /// The page number the value was detected on.
  final int? pageNumber;

  /// The implied label of a detected element. Present alongside LabelDetection
  /// for explicit elements.
  final ExpenseType? type;

  /// The value of a detected element. Present in explicit and implicit elements.
  final ExpenseDetection? valueDetection;

  ExpenseField({
    this.currency,
    this.groupProperties,
    this.labelDetection,
    this.pageNumber,
    this.type,
    this.valueDetection,
  });

  factory ExpenseField.fromJson(Map<String, dynamic> json) {
    return ExpenseField(
      currency: json['Currency'] != null
          ? ExpenseCurrency.fromJson(json['Currency'] as Map<String, dynamic>)
          : null,
      groupProperties: (json['GroupProperties'] as List?)
          ?.whereNotNull()
          .map((e) => ExpenseGroupProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      labelDetection: json['LabelDetection'] != null
          ? ExpenseDetection.fromJson(
              json['LabelDetection'] as Map<String, dynamic>)
          : null,
      pageNumber: json['PageNumber'] as int?,
      type: json['Type'] != null
          ? ExpenseType.fromJson(json['Type'] as Map<String, dynamic>)
          : null,
      valueDetection: json['ValueDetection'] != null
          ? ExpenseDetection.fromJson(
              json['ValueDetection'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Shows the group that a certain key belongs to. This helps differentiate
/// between names and addresses for different organizations, that can be hard to
/// determine via JSON response.
class ExpenseGroupProperty {
  /// Provides a group Id number, which will be the same for each in the group.
  final String? id;

  /// Informs you on whether the expense group is a name or an address.
  final List<String>? types;

  ExpenseGroupProperty({
    this.id,
    this.types,
  });

  factory ExpenseGroupProperty.fromJson(Map<String, dynamic> json) {
    return ExpenseGroupProperty(
      id: json['Id'] as String?,
      types: (json['Types'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// An object used to store information about the Type detected by Amazon
/// Textract.
class ExpenseType {
  /// The confidence of accuracy, as a percentage.
  final double? confidence;

  /// The word or line of text detected by Amazon Textract.
  final String? text;

  ExpenseType({
    this.confidence,
    this.text,
  });

  factory ExpenseType.fromJson(Map<String, dynamic> json) {
    return ExpenseType(
      confidence: json['Confidence'] as double?,
      text: json['Text'] as String?,
    );
  }
}

/// Contains information extracted by an analysis operation after using
/// StartLendingAnalysis.
class Extraction {
  final ExpenseDocument? expenseDocument;
  final IdentityDocument? identityDocument;

  /// Holds the structured data returned by AnalyzeDocument for lending documents.
  final LendingDocument? lendingDocument;

  Extraction({
    this.expenseDocument,
    this.identityDocument,
    this.lendingDocument,
  });

  factory Extraction.fromJson(Map<String, dynamic> json) {
    return Extraction(
      expenseDocument: json['ExpenseDocument'] != null
          ? ExpenseDocument.fromJson(
              json['ExpenseDocument'] as Map<String, dynamic>)
          : null,
      identityDocument: json['IdentityDocument'] != null
          ? IdentityDocument.fromJson(
              json['IdentityDocument'] as Map<String, dynamic>)
          : null,
      lendingDocument: json['LendingDocument'] != null
          ? LendingDocument.fromJson(
              json['LendingDocument'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum FeatureType {
  tables,
  forms,
  queries,
  signatures,
}

extension FeatureTypeValueExtension on FeatureType {
  String toValue() {
    switch (this) {
      case FeatureType.tables:
        return 'TABLES';
      case FeatureType.forms:
        return 'FORMS';
      case FeatureType.queries:
        return 'QUERIES';
      case FeatureType.signatures:
        return 'SIGNATURES';
    }
  }
}

extension FeatureTypeFromString on String {
  FeatureType toFeatureType() {
    switch (this) {
      case 'TABLES':
        return FeatureType.tables;
      case 'FORMS':
        return FeatureType.forms;
      case 'QUERIES':
        return FeatureType.queries;
      case 'SIGNATURES':
        return FeatureType.signatures;
    }
    throw Exception('$this is not known in enum FeatureType');
  }
}

/// Information about where the following items are located on a document page:
/// detected page, text, key-value pairs, tables, table cells, and selection
/// elements.
class Geometry {
  /// An axis-aligned coarse representation of the location of the recognized item
  /// on the document page.
  final BoundingBox? boundingBox;

  /// Within the bounding box, a fine-grained polygon around the recognized item.
  final List<Point>? polygon;

  Geometry({
    this.boundingBox,
    this.polygon,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      polygon: (json['Polygon'] as List?)
          ?.whereNotNull()
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetDocumentAnalysisResponse {
  /// <p/>
  final String? analyzeDocumentModelVersion;

  /// The results of the text-analysis operation.
  final List<Block>? blocks;

  /// Information about a document that Amazon Textract processed.
  /// <code>DocumentMetadata</code> is returned in every page of paginated
  /// responses from an Amazon Textract video operation.
  final DocumentMetadata? documentMetadata;

  /// The current status of the text detection job.
  final JobStatus? jobStatus;

  /// If the response is truncated, Amazon Textract returns this token. You can
  /// use this token in the subsequent request to retrieve the next set of text
  /// detection results.
  final String? nextToken;

  /// Returns if the detection job could not be completed. Contains explanation
  /// for what error occured.
  final String? statusMessage;

  /// A list of warnings that occurred during the document-analysis operation.
  final List<Warning>? warnings;

  GetDocumentAnalysisResponse({
    this.analyzeDocumentModelVersion,
    this.blocks,
    this.documentMetadata,
    this.jobStatus,
    this.nextToken,
    this.statusMessage,
    this.warnings,
  });

  factory GetDocumentAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return GetDocumentAnalysisResponse(
      analyzeDocumentModelVersion:
          json['AnalyzeDocumentModelVersion'] as String?,
      blocks: (json['Blocks'] as List?)
          ?.whereNotNull()
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      nextToken: json['NextToken'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      warnings: (json['Warnings'] as List?)
          ?.whereNotNull()
          .map((e) => Warning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetDocumentTextDetectionResponse {
  /// The results of the text-detection operation.
  final List<Block>? blocks;

  /// <p/>
  final String? detectDocumentTextModelVersion;

  /// Information about a document that Amazon Textract processed.
  /// <code>DocumentMetadata</code> is returned in every page of paginated
  /// responses from an Amazon Textract video operation.
  final DocumentMetadata? documentMetadata;

  /// The current status of the text detection job.
  final JobStatus? jobStatus;

  /// If the response is truncated, Amazon Textract returns this token. You can
  /// use this token in the subsequent request to retrieve the next set of
  /// text-detection results.
  final String? nextToken;

  /// Returns if the detection job could not be completed. Contains explanation
  /// for what error occured.
  final String? statusMessage;

  /// A list of warnings that occurred during the text-detection operation for the
  /// document.
  final List<Warning>? warnings;

  GetDocumentTextDetectionResponse({
    this.blocks,
    this.detectDocumentTextModelVersion,
    this.documentMetadata,
    this.jobStatus,
    this.nextToken,
    this.statusMessage,
    this.warnings,
  });

  factory GetDocumentTextDetectionResponse.fromJson(Map<String, dynamic> json) {
    return GetDocumentTextDetectionResponse(
      blocks: (json['Blocks'] as List?)
          ?.whereNotNull()
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      detectDocumentTextModelVersion:
          json['DetectDocumentTextModelVersion'] as String?,
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      nextToken: json['NextToken'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      warnings: (json['Warnings'] as List?)
          ?.whereNotNull()
          .map((e) => Warning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetExpenseAnalysisResponse {
  /// The current model version of AnalyzeExpense.
  final String? analyzeExpenseModelVersion;

  /// Information about a document that Amazon Textract processed.
  /// <code>DocumentMetadata</code> is returned in every page of paginated
  /// responses from an Amazon Textract operation.
  final DocumentMetadata? documentMetadata;

  /// The expenses detected by Amazon Textract.
  final List<ExpenseDocument>? expenseDocuments;

  /// The current status of the text detection job.
  final JobStatus? jobStatus;

  /// If the response is truncated, Amazon Textract returns this token. You can
  /// use this token in the subsequent request to retrieve the next set of
  /// text-detection results.
  final String? nextToken;

  /// Returns if the detection job could not be completed. Contains explanation
  /// for what error occured.
  final String? statusMessage;

  /// A list of warnings that occurred during the text-detection operation for the
  /// document.
  final List<Warning>? warnings;

  GetExpenseAnalysisResponse({
    this.analyzeExpenseModelVersion,
    this.documentMetadata,
    this.expenseDocuments,
    this.jobStatus,
    this.nextToken,
    this.statusMessage,
    this.warnings,
  });

  factory GetExpenseAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return GetExpenseAnalysisResponse(
      analyzeExpenseModelVersion: json['AnalyzeExpenseModelVersion'] as String?,
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      expenseDocuments: (json['ExpenseDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => ExpenseDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      nextToken: json['NextToken'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      warnings: (json['Warnings'] as List?)
          ?.whereNotNull()
          .map((e) => Warning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetLendingAnalysisResponse {
  /// The current model version of the Analyze Lending API.
  final String? analyzeLendingModelVersion;
  final DocumentMetadata? documentMetadata;

  /// The current status of the lending analysis job.
  final JobStatus? jobStatus;

  /// If the response is truncated, Amazon Textract returns this token. You can
  /// use this token in the subsequent request to retrieve the next set of lending
  /// results.
  final String? nextToken;

  /// Holds the information returned by one of AmazonTextract's document analysis
  /// operations for the pinstripe.
  final List<LendingResult>? results;

  /// Returns if the lending analysis job could not be completed. Contains
  /// explanation for what error occurred.
  final String? statusMessage;

  /// A list of warnings that occurred during the lending analysis operation.
  final List<Warning>? warnings;

  GetLendingAnalysisResponse({
    this.analyzeLendingModelVersion,
    this.documentMetadata,
    this.jobStatus,
    this.nextToken,
    this.results,
    this.statusMessage,
    this.warnings,
  });

  factory GetLendingAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return GetLendingAnalysisResponse(
      analyzeLendingModelVersion: json['AnalyzeLendingModelVersion'] as String?,
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      nextToken: json['NextToken'] as String?,
      results: (json['Results'] as List?)
          ?.whereNotNull()
          .map((e) => LendingResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['StatusMessage'] as String?,
      warnings: (json['Warnings'] as List?)
          ?.whereNotNull()
          .map((e) => Warning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetLendingAnalysisSummaryResponse {
  /// The current model version of the Analyze Lending API.
  final String? analyzeLendingModelVersion;
  final DocumentMetadata? documentMetadata;

  /// The current status of the lending analysis job.
  final JobStatus? jobStatus;

  /// Returns if the lending analysis could not be completed. Contains explanation
  /// for what error occurred.
  final String? statusMessage;

  /// Contains summary information for documents grouped by type.
  final LendingSummary? summary;

  /// A list of warnings that occurred during the lending analysis operation.
  final List<Warning>? warnings;

  GetLendingAnalysisSummaryResponse({
    this.analyzeLendingModelVersion,
    this.documentMetadata,
    this.jobStatus,
    this.statusMessage,
    this.summary,
    this.warnings,
  });

  factory GetLendingAnalysisSummaryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetLendingAnalysisSummaryResponse(
      analyzeLendingModelVersion: json['AnalyzeLendingModelVersion'] as String?,
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      statusMessage: json['StatusMessage'] as String?,
      summary: json['Summary'] != null
          ? LendingSummary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
      warnings: (json['Warnings'] as List?)
          ?.whereNotNull()
          .map((e) => Warning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Shows the results of the human in the loop evaluation. If there is no
/// HumanLoopArn, the input did not trigger human review.
class HumanLoopActivationOutput {
  /// Shows the result of condition evaluations, including those conditions which
  /// activated a human review.
  final Object? humanLoopActivationConditionsEvaluationResults;

  /// Shows if and why human review was needed.
  final List<String>? humanLoopActivationReasons;

  /// The Amazon Resource Name (ARN) of the HumanLoop created.
  final String? humanLoopArn;

  HumanLoopActivationOutput({
    this.humanLoopActivationConditionsEvaluationResults,
    this.humanLoopActivationReasons,
    this.humanLoopArn,
  });

  factory HumanLoopActivationOutput.fromJson(Map<String, dynamic> json) {
    return HumanLoopActivationOutput(
      humanLoopActivationConditionsEvaluationResults:
          json['HumanLoopActivationConditionsEvaluationResults'] == null
              ? null
              : jsonDecode(
                  json['HumanLoopActivationConditionsEvaluationResults']
                      as String),
      humanLoopActivationReasons: (json['HumanLoopActivationReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      humanLoopArn: json['HumanLoopArn'] as String?,
    );
  }
}

/// Sets up the human review workflow the document will be sent to if one of the
/// conditions is met. You can also set certain attributes of the image before
/// review.
class HumanLoopConfig {
  /// The Amazon Resource Name (ARN) of the flow definition.
  final String flowDefinitionArn;

  /// The name of the human workflow used for this image. This should be kept
  /// unique within a region.
  final String humanLoopName;

  /// Sets attributes of the input data.
  final HumanLoopDataAttributes? dataAttributes;

  HumanLoopConfig({
    required this.flowDefinitionArn,
    required this.humanLoopName,
    this.dataAttributes,
  });
  Map<String, dynamic> toJson() {
    final flowDefinitionArn = this.flowDefinitionArn;
    final humanLoopName = this.humanLoopName;
    final dataAttributes = this.dataAttributes;
    return {
      'FlowDefinitionArn': flowDefinitionArn,
      'HumanLoopName': humanLoopName,
      if (dataAttributes != null) 'DataAttributes': dataAttributes,
    };
  }
}

/// Allows you to set attributes of the image. Currently, you can declare an
/// image as free of personally identifiable information and adult content.
class HumanLoopDataAttributes {
  /// Sets whether the input image is free of personally identifiable information
  /// or adult content.
  final List<ContentClassifier>? contentClassifiers;

  HumanLoopDataAttributes({
    this.contentClassifiers,
  });
  Map<String, dynamic> toJson() {
    final contentClassifiers = this.contentClassifiers;
    return {
      if (contentClassifiers != null)
        'ContentClassifiers':
            contentClassifiers.map((e) => e.toValue()).toList(),
    };
  }
}

/// The structure that lists each document processed in an AnalyzeID operation.
class IdentityDocument {
  /// Individual word recognition, as returned by document detection.
  final List<Block>? blocks;

  /// Denotes the placement of a document in the IdentityDocument list. The first
  /// document is marked 1, the second 2 and so on.
  final int? documentIndex;

  /// The structure used to record information extracted from identity documents.
  /// Contains both normalized field and value of the extracted text.
  final List<IdentityDocumentField>? identityDocumentFields;

  IdentityDocument({
    this.blocks,
    this.documentIndex,
    this.identityDocumentFields,
  });

  factory IdentityDocument.fromJson(Map<String, dynamic> json) {
    return IdentityDocument(
      blocks: (json['Blocks'] as List?)
          ?.whereNotNull()
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentIndex: json['DocumentIndex'] as int?,
      identityDocumentFields: (json['IdentityDocumentFields'] as List?)
          ?.whereNotNull()
          .map((e) => IdentityDocumentField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Structure containing both the normalized type of the extracted information
/// and the text associated with it. These are extracted as Type and Value
/// respectively.
class IdentityDocumentField {
  final AnalyzeIDDetections? type;
  final AnalyzeIDDetections? valueDetection;

  IdentityDocumentField({
    this.type,
    this.valueDetection,
  });

  factory IdentityDocumentField.fromJson(Map<String, dynamic> json) {
    return IdentityDocumentField(
      type: json['Type'] != null
          ? AnalyzeIDDetections.fromJson(json['Type'] as Map<String, dynamic>)
          : null,
      valueDetection: json['ValueDetection'] != null
          ? AnalyzeIDDetections.fromJson(
              json['ValueDetection'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum JobStatus {
  inProgress,
  succeeded,
  failed,
  partialSuccess,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.succeeded:
        return 'SUCCEEDED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.partialSuccess:
        return 'PARTIAL_SUCCESS';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return JobStatus.inProgress;
      case 'SUCCEEDED':
        return JobStatus.succeeded;
      case 'FAILED':
        return JobStatus.failed;
      case 'PARTIAL_SUCCESS':
        return JobStatus.partialSuccess;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// The results extracted for a lending document.
class LendingDetection {
  /// The confidence level for the text of a detected value in a lending document.
  final double? confidence;
  final Geometry? geometry;

  /// The selection status of a selection element, such as an option button or
  /// check box.
  final SelectionStatus? selectionStatus;

  /// The text extracted for a detected value in a lending document.
  final String? text;

  LendingDetection({
    this.confidence,
    this.geometry,
    this.selectionStatus,
    this.text,
  });

  factory LendingDetection.fromJson(Map<String, dynamic> json) {
    return LendingDetection(
      confidence: json['Confidence'] as double?,
      geometry: json['Geometry'] != null
          ? Geometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
      selectionStatus:
          (json['SelectionStatus'] as String?)?.toSelectionStatus(),
      text: json['Text'] as String?,
    );
  }
}

/// Holds the structured data returned by AnalyzeDocument for lending documents.
class LendingDocument {
  /// An array of LendingField objects.
  final List<LendingField>? lendingFields;

  /// A list of signatures detected in a lending document.
  final List<SignatureDetection>? signatureDetections;

  LendingDocument({
    this.lendingFields,
    this.signatureDetections,
  });

  factory LendingDocument.fromJson(Map<String, dynamic> json) {
    return LendingDocument(
      lendingFields: (json['LendingFields'] as List?)
          ?.whereNotNull()
          .map((e) => LendingField.fromJson(e as Map<String, dynamic>))
          .toList(),
      signatureDetections: (json['SignatureDetections'] as List?)
          ?.whereNotNull()
          .map((e) => SignatureDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Holds the normalized key-value pairs returned by AnalyzeDocument, including
/// the document type, detected text, and geometry.
class LendingField {
  final LendingDetection? keyDetection;

  /// The type of the lending document.
  final String? type;

  /// An array of LendingDetection objects.
  final List<LendingDetection>? valueDetections;

  LendingField({
    this.keyDetection,
    this.type,
    this.valueDetections,
  });

  factory LendingField.fromJson(Map<String, dynamic> json) {
    return LendingField(
      keyDetection: json['KeyDetection'] != null
          ? LendingDetection.fromJson(
              json['KeyDetection'] as Map<String, dynamic>)
          : null,
      type: json['Type'] as String?,
      valueDetections: (json['ValueDetections'] as List?)
          ?.whereNotNull()
          .map((e) => LendingDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains the detections for each page analyzed through the Analyze Lending
/// API.
class LendingResult {
  /// An array of Extraction to hold structured data. e.g. normalized key value
  /// pairs instead of raw OCR detections .
  final List<Extraction>? extractions;

  /// The page number for a page, with regard to whole submission.
  final int? page;

  /// The classifier result for a given page.
  final PageClassification? pageClassification;

  LendingResult({
    this.extractions,
    this.page,
    this.pageClassification,
  });

  factory LendingResult.fromJson(Map<String, dynamic> json) {
    return LendingResult(
      extractions: (json['Extractions'] as List?)
          ?.whereNotNull()
          .map((e) => Extraction.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['Page'] as int?,
      pageClassification: json['PageClassification'] != null
          ? PageClassification.fromJson(
              json['PageClassification'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information regarding DocumentGroups and UndetectedDocumentTypes.
class LendingSummary {
  /// Contains an array of all DocumentGroup objects.
  final List<DocumentGroup>? documentGroups;

  /// UndetectedDocumentTypes.
  final List<String>? undetectedDocumentTypes;

  LendingSummary({
    this.documentGroups,
    this.undetectedDocumentTypes,
  });

  factory LendingSummary.fromJson(Map<String, dynamic> json) {
    return LendingSummary(
      documentGroups: (json['DocumentGroups'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      undetectedDocumentTypes: (json['UndetectedDocumentTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// A structure that holds information about the different lines found in a
/// document's tables.
class LineItemFields {
  /// ExpenseFields used to show information from detected lines on a table.
  final List<ExpenseField>? lineItemExpenseFields;

  LineItemFields({
    this.lineItemExpenseFields,
  });

  factory LineItemFields.fromJson(Map<String, dynamic> json) {
    return LineItemFields(
      lineItemExpenseFields: (json['LineItemExpenseFields'] as List?)
          ?.whereNotNull()
          .map((e) => ExpenseField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// A grouping of tables which contain LineItems, with each table identified by
/// the table's <code>LineItemGroupIndex</code>.
class LineItemGroup {
  /// The number used to identify a specific table in a document. The first table
  /// encountered will have a LineItemGroupIndex of 1, the second 2, etc.
  final int? lineItemGroupIndex;

  /// The breakdown of information on a particular line of a table.
  final List<LineItemFields>? lineItems;

  LineItemGroup({
    this.lineItemGroupIndex,
    this.lineItems,
  });

  factory LineItemGroup.fromJson(Map<String, dynamic> json) {
    return LineItemGroup(
      lineItemGroupIndex: json['LineItemGroupIndex'] as int?,
      lineItems: (json['LineItems'] as List?)
          ?.whereNotNull()
          .map((e) => LineItemFields.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information relating to dates in a document, including the type of
/// value, and the value.
class NormalizedValue {
  /// The value of the date, written as Year-Month-DayTHour:Minute:Second.
  final String? value;

  /// The normalized type of the value detected. In this case, DATE.
  final ValueType? valueType;

  NormalizedValue({
    this.value,
    this.valueType,
  });

  factory NormalizedValue.fromJson(Map<String, dynamic> json) {
    return NormalizedValue(
      value: json['Value'] as String?,
      valueType: (json['ValueType'] as String?)?.toValueType(),
    );
  }
}

/// The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon
/// Textract publishes the completion status of an asynchronous document
/// operation.
class NotificationChannel {
  /// The Amazon Resource Name (ARN) of an IAM role that gives Amazon Textract
  /// publishing permissions to the Amazon SNS topic.
  final String roleArn;

  /// The Amazon SNS topic that Amazon Textract posts the completion status to.
  final String sNSTopicArn;

  NotificationChannel({
    required this.roleArn,
    required this.sNSTopicArn,
  });
  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final sNSTopicArn = this.sNSTopicArn;
    return {
      'RoleArn': roleArn,
      'SNSTopicArn': sNSTopicArn,
    };
  }
}

/// Sets whether or not your output will go to a user created bucket. Used to
/// set the name of the bucket, and the prefix on the output file.
///
/// <code>OutputConfig</code> is an optional parameter which lets you adjust
/// where your output will be placed. By default, Amazon Textract will store the
/// results internally and can only be accessed by the Get API operations. With
/// <code>OutputConfig</code> enabled, you can set the name of the bucket the
/// output will be sent to the file prefix of the results where you can download
/// your results. Additionally, you can set the <code>KMSKeyID</code> parameter
/// to a customer master key (CMK) to encrypt your output. Without this
/// parameter set Amazon Textract will encrypt server-side using the AWS managed
/// CMK for Amazon S3.
///
/// Decryption of Customer Content is necessary for processing of the documents
/// by Amazon Textract. If your account is opted out under an AI services opt
/// out policy then all unencrypted Customer Content is immediately and
/// permanently deleted after the Customer Content has been processed by the
/// service. No copy of of the output is retained by Amazon Textract. For
/// information about how to opt out, see <a
/// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html">
/// Managing AI services opt-out policy. </a>
///
/// For more information on data privacy, see the <a
/// href="https://aws.amazon.com/compliance/data-privacy-faq/">Data Privacy
/// FAQ</a>.
class OutputConfig {
  /// The name of the bucket your output will go to.
  final String s3Bucket;

  /// The prefix of the object key that the output will be saved to. When not
  /// enabled, the prefix will be “textract_output".
  final String? s3Prefix;

  OutputConfig({
    required this.s3Bucket,
    this.s3Prefix,
  });
  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Prefix = this.s3Prefix;
    return {
      'S3Bucket': s3Bucket,
      if (s3Prefix != null) 'S3Prefix': s3Prefix,
    };
  }
}

/// The class assigned to a Page object detected in an input document. Contains
/// information regarding the predicted type/class of a document's page and the
/// page number that the Page object was detected on.
class PageClassification {
  /// The page number the value was detected on, relative to Amazon Textract's
  /// starting position.
  final List<Prediction> pageNumber;

  /// The class, or document type, assigned to a detected Page object. The class,
  /// or document type, assigned to a detected Page object.
  final List<Prediction> pageType;

  PageClassification({
    required this.pageNumber,
    required this.pageType,
  });

  factory PageClassification.fromJson(Map<String, dynamic> json) {
    return PageClassification(
      pageNumber: (json['PageNumber'] as List)
          .whereNotNull()
          .map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageType: (json['PageType'] as List)
          .whereNotNull()
          .map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The X and Y coordinates of a point on a document page. The X and Y values
/// that are returned are ratios of the overall document page size. For example,
/// if the input document is 700 x 200 and the operation returns X=0.5 and
/// Y=0.25, then the point is at the (350,50) pixel coordinate on the document
/// page.
///
/// An array of <code>Point</code> objects, <code>Polygon</code>, is returned by
/// <a>DetectDocumentText</a>. <code>Polygon</code> represents a fine-grained
/// polygon around detected text. For more information, see Geometry in the
/// Amazon Textract Developer Guide.
class Point {
  /// The value of the X coordinate for a point on a <code>Polygon</code>.
  final double? x;

  /// The value of the Y coordinate for a point on a <code>Polygon</code>.
  final double? y;

  Point({
    this.x,
    this.y,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      x: json['X'] as double?,
      y: json['Y'] as double?,
    );
  }
}

/// Contains information regarding predicted values returned by Amazon Textract
/// operations, including the predicted value and the confidence in the
/// predicted value.
class Prediction {
  /// Amazon Textract's confidence in its predicted value.
  final double? confidence;

  /// The predicted value of a detected object.
  final String? value;

  Prediction({
    this.confidence,
    this.value,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as String?,
    );
  }
}

/// <p/>
class QueriesConfig {
  /// <p/>
  final List<Query> queries;

  QueriesConfig({
    required this.queries,
  });
  Map<String, dynamic> toJson() {
    final queries = this.queries;
    return {
      'Queries': queries,
    };
  }
}

/// Each query contains the question you want to ask in the Text and the alias
/// you want to associate.
class Query {
  /// Question that Amazon Textract will apply to the document. An example would
  /// be "What is the customer's SSN?"
  final String text;

  /// Alias attached to the query, for ease of location.
  final String? alias;

  /// Pages is a parameter that the user inputs to specify which pages to apply a
  /// query to. The following is a list of rules for using this parameter.
  ///
  /// <ul>
  /// <li>
  /// If a page is not specified, it is set to <code>["1"]</code> by default.
  /// </li>
  /// <li>
  /// The following characters are allowed in the parameter's string: <code>0 1 2
  /// 3 4 5 6 7 8 9 - *</code>. No whitespace is allowed.
  /// </li>
  /// <li>
  /// When using * to indicate all pages, it must be the only element in the list.
  /// </li>
  /// <li>
  /// You can use page intervals, such as <code>[“1-3”, “1-1”, “4-*”]</code>.
  /// Where <code>*</code> indicates last page of document.
  /// </li>
  /// <li>
  /// Specified pages must be greater than 0 and less than or equal to the number
  /// of pages in the document.
  /// </li>
  /// </ul>
  final List<String>? pages;

  Query({
    required this.text,
    this.alias,
    this.pages,
  });

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      text: json['Text'] as String,
      alias: json['Alias'] as String?,
      pages: (json['Pages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final alias = this.alias;
    final pages = this.pages;
    return {
      'Text': text,
      if (alias != null) 'Alias': alias,
      if (pages != null) 'Pages': pages,
    };
  }
}

/// Information about how blocks are related to each other. A <code>Block</code>
/// object contains 0 or more <code>Relation</code> objects in a list,
/// <code>Relationships</code>. For more information, see <a>Block</a>.
///
/// The <code>Type</code> element provides the type of the relationship for all
/// blocks in the <code>IDs</code> array.
class Relationship {
  /// An array of IDs for related blocks. You can get the type of the relationship
  /// from the <code>Type</code> element.
  final List<String>? ids;

  /// The type of relationship between the blocks in the IDs array and the current
  /// block. The following list describes the relationship types that can be
  /// returned.
  ///
  /// <ul>
  /// <li>
  /// <i>VALUE</i> - A list that contains the ID of the VALUE block that's
  /// associated with the KEY of a key-value pair.
  /// </li>
  /// <li>
  /// <i>CHILD</i> - A list of IDs that identify blocks found within the current
  /// block object. For example, WORD blocks have a CHILD relationship to the LINE
  /// block type.
  /// </li>
  /// <li>
  /// <i>MERGED_CELL</i> - A list of IDs that identify each of the MERGED_CELL
  /// block types in a table.
  /// </li>
  /// <li>
  /// <i>ANSWER</i> - A list that contains the ID of the QUERY_RESULT block that’s
  /// associated with the corresponding QUERY block.
  /// </li>
  /// <li>
  /// <i>TABLE</i> - A list of IDs that identify associated TABLE block types.
  /// </li>
  /// <li>
  /// <i>TABLE_TITLE</i> - A list that contains the ID for the TABLE_TITLE block
  /// type in a table.
  /// </li>
  /// <li>
  /// <i>TABLE_FOOTER</i> - A list of IDs that identify the TABLE_FOOTER block
  /// types in a table.
  /// </li>
  /// </ul>
  final RelationshipType? type;

  Relationship({
    this.ids,
    this.type,
  });

  factory Relationship.fromJson(Map<String, dynamic> json) {
    return Relationship(
      ids: (json['Ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['Type'] as String?)?.toRelationshipType(),
    );
  }
}

enum RelationshipType {
  value,
  child,
  complexFeatures,
  mergedCell,
  title,
  answer,
  table,
  tableTitle,
  tableFooter,
}

extension RelationshipTypeValueExtension on RelationshipType {
  String toValue() {
    switch (this) {
      case RelationshipType.value:
        return 'VALUE';
      case RelationshipType.child:
        return 'CHILD';
      case RelationshipType.complexFeatures:
        return 'COMPLEX_FEATURES';
      case RelationshipType.mergedCell:
        return 'MERGED_CELL';
      case RelationshipType.title:
        return 'TITLE';
      case RelationshipType.answer:
        return 'ANSWER';
      case RelationshipType.table:
        return 'TABLE';
      case RelationshipType.tableTitle:
        return 'TABLE_TITLE';
      case RelationshipType.tableFooter:
        return 'TABLE_FOOTER';
    }
  }
}

extension RelationshipTypeFromString on String {
  RelationshipType toRelationshipType() {
    switch (this) {
      case 'VALUE':
        return RelationshipType.value;
      case 'CHILD':
        return RelationshipType.child;
      case 'COMPLEX_FEATURES':
        return RelationshipType.complexFeatures;
      case 'MERGED_CELL':
        return RelationshipType.mergedCell;
      case 'TITLE':
        return RelationshipType.title;
      case 'ANSWER':
        return RelationshipType.answer;
      case 'TABLE':
        return RelationshipType.table;
      case 'TABLE_TITLE':
        return RelationshipType.tableTitle;
      case 'TABLE_FOOTER':
        return RelationshipType.tableFooter;
    }
    throw Exception('$this is not known in enum RelationshipType');
  }
}

/// The S3 bucket name and file name that identifies the document.
///
/// The AWS Region for the S3 bucket that contains the document must match the
/// Region that you use for Amazon Textract operations.
///
/// For Amazon Textract to process a file in an S3 bucket, the user must have
/// permission to access the S3 bucket and file.
class S3Object {
  /// The name of the S3 bucket. Note that the # character is not valid in the
  /// file name.
  final String? bucket;

  /// The file name of the input document. Synchronous operations can use image
  /// files that are in JPEG or PNG format. Asynchronous operations also support
  /// PDF and TIFF format files.
  final String? name;

  /// If the bucket has versioning enabled, you can specify the object version.
  final String? version;

  S3Object({
    this.bucket,
    this.name,
    this.version,
  });
  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final name = this.name;
    final version = this.version;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

enum SelectionStatus {
  selected,
  notSelected,
}

extension SelectionStatusValueExtension on SelectionStatus {
  String toValue() {
    switch (this) {
      case SelectionStatus.selected:
        return 'SELECTED';
      case SelectionStatus.notSelected:
        return 'NOT_SELECTED';
    }
  }
}

extension SelectionStatusFromString on String {
  SelectionStatus toSelectionStatus() {
    switch (this) {
      case 'SELECTED':
        return SelectionStatus.selected;
      case 'NOT_SELECTED':
        return SelectionStatus.notSelected;
    }
    throw Exception('$this is not known in enum SelectionStatus');
  }
}

/// Information regarding a detected signature on a page.
class SignatureDetection {
  /// The confidence, from 0 to 100, in the predicted values for a detected
  /// signature.
  final double? confidence;
  final Geometry? geometry;

  SignatureDetection({
    this.confidence,
    this.geometry,
  });

  factory SignatureDetection.fromJson(Map<String, dynamic> json) {
    return SignatureDetection(
      confidence: json['Confidence'] as double?,
      geometry: json['Geometry'] != null
          ? Geometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about the pages of a document, defined by logical
/// boundary.
class SplitDocument {
  /// The index for a given document in a DocumentGroup of a specific Type.
  final int? index;

  /// An array of page numbers for a for a given document, ordered by logical
  /// boundary.
  final List<int>? pages;

  SplitDocument({
    this.index,
    this.pages,
  });

  factory SplitDocument.fromJson(Map<String, dynamic> json) {
    return SplitDocument(
      index: json['Index'] as int?,
      pages: (json['Pages'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }
}

class StartDocumentAnalysisResponse {
  /// The identifier for the document text detection job. Use <code>JobId</code>
  /// to identify the job in a subsequent call to
  /// <code>GetDocumentAnalysis</code>. A <code>JobId</code> value is only valid
  /// for 7 days.
  final String? jobId;

  StartDocumentAnalysisResponse({
    this.jobId,
  });

  factory StartDocumentAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return StartDocumentAnalysisResponse(
      jobId: json['JobId'] as String?,
    );
  }
}

class StartDocumentTextDetectionResponse {
  /// The identifier of the text detection job for the document. Use
  /// <code>JobId</code> to identify the job in a subsequent call to
  /// <code>GetDocumentTextDetection</code>. A <code>JobId</code> value is only
  /// valid for 7 days.
  final String? jobId;

  StartDocumentTextDetectionResponse({
    this.jobId,
  });

  factory StartDocumentTextDetectionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDocumentTextDetectionResponse(
      jobId: json['JobId'] as String?,
    );
  }
}

class StartExpenseAnalysisResponse {
  /// A unique identifier for the text detection job. The <code>JobId</code> is
  /// returned from <code>StartExpenseAnalysis</code>. A <code>JobId</code> value
  /// is only valid for 7 days.
  final String? jobId;

  StartExpenseAnalysisResponse({
    this.jobId,
  });

  factory StartExpenseAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return StartExpenseAnalysisResponse(
      jobId: json['JobId'] as String?,
    );
  }
}

class StartLendingAnalysisResponse {
  /// A unique identifier for the lending or text-detection job. The
  /// <code>JobId</code> is returned from <code>StartLendingAnalysis</code>. A
  /// <code>JobId</code> value is only valid for 7 days.
  final String? jobId;

  StartLendingAnalysisResponse({
    this.jobId,
  });

  factory StartLendingAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return StartLendingAnalysisResponse(
      jobId: json['JobId'] as String?,
    );
  }
}

enum TextType {
  handwriting,
  printed,
}

extension TextTypeValueExtension on TextType {
  String toValue() {
    switch (this) {
      case TextType.handwriting:
        return 'HANDWRITING';
      case TextType.printed:
        return 'PRINTED';
    }
  }
}

extension TextTypeFromString on String {
  TextType toTextType() {
    switch (this) {
      case 'HANDWRITING':
        return TextType.handwriting;
      case 'PRINTED':
        return TextType.printed;
    }
    throw Exception('$this is not known in enum TextType');
  }
}

/// A structure containing information about an undetected signature on a page
/// where it was expected but not found.
class UndetectedSignature {
  /// The page where a signature was expected but not found.
  final int? page;

  UndetectedSignature({
    this.page,
  });

  factory UndetectedSignature.fromJson(Map<String, dynamic> json) {
    return UndetectedSignature(
      page: json['Page'] as int?,
    );
  }
}

enum ValueType {
  date,
}

extension ValueTypeValueExtension on ValueType {
  String toValue() {
    switch (this) {
      case ValueType.date:
        return 'DATE';
    }
  }
}

extension ValueTypeFromString on String {
  ValueType toValueType() {
    switch (this) {
      case 'DATE':
        return ValueType.date;
    }
    throw Exception('$this is not known in enum ValueType');
  }
}

/// A warning about an issue that occurred during asynchronous text analysis
/// (<a>StartDocumentAnalysis</a>) or asynchronous document text detection
/// (<a>StartDocumentTextDetection</a>).
class Warning {
  /// The error code for the warning.
  final String? errorCode;

  /// A list of the pages that the warning applies to.
  final List<int>? pages;

  Warning({
    this.errorCode,
    this.pages,
  });

  factory Warning.fromJson(Map<String, dynamic> json) {
    return Warning(
      errorCode: json['ErrorCode'] as String?,
      pages: (json['Pages'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadDocumentException extends _s.GenericAwsException {
  BadDocumentException({String? type, String? message})
      : super(type: type, code: 'BadDocumentException', message: message);
}

class DocumentTooLargeException extends _s.GenericAwsException {
  DocumentTooLargeException({String? type, String? message})
      : super(type: type, code: 'DocumentTooLargeException', message: message);
}

class HumanLoopQuotaExceededException extends _s.GenericAwsException {
  HumanLoopQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'HumanLoopQuotaExceededException',
            message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidJobIdException extends _s.GenericAwsException {
  InvalidJobIdException({String? type, String? message})
      : super(type: type, code: 'InvalidJobIdException', message: message);
}

class InvalidKMSKeyException extends _s.GenericAwsException {
  InvalidKMSKeyException({String? type, String? message})
      : super(type: type, code: 'InvalidKMSKeyException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidS3ObjectException extends _s.GenericAwsException {
  InvalidS3ObjectException({String? type, String? message})
      : super(type: type, code: 'InvalidS3ObjectException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ProvisionedThroughputExceededException extends _s.GenericAwsException {
  ProvisionedThroughputExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedThroughputExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedDocumentException extends _s.GenericAwsException {
  UnsupportedDocumentException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedDocumentException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadDocumentException': (type, message) =>
      BadDocumentException(type: type, message: message),
  'DocumentTooLargeException': (type, message) =>
      DocumentTooLargeException(type: type, message: message),
  'HumanLoopQuotaExceededException': (type, message) =>
      HumanLoopQuotaExceededException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidJobIdException': (type, message) =>
      InvalidJobIdException(type: type, message: message),
  'InvalidKMSKeyException': (type, message) =>
      InvalidKMSKeyException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidS3ObjectException': (type, message) =>
      InvalidS3ObjectException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ProvisionedThroughputExceededException': (type, message) =>
      ProvisionedThroughputExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnsupportedDocumentException': (type, message) =>
      UnsupportedDocumentException(type: type, message: message),
};
