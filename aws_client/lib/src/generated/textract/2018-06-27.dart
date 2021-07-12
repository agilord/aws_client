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

/// Amazon Textract detects and analyzes text in documents and converts it into
/// machine-readable text. This is the API reference documentation for Amazon
/// Textract.
class Textract {
  final _s.JsonProtocol _protocol;
  Textract({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'textract',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// bytes. The document must be an image in JPEG or PNG format.
  ///
  /// If you're using an AWS SDK to call Amazon Textract, you might not need to
  /// base64-encode image bytes that are passed using the <code>Bytes</code>
  /// field.
  ///
  /// Parameter [featureTypes] :
  /// A list of the types of analysis to perform. Add TABLES to the list to
  /// return information about the tables that are detected in the input
  /// document. Add FORMS to return detected form data. To perform both types of
  /// analysis, add TABLES and FORMS to <code>FeatureTypes</code>. All lines and
  /// words detected in the document are included in the response (including
  /// text that isn't related to the value of <code>FeatureTypes</code>).
  ///
  /// Parameter [humanLoopConfig] :
  /// Sets the configuration for the human in the loop workflow for analyzing
  /// documents.
  Future<AnalyzeDocumentResponse> analyzeDocument({
    required Document document,
    required List<FeatureType> featureTypes,
    HumanLoopConfig? humanLoopConfig,
  }) async {
    ArgumentError.checkNotNull(document, 'document');
    ArgumentError.checkNotNull(featureTypes, 'featureTypes');
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
      },
    );

    return AnalyzeDocumentResponse.fromJson(jsonResponse.body);
  }

  /// Detects text in the input document. Amazon Textract can detect lines of
  /// text and the words that make up a line of text. The input document must be
  /// an image in JPEG or PNG format. <code>DetectDocumentText</code> returns
  /// the detected text in an array of <a>Block</a> objects.
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
    ArgumentError.checkNotNull(document, 'document');
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
  /// </ul>
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
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      255,
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
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      255,
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

  /// Starts the asynchronous analysis of an input document for relationships
  /// between detected items such as key-value pairs, tables, and selection
  /// elements.
  ///
  /// <code>StartDocumentAnalysis</code> can analyze text in documents that are
  /// in JPEG, PNG, and PDF format. The documents are stored in an Amazon S3
  /// bucket. Use <a>DocumentLocation</a> to specify the bucket name and file
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
  }) async {
    ArgumentError.checkNotNull(documentLocation, 'documentLocation');
    ArgumentError.checkNotNull(featureTypes, 'featureTypes');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      64,
    );
    _s.validateStringLength(
      'kMSKeyId',
      kMSKeyId,
      1,
      2048,
    );
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
      },
    );

    return StartDocumentAnalysisResponse.fromJson(jsonResponse.body);
  }

  /// Starts the asynchronous detection of text in a document. Amazon Textract
  /// can detect lines of text and the words that make up a line of text.
  ///
  /// <code>StartDocumentTextDetection</code> can analyze text in documents that
  /// are in JPEG, PNG, and PDF format. The documents are stored in an Amazon S3
  /// bucket. Use <a>DocumentLocation</a> to specify the bucket name and file
  /// name of the document.
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
    ArgumentError.checkNotNull(documentLocation, 'documentLocation');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      64,
    );
    _s.validateStringLength(
      'kMSKeyId',
      kMSKeyId,
      1,
      2048,
    );
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

  Map<String, dynamic> toJson() {
    final analyzeDocumentModelVersion = this.analyzeDocumentModelVersion;
    final blocks = this.blocks;
    final documentMetadata = this.documentMetadata;
    final humanLoopActivationOutput = this.humanLoopActivationOutput;
    return {
      if (analyzeDocumentModelVersion != null)
        'AnalyzeDocumentModelVersion': analyzeDocumentModelVersion,
      if (blocks != null) 'Blocks': blocks,
      if (documentMetadata != null) 'DocumentMetadata': documentMetadata,
      if (humanLoopActivationOutput != null)
        'HumanLoopActivationOutput': humanLoopActivationOutput,
    };
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
  /// <i>CELL</i> - A cell within a detected table. The cell is the parent of the
  /// block that contains the text in the cell.
  /// </li>
  /// <li>
  /// <i>SELECTION_ELEMENT</i> - A selection element such as an option button
  /// (radio button) or a check box that's detected on a document page. Use the
  /// value of <code>SelectionStatus</code> to determine the status of the
  /// selection element.
  /// </li>
  /// </ul>
  final BlockType? blockType;

  /// The column in which a table cell appears. The first column position is 1.
  /// <code>ColumnIndex</code> isn't returned by <code>DetectDocumentText</code>
  /// and <code>GetDocumentTextDetection</code>.
  final int? columnIndex;

  /// The number of columns that a table cell spans. Currently this value is
  /// always 1, even if the number of columns spanned is greater than 1.
  /// <code>ColumnSpan</code> isn't returned by <code>DetectDocumentText</code>
  /// and <code>GetDocumentTextDetection</code>.
  final int? columnSpan;

  /// The confidence score that Amazon Textract has in the accuracy of the
  /// recognized text and the accuracy of the geometry points around the
  /// recognized text.
  final double? confidence;

  /// The type of entity. The following can be returned:
  ///
  /// <ul>
  /// <li>
  /// <i>KEY</i> - An identifier for a field on the document.
  /// </li>
  /// <li>
  /// <i>VALUE</i> - The field text.
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
  /// asynchronous operations. Page values greater than 1 are only returned for
  /// multipage documents that are in PDF format. A scanned image (JPEG/PNG), even
  /// if it contains multiple document pages, is considered to be a single-page
  /// document. The value of <code>Page</code> is always 1. Synchronous operations
  /// don't return <code>Page</code> because every input document is considered to
  /// be a single-page document.
  final int? page;

  /// A list of child blocks of the current block. For example, a LINE object has
  /// child blocks for each WORD block that's part of the line of text. There
  /// aren't Relationship objects in the list for relationships that don't exist,
  /// such as when the current block has no child blocks. The list size can be the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// 0 - The block has no child blocks.
  /// </li>
  /// <li>
  /// 1 - The block has child blocks.
  /// </li>
  /// </ul>
  final List<Relationship>? relationships;

  /// The row in which a table cell is located. The first row position is 1.
  /// <code>RowIndex</code> isn't returned by <code>DetectDocumentText</code> and
  /// <code>GetDocumentTextDetection</code>.
  final int? rowIndex;

  /// The number of rows that a table cell spans. Currently this value is always
  /// 1, even if the number of rows spanned is greater than 1.
  /// <code>RowSpan</code> isn't returned by <code>DetectDocumentText</code> and
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

  Map<String, dynamic> toJson() {
    final blockType = this.blockType;
    final columnIndex = this.columnIndex;
    final columnSpan = this.columnSpan;
    final confidence = this.confidence;
    final entityTypes = this.entityTypes;
    final geometry = this.geometry;
    final id = this.id;
    final page = this.page;
    final relationships = this.relationships;
    final rowIndex = this.rowIndex;
    final rowSpan = this.rowSpan;
    final selectionStatus = this.selectionStatus;
    final text = this.text;
    final textType = this.textType;
    return {
      if (blockType != null) 'BlockType': blockType.toValue(),
      if (columnIndex != null) 'ColumnIndex': columnIndex,
      if (columnSpan != null) 'ColumnSpan': columnSpan,
      if (confidence != null) 'Confidence': confidence,
      if (entityTypes != null)
        'EntityTypes': entityTypes.map((e) => e.toValue()).toList(),
      if (geometry != null) 'Geometry': geometry,
      if (id != null) 'Id': id,
      if (page != null) 'Page': page,
      if (relationships != null) 'Relationships': relationships,
      if (rowIndex != null) 'RowIndex': rowIndex,
      if (rowSpan != null) 'RowSpan': rowSpan,
      if (selectionStatus != null) 'SelectionStatus': selectionStatus.toValue(),
      if (text != null) 'Text': text,
      if (textType != null) 'TextType': textType.toValue(),
    };
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
}

extension on BlockType {
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
    }
  }
}

extension on String {
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

  Map<String, dynamic> toJson() {
    final height = this.height;
    final left = this.left;
    final top = this.top;
    final width = this.width;
    return {
      if (height != null) 'Height': height,
      if (left != null) 'Left': left,
      if (top != null) 'Top': top,
      if (width != null) 'Width': width,
    };
  }
}

enum ContentClassifier {
  freeOfPersonallyIdentifiableInformation,
  freeOfAdultContent,
}

extension on ContentClassifier {
  String toValue() {
    switch (this) {
      case ContentClassifier.freeOfPersonallyIdentifiableInformation:
        return 'FreeOfPersonallyIdentifiableInformation';
      case ContentClassifier.freeOfAdultContent:
        return 'FreeOfAdultContent';
    }
  }
}

extension on String {
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

  Map<String, dynamic> toJson() {
    final blocks = this.blocks;
    final detectDocumentTextModelVersion = this.detectDocumentTextModelVersion;
    final documentMetadata = this.documentMetadata;
    return {
      if (blocks != null) 'Blocks': blocks,
      if (detectDocumentTextModelVersion != null)
        'DetectDocumentTextModelVersion': detectDocumentTextModelVersion,
      if (documentMetadata != null) 'DocumentMetadata': documentMetadata,
    };
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

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      bytes: _s.decodeNullableUint8List(json['Bytes'] as String?),
      s3Object: json['S3Object'] != null
          ? S3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final s3Object = this.s3Object;
    return {
      if (bytes != null) 'Bytes': base64Encode(bytes),
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// The Amazon S3 bucket that contains the document to be processed. It's used
/// by asynchronous operations such as <a>StartDocumentTextDetection</a>.
///
/// The input document can be an image file in JPEG or PNG format. It can also
/// be a file in PDF format.
class DocumentLocation {
  /// The Amazon S3 bucket that contains the input document.
  final S3Object? s3Object;

  DocumentLocation({
    this.s3Object,
  });

  factory DocumentLocation.fromJson(Map<String, dynamic> json) {
    return DocumentLocation(
      s3Object: json['S3Object'] != null
          ? S3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
          : null,
    );
  }

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

  Map<String, dynamic> toJson() {
    final pages = this.pages;
    return {
      if (pages != null) 'Pages': pages,
    };
  }
}

enum EntityType {
  key,
  value,
}

extension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.key:
        return 'KEY';
      case EntityType.value:
        return 'VALUE';
    }
  }
}

extension on String {
  EntityType toEntityType() {
    switch (this) {
      case 'KEY':
        return EntityType.key;
      case 'VALUE':
        return EntityType.value;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

enum FeatureType {
  tables,
  forms,
}

extension on FeatureType {
  String toValue() {
    switch (this) {
      case FeatureType.tables:
        return 'TABLES';
      case FeatureType.forms:
        return 'FORMS';
    }
  }
}

extension on String {
  FeatureType toFeatureType() {
    switch (this) {
      case 'TABLES':
        return FeatureType.tables;
      case 'FORMS':
        return FeatureType.forms;
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

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final polygon = this.polygon;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (polygon != null) 'Polygon': polygon,
    };
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

  Map<String, dynamic> toJson() {
    final analyzeDocumentModelVersion = this.analyzeDocumentModelVersion;
    final blocks = this.blocks;
    final documentMetadata = this.documentMetadata;
    final jobStatus = this.jobStatus;
    final nextToken = this.nextToken;
    final statusMessage = this.statusMessage;
    final warnings = this.warnings;
    return {
      if (analyzeDocumentModelVersion != null)
        'AnalyzeDocumentModelVersion': analyzeDocumentModelVersion,
      if (blocks != null) 'Blocks': blocks,
      if (documentMetadata != null) 'DocumentMetadata': documentMetadata,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (nextToken != null) 'NextToken': nextToken,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (warnings != null) 'Warnings': warnings,
    };
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

  Map<String, dynamic> toJson() {
    final blocks = this.blocks;
    final detectDocumentTextModelVersion = this.detectDocumentTextModelVersion;
    final documentMetadata = this.documentMetadata;
    final jobStatus = this.jobStatus;
    final nextToken = this.nextToken;
    final statusMessage = this.statusMessage;
    final warnings = this.warnings;
    return {
      if (blocks != null) 'Blocks': blocks,
      if (detectDocumentTextModelVersion != null)
        'DetectDocumentTextModelVersion': detectDocumentTextModelVersion,
      if (documentMetadata != null) 'DocumentMetadata': documentMetadata,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (nextToken != null) 'NextToken': nextToken,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (warnings != null) 'Warnings': warnings,
    };
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

  Map<String, dynamic> toJson() {
    final humanLoopActivationConditionsEvaluationResults =
        this.humanLoopActivationConditionsEvaluationResults;
    final humanLoopActivationReasons = this.humanLoopActivationReasons;
    final humanLoopArn = this.humanLoopArn;
    return {
      if (humanLoopActivationConditionsEvaluationResults != null)
        'HumanLoopActivationConditionsEvaluationResults':
            jsonEncode(humanLoopActivationConditionsEvaluationResults),
      if (humanLoopActivationReasons != null)
        'HumanLoopActivationReasons': humanLoopActivationReasons,
      if (humanLoopArn != null) 'HumanLoopArn': humanLoopArn,
    };
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

  factory HumanLoopConfig.fromJson(Map<String, dynamic> json) {
    return HumanLoopConfig(
      flowDefinitionArn: json['FlowDefinitionArn'] as String,
      humanLoopName: json['HumanLoopName'] as String,
      dataAttributes: json['DataAttributes'] != null
          ? HumanLoopDataAttributes.fromJson(
              json['DataAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

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

  factory HumanLoopDataAttributes.fromJson(Map<String, dynamic> json) {
    return HumanLoopDataAttributes(
      contentClassifiers: (json['ContentClassifiers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toContentClassifier())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contentClassifiers = this.contentClassifiers;
    return {
      if (contentClassifiers != null)
        'ContentClassifiers':
            contentClassifiers.map((e) => e.toValue()).toList(),
    };
  }
}

enum JobStatus {
  inProgress,
  succeeded,
  failed,
  partialSuccess,
}

extension on JobStatus {
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

extension on String {
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

/// The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon
/// Textract publishes the completion status of an asynchronous document
/// operation, such as <a>StartDocumentTextDetection</a>.
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

  factory NotificationChannel.fromJson(Map<String, dynamic> json) {
    return NotificationChannel(
      roleArn: json['RoleArn'] as String,
      sNSTopicArn: json['SNSTopicArn'] as String,
    );
  }

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

  factory OutputConfig.fromJson(Map<String, dynamic> json) {
    return OutputConfig(
      s3Bucket: json['S3Bucket'] as String,
      s3Prefix: json['S3Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Prefix = this.s3Prefix;
    return {
      'S3Bucket': s3Bucket,
      if (s3Prefix != null) 'S3Prefix': s3Prefix,
    };
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

  Map<String, dynamic> toJson() {
    final x = this.x;
    final y = this.y;
    return {
      if (x != null) 'X': x,
      if (y != null) 'Y': y,
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

  /// The type of relationship that the blocks in the IDs array have with the
  /// current block. The relationship can be <code>VALUE</code> or
  /// <code>CHILD</code>. A relationship of type VALUE is a list that contains the
  /// ID of the VALUE block that's associated with the KEY of a key-value pair. A
  /// relationship of type CHILD is a list of IDs that identify WORD blocks in the
  /// case of lines Cell blocks in the case of Tables, and WORD blocks in the case
  /// of Selection Elements.
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

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    final type = this.type;
    return {
      if (ids != null) 'Ids': ids,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RelationshipType {
  value,
  child,
  complexFeatures,
}

extension on RelationshipType {
  String toValue() {
    switch (this) {
      case RelationshipType.value:
        return 'VALUE';
      case RelationshipType.child:
        return 'CHILD';
      case RelationshipType.complexFeatures:
        return 'COMPLEX_FEATURES';
    }
  }
}

extension on String {
  RelationshipType toRelationshipType() {
    switch (this) {
      case 'VALUE':
        return RelationshipType.value;
      case 'CHILD':
        return RelationshipType.child;
      case 'COMPLEX_FEATURES':
        return RelationshipType.complexFeatures;
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
  /// The name of the S3 bucket.
  final String? bucket;

  /// The file name of the input document. Synchronous operations can use image
  /// files that are in JPEG or PNG format. Asynchronous operations also support
  /// PDF format files.
  final String? name;

  /// If the bucket has versioning enabled, you can specify the object version.
  final String? version;

  S3Object({
    this.bucket,
    this.name,
    this.version,
  });

  factory S3Object.fromJson(Map<String, dynamic> json) {
    return S3Object(
      bucket: json['Bucket'] as String?,
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

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

extension on SelectionStatus {
  String toValue() {
    switch (this) {
      case SelectionStatus.selected:
        return 'SELECTED';
      case SelectionStatus.notSelected:
        return 'NOT_SELECTED';
    }
  }
}

extension on String {
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

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
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

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

enum TextType {
  handwriting,
  printed,
}

extension on TextType {
  String toValue() {
    switch (this) {
      case TextType.handwriting:
        return 'HANDWRITING';
      case TextType.printed:
        return 'PRINTED';
    }
  }
}

extension on String {
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

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final pages = this.pages;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (pages != null) 'Pages': pages,
    };
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
