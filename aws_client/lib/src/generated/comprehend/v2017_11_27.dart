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

/// Amazon Comprehend is an Amazon Web Services service for gaining insight into
/// the content of documents. Use these actions to determine the topics
/// contained in your documents, the topics they discuss, the predominant
/// sentiment expressed in them, the predominant language used, and more.
class Comprehend {
  final _s.JsonProtocol _protocol;
  Comprehend({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'comprehend',
            signingName: 'comprehend',
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

  /// Determines the dominant language of the input text for a batch of
  /// documents. For a list of languages that Amazon Comprehend can detect, see
  /// <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon
  /// Comprehend Supported Languages</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [textList] :
  /// A list containing the UTF-8 encoded text of the input documents. The list
  /// can contain a maximum of 25 documents. Each document should contain at
  /// least 20 characters. The maximum size of each document is 5 KB.
  Future<BatchDetectDominantLanguageResponse> batchDetectDominantLanguage({
    required List<String> textList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectDominantLanguage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TextList': textList,
      },
    );

    return BatchDetectDominantLanguageResponse.fromJson(jsonResponse.body);
  }

  /// Inspects the text of a batch of documents for named entities and returns
  /// information about them. For more information about named entities, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html">Entities</a>
  /// in the Comprehend Developer Guide.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [textList] :
  /// A list containing the UTF-8 encoded text of the input documents. The list
  /// can contain a maximum of 25 documents. The maximum size of each document
  /// is 5 KB.
  Future<BatchDetectEntitiesResponse> batchDetectEntities({
    required LanguageCode languageCode,
    required List<String> textList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Detects the key noun phrases found in a batch of documents.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [textList] :
  /// A list containing the UTF-8 encoded text of the input documents. The list
  /// can contain a maximum of 25 documents. The maximum size of each document
  /// is 5 KB.
  Future<BatchDetectKeyPhrasesResponse> batchDetectKeyPhrases({
    required LanguageCode languageCode,
    required List<String> textList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectKeyPhrases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectKeyPhrasesResponse.fromJson(jsonResponse.body);
  }

  /// Inspects a batch of documents and returns an inference of the prevailing
  /// sentiment, <code>POSITIVE</code>, <code>NEUTRAL</code>,
  /// <code>MIXED</code>, or <code>NEGATIVE</code>, in each one.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [textList] :
  /// A list containing the UTF-8 encoded text of the input documents. The list
  /// can contain a maximum of 25 documents. The maximum size of each document
  /// is 5 KB.
  Future<BatchDetectSentimentResponse> batchDetectSentiment({
    required LanguageCode languageCode,
    required List<String> textList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectSentiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectSentimentResponse.fromJson(jsonResponse.body);
  }

  /// Inspects the text of a batch of documents for the syntax and part of
  /// speech of the words in the document and returns information about them.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html">Syntax</a>
  /// in the Comprehend Developer Guide.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the following
  /// languages supported by Amazon Comprehend: German ("de"), English ("en"),
  /// Spanish ("es"), French ("fr"), Italian ("it"), or Portuguese ("pt"). All
  /// documents must be in the same language.
  ///
  /// Parameter [textList] :
  /// A list containing the UTF-8 encoded text of the input documents. The list
  /// can contain a maximum of 25 documents. The maximum size for each document
  /// is 5 KB.
  Future<BatchDetectSyntaxResponse> batchDetectSyntax({
    required SyntaxLanguageCode languageCode,
    required List<String> textList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectSyntax'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectSyntaxResponse.fromJson(jsonResponse.body);
  }

  /// Inspects a batch of documents and returns a sentiment analysis for each
  /// entity identified in the documents.
  ///
  /// For more information about targeted sentiment, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html">Targeted
  /// sentiment</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [BatchSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. Currently, English is the only
  /// supported language.
  ///
  /// Parameter [textList] :
  /// A list containing the UTF-8 encoded text of the input documents. The list
  /// can contain a maximum of 25 documents. The maximum size of each document
  /// is 5 KB.
  Future<BatchDetectTargetedSentimentResponse> batchDetectTargetedSentiment({
    required LanguageCode languageCode,
    required List<String> textList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.BatchDetectTargetedSentiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextList': textList,
      },
    );

    return BatchDetectTargetedSentimentResponse.fromJson(jsonResponse.body);
  }

  /// Creates a classification request to analyze a single document in
  /// real-time. <code>ClassifyDocument</code> supports the following model
  /// types:
  ///
  /// <ul>
  /// <li>
  /// Custom classifier - a custom model that you have created and trained. For
  /// input, you can provide plain text, a single-page document (PDF, Word, or
  /// image), or Amazon Textract API output. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-document-classification.html">Custom
  /// classification</a> in the <i>Amazon Comprehend Developer Guide</i>.
  /// </li>
  /// <li>
  /// Prompt safety classifier - Amazon Comprehend provides a pre-trained model
  /// for classifying input prompts for generative AI applications. For input,
  /// you provide English plain text input. For prompt safety classification,
  /// the response includes only the <code>Classes</code> field. For more
  /// information about prompt safety classifiers, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/trust-safety.html#prompt-classification">Prompt
  /// safety classification</a> in the <i>Amazon Comprehend Developer Guide</i>.
  /// </li>
  /// </ul>
  /// If the system detects errors while processing a page in the input
  /// document, the API response includes an <code>Errors</code> field that
  /// describes the errors.
  ///
  /// If the system detects a document-level error in your input document, the
  /// API returns an <code>InvalidRequestException</code> error response. For
  /// details about this exception, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync-err.html">
  /// Errors in semi-structured documents</a> in the Comprehend Developer Guide.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceUnavailableException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Number (ARN) of the endpoint.
  ///
  /// For prompt safety classification, Amazon Comprehend provides the endpoint
  /// ARN. For more information about prompt safety classifiers, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/trust-safety.html#prompt-classification">Prompt
  /// safety classification</a> in the <i>Amazon Comprehend Developer Guide</i>
  ///
  /// For custom classification, you create an endpoint for your custom model.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/using-endpoints.html">Using
  /// Amazon Comprehend endpoints</a>.
  ///
  /// Parameter [bytes] :
  /// Use the <code>Bytes</code> parameter to input a text, PDF, Word or image
  /// file.
  ///
  /// When you classify a document using a custom model, you can also use the
  /// <code>Bytes</code> parameter to input an Amazon Textract
  /// <code>DetectDocumentText</code> or <code>AnalyzeDocument</code> output
  /// file.
  ///
  /// To classify a document using the prompt safety classifier, use the
  /// <code>Text</code> parameter for input.
  ///
  /// Provide the input document as a sequence of base64-encoded bytes. If your
  /// code uses an Amazon Web Services SDK to classify documents, the SDK may
  /// encode the document file bytes for you.
  ///
  /// The maximum length of this field depends on the input document type. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync.html">
  /// Inputs for real-time custom analysis</a> in the Comprehend Developer
  /// Guide.
  ///
  /// If you use the <code>Bytes</code> parameter, do not use the
  /// <code>Text</code> parameter.
  ///
  /// Parameter [documentReaderConfig] :
  /// Provides configuration parameters to override the default actions for
  /// extracting text from PDF documents and image files.
  ///
  /// Parameter [text] :
  /// The document text to be analyzed. If you enter text using this parameter,
  /// do not use the <code>Bytes</code> parameter.
  Future<ClassifyDocumentResponse> classifyDocument({
    required String endpointArn,
    Uint8List? bytes,
    DocumentReaderConfig? documentReaderConfig,
    String? text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ClassifyDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
        if (bytes != null) 'Bytes': base64Encode(bytes),
        if (documentReaderConfig != null)
          'DocumentReaderConfig': documentReaderConfig,
        if (text != null) 'Text': text,
      },
    );

    return ClassifyDocumentResponse.fromJson(jsonResponse.body);
  }

  /// Analyzes input text for the presence of personally identifiable
  /// information (PII) and returns the labels of identified PII entity types
  /// such as name, address, bank account number, or phone number.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents.
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. The maximum string size is 100 KB.
  Future<ContainsPiiEntitiesResponse> containsPiiEntities({
    required LanguageCode languageCode,
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ContainsPiiEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return ContainsPiiEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a dataset to upload training or test data for a model associated
  /// with a flywheel. For more information about datasets, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetName] :
  /// Name of the dataset.
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel of the flywheel to
  /// receive the data.
  ///
  /// Parameter [inputDataConfig] :
  /// Information about the input data configuration. The type of input data
  /// varies based on the format of the input and whether the data is for a
  /// classifier model or an entity recognition model.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [datasetType] :
  /// The dataset type. You can specify that the data in a dataset is for
  /// training the model or for testing the model.
  ///
  /// Parameter [description] :
  /// Description of the dataset.
  ///
  /// Parameter [tags] :
  /// Tags for the dataset.
  Future<CreateDatasetResponse> createDataset({
    required String datasetName,
    required String flywheelArn,
    required DatasetInputDataConfig inputDataConfig,
    String? clientRequestToken,
    DatasetType? datasetType,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.CreateDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
        'FlywheelArn': flywheelArn,
        'InputDataConfig': inputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (datasetType != null) 'DatasetType': datasetType.toValue(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new document classifier that you can use to categorize
  /// documents. To create a classifier, you provide a set of training documents
  /// that are labeled with the categories that you want to use. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/training-classifier-model.html">Training
  /// classifier models</a> in the Comprehend Developer Guide.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data.
  ///
  /// Parameter [documentClassifierName] :
  /// The name of the document classifier.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the languages
  /// supported by Amazon Comprehend. All documents must be in the same
  /// language.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [mode] :
  /// Indicates the mode in which the classifier will be trained. The classifier
  /// can be trained in multi-class (single-label) mode or multi-label mode.
  /// Multi-class mode identifies a single class label for each document and
  /// multi-label mode identifies one or more class labels for each document.
  /// Multiple labels for an individual document are separated by a delimiter.
  /// The default delimiter between labels is a pipe (|).
  ///
  /// Parameter [modelKmsKeyId] :
  /// ID for the KMS key that Amazon Comprehend uses to encrypt trained custom
  /// models. The ModelKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [modelPolicy] :
  /// The resource-based policy to attach to your custom document classifier
  /// model. You can use this policy to allow another Amazon Web Services
  /// account to import your custom model.
  ///
  /// Provide your policy as a JSON body that you enter as a UTF-8 encoded
  /// string without line breaks. To provide valid JSON, enclose the attribute
  /// names and values in double quotes. If the JSON body is also enclosed in
  /// double quotes, then you must escape the double quotes that are inside the
  /// policy:
  ///
  /// <code>"{\"attribute\": \"value\", \"attribute\": [\"value\"]}"</code>
  ///
  /// To avoid escaping quotes, you can use single quotes to enclose the policy
  /// and double quotes to enclose the JSON names and values:
  ///
  /// <code>'{"attribute": "value", "attribute": ["value"]}'</code>
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies the location for the output files from a custom classifier job.
  /// This parameter is required for a request that creates a native document
  /// model.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the document classifier. A tag is a key-value pair
  /// that adds as a metadata to a resource used by Amazon Comprehend. For
  /// example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  ///
  /// Parameter [versionName] :
  /// The version name given to the newly created classifier. Version names can
  /// have a maximum of 256 characters. Alphanumeric characters, hyphens (-) and
  /// underscores (_) are allowed. The version name must be unique among all
  /// models with the same classifier name in the Amazon Web Services
  /// account/Amazon Web Services Region.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the Amazon Web Services Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your custom classifier.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<CreateDocumentClassifierResponse> createDocumentClassifier({
    required String dataAccessRoleArn,
    required String documentClassifierName,
    required DocumentClassifierInputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    String? clientRequestToken,
    DocumentClassifierMode? mode,
    String? modelKmsKeyId,
    String? modelPolicy,
    DocumentClassifierOutputDataConfig? outputDataConfig,
    List<Tag>? tags,
    String? versionName,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.CreateDocumentClassifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'DocumentClassifierName': documentClassifierName,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (mode != null) 'Mode': mode.toValue(),
        if (modelKmsKeyId != null) 'ModelKmsKeyId': modelKmsKeyId,
        if (modelPolicy != null) 'ModelPolicy': modelPolicy,
        if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
        if (tags != null) 'Tags': tags,
        if (versionName != null) 'VersionName': versionName,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return CreateDocumentClassifierResponse.fromJson(jsonResponse.body);
  }

  /// Creates a model-specific endpoint for synchronous inference for a
  /// previously trained custom model For information about endpoints, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing
  /// endpoints</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [TooManyTagsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [desiredInferenceUnits] :
  /// The desired number of inference units to be used by the model using this
  /// endpoint. Each inference unit represents of a throughput of 100 characters
  /// per second.
  ///
  /// Parameter [endpointName] :
  /// This is the descriptive suffix that becomes part of the
  /// <code>EndpointArn</code> used for all subsequent requests to this
  /// resource.
  ///
  /// Parameter [clientRequestToken] :
  /// An idempotency token provided by the customer. If this token matches a
  /// previous endpoint creation request, Amazon Comprehend will not return a
  /// <code>ResourceInUseException</code>.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to trained custom models encrypted with a customer
  /// managed key (ModelKmsKeyId).
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel to which the endpoint
  /// will be attached.
  ///
  /// Parameter [modelArn] :
  /// The Amazon Resource Number (ARN) of the model to which the endpoint will
  /// be attached.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the endpoint. A tag is a key-value pair that adds
  /// metadata to the endpoint. For example, a tag with "Sales" as the key might
  /// be added to an endpoint to indicate its use by the sales department.
  Future<CreateEndpointResponse> createEndpoint({
    required int desiredInferenceUnits,
    required String endpointName,
    String? clientRequestToken,
    String? dataAccessRoleArn,
    String? flywheelArn,
    String? modelArn,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'desiredInferenceUnits',
      desiredInferenceUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.CreateEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DesiredInferenceUnits': desiredInferenceUnits,
        'EndpointName': endpointName,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
        if (flywheelArn != null) 'FlywheelArn': flywheelArn,
        if (modelArn != null) 'ModelArn': modelArn,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Creates an entity recognizer using submitted files. After your
  /// <code>CreateEntityRecognizer</code> request is submitted, you can check
  /// job status using the <code>DescribeEntityRecognizer</code> API.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data. The S3 bucket
  /// containing the input data must be located in the same Region as the entity
  /// recognizer being created.
  ///
  /// Parameter [languageCode] :
  /// You can specify any of the following languages: English ("en"), Spanish
  /// ("es"), French ("fr"), Italian ("it"), German ("de"), or Portuguese
  /// ("pt"). If you plan to use this entity recognizer with PDF, Word, or image
  /// input files, you must specify English as the language. All training
  /// documents must be in the same language.
  ///
  /// Parameter [recognizerName] :
  /// The name given to the newly created recognizer. Recognizer names can be a
  /// maximum of 256 characters. Alphanumeric characters, hyphens (-) and
  /// underscores (_) are allowed. The name must be unique in the
  /// account/Region.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [modelKmsKeyId] :
  /// ID for the KMS key that Amazon Comprehend uses to encrypt trained custom
  /// models. The ModelKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [modelPolicy] :
  /// The JSON resource-based policy to attach to your custom entity recognizer
  /// model. You can use this policy to allow another Amazon Web Services
  /// account to import your custom model.
  ///
  /// Provide your JSON as a UTF-8 encoded string without line breaks. To
  /// provide valid JSON for your policy, enclose the attribute names and values
  /// in double quotes. If the JSON body is also enclosed in double quotes, then
  /// you must escape the double quotes that are inside the policy:
  ///
  /// <code>"{\"attribute\": \"value\", \"attribute\": [\"value\"]}"</code>
  ///
  /// To avoid escaping quotes, you can use single quotes to enclose the policy
  /// and double quotes to enclose the JSON names and values:
  ///
  /// <code>'{"attribute": "value", "attribute": ["value"]}'</code>
  ///
  /// Parameter [tags] :
  /// Tags to associate with the entity recognizer. A tag is a key-value pair
  /// that adds as a metadata to a resource used by Amazon Comprehend. For
  /// example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  ///
  /// Parameter [versionName] :
  /// The version name given to the newly created recognizer. Version names can
  /// be a maximum of 256 characters. Alphanumeric characters, hyphens (-) and
  /// underscores (_) are allowed. The version name must be unique among all
  /// models with the same recognizer name in the account/Region.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the Amazon Web Services Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your custom entity
  /// recognizer. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<CreateEntityRecognizerResponse> createEntityRecognizer({
    required String dataAccessRoleArn,
    required EntityRecognizerInputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required String recognizerName,
    String? clientRequestToken,
    String? modelKmsKeyId,
    String? modelPolicy,
    List<Tag>? tags,
    String? versionName,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.CreateEntityRecognizer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'RecognizerName': recognizerName,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (modelKmsKeyId != null) 'ModelKmsKeyId': modelKmsKeyId,
        if (modelPolicy != null) 'ModelPolicy': modelPolicy,
        if (tags != null) 'Tags': tags,
        if (versionName != null) 'VersionName': versionName,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return CreateEntityRecognizerResponse.fromJson(jsonResponse.body);
  }

  /// A flywheel is an Amazon Web Services resource that orchestrates the
  /// ongoing training of a model for custom classification or custom entity
  /// recognition. You can create a flywheel to start with an existing trained
  /// model, or Comprehend can create and train a new model.
  ///
  /// When you create the flywheel, Comprehend creates a data lake in your
  /// account. The data lake holds the training data and test data for all
  /// versions of the model.
  ///
  /// To use a flywheel with an existing trained model, you specify the active
  /// model version. Comprehend copies the model's training data and test data
  /// into the flywheel's data lake.
  ///
  /// To use the flywheel with a new model, you need to provide a dataset for
  /// training data (and optional test data) when you create the flywheel.
  ///
  /// For more information about flywheels, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [KmsKeyValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend the permissions required to access the flywheel data in the
  /// data lake.
  ///
  /// Parameter [dataLakeS3Uri] :
  /// Enter the S3 location for the data lake. You can specify a new S3 bucket
  /// or a new folder of an existing S3 bucket. The flywheel creates the data
  /// lake at this location.
  ///
  /// Parameter [flywheelName] :
  /// Name for the flywheel.
  ///
  /// Parameter [activeModelArn] :
  /// To associate an existing model with the flywheel, specify the Amazon
  /// Resource Number (ARN) of the model version. Do not set
  /// <code>TaskConfig</code> or <code>ModelType</code> if you specify an
  /// <code>ActiveModelArn</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [dataSecurityConfig] :
  /// Data security configurations.
  ///
  /// Parameter [modelType] :
  /// The model type. You need to set <code>ModelType</code> if you are creating
  /// a flywheel for a new model.
  ///
  /// Parameter [tags] :
  /// The tags to associate with this flywheel.
  ///
  /// Parameter [taskConfig] :
  /// Configuration about the model associated with the flywheel. You need to
  /// set <code>TaskConfig</code> if you are creating a flywheel for a new
  /// model.
  Future<CreateFlywheelResponse> createFlywheel({
    required String dataAccessRoleArn,
    required String dataLakeS3Uri,
    required String flywheelName,
    String? activeModelArn,
    String? clientRequestToken,
    DataSecurityConfig? dataSecurityConfig,
    ModelType? modelType,
    List<Tag>? tags,
    TaskConfig? taskConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.CreateFlywheel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'DataLakeS3Uri': dataLakeS3Uri,
        'FlywheelName': flywheelName,
        if (activeModelArn != null) 'ActiveModelArn': activeModelArn,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (dataSecurityConfig != null)
          'DataSecurityConfig': dataSecurityConfig,
        if (modelType != null) 'ModelType': modelType.toValue(),
        if (tags != null) 'Tags': tags,
        if (taskConfig != null) 'TaskConfig': taskConfig,
      },
    );

    return CreateFlywheelResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a previously created document classifier
  ///
  /// Only those classifiers that are in terminated states (IN_ERROR, TRAINED)
  /// will be deleted. If an active inference job is using the model, a
  /// <code>ResourceInUseException</code> will be returned.
  ///
  /// This is an asynchronous action that puts the classifier into a DELETING
  /// state, and it is then removed by a background job. Once removed, the
  /// classifier disappears from your account and is no longer available for
  /// use.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documentClassifierArn] :
  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  Future<void> deleteDocumentClassifier({
    required String documentClassifierArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DeleteDocumentClassifier'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentClassifierArn': documentClassifierArn,
      },
    );
  }

  /// Deletes a model-specific endpoint for a previously-trained custom model.
  /// All endpoints must be deleted in order for the model to be deleted. For
  /// information about endpoints, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing
  /// endpoints</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Number (ARN) of the endpoint being deleted.
  Future<void> deleteEndpoint({
    required String endpointArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DeleteEndpoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
      },
    );
  }

  /// Deletes an entity recognizer.
  ///
  /// Only those recognizers that are in terminated states (IN_ERROR, TRAINED)
  /// will be deleted. If an active inference job is using the model, a
  /// <code>ResourceInUseException</code> will be returned.
  ///
  /// This is an asynchronous action that puts the recognizer into a DELETING
  /// state, and it is then removed by a background job. Once removed, the
  /// recognizer disappears from your account and is no longer available for
  /// use.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityRecognizerArn] :
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  Future<void> deleteEntityRecognizer({
    required String entityRecognizerArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DeleteEntityRecognizer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityRecognizerArn': entityRecognizerArn,
      },
    );
  }

  /// Deletes a flywheel. When you delete the flywheel, Amazon Comprehend does
  /// not delete the data lake or the model associated with the flywheel.
  ///
  /// For more information about flywheels, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel to delete.
  Future<void> deleteFlywheel({
    required String flywheelArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DeleteFlywheel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlywheelArn': flywheelArn,
      },
    );
  }

  /// Deletes a resource-based policy that is attached to a custom model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the custom model version that has the
  /// policy to delete.
  ///
  /// Parameter [policyRevisionId] :
  /// The revision ID of the policy to delete.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
    String? policyRevisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DeleteResourcePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      },
    );
  }

  /// Returns information about the dataset that you specify. For more
  /// information about datasets, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetArn] :
  /// The ARN of the dataset.
  Future<DescribeDatasetResponse> describeDataset({
    required String datasetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetArn': datasetArn,
      },
    );

    return DescribeDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a document classification job. Use
  /// this operation to get the status of a classification job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The
  /// <code>StartDocumentClassificationJob</code> operation returns this
  /// identifier in its response.
  Future<DescribeDocumentClassificationJobResponse>
      describeDocumentClassificationJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeDocumentClassificationJob'
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

    return DescribeDocumentClassificationJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets the properties associated with a document classifier.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documentClassifierArn] :
  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  /// The <code>CreateDocumentClassifier</code> operation returns this
  /// identifier in its response.
  Future<DescribeDocumentClassifierResponse> describeDocumentClassifier({
    required String documentClassifierArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeDocumentClassifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentClassifierArn': documentClassifierArn,
      },
    );

    return DescribeDocumentClassifierResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a dominant language detection job. Use
  /// this operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The
  /// <code>StartDominantLanguageDetectionJob</code> operation returns this
  /// identifier in its response.
  Future<DescribeDominantLanguageDetectionJobResponse>
      describeDominantLanguageDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeDominantLanguageDetectionJob'
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

    return DescribeDominantLanguageDetectionJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets the properties associated with a specific endpoint. Use this
  /// operation to get the status of an endpoint. For information about
  /// endpoints, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing
  /// endpoints</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Number (ARN) of the endpoint being described.
  Future<DescribeEndpointResponse> describeEndpoint({
    required String endpointArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
      },
    );

    return DescribeEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with an entities detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The
  /// <code>StartEntitiesDetectionJob</code> operation returns this identifier
  /// in its response.
  Future<DescribeEntitiesDetectionJobResponse> describeEntitiesDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeEntitiesDetectionJob'
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

    return DescribeEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Provides details about an entity recognizer including status, S3 buckets
  /// containing training data, recognizer metadata, metrics, and so on.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityRecognizerArn] :
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  Future<DescribeEntityRecognizerResponse> describeEntityRecognizer({
    required String entityRecognizerArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeEntityRecognizer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityRecognizerArn': entityRecognizerArn,
      },
    );

    return DescribeEntityRecognizerResponse.fromJson(jsonResponse.body);
  }

  /// Gets the status and details of an events detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the events detection job.
  Future<DescribeEventsDetectionJobResponse> describeEventsDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeEventsDetectionJob'
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

    return DescribeEventsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Provides configuration information about the flywheel. For more
  /// information about flywheels, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel.
  Future<DescribeFlywheelResponse> describeFlywheel({
    required String flywheelArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeFlywheel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlywheelArn': flywheelArn,
      },
    );

    return DescribeFlywheelResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve the configuration properties of a flywheel iteration. For more
  /// information about flywheels, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flywheelArn] :
  /// <p/>
  ///
  /// Parameter [flywheelIterationId] :
  /// <p/>
  Future<DescribeFlywheelIterationResponse> describeFlywheelIteration({
    required String flywheelArn,
    required String flywheelIterationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeFlywheelIteration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlywheelArn': flywheelArn,
        'FlywheelIterationId': flywheelIterationId,
      },
    );

    return DescribeFlywheelIterationResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a key phrases detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The
  /// <code>StartKeyPhrasesDetectionJob</code> operation returns this identifier
  /// in its response.
  Future<DescribeKeyPhrasesDetectionJobResponse>
      describeKeyPhrasesDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeKeyPhrasesDetectionJob'
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

    return DescribeKeyPhrasesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a PII entities detection job. For
  /// example, you can use this operation to get the job status.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The operation
  /// returns this identifier in its response.
  Future<DescribePiiEntitiesDetectionJobResponse>
      describePiiEntitiesDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribePiiEntitiesDetectionJob'
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

    return DescribePiiEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the details of a resource-based policy that is attached to a custom
  /// model, including the JSON body of the policy.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the custom model version that has the
  /// resource policy.
  Future<DescribeResourcePolicyResponse> describeResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return DescribeResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a sentiment detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The operation
  /// returns this identifier in its response.
  Future<DescribeSentimentDetectionJobResponse> describeSentimentDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeSentimentDetectionJob'
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

    return DescribeSentimentDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a targeted sentiment detection job.
  /// Use this operation to get the status of the job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend generated for the job. The
  /// <code>StartTargetedSentimentDetectionJob</code> operation returns this
  /// identifier in its response.
  Future<DescribeTargetedSentimentDetectionJobResponse>
      describeTargetedSentimentDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Comprehend_20171127.DescribeTargetedSentimentDetectionJob'
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

    return DescribeTargetedSentimentDetectionJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets the properties associated with a topic detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier assigned by the user to the detection job.
  Future<DescribeTopicsDetectionJobResponse> describeTopicsDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DescribeTopicsDetectionJob'
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

    return DescribeTopicsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Determines the dominant language of the input text. For a list of
  /// languages that Amazon Comprehend can detect, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html">Amazon
  /// Comprehend Supported Languages</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. The string must contain at least 20 characters. The
  /// maximum string size is 100 KB.
  Future<DetectDominantLanguageResponse> detectDominantLanguage({
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectDominantLanguage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
      },
    );

    return DetectDominantLanguageResponse.fromJson(jsonResponse.body);
  }

  /// Detects named entities in input text when you use the pre-trained model.
  /// Detects custom entities if you have a custom entity recognition model.
  ///
  /// When detecting named entities using the pre-trained model, use plain text
  /// as the input. For more information about named entities, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html">Entities</a>
  /// in the Comprehend Developer Guide.
  ///
  /// When you use a custom entity recognition model, you can input plain text
  /// or you can upload a single-page input document (text, PDF, Word, or
  /// image).
  ///
  /// If the system detects errors while processing a page in the input
  /// document, the API response includes an entry in <code>Errors</code> for
  /// each error.
  ///
  /// If the system detects a document-level error in your input document, the
  /// API returns an <code>InvalidRequestException</code> error response. For
  /// details about this exception, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync-err.html">
  /// Errors in semi-structured documents</a> in the Comprehend Developer Guide.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceUnavailableException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [bytes] :
  /// This field applies only when you use a custom entity recognition model
  /// that was trained with PDF annotations. For other cases, enter your text
  /// input in the <code>Text</code> field.
  ///
  /// Use the <code>Bytes</code> parameter to input a text, PDF, Word or image
  /// file. Using a plain-text file in the <code>Bytes</code> parameter is
  /// equivelent to using the <code>Text</code> parameter (the
  /// <code>Entities</code> field in the response is identical).
  ///
  /// You can also use the <code>Bytes</code> parameter to input an Amazon
  /// Textract <code>DetectDocumentText</code> or <code>AnalyzeDocument</code>
  /// output file.
  ///
  /// Provide the input document as a sequence of base64-encoded bytes. If your
  /// code uses an Amazon Web Services SDK to detect entities, the SDK may
  /// encode the document file bytes for you.
  ///
  /// The maximum length of this field depends on the input document type. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync.html">
  /// Inputs for real-time custom analysis</a> in the Comprehend Developer
  /// Guide.
  ///
  /// If you use the <code>Bytes</code> parameter, do not use the
  /// <code>Text</code> parameter.
  ///
  /// Parameter [documentReaderConfig] :
  /// Provides configuration parameters to override the default actions for
  /// extracting text from PDF documents and image files.
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name of an endpoint that is associated with a custom
  /// entity recognition model. Provide an endpoint if you want to detect
  /// entities by using your own custom model instead of the default model that
  /// is used by Amazon Comprehend.
  ///
  /// If you specify an endpoint, Amazon Comprehend uses the language of your
  /// custom model, and it ignores any language code that you provide in your
  /// request.
  ///
  /// For information about endpoints, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing
  /// endpoints</a>.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. If your request includes the
  /// endpoint for a custom entity recognition model, Amazon Comprehend uses the
  /// language of your custom model, and it ignores any language code that you
  /// specify here.
  ///
  /// All input documents must be in the same language.
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. The maximum string size is 100 KB. If you enter text
  /// using this parameter, do not use the <code>Bytes</code> parameter.
  Future<DetectEntitiesResponse> detectEntities({
    Uint8List? bytes,
    DocumentReaderConfig? documentReaderConfig,
    String? endpointArn,
    LanguageCode? languageCode,
    String? text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bytes != null) 'Bytes': base64Encode(bytes),
        if (documentReaderConfig != null)
          'DocumentReaderConfig': documentReaderConfig,
        if (endpointArn != null) 'EndpointArn': endpointArn,
        if (languageCode != null) 'LanguageCode': languageCode.toValue(),
        if (text != null) 'Text': text,
      },
    );

    return DetectEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Detects the key noun phrases found in the text.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. The string must contain less than 100 KB of UTF-8
  /// encoded characters.
  Future<DetectKeyPhrasesResponse> detectKeyPhrases({
    required LanguageCode languageCode,
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectKeyPhrases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectKeyPhrasesResponse.fromJson(jsonResponse.body);
  }

  /// Inspects the input text for entities that contain personally identifiable
  /// information (PII) and returns information about them.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input text. Enter the language code for English (en)
  /// or Spanish (es).
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. The maximum string size is 100 KB.
  Future<DetectPiiEntitiesResponse> detectPiiEntities({
    required LanguageCode languageCode,
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectPiiEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectPiiEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Inspects text and returns an inference of the prevailing sentiment
  /// (<code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or
  /// <code>NEGATIVE</code>).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. The maximum string size is 5 KB.
  Future<DetectSentimentResponse> detectSentiment({
    required LanguageCode languageCode,
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectSentiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectSentimentResponse.fromJson(jsonResponse.body);
  }

  /// Inspects text for syntax and the part of speech of words in the document.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html">Syntax</a>
  /// in the Comprehend Developer Guide.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the input documents. You can specify any of the
  /// following languages supported by Amazon Comprehend: German ("de"), English
  /// ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or Portuguese
  /// ("pt").
  ///
  /// Parameter [text] :
  /// A UTF-8 string. The maximum string size is 5 KB.
  Future<DetectSyntaxResponse> detectSyntax({
    required SyntaxLanguageCode languageCode,
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectSyntax'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectSyntaxResponse.fromJson(jsonResponse.body);
  }

  /// Inspects the input text and returns a sentiment analysis for each entity
  /// identified in the text.
  ///
  /// For more information about targeted sentiment, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html">Targeted
  /// sentiment</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. Currently, English is the only
  /// supported language.
  ///
  /// Parameter [text] :
  /// A UTF-8 text string. The maximum string length is 5 KB.
  Future<DetectTargetedSentimentResponse> detectTargetedSentiment({
    required LanguageCode languageCode,
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectTargetedSentiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Text': text,
      },
    );

    return DetectTargetedSentimentResponse.fromJson(jsonResponse.body);
  }

  /// Performs toxicity analysis on the list of text strings that you provide as
  /// input. The API response contains a results list that matches the size of
  /// the input list. For more information about toxicity detection, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/toxicity-detection.html">Toxicity
  /// detection</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [UnsupportedLanguageException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [languageCode] :
  /// The language of the input text. Currently, English is the only supported
  /// language.
  ///
  /// Parameter [textSegments] :
  /// A list of up to 10 text strings. Each string has a maximum size of 1 KB,
  /// and the maximum size of the list is 10 KB.
  Future<DetectToxicContentResponse> detectToxicContent({
    required LanguageCode languageCode,
    required List<TextSegment> textSegments,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.DetectToxicContent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'TextSegments': textSegments,
      },
    );

    return DetectToxicContentResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new custom model that replicates a source custom model that you
  /// import. The source model can be in your Amazon Web Services account or
  /// another one.
  ///
  /// If the source model is in another Amazon Web Services account, then it
  /// must have a resource-based policy that authorizes you to import it.
  ///
  /// The source model must be in the same Amazon Web Services Region that
  /// you're using when you import. You can't import a model that's in a
  /// different Region.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceUnavailableException].
  /// May throw [TooManyTagsException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [KmsKeyValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [sourceModelArn] :
  /// The Amazon Resource Name (ARN) of the custom model to import.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend permission to use Amazon Key Management Service (KMS) to
  /// encrypt or decrypt the custom model.
  ///
  /// Parameter [modelKmsKeyId] :
  /// ID for the KMS key that Amazon Comprehend uses to encrypt trained custom
  /// models. The ModelKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [modelName] :
  /// The name to assign to the custom model that is created in Amazon
  /// Comprehend by this import.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the custom model that is created by this import. A
  /// tag is a key-value pair that adds as a metadata to a resource used by
  /// Amazon Comprehend. For example, a tag with "Sales" as the key might be
  /// added to a resource to indicate its use by the sales department.
  ///
  /// Parameter [versionName] :
  /// The version name given to the custom model that is created by this import.
  /// Version names can have a maximum of 256 characters. Alphanumeric
  /// characters, hyphens (-) and underscores (_) are allowed. The version name
  /// must be unique among all models with the same classifier name in the
  /// account/Region.
  Future<ImportModelResponse> importModel({
    required String sourceModelArn,
    String? dataAccessRoleArn,
    String? modelKmsKeyId,
    String? modelName,
    List<Tag>? tags,
    String? versionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ImportModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SourceModelArn': sourceModelArn,
        if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
        if (modelKmsKeyId != null) 'ModelKmsKeyId': modelKmsKeyId,
        if (modelName != null) 'ModelName': modelName,
        if (tags != null) 'Tags': tags,
        if (versionName != null) 'VersionName': versionName,
      },
    );

    return ImportModelResponse.fromJson(jsonResponse.body);
  }

  /// List the datasets that you have configured in this Region. For more
  /// information about datasets, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the datasets to be returned in the response.
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a response. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDatasetsResponse> listDatasets({
    DatasetFilter? filter,
    String? flywheelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListDatasets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (flywheelArn != null) 'FlywheelArn': flywheelArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDatasetsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the documentation classification jobs that you have
  /// submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their names,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDocumentClassificationJobsResponse>
      listDocumentClassificationJobs({
    DocumentClassificationJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListDocumentClassificationJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDocumentClassificationJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of summaries of the document classifiers that you have created
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return on each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDocumentClassifierSummariesResponse>
      listDocumentClassifierSummaries({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListDocumentClassifierSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDocumentClassifierSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the document classifiers that you have created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDocumentClassifiersResponse> listDocumentClassifiers({
    DocumentClassifierFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListDocumentClassifiers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDocumentClassifiersResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the dominant language detection jobs that you have
  /// submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters that jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDominantLanguageDetectionJobsResponse>
      listDominantLanguageDetectionJobs({
    DominantLanguageDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListDominantLanguageDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDominantLanguageDetectionJobsResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets a list of all existing endpoints that you've created. For information
  /// about endpoints, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing
  /// endpoints</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the endpoints that are returned. You can filter endpoints on their
  /// name, model, status, or the date and time that they were created. You can
  /// only set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEndpointsResponse> listEndpoints({
    EndpointFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the entity detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEntitiesDetectionJobsResponse> listEntitiesDetectionJobs({
    EntitiesDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEntitiesDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEntitiesDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of summaries for the entity recognizers that you have created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return on each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEntityRecognizerSummariesResponse> listEntityRecognizerSummaries({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEntityRecognizerSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEntityRecognizerSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the properties of all entity recognizers that you created,
  /// including recognizers currently in training. Allows you to filter the list
  /// of recognizers based on criteria such as status and submission time. This
  /// call returns up to 500 entity recognizers in the list, with a default
  /// number of 100 recognizers in the list.
  ///
  /// The results of this list are not in any particular order. Please get the
  /// list and sort locally if needed.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the list of entities returned. You can filter on
  /// <code>Status</code>, <code>SubmitTimeBefore</code>, or
  /// <code>SubmitTimeAfter</code>. You can only set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return on each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEntityRecognizersResponse> listEntityRecognizers({
    EntityRecognizerFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEntityRecognizers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEntityRecognizersResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the events detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEventsDetectionJobsResponse> listEventsDetectionJobs({
    EventsDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListEventsDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEventsDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Information about the history of a flywheel iteration. For more
  /// information about flywheels, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flywheelArn] :
  /// The ARN of the flywheel.
  ///
  /// Parameter [filter] :
  /// Filter the flywheel iteration history based on creation time.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of iteration history results to return
  ///
  /// Parameter [nextToken] :
  /// Next token
  Future<ListFlywheelIterationHistoryResponse> listFlywheelIterationHistory({
    required String flywheelArn,
    FlywheelIterationFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListFlywheelIterationHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlywheelArn': flywheelArn,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFlywheelIterationHistoryResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the flywheels that you have created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the flywheels that are returned. You can filter flywheels on their
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a response. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListFlywheelsResponse> listFlywheels({
    FlywheelFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListFlywheels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFlywheelsResponse.fromJson(jsonResponse.body);
  }

  /// Get a list of key phrase detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListKeyPhrasesDetectionJobsResponse> listKeyPhrasesDetectionJobs({
    KeyPhrasesDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListKeyPhrasesDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListKeyPhrasesDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the PII entity detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListPiiEntitiesDetectionJobsResponse> listPiiEntitiesDetectionJobs({
    PiiEntitiesDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListPiiEntitiesDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPiiEntitiesDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of sentiment detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListSentimentDetectionJobsResponse> listSentimentDetectionJobs({
    SentimentDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListSentimentDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSentimentDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags associated with a given Amazon Comprehend resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you
  /// are querying.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of targeted sentiment detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs on their name,
  /// status, or the date and time that they were submitted. You can only set
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListTargetedSentimentDetectionJobsResponse>
      listTargetedSentimentDetectionJobs({
    TargetedSentimentDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListTargetedSentimentDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTargetedSentimentDetectionJobsResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets a list of the topic detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. Jobs can be filtered on their name,
  /// status, or the date and time that they were submitted. You can set only
  /// one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListTopicsDetectionJobsResponse> listTopicsDetectionJobs({
    TopicsDetectionJobFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.ListTopicsDetectionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTopicsDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Attaches a resource-based policy to a custom model. You can use this
  /// policy to authorize an entity in another Amazon Web Services account to
  /// import the custom model, which replicates it in Amazon Comprehend in their
  /// account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the custom model to attach the policy
  /// to.
  ///
  /// Parameter [resourcePolicy] :
  /// The JSON resource-based policy to attach to your custom model. Provide
  /// your JSON as a UTF-8 encoded string without line breaks. To provide valid
  /// JSON for your policy, enclose the attribute names and values in double
  /// quotes. If the JSON body is also enclosed in double quotes, then you must
  /// escape the double quotes that are inside the policy:
  ///
  /// <code>"{\"attribute\": \"value\", \"attribute\": [\"value\"]}"</code>
  ///
  /// To avoid escaping quotes, you can use single quotes to enclose the policy
  /// and double quotes to enclose the JSON names and values:
  ///
  /// <code>'{"attribute": "value", "attribute": ["value"]}'</code>
  ///
  /// Parameter [policyRevisionId] :
  /// The revision ID that Amazon Comprehend assigned to the policy that you are
  /// updating. If you are creating a new policy that has no prior version,
  /// don't use this parameter. Amazon Comprehend creates the revision ID for
  /// you.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String resourceArn,
    required String resourcePolicy,
    String? policyRevisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourcePolicy': resourcePolicy,
        if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous document classification job using a custom
  /// classification model. Use the
  /// <code>DescribeDocumentClassificationJob</code> operation to track the
  /// progress of the job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [documentClassifierArn] :
  /// The Amazon Resource Name (ARN) of the document classifier to use to
  /// process the job.
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel associated with the model
  /// to use.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the document classification job. A tag is a
  /// key-value pair that adds metadata to a resource used by Amazon Comprehend.
  /// For example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the Amazon Web Services Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your document
  /// classification job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartDocumentClassificationJobResponse>
      startDocumentClassificationJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? documentClassifierArn,
    String? flywheelArn,
    String? jobName,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartDocumentClassificationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (documentClassifierArn != null)
          'DocumentClassifierArn': documentClassifierArn,
        if (flywheelArn != null) 'FlywheelArn': flywheelArn,
        if (jobName != null) 'JobName': jobName,
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartDocumentClassificationJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous dominant language detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions">Role-based
  /// permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// An identifier for the job.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the dominant language detection job. A tag is a
  /// key-value pair that adds metadata to a resource used by Amazon Comprehend.
  /// For example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the Amazon Web Services Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your dominant language
  /// detection job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartDominantLanguageDetectionJobResponse>
      startDominantLanguageDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartDominantLanguageDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartDominantLanguageDetectionJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Starts an asynchronous entity detection job for a collection of documents.
  /// Use the operation to track the status of a job.
  ///
  /// This API can be used for either standard entity detection or custom entity
  /// recognition. In order to be used for custom entity recognition, the
  /// optional <code>EntityRecognizerArn</code> must be used in order to provide
  /// access to the recognizer being used to detect the custom entity.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions">Role-based
  /// permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. All documents must be in the same
  /// language. You can specify any of the languages supported by Amazon
  /// Comprehend. If custom entities recognition is used, this parameter is
  /// ignored and the language used for training the model is used instead.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [entityRecognizerArn] :
  /// The Amazon Resource Name (ARN) that identifies the specific entity
  /// recognizer to be used by the <code>StartEntitiesDetectionJob</code>. This
  /// ARN is optional and is only used for a custom entity recognition job.
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel associated with the model
  /// to use.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the entities detection job. A tag is a key-value
  /// pair that adds metadata to a resource used by Amazon Comprehend. For
  /// example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the Amazon Web Services Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your entity detection
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartEntitiesDetectionJobResponse> startEntitiesDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? entityRecognizerArn,
    String? flywheelArn,
    String? jobName,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartEntitiesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (entityRecognizerArn != null)
          'EntityRecognizerArn': entityRecognizerArn,
        if (flywheelArn != null) 'FlywheelArn': flywheelArn,
        if (jobName != null) 'JobName': jobName,
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous event detection job for a collection of documents.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language code of the input documents.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [targetEventTypes] :
  /// The types of events to detect in the input documents.
  ///
  /// Parameter [clientRequestToken] :
  /// An unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the events detection job.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the events detection job. A tag is a key-value pair
  /// that adds metadata to a resource used by Amazon Comprehend. For example, a
  /// tag with "Sales" as the key might be added to a resource to indicate its
  /// use by the sales department.
  Future<StartEventsDetectionJobResponse> startEventsDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    required List<String> targetEventTypes,
    String? clientRequestToken,
    String? jobName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartEventsDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'TargetEventTypes': targetEventTypes,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartEventsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Start the flywheel iteration.This operation uses any new datasets to train
  /// a new model version. For more information about flywheels, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html">
  /// Flywheel overview</a> in the <i>Amazon Comprehend Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flywheelArn] :
  /// The ARN of the flywheel.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  Future<StartFlywheelIterationResponse> startFlywheelIteration({
    required String flywheelArn,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartFlywheelIteration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlywheelArn': flywheelArn,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
      },
    );

    return StartFlywheelIterationResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous key phrase detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions">Role-based
  /// permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the key phrases detection job. A tag is a key-value
  /// pair that adds metadata to a resource used by Amazon Comprehend. For
  /// example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the Amazon Web Services Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your key phrases
  /// detection job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartKeyPhrasesDetectionJobResponse> startKeyPhrasesDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartKeyPhrasesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartKeyPhrasesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous PII entity detection job for a collection of
  /// documents.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data.
  ///
  /// Parameter [inputDataConfig] :
  /// The input properties for a PII entities detection job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. Enter the language code for English
  /// (en) or Spanish (es).
  ///
  /// Parameter [mode] :
  /// Specifies whether the output provides the locations (offsets) of PII
  /// entities or a file in which PII entities are redacted.
  ///
  /// Parameter [outputDataConfig] :
  /// Provides conﬁguration parameters for the output of PII entity detection
  /// jobs.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [redactionConfig] :
  /// Provides configuration parameters for PII entity redaction.
  ///
  /// This parameter is required if you set the <code>Mode</code> parameter to
  /// <code>ONLY_REDACTION</code>. In that case, you must provide a
  /// <code>RedactionConfig</code> definition that includes the
  /// <code>PiiEntityTypes</code> parameter.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the PII entities detection job. A tag is a
  /// key-value pair that adds metadata to a resource used by Amazon Comprehend.
  /// For example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  Future<StartPiiEntitiesDetectionJobResponse> startPiiEntitiesDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required PiiEntitiesDetectionMode mode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    RedactionConfig? redactionConfig,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartPiiEntitiesDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'Mode': mode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (redactionConfig != null) 'RedactionConfig': redactionConfig,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartPiiEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous sentiment detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions">Role-based
  /// permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. You can specify any of the primary
  /// languages supported by Amazon Comprehend. All documents must be in the
  /// same language.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the sentiment detection job. A tag is a key-value
  /// pair that adds metadata to a resource used by Amazon Comprehend. For
  /// example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the Amazon Web Services Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your sentiment detection
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartSentimentDetectionJobResponse> startSentimentDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartSentimentDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartSentimentDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous targeted sentiment detection job for a collection
  /// of documents. Use the <code>DescribeTargetedSentimentDetectionJob</code>
  /// operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions">Role-based
  /// permissions</a>.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. Currently, English is the only
  /// supported language.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the targeted sentiment detection job. A tag is a
  /// key-value pair that adds metadata to a resource used by Amazon Comprehend.
  /// For example, a tag with "Sales" as the key might be added to a resource to
  /// indicate its use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the KMS key that Amazon Comprehend uses to encrypt data on the
  /// storage volume attached to the ML compute instance(s) that process the
  /// analysis job. The VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  Future<StartTargetedSentimentDetectionJobResponse>
      startTargetedSentimentDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartTargetedSentimentDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartTargetedSentimentDetectionJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Starts an asynchronous topic detection job. Use the
  /// <code>DescribeTopicDetectionJob</code> operation to track the status of a
  /// job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend read access to your input data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions">Role-based
  /// permissions</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files. The output is a compressed
  /// archive with two files, <code>topic-terms.csv</code> that lists the terms
  /// associated with each topic, and <code>doc-topics.csv</code> that lists the
  /// documents associated with each topic
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Comprehend generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [numberOfTopics] :
  /// The number of topics to detect.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the topics detection job. A tag is a key-value pair
  /// that adds metadata to a resource used by Amazon Comprehend. For example, a
  /// tag with "Sales" as the key might be added to a resource to indicate its
  /// use by the sales department.
  ///
  /// Parameter [volumeKmsKeyId] :
  /// ID for the Amazon Web Services Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [vpcConfig] :
  /// Configuration parameters for an optional private Virtual Private Cloud
  /// (VPC) containing the resources you are using for your topic detection job.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  Future<StartTopicsDetectionJobResponse> startTopicsDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    int? numberOfTopics,
    List<Tag>? tags,
    String? volumeKmsKeyId,
    VpcConfig? vpcConfig,
  }) async {
    _s.validateNumRange(
      'numberOfTopics',
      numberOfTopics,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StartTopicsDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (numberOfTopics != null) 'NumberOfTopics': numberOfTopics,
        if (tags != null) 'Tags': tags,
        if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
        if (vpcConfig != null) 'VpcConfig': vpcConfig,
      },
    );

    return StartTopicsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a dominant language detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code> the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the dominant language detection job to stop.
  Future<StopDominantLanguageDetectionJobResponse>
      stopDominantLanguageDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopDominantLanguageDetectionJob'
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

    return StopDominantLanguageDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops an entities detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code> the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the entities detection job to stop.
  Future<StopEntitiesDetectionJobResponse> stopEntitiesDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopEntitiesDetectionJob'
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

    return StopEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops an events detection job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the events detection job to stop.
  Future<StopEventsDetectionJobResponse> stopEventsDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopEventsDetectionJob'
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

    return StopEventsDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a key phrases detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code> the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the key phrases detection job to stop.
  Future<StopKeyPhrasesDetectionJobResponse> stopKeyPhrasesDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopKeyPhrasesDetectionJob'
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

    return StopKeyPhrasesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a PII entities detection job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the PII entities detection job to stop.
  Future<StopPiiEntitiesDetectionJobResponse> stopPiiEntitiesDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopPiiEntitiesDetectionJob'
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

    return StopPiiEntitiesDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a sentiment detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code>, the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is be stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the sentiment detection job to stop.
  Future<StopSentimentDetectionJobResponse> stopSentimentDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopSentimentDetectionJob'
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

    return StopSentimentDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a targeted sentiment detection job in progress.
  ///
  /// If the job state is <code>IN_PROGRESS</code>, the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state; otherwise the job is be stopped and put into
  /// the <code>STOPPED</code> state.
  ///
  /// If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state
  /// when you call the <code>StopDominantLanguageDetectionJob</code> operation,
  /// the operation returns a 400 Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [JobNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the targeted sentiment detection job to stop.
  Future<StopTargetedSentimentDetectionJobResponse>
      stopTargetedSentimentDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopTargetedSentimentDetectionJob'
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

    return StopTargetedSentimentDetectionJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Stops a document classifier training job while in progress.
  ///
  /// If the training job state is <code>TRAINING</code>, the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the
  /// training job completes before it can be stopped, it is put into the
  /// <code>TRAINED</code>; otherwise the training job is stopped and put into
  /// the <code>STOPPED</code> state and the service sends back an HTTP 200
  /// response with an empty HTTP body.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documentClassifierArn] :
  /// The Amazon Resource Name (ARN) that identifies the document classifier
  /// currently being trained.
  Future<void> stopTrainingDocumentClassifier({
    required String documentClassifierArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopTrainingDocumentClassifier'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentClassifierArn': documentClassifierArn,
      },
    );
  }

  /// Stops an entity recognizer training job while in progress.
  ///
  /// If the training job state is <code>TRAINING</code>, the job is marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the
  /// training job completes before it can be stopped, it is put into the
  /// <code>TRAINED</code>; otherwise the training job is stopped and putted
  /// into the <code>STOPPED</code> state and the service sends back an HTTP 200
  /// response with an empty HTTP body.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityRecognizerArn] :
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer
  /// currently being trained.
  Future<void> stopTrainingEntityRecognizer({
    required String entityRecognizerArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.StopTrainingEntityRecognizer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityRecognizerArn': entityRecognizerArn,
      },
    );
  }

  /// Associates a specific tag with an Amazon Comprehend resource. A tag is a
  /// key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource to
  /// which you want to associate the tags.
  ///
  /// Parameter [tags] :
  /// Tags being associated with a specific Amazon Comprehend resource. There
  /// can be a maximum of 50 tags (both existing and pending) associated with a
  /// specific resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Removes a specific tag associated with an Amazon Comprehend resource.
  ///
  /// May throw [TooManyTagKeysException].
  /// May throw [InvalidRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource
  /// from which you want to remove the tags.
  ///
  /// Parameter [tagKeys] :
  /// The initial part of a key-value pair that forms a tag being removed from a
  /// given resource. For example, a tag with "Sales" as the key might be added
  /// to a resource to indicate its use by the sales department. Keys must be
  /// unique and cannot be duplicated for a particular resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates information about the specified endpoint. For information about
  /// endpoints, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing
  /// endpoints</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Number (ARN) of the endpoint being updated.
  ///
  /// Parameter [desiredDataAccessRoleArn] :
  /// Data access role ARN to use in case the new model is encrypted with a
  /// customer CMK.
  ///
  /// Parameter [desiredInferenceUnits] :
  /// The desired number of inference units to be used by the model using this
  /// endpoint. Each inference unit represents of a throughput of 100 characters
  /// per second.
  ///
  /// Parameter [desiredModelArn] :
  /// The ARN of the new model to use when updating an existing endpoint.
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel
  Future<UpdateEndpointResponse> updateEndpoint({
    required String endpointArn,
    String? desiredDataAccessRoleArn,
    int? desiredInferenceUnits,
    String? desiredModelArn,
    String? flywheelArn,
  }) async {
    _s.validateNumRange(
      'desiredInferenceUnits',
      desiredInferenceUnits,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.UpdateEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointArn': endpointArn,
        if (desiredDataAccessRoleArn != null)
          'DesiredDataAccessRoleArn': desiredDataAccessRoleArn,
        if (desiredInferenceUnits != null)
          'DesiredInferenceUnits': desiredInferenceUnits,
        if (desiredModelArn != null) 'DesiredModelArn': desiredModelArn,
        if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      },
    );

    return UpdateEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Update the configuration information for an existing flywheel.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [KmsKeyValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flywheelArn] :
  /// The Amazon Resource Number (ARN) of the flywheel to update.
  ///
  /// Parameter [activeModelArn] :
  /// The Amazon Resource Number (ARN) of the active model version.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon
  /// Comprehend permission to access the flywheel data.
  ///
  /// Parameter [dataSecurityConfig] :
  /// Flywheel data security configuration.
  Future<UpdateFlywheelResponse> updateFlywheel({
    required String flywheelArn,
    String? activeModelArn,
    String? dataAccessRoleArn,
    UpdateDataSecurityConfig? dataSecurityConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Comprehend_20171127.UpdateFlywheel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlywheelArn': flywheelArn,
        if (activeModelArn != null) 'ActiveModelArn': activeModelArn,
        if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
        if (dataSecurityConfig != null)
          'DataSecurityConfig': dataSecurityConfig,
      },
    );

    return UpdateFlywheelResponse.fromJson(jsonResponse.body);
  }
}

enum AugmentedManifestsDocumentTypeFormat {
  plainTextDocument,
  semiStructuredDocument,
}

extension AugmentedManifestsDocumentTypeFormatValueExtension
    on AugmentedManifestsDocumentTypeFormat {
  String toValue() {
    switch (this) {
      case AugmentedManifestsDocumentTypeFormat.plainTextDocument:
        return 'PLAIN_TEXT_DOCUMENT';
      case AugmentedManifestsDocumentTypeFormat.semiStructuredDocument:
        return 'SEMI_STRUCTURED_DOCUMENT';
    }
  }
}

extension AugmentedManifestsDocumentTypeFormatFromString on String {
  AugmentedManifestsDocumentTypeFormat
      toAugmentedManifestsDocumentTypeFormat() {
    switch (this) {
      case 'PLAIN_TEXT_DOCUMENT':
        return AugmentedManifestsDocumentTypeFormat.plainTextDocument;
      case 'SEMI_STRUCTURED_DOCUMENT':
        return AugmentedManifestsDocumentTypeFormat.semiStructuredDocument;
    }
    throw Exception(
        '$this is not known in enum AugmentedManifestsDocumentTypeFormat');
  }
}

/// An augmented manifest file that provides training data for your custom
/// model. An augmented manifest file is a labeled dataset that is produced by
/// Amazon SageMaker Ground Truth.
class AugmentedManifestsListItem {
  /// The JSON attribute that contains the annotations for your training
  /// documents. The number of attribute names that you specify depends on whether
  /// your augmented manifest file is the output of a single labeling job or a
  /// chained labeling job.
  ///
  /// If your file is the output of a single labeling job, specify the
  /// LabelAttributeName key that was used when the job was created in Ground
  /// Truth.
  ///
  /// If your file is the output of a chained labeling job, specify the
  /// LabelAttributeName key for one or more jobs in the chain. Each
  /// LabelAttributeName key provides the annotations from an individual job.
  final List<String> attributeNames;

  /// The Amazon S3 location of the augmented manifest file.
  final String s3Uri;

  /// The S3 prefix to the annotation files that are referred in the augmented
  /// manifest file.
  final String? annotationDataS3Uri;

  /// The type of augmented manifest. PlainTextDocument or SemiStructuredDocument.
  /// If you don't specify, the default is PlainTextDocument.
  ///
  /// <ul>
  /// <li>
  /// <code>PLAIN_TEXT_DOCUMENT</code> A document type that represents any unicode
  /// text that is encoded in UTF-8.
  /// </li>
  /// <li>
  /// <code>SEMI_STRUCTURED_DOCUMENT</code> A document type with positional and
  /// structural context, like a PDF. For training with Amazon Comprehend, only
  /// PDFs are supported. For inference, Amazon Comprehend support PDFs, DOCX and
  /// TXT.
  /// </li>
  /// </ul>
  final AugmentedManifestsDocumentTypeFormat? documentType;

  /// The S3 prefix to the source files (PDFs) that are referred to in the
  /// augmented manifest file.
  final String? sourceDocumentsS3Uri;

  /// The purpose of the data you've provided in the augmented manifest. You can
  /// either train or test this data. If you don't specify, the default is train.
  ///
  /// TRAIN - all of the documents in the manifest will be used for training. If
  /// no test documents are provided, Amazon Comprehend will automatically reserve
  /// a portion of the training documents for testing.
  ///
  /// TEST - all of the documents in the manifest will be used for testing.
  final Split? split;

  AugmentedManifestsListItem({
    required this.attributeNames,
    required this.s3Uri,
    this.annotationDataS3Uri,
    this.documentType,
    this.sourceDocumentsS3Uri,
    this.split,
  });

  factory AugmentedManifestsListItem.fromJson(Map<String, dynamic> json) {
    return AugmentedManifestsListItem(
      attributeNames: (json['AttributeNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      s3Uri: json['S3Uri'] as String,
      annotationDataS3Uri: json['AnnotationDataS3Uri'] as String?,
      documentType: (json['DocumentType'] as String?)
          ?.toAugmentedManifestsDocumentTypeFormat(),
      sourceDocumentsS3Uri: json['SourceDocumentsS3Uri'] as String?,
      split: (json['Split'] as String?)?.toSplit(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeNames = this.attributeNames;
    final s3Uri = this.s3Uri;
    final annotationDataS3Uri = this.annotationDataS3Uri;
    final documentType = this.documentType;
    final sourceDocumentsS3Uri = this.sourceDocumentsS3Uri;
    final split = this.split;
    return {
      'AttributeNames': attributeNames,
      'S3Uri': s3Uri,
      if (annotationDataS3Uri != null)
        'AnnotationDataS3Uri': annotationDataS3Uri,
      if (documentType != null) 'DocumentType': documentType.toValue(),
      if (sourceDocumentsS3Uri != null)
        'SourceDocumentsS3Uri': sourceDocumentsS3Uri,
      if (split != null) 'Split': split.toValue(),
    };
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectDominantLanguageItemResult {
  /// The zero-based index of the document in the input list.
  final int? index;

  /// One or more <a>DominantLanguage</a> objects describing the dominant
  /// languages in the document.
  final List<DominantLanguage>? languages;

  BatchDetectDominantLanguageItemResult({
    this.index,
    this.languages,
  });

  factory BatchDetectDominantLanguageItemResult.fromJson(
      Map<String, dynamic> json) {
    return BatchDetectDominantLanguageItemResult(
      index: json['Index'] as int?,
      languages: (json['Languages'] as List?)
          ?.whereNotNull()
          .map((e) => DominantLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final languages = this.languages;
    return {
      if (index != null) 'Index': index,
      if (languages != null) 'Languages': languages,
    };
  }
}

class BatchDetectDominantLanguageResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectDominantLanguageItemResult> resultList;

  BatchDetectDominantLanguageResponse({
    required this.errorList,
    required this.resultList,
  });

  factory BatchDetectDominantLanguageResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDetectDominantLanguageResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) => BatchDetectDominantLanguageItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorList = this.errorList;
    final resultList = this.resultList;
    return {
      'ErrorList': errorList,
      'ResultList': resultList,
    };
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectEntitiesItemResult {
  /// One or more <a>Entity</a> objects, one for each entity detected in the
  /// document.
  final List<Entity>? entities;

  /// The zero-based index of the document in the input list.
  final int? index;

  BatchDetectEntitiesItemResult({
    this.entities,
    this.index,
  });

  factory BatchDetectEntitiesItemResult.fromJson(Map<String, dynamic> json) {
    return BatchDetectEntitiesItemResult(
      entities: (json['Entities'] as List?)
          ?.whereNotNull()
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: json['Index'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final index = this.index;
    return {
      if (entities != null) 'Entities': entities,
      if (index != null) 'Index': index,
    };
  }
}

class BatchDetectEntitiesResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectEntitiesItemResult> resultList;

  BatchDetectEntitiesResponse({
    required this.errorList,
    required this.resultList,
  });

  factory BatchDetectEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetectEntitiesResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) =>
              BatchDetectEntitiesItemResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorList = this.errorList;
    final resultList = this.resultList;
    return {
      'ErrorList': errorList,
      'ResultList': resultList,
    };
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectKeyPhrasesItemResult {
  /// The zero-based index of the document in the input list.
  final int? index;

  /// One or more <a>KeyPhrase</a> objects, one for each key phrase detected in
  /// the document.
  final List<KeyPhrase>? keyPhrases;

  BatchDetectKeyPhrasesItemResult({
    this.index,
    this.keyPhrases,
  });

  factory BatchDetectKeyPhrasesItemResult.fromJson(Map<String, dynamic> json) {
    return BatchDetectKeyPhrasesItemResult(
      index: json['Index'] as int?,
      keyPhrases: (json['KeyPhrases'] as List?)
          ?.whereNotNull()
          .map((e) => KeyPhrase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final keyPhrases = this.keyPhrases;
    return {
      if (index != null) 'Index': index,
      if (keyPhrases != null) 'KeyPhrases': keyPhrases,
    };
  }
}

class BatchDetectKeyPhrasesResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectKeyPhrasesItemResult> resultList;

  BatchDetectKeyPhrasesResponse({
    required this.errorList,
    required this.resultList,
  });

  factory BatchDetectKeyPhrasesResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetectKeyPhrasesResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) => BatchDetectKeyPhrasesItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorList = this.errorList;
    final resultList = this.resultList;
    return {
      'ErrorList': errorList,
      'ResultList': resultList,
    };
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectSentimentItemResult {
  /// The zero-based index of the document in the input list.
  final int? index;

  /// The sentiment detected in the document.
  final SentimentType? sentiment;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// sentiment detection.
  final SentimentScore? sentimentScore;

  BatchDetectSentimentItemResult({
    this.index,
    this.sentiment,
    this.sentimentScore,
  });

  factory BatchDetectSentimentItemResult.fromJson(Map<String, dynamic> json) {
    return BatchDetectSentimentItemResult(
      index: json['Index'] as int?,
      sentiment: (json['Sentiment'] as String?)?.toSentimentType(),
      sentimentScore: json['SentimentScore'] != null
          ? SentimentScore.fromJson(
              json['SentimentScore'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final sentiment = this.sentiment;
    final sentimentScore = this.sentimentScore;
    return {
      if (index != null) 'Index': index,
      if (sentiment != null) 'Sentiment': sentiment.toValue(),
      if (sentimentScore != null) 'SentimentScore': sentimentScore,
    };
  }
}

class BatchDetectSentimentResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectSentimentItemResult> resultList;

  BatchDetectSentimentResponse({
    required this.errorList,
    required this.resultList,
  });

  factory BatchDetectSentimentResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetectSentimentResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) => BatchDetectSentimentItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorList = this.errorList;
    final resultList = this.resultList;
    return {
      'ErrorList': errorList,
      'ResultList': resultList,
    };
  }
}

/// The result of calling the operation. The operation returns one object that
/// is successfully processed by the operation.
class BatchDetectSyntaxItemResult {
  /// The zero-based index of the document in the input list.
  final int? index;

  /// The syntax tokens for the words in the document, one token for each word.
  final List<SyntaxToken>? syntaxTokens;

  BatchDetectSyntaxItemResult({
    this.index,
    this.syntaxTokens,
  });

  factory BatchDetectSyntaxItemResult.fromJson(Map<String, dynamic> json) {
    return BatchDetectSyntaxItemResult(
      index: json['Index'] as int?,
      syntaxTokens: (json['SyntaxTokens'] as List?)
          ?.whereNotNull()
          .map((e) => SyntaxToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final syntaxTokens = this.syntaxTokens;
    return {
      if (index != null) 'Index': index,
      if (syntaxTokens != null) 'SyntaxTokens': syntaxTokens,
    };
  }
}

class BatchDetectSyntaxResponse {
  /// A list containing one object for each document that contained an error. The
  /// results are sorted in ascending order by the <code>Index</code> field and
  /// match the order of the documents in the input list. If there are no errors
  /// in the batch, the <code>ErrorList</code> is empty.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectSyntaxItemResult> resultList;

  BatchDetectSyntaxResponse({
    required this.errorList,
    required this.resultList,
  });

  factory BatchDetectSyntaxResponse.fromJson(Map<String, dynamic> json) {
    return BatchDetectSyntaxResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) =>
              BatchDetectSyntaxItemResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorList = this.errorList;
    final resultList = this.resultList;
    return {
      'ErrorList': errorList,
      'ResultList': resultList,
    };
  }
}

/// Analysis results for one of the documents in the batch.
class BatchDetectTargetedSentimentItemResult {
  /// An array of targeted sentiment entities.
  final List<TargetedSentimentEntity>? entities;

  /// The zero-based index of this result in the input list.
  final int? index;

  BatchDetectTargetedSentimentItemResult({
    this.entities,
    this.index,
  });

  factory BatchDetectTargetedSentimentItemResult.fromJson(
      Map<String, dynamic> json) {
    return BatchDetectTargetedSentimentItemResult(
      entities: (json['Entities'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TargetedSentimentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: json['Index'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final index = this.index;
    return {
      if (entities != null) 'Entities': entities,
      if (index != null) 'Index': index,
    };
  }
}

class BatchDetectTargetedSentimentResponse {
  /// List of errors that the operation can return.
  final List<BatchItemError> errorList;

  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the <code>Index</code> field and match the
  /// order of the documents in the input list. If all of the documents contain an
  /// error, the <code>ResultList</code> is empty.
  final List<BatchDetectTargetedSentimentItemResult> resultList;

  BatchDetectTargetedSentimentResponse({
    required this.errorList,
    required this.resultList,
  });

  factory BatchDetectTargetedSentimentResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDetectTargetedSentimentResponse(
      errorList: (json['ErrorList'] as List)
          .whereNotNull()
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .whereNotNull()
          .map((e) => BatchDetectTargetedSentimentItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorList = this.errorList;
    final resultList = this.resultList;
    return {
      'ErrorList': errorList,
      'ResultList': resultList,
    };
  }
}

/// Describes an error that occurred while processing a document in a batch. The
/// operation returns on <code>BatchItemError</code> object for each document
/// that contained an error.
class BatchItemError {
  /// The numeric error code of the error.
  final String? errorCode;

  /// A text description of the error.
  final String? errorMessage;

  /// The zero-based index of the document in the input list.
  final int? index;

  BatchItemError({
    this.errorCode,
    this.errorMessage,
    this.index,
  });

  factory BatchItemError.fromJson(Map<String, dynamic> json) {
    return BatchItemError(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      index: json['Index'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final index = this.index;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (index != null) 'Index': index,
    };
  }
}

/// Information about each word or line of text in the input document.
///
/// For additional information, see <a
/// href="https://docs.aws.amazon.com/textract/latest/dg/API_Block.html">Block</a>
/// in the Amazon Textract API reference.
class Block {
  /// The block represents a line of text or one word of text.
  ///
  /// <ul>
  /// <li>
  /// WORD - A word that's detected on a document page. A word is one or more ISO
  /// basic Latin script characters that aren't separated by spaces.
  /// </li>
  /// <li>
  /// LINE - A string of tab-delimited, contiguous words that are detected on a
  /// document page
  /// </li>
  /// </ul>
  final BlockType? blockType;

  /// Co-ordinates of the rectangle or polygon that contains the text.
  final Geometry? geometry;

  /// Unique identifier for the block.
  final String? id;

  /// Page number where the block appears.
  final int? page;

  /// A list of child blocks of the current block. For example, a LINE object has
  /// child blocks for each WORD block that's part of the line of text.
  final List<RelationshipsListItem>? relationships;

  /// The word or line of text extracted from the block.
  final String? text;

  Block({
    this.blockType,
    this.geometry,
    this.id,
    this.page,
    this.relationships,
    this.text,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      blockType: (json['BlockType'] as String?)?.toBlockType(),
      geometry: json['Geometry'] != null
          ? Geometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      page: json['Page'] as int?,
      relationships: (json['Relationships'] as List?)
          ?.whereNotNull()
          .map((e) => RelationshipsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['Text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockType = this.blockType;
    final geometry = this.geometry;
    final id = this.id;
    final page = this.page;
    final relationships = this.relationships;
    final text = this.text;
    return {
      if (blockType != null) 'BlockType': blockType.toValue(),
      if (geometry != null) 'Geometry': geometry,
      if (id != null) 'Id': id,
      if (page != null) 'Page': page,
      if (relationships != null) 'Relationships': relationships,
      if (text != null) 'Text': text,
    };
  }
}

/// A reference to a block.
class BlockReference {
  /// Offset of the start of the block within its parent block.
  final int? beginOffset;

  /// Unique identifier for the block.
  final String? blockId;

  /// List of child blocks within this block.
  final List<ChildBlock>? childBlocks;

  /// Offset of the end of the block within its parent block.
  final int? endOffset;

  BlockReference({
    this.beginOffset,
    this.blockId,
    this.childBlocks,
    this.endOffset,
  });

  factory BlockReference.fromJson(Map<String, dynamic> json) {
    return BlockReference(
      beginOffset: json['BeginOffset'] as int?,
      blockId: json['BlockId'] as String?,
      childBlocks: (json['ChildBlocks'] as List?)
          ?.whereNotNull()
          .map((e) => ChildBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      endOffset: json['EndOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final blockId = this.blockId;
    final childBlocks = this.childBlocks;
    final endOffset = this.endOffset;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (blockId != null) 'BlockId': blockId,
      if (childBlocks != null) 'ChildBlocks': childBlocks,
      if (endOffset != null) 'EndOffset': endOffset,
    };
  }
}

enum BlockType {
  line,
  word,
}

extension BlockTypeValueExtension on BlockType {
  String toValue() {
    switch (this) {
      case BlockType.line:
        return 'LINE';
      case BlockType.word:
        return 'WORD';
    }
  }
}

extension BlockTypeFromString on String {
  BlockType toBlockType() {
    switch (this) {
      case 'LINE':
        return BlockType.line;
      case 'WORD':
        return BlockType.word;
    }
    throw Exception('$this is not known in enum BlockType');
  }
}

/// The bounding box around the detected page or around an element on a document
/// page. The left (x-coordinate) and top (y-coordinate) are coordinates that
/// represent the top and left sides of the bounding box. Note that the
/// upper-left corner of the image is the origin (0,0).
///
/// For additional information, see <a
/// href="https://docs.aws.amazon.com/textract/latest/dg/API_BoundingBox.html">BoundingBox</a>
/// in the Amazon Textract API reference.
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

/// Nested block contained within a block.
class ChildBlock {
  /// Offset of the start of the child block within its parent block.
  final int? beginOffset;

  /// Unique identifier for the child block.
  final String? childBlockId;

  /// Offset of the end of the child block within its parent block.
  final int? endOffset;

  ChildBlock({
    this.beginOffset,
    this.childBlockId,
    this.endOffset,
  });

  factory ChildBlock.fromJson(Map<String, dynamic> json) {
    return ChildBlock(
      beginOffset: json['BeginOffset'] as int?,
      childBlockId: json['ChildBlockId'] as String?,
      endOffset: json['EndOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final childBlockId = this.childBlockId;
    final endOffset = this.endOffset;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (childBlockId != null) 'ChildBlockId': childBlockId,
      if (endOffset != null) 'EndOffset': endOffset,
    };
  }
}

/// Describes the result metrics for the test data associated with an
/// documentation classifier.
class ClassifierEvaluationMetrics {
  /// The fraction of the labels that were correct recognized. It is computed by
  /// dividing the number of labels in the test documents that were correctly
  /// recognized by the total number of labels in the test documents.
  final double? accuracy;

  /// A measure of how accurate the classifier results are for the test data. It
  /// is derived from the <code>Precision</code> and <code>Recall</code> values.
  /// The <code>F1Score</code> is the harmonic average of the two scores. The
  /// highest score is 1, and the worst score is 0.
  final double? f1Score;

  /// Indicates the fraction of labels that are incorrectly predicted. Also seen
  /// as the fraction of wrong labels compared to the total number of labels.
  /// Scores closer to zero are better.
  final double? hammingLoss;

  /// A measure of how accurate the classifier results are for the test data. It
  /// is a combination of the <code>Micro Precision</code> and <code>Micro
  /// Recall</code> values. The <code>Micro F1Score</code> is the harmonic mean of
  /// the two scores. The highest score is 1, and the worst score is 0.
  final double? microF1Score;

  /// A measure of the usefulness of the recognizer results in the test data. High
  /// precision means that the recognizer returned substantially more relevant
  /// results than irrelevant ones. Unlike the Precision metric which comes from
  /// averaging the precision of all available labels, this is based on the
  /// overall score of all precision scores added together.
  final double? microPrecision;

  /// A measure of how complete the classifier results are for the test data. High
  /// recall means that the classifier returned most of the relevant results.
  /// Specifically, this indicates how many of the correct categories in the text
  /// that the model can predict. It is a percentage of correct categories in the
  /// text that can found. Instead of averaging the recall scores of all labels
  /// (as with Recall), micro Recall is based on the overall score of all recall
  /// scores added together.
  final double? microRecall;

  /// A measure of the usefulness of the classifier results in the test data. High
  /// precision means that the classifier returned substantially more relevant
  /// results than irrelevant ones.
  final double? precision;

  /// A measure of how complete the classifier results are for the test data. High
  /// recall means that the classifier returned most of the relevant results.
  final double? recall;

  ClassifierEvaluationMetrics({
    this.accuracy,
    this.f1Score,
    this.hammingLoss,
    this.microF1Score,
    this.microPrecision,
    this.microRecall,
    this.precision,
    this.recall,
  });

  factory ClassifierEvaluationMetrics.fromJson(Map<String, dynamic> json) {
    return ClassifierEvaluationMetrics(
      accuracy: json['Accuracy'] as double?,
      f1Score: json['F1Score'] as double?,
      hammingLoss: json['HammingLoss'] as double?,
      microF1Score: json['MicroF1Score'] as double?,
      microPrecision: json['MicroPrecision'] as double?,
      microRecall: json['MicroRecall'] as double?,
      precision: json['Precision'] as double?,
      recall: json['Recall'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final accuracy = this.accuracy;
    final f1Score = this.f1Score;
    final hammingLoss = this.hammingLoss;
    final microF1Score = this.microF1Score;
    final microPrecision = this.microPrecision;
    final microRecall = this.microRecall;
    final precision = this.precision;
    final recall = this.recall;
    return {
      if (accuracy != null) 'Accuracy': accuracy,
      if (f1Score != null) 'F1Score': f1Score,
      if (hammingLoss != null) 'HammingLoss': hammingLoss,
      if (microF1Score != null) 'MicroF1Score': microF1Score,
      if (microPrecision != null) 'MicroPrecision': microPrecision,
      if (microRecall != null) 'MicroRecall': microRecall,
      if (precision != null) 'Precision': precision,
      if (recall != null) 'Recall': recall,
    };
  }
}

/// Provides information about a document classifier.
class ClassifierMetadata {
  /// Describes the result metrics for the test data associated with an
  /// documentation classifier.
  final ClassifierEvaluationMetrics? evaluationMetrics;

  /// The number of labels in the input data.
  final int? numberOfLabels;

  /// The number of documents in the input data that were used to test the
  /// classifier. Typically this is 10 to 20 percent of the input documents, up to
  /// 10,000 documents.
  final int? numberOfTestDocuments;

  /// The number of documents in the input data that were used to train the
  /// classifier. Typically this is 80 to 90 percent of the input documents.
  final int? numberOfTrainedDocuments;

  ClassifierMetadata({
    this.evaluationMetrics,
    this.numberOfLabels,
    this.numberOfTestDocuments,
    this.numberOfTrainedDocuments,
  });

  factory ClassifierMetadata.fromJson(Map<String, dynamic> json) {
    return ClassifierMetadata(
      evaluationMetrics: json['EvaluationMetrics'] != null
          ? ClassifierEvaluationMetrics.fromJson(
              json['EvaluationMetrics'] as Map<String, dynamic>)
          : null,
      numberOfLabels: json['NumberOfLabels'] as int?,
      numberOfTestDocuments: json['NumberOfTestDocuments'] as int?,
      numberOfTrainedDocuments: json['NumberOfTrainedDocuments'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationMetrics = this.evaluationMetrics;
    final numberOfLabels = this.numberOfLabels;
    final numberOfTestDocuments = this.numberOfTestDocuments;
    final numberOfTrainedDocuments = this.numberOfTrainedDocuments;
    return {
      if (evaluationMetrics != null) 'EvaluationMetrics': evaluationMetrics,
      if (numberOfLabels != null) 'NumberOfLabels': numberOfLabels,
      if (numberOfTestDocuments != null)
        'NumberOfTestDocuments': numberOfTestDocuments,
      if (numberOfTrainedDocuments != null)
        'NumberOfTrainedDocuments': numberOfTrainedDocuments,
    };
  }
}

class ClassifyDocumentResponse {
  /// The classes used by the document being analyzed. These are used for models
  /// trained in multi-class mode. Individual classes are mutually exclusive and
  /// each document is expected to have only a single class assigned to it. For
  /// example, an animal can be a dog or a cat, but not both at the same time.
  ///
  /// For prompt safety classification, the response includes only two classes
  /// (SAFE_PROMPT and UNSAFE_PROMPT), along with a confidence score for each
  /// class. The value range of the score is zero to one, where one is the highest
  /// confidence.
  final List<DocumentClass>? classes;

  /// Extraction information about the document. This field is present in the
  /// response only if your request includes the <code>Byte</code> parameter.
  final DocumentMetadata? documentMetadata;

  /// The document type for each page in the input document. This field is present
  /// in the response only if your request includes the <code>Byte</code>
  /// parameter.
  final List<DocumentTypeListItem>? documentType;

  /// Page-level errors that the system detected while processing the input
  /// document. The field is empty if the system encountered no errors.
  final List<ErrorsListItem>? errors;

  /// The labels used in the document being analyzed. These are used for
  /// multi-label trained models. Individual labels represent different categories
  /// that are related in some manner and are not mutually exclusive. For example,
  /// a movie can be just an action movie, or it can be an action movie, a science
  /// fiction movie, and a comedy, all at the same time.
  final List<DocumentLabel>? labels;

  /// Warnings detected while processing the input document. The response includes
  /// a warning if there is a mismatch between the input document type and the
  /// model type associated with the endpoint that you specified. The response can
  /// also include warnings for individual pages that have a mismatch.
  ///
  /// The field is empty if the system generated no warnings.
  final List<WarningsListItem>? warnings;

  ClassifyDocumentResponse({
    this.classes,
    this.documentMetadata,
    this.documentType,
    this.errors,
    this.labels,
    this.warnings,
  });

  factory ClassifyDocumentResponse.fromJson(Map<String, dynamic> json) {
    return ClassifyDocumentResponse(
      classes: (json['Classes'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentClass.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      documentType: (json['DocumentType'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentTypeListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      warnings: (json['Warnings'] as List?)
          ?.whereNotNull()
          .map((e) => WarningsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final classes = this.classes;
    final documentMetadata = this.documentMetadata;
    final documentType = this.documentType;
    final errors = this.errors;
    final labels = this.labels;
    final warnings = this.warnings;
    return {
      if (classes != null) 'Classes': classes,
      if (documentMetadata != null) 'DocumentMetadata': documentMetadata,
      if (documentType != null) 'DocumentType': documentType,
      if (errors != null) 'Errors': errors,
      if (labels != null) 'Labels': labels,
      if (warnings != null) 'Warnings': warnings,
    };
  }
}

class ContainsPiiEntitiesResponse {
  /// The labels used in the document being analyzed. Individual labels represent
  /// personally identifiable information (PII) entity types.
  final List<EntityLabel>? labels;

  ContainsPiiEntitiesResponse({
    this.labels,
  });

  factory ContainsPiiEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return ContainsPiiEntitiesResponse(
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => EntityLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final labels = this.labels;
    return {
      if (labels != null) 'Labels': labels,
    };
  }
}

class CreateDatasetResponse {
  /// The ARN of the dataset.
  final String? datasetArn;

  CreateDatasetResponse({
    this.datasetArn,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      datasetArn: json['DatasetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    return {
      if (datasetArn != null) 'DatasetArn': datasetArn,
    };
  }
}

class CreateDocumentClassifierResponse {
  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String? documentClassifierArn;

  CreateDocumentClassifierResponse({
    this.documentClassifierArn,
  });

  factory CreateDocumentClassifierResponse.fromJson(Map<String, dynamic> json) {
    return CreateDocumentClassifierResponse(
      documentClassifierArn: json['DocumentClassifierArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentClassifierArn = this.documentClassifierArn;
    return {
      if (documentClassifierArn != null)
        'DocumentClassifierArn': documentClassifierArn,
    };
  }
}

class CreateEndpointResponse {
  /// The Amazon Resource Number (ARN) of the endpoint being created.
  final String? endpointArn;

  /// The Amazon Resource Number (ARN) of the model to which the endpoint is
  /// attached.
  final String? modelArn;

  CreateEndpointResponse({
    this.endpointArn,
    this.modelArn,
  });

  factory CreateEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateEndpointResponse(
      endpointArn: json['EndpointArn'] as String?,
      modelArn: json['ModelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointArn = this.endpointArn;
    final modelArn = this.modelArn;
    return {
      if (endpointArn != null) 'EndpointArn': endpointArn,
      if (modelArn != null) 'ModelArn': modelArn,
    };
  }
}

class CreateEntityRecognizerResponse {
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String? entityRecognizerArn;

  CreateEntityRecognizerResponse({
    this.entityRecognizerArn,
  });

  factory CreateEntityRecognizerResponse.fromJson(Map<String, dynamic> json) {
    return CreateEntityRecognizerResponse(
      entityRecognizerArn: json['EntityRecognizerArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityRecognizerArn = this.entityRecognizerArn;
    return {
      if (entityRecognizerArn != null)
        'EntityRecognizerArn': entityRecognizerArn,
    };
  }
}

class CreateFlywheelResponse {
  /// The Amazon Resource Number (ARN) of the active model version.
  final String? activeModelArn;

  /// The Amazon Resource Number (ARN) of the flywheel.
  final String? flywheelArn;

  CreateFlywheelResponse({
    this.activeModelArn,
    this.flywheelArn,
  });

  factory CreateFlywheelResponse.fromJson(Map<String, dynamic> json) {
    return CreateFlywheelResponse(
      activeModelArn: json['ActiveModelArn'] as String?,
      flywheelArn: json['FlywheelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeModelArn = this.activeModelArn;
    final flywheelArn = this.flywheelArn;
    return {
      if (activeModelArn != null) 'ActiveModelArn': activeModelArn,
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
    };
  }
}

/// Data security configuration.
class DataSecurityConfig {
  /// ID for the KMS key that Amazon Comprehend uses to encrypt the data in the
  /// data lake.
  final String? dataLakeKmsKeyId;

  /// ID for the KMS key that Amazon Comprehend uses to encrypt trained custom
  /// models. The ModelKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? modelKmsKeyId;

  /// ID for the KMS key that Amazon Comprehend uses to encrypt the volume.
  final String? volumeKmsKeyId;
  final VpcConfig? vpcConfig;

  DataSecurityConfig({
    this.dataLakeKmsKeyId,
    this.modelKmsKeyId,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory DataSecurityConfig.fromJson(Map<String, dynamic> json) {
    return DataSecurityConfig(
      dataLakeKmsKeyId: json['DataLakeKmsKeyId'] as String?,
      modelKmsKeyId: json['ModelKmsKeyId'] as String?,
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakeKmsKeyId = this.dataLakeKmsKeyId;
    final modelKmsKeyId = this.modelKmsKeyId;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataLakeKmsKeyId != null) 'DataLakeKmsKeyId': dataLakeKmsKeyId,
      if (modelKmsKeyId != null) 'ModelKmsKeyId': modelKmsKeyId,
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// An augmented manifest file that provides training data for your custom
/// model. An augmented manifest file is a labeled dataset that is produced by
/// Amazon SageMaker Ground Truth.
class DatasetAugmentedManifestsListItem {
  /// The JSON attribute that contains the annotations for your training
  /// documents. The number of attribute names that you specify depends on whether
  /// your augmented manifest file is the output of a single labeling job or a
  /// chained labeling job.
  ///
  /// If your file is the output of a single labeling job, specify the
  /// LabelAttributeName key that was used when the job was created in Ground
  /// Truth.
  ///
  /// If your file is the output of a chained labeling job, specify the
  /// LabelAttributeName key for one or more jobs in the chain. Each
  /// LabelAttributeName key provides the annotations from an individual job.
  final List<String> attributeNames;

  /// The Amazon S3 location of the augmented manifest file.
  final String s3Uri;

  /// The S3 prefix to the annotation files that are referred in the augmented
  /// manifest file.
  final String? annotationDataS3Uri;

  /// The type of augmented manifest. If you don't specify, the default is
  /// PlainTextDocument.
  ///
  /// <code>PLAIN_TEXT_DOCUMENT</code> A document type that represents any unicode
  /// text that is encoded in UTF-8.
  final AugmentedManifestsDocumentTypeFormat? documentType;

  /// The S3 prefix to the source files (PDFs) that are referred to in the
  /// augmented manifest file.
  final String? sourceDocumentsS3Uri;

  DatasetAugmentedManifestsListItem({
    required this.attributeNames,
    required this.s3Uri,
    this.annotationDataS3Uri,
    this.documentType,
    this.sourceDocumentsS3Uri,
  });

  Map<String, dynamic> toJson() {
    final attributeNames = this.attributeNames;
    final s3Uri = this.s3Uri;
    final annotationDataS3Uri = this.annotationDataS3Uri;
    final documentType = this.documentType;
    final sourceDocumentsS3Uri = this.sourceDocumentsS3Uri;
    return {
      'AttributeNames': attributeNames,
      'S3Uri': s3Uri,
      if (annotationDataS3Uri != null)
        'AnnotationDataS3Uri': annotationDataS3Uri,
      if (documentType != null) 'DocumentType': documentType.toValue(),
      if (sourceDocumentsS3Uri != null)
        'SourceDocumentsS3Uri': sourceDocumentsS3Uri,
    };
  }
}

enum DatasetDataFormat {
  comprehendCsv,
  augmentedManifest,
}

extension DatasetDataFormatValueExtension on DatasetDataFormat {
  String toValue() {
    switch (this) {
      case DatasetDataFormat.comprehendCsv:
        return 'COMPREHEND_CSV';
      case DatasetDataFormat.augmentedManifest:
        return 'AUGMENTED_MANIFEST';
    }
  }
}

extension DatasetDataFormatFromString on String {
  DatasetDataFormat toDatasetDataFormat() {
    switch (this) {
      case 'COMPREHEND_CSV':
        return DatasetDataFormat.comprehendCsv;
      case 'AUGMENTED_MANIFEST':
        return DatasetDataFormat.augmentedManifest;
    }
    throw Exception('$this is not known in enum DatasetDataFormat');
  }
}

/// Describes the dataset input data configuration for a document classifier
/// model.
///
/// For more information on how the input file is formatted, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/prep-classifier-data.html">Preparing
/// training data</a> in the Comprehend Developer Guide.
class DatasetDocumentClassifierInputDataConfig {
  /// The Amazon S3 URI for the input data. The S3 bucket must be in the same
  /// Region as the API endpoint that you are calling. The URI can point to a
  /// single input file or it can provide the prefix for a collection of input
  /// files.
  ///
  /// For example, if you use the URI <code>S3://bucketName/prefix</code>, if the
  /// prefix is a single file, Amazon Comprehend uses that file as input. If more
  /// than one file begins with the prefix, Amazon Comprehend uses all of them as
  /// input.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>COMPREHEND_CSV</code>.
  final String s3Uri;

  /// Indicates the delimiter used to separate each label for training a
  /// multi-label classifier. The default delimiter between labels is a pipe (|).
  /// You can use a different character as a delimiter (if it's an allowed
  /// character) by specifying it under Delimiter for labels. If the training
  /// documents use a delimiter other than the default or the delimiter you
  /// specify, the labels on that line will be combined to make a single unique
  /// label, such as LABELLABELLABEL.
  final String? labelDelimiter;

  DatasetDocumentClassifierInputDataConfig({
    required this.s3Uri,
    this.labelDelimiter,
  });

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final labelDelimiter = this.labelDelimiter;
    return {
      'S3Uri': s3Uri,
      if (labelDelimiter != null) 'LabelDelimiter': labelDelimiter,
    };
  }
}

/// Describes the annotations associated with a entity recognizer.
class DatasetEntityRecognizerAnnotations {
  /// Specifies the Amazon S3 location where the training documents for an entity
  /// recognizer are located. The URI must be in the same Region as the API
  /// endpoint that you are calling.
  final String s3Uri;

  DatasetEntityRecognizerAnnotations({
    required this.s3Uri,
  });

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      'S3Uri': s3Uri,
    };
  }
}

/// Describes the documents submitted with a dataset for an entity recognizer
/// model.
class DatasetEntityRecognizerDocuments {
  /// Specifies the Amazon S3 location where the documents for the dataset are
  /// located.
  final String s3Uri;

  /// Specifies how the text in an input file should be processed. This is
  /// optional, and the default is ONE_DOC_PER_LINE. ONE_DOC_PER_FILE - Each file
  /// is considered a separate document. Use this option when you are processing
  /// large documents, such as newspaper articles or scientific papers.
  /// ONE_DOC_PER_LINE - Each line in a file is considered a separate document.
  /// Use this option when you are processing many short documents, such as text
  /// messages.
  final InputFormat? inputFormat;

  DatasetEntityRecognizerDocuments({
    required this.s3Uri,
    this.inputFormat,
  });

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final inputFormat = this.inputFormat;
    return {
      'S3Uri': s3Uri,
      if (inputFormat != null) 'InputFormat': inputFormat.toValue(),
    };
  }
}

/// Describes the dataset entity list for an entity recognizer model.
///
/// For more information on how the input file is formatted, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/prep-training-data-cer.html">Preparing
/// training data</a> in the Comprehend Developer Guide.
class DatasetEntityRecognizerEntityList {
  /// Specifies the Amazon S3 location where the entity list is located.
  final String s3Uri;

  DatasetEntityRecognizerEntityList({
    required this.s3Uri,
  });

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      'S3Uri': s3Uri,
    };
  }
}

/// Specifies the format and location of the input data. You must provide either
/// the <code>Annotations</code> parameter or the <code>EntityList</code>
/// parameter.
class DatasetEntityRecognizerInputDataConfig {
  /// The format and location of the training documents for your custom entity
  /// recognizer.
  final DatasetEntityRecognizerDocuments documents;

  /// The S3 location of the annotation documents for your custom entity
  /// recognizer.
  final DatasetEntityRecognizerAnnotations? annotations;

  /// The S3 location of the entity list for your custom entity recognizer.
  final DatasetEntityRecognizerEntityList? entityList;

  DatasetEntityRecognizerInputDataConfig({
    required this.documents,
    this.annotations,
    this.entityList,
  });

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    final annotations = this.annotations;
    final entityList = this.entityList;
    return {
      'Documents': documents,
      if (annotations != null) 'Annotations': annotations,
      if (entityList != null) 'EntityList': entityList,
    };
  }
}

/// Filter the datasets based on creation time or dataset status.
class DatasetFilter {
  /// Filter the datasets to include datasets created after the specified time.
  final DateTime? creationTimeAfter;

  /// Filter the datasets to include datasets created before the specified time.
  final DateTime? creationTimeBefore;

  /// Filter the datasets based on the dataset type.
  final DatasetType? datasetType;

  /// Filter the datasets based on the dataset status.
  final DatasetStatus? status;

  DatasetFilter({
    this.creationTimeAfter,
    this.creationTimeBefore,
    this.datasetType,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final creationTimeAfter = this.creationTimeAfter;
    final creationTimeBefore = this.creationTimeBefore;
    final datasetType = this.datasetType;
    final status = this.status;
    return {
      if (creationTimeAfter != null)
        'CreationTimeAfter': unixTimestampToJson(creationTimeAfter),
      if (creationTimeBefore != null)
        'CreationTimeBefore': unixTimestampToJson(creationTimeBefore),
      if (datasetType != null) 'DatasetType': datasetType.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Specifies the format and location of the input data for the dataset.
class DatasetInputDataConfig {
  /// A list of augmented manifest files that provide training data for your
  /// custom model. An augmented manifest file is a labeled dataset that is
  /// produced by Amazon SageMaker Ground Truth.
  final List<DatasetAugmentedManifestsListItem>? augmentedManifests;

  /// <code>COMPREHEND_CSV</code>: The data format is a two-column CSV file, where
  /// the first column contains labels and the second column contains documents.
  ///
  /// <code>AUGMENTED_MANIFEST</code>: The data format
  final DatasetDataFormat? dataFormat;

  /// The input properties for training a document classifier model.
  ///
  /// For more information on how the input file is formatted, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/prep-classifier-data.html">Preparing
  /// training data</a> in the Comprehend Developer Guide.
  final DatasetDocumentClassifierInputDataConfig?
      documentClassifierInputDataConfig;

  /// The input properties for training an entity recognizer model.
  final DatasetEntityRecognizerInputDataConfig? entityRecognizerInputDataConfig;

  DatasetInputDataConfig({
    this.augmentedManifests,
    this.dataFormat,
    this.documentClassifierInputDataConfig,
    this.entityRecognizerInputDataConfig,
  });

  Map<String, dynamic> toJson() {
    final augmentedManifests = this.augmentedManifests;
    final dataFormat = this.dataFormat;
    final documentClassifierInputDataConfig =
        this.documentClassifierInputDataConfig;
    final entityRecognizerInputDataConfig =
        this.entityRecognizerInputDataConfig;
    return {
      if (augmentedManifests != null) 'AugmentedManifests': augmentedManifests,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (documentClassifierInputDataConfig != null)
        'DocumentClassifierInputDataConfig': documentClassifierInputDataConfig,
      if (entityRecognizerInputDataConfig != null)
        'EntityRecognizerInputDataConfig': entityRecognizerInputDataConfig,
    };
  }
}

/// Properties associated with the dataset.
class DatasetProperties {
  /// Creation time of the dataset.
  final DateTime? creationTime;

  /// The ARN of the dataset.
  final String? datasetArn;

  /// The name of the dataset.
  final String? datasetName;

  /// The S3 URI where the dataset is stored.
  final String? datasetS3Uri;

  /// The dataset type (training data or test data).
  final DatasetType? datasetType;

  /// Description of the dataset.
  final String? description;

  /// Time when the data from the dataset becomes available in the data lake.
  final DateTime? endTime;

  /// A description of the status of the dataset.
  final String? message;

  /// The number of documents in the dataset.
  final int? numberOfDocuments;

  /// The dataset status. While the system creates the dataset, the status is
  /// <code>CREATING</code>. When the dataset is ready to use, the status changes
  /// to <code>COMPLETED</code>.
  final DatasetStatus? status;

  DatasetProperties({
    this.creationTime,
    this.datasetArn,
    this.datasetName,
    this.datasetS3Uri,
    this.datasetType,
    this.description,
    this.endTime,
    this.message,
    this.numberOfDocuments,
    this.status,
  });

  factory DatasetProperties.fromJson(Map<String, dynamic> json) {
    return DatasetProperties(
      creationTime: timeStampFromJson(json['CreationTime']),
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      datasetS3Uri: json['DatasetS3Uri'] as String?,
      datasetType: (json['DatasetType'] as String?)?.toDatasetType(),
      description: json['Description'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      message: json['Message'] as String?,
      numberOfDocuments: json['NumberOfDocuments'] as int?,
      status: (json['Status'] as String?)?.toDatasetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final datasetS3Uri = this.datasetS3Uri;
    final datasetType = this.datasetType;
    final description = this.description;
    final endTime = this.endTime;
    final message = this.message;
    final numberOfDocuments = this.numberOfDocuments;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (datasetS3Uri != null) 'DatasetS3Uri': datasetS3Uri,
      if (datasetType != null) 'DatasetType': datasetType.toValue(),
      if (description != null) 'Description': description,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (message != null) 'Message': message,
      if (numberOfDocuments != null) 'NumberOfDocuments': numberOfDocuments,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum DatasetStatus {
  creating,
  completed,
  failed,
}

extension DatasetStatusValueExtension on DatasetStatus {
  String toValue() {
    switch (this) {
      case DatasetStatus.creating:
        return 'CREATING';
      case DatasetStatus.completed:
        return 'COMPLETED';
      case DatasetStatus.failed:
        return 'FAILED';
    }
  }
}

extension DatasetStatusFromString on String {
  DatasetStatus toDatasetStatus() {
    switch (this) {
      case 'CREATING':
        return DatasetStatus.creating;
      case 'COMPLETED':
        return DatasetStatus.completed;
      case 'FAILED':
        return DatasetStatus.failed;
    }
    throw Exception('$this is not known in enum DatasetStatus');
  }
}

enum DatasetType {
  train,
  test,
}

extension DatasetTypeValueExtension on DatasetType {
  String toValue() {
    switch (this) {
      case DatasetType.train:
        return 'TRAIN';
      case DatasetType.test:
        return 'TEST';
    }
  }
}

extension DatasetTypeFromString on String {
  DatasetType toDatasetType() {
    switch (this) {
      case 'TRAIN':
        return DatasetType.train;
      case 'TEST':
        return DatasetType.test;
    }
    throw Exception('$this is not known in enum DatasetType');
  }
}

class DeleteDocumentClassifierResponse {
  DeleteDocumentClassifierResponse();

  factory DeleteDocumentClassifierResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDocumentClassifierResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEndpointResponse {
  DeleteEndpointResponse();

  factory DeleteEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEntityRecognizerResponse {
  DeleteEntityRecognizerResponse();

  factory DeleteEntityRecognizerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEntityRecognizerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFlywheelResponse {
  DeleteFlywheelResponse();

  factory DeleteFlywheelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFlywheelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeDatasetResponse {
  /// The dataset properties.
  final DatasetProperties? datasetProperties;

  DescribeDatasetResponse({
    this.datasetProperties,
  });

  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetResponse(
      datasetProperties: json['DatasetProperties'] != null
          ? DatasetProperties.fromJson(
              json['DatasetProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetProperties = this.datasetProperties;
    return {
      if (datasetProperties != null) 'DatasetProperties': datasetProperties,
    };
  }
}

class DescribeDocumentClassificationJobResponse {
  /// An object that describes the properties associated with the document
  /// classification job.
  final DocumentClassificationJobProperties?
      documentClassificationJobProperties;

  DescribeDocumentClassificationJobResponse({
    this.documentClassificationJobProperties,
  });

  factory DescribeDocumentClassificationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDocumentClassificationJobResponse(
      documentClassificationJobProperties:
          json['DocumentClassificationJobProperties'] != null
              ? DocumentClassificationJobProperties.fromJson(
                  json['DocumentClassificationJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final documentClassificationJobProperties =
        this.documentClassificationJobProperties;
    return {
      if (documentClassificationJobProperties != null)
        'DocumentClassificationJobProperties':
            documentClassificationJobProperties,
    };
  }
}

class DescribeDocumentClassifierResponse {
  /// An object that contains the properties associated with a document
  /// classifier.
  final DocumentClassifierProperties? documentClassifierProperties;

  DescribeDocumentClassifierResponse({
    this.documentClassifierProperties,
  });

  factory DescribeDocumentClassifierResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDocumentClassifierResponse(
      documentClassifierProperties: json['DocumentClassifierProperties'] != null
          ? DocumentClassifierProperties.fromJson(
              json['DocumentClassifierProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final documentClassifierProperties = this.documentClassifierProperties;
    return {
      if (documentClassifierProperties != null)
        'DocumentClassifierProperties': documentClassifierProperties,
    };
  }
}

class DescribeDominantLanguageDetectionJobResponse {
  /// An object that contains the properties associated with a dominant language
  /// detection job.
  final DominantLanguageDetectionJobProperties?
      dominantLanguageDetectionJobProperties;

  DescribeDominantLanguageDetectionJobResponse({
    this.dominantLanguageDetectionJobProperties,
  });

  factory DescribeDominantLanguageDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDominantLanguageDetectionJobResponse(
      dominantLanguageDetectionJobProperties:
          json['DominantLanguageDetectionJobProperties'] != null
              ? DominantLanguageDetectionJobProperties.fromJson(
                  json['DominantLanguageDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dominantLanguageDetectionJobProperties =
        this.dominantLanguageDetectionJobProperties;
    return {
      if (dominantLanguageDetectionJobProperties != null)
        'DominantLanguageDetectionJobProperties':
            dominantLanguageDetectionJobProperties,
    };
  }
}

class DescribeEndpointResponse {
  /// Describes information associated with the specific endpoint.
  final EndpointProperties? endpointProperties;

  DescribeEndpointResponse({
    this.endpointProperties,
  });

  factory DescribeEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointResponse(
      endpointProperties: json['EndpointProperties'] != null
          ? EndpointProperties.fromJson(
              json['EndpointProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointProperties = this.endpointProperties;
    return {
      if (endpointProperties != null) 'EndpointProperties': endpointProperties,
    };
  }
}

class DescribeEntitiesDetectionJobResponse {
  /// An object that contains the properties associated with an entities detection
  /// job.
  final EntitiesDetectionJobProperties? entitiesDetectionJobProperties;

  DescribeEntitiesDetectionJobResponse({
    this.entitiesDetectionJobProperties,
  });

  factory DescribeEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEntitiesDetectionJobResponse(
      entitiesDetectionJobProperties: json['EntitiesDetectionJobProperties'] !=
              null
          ? EntitiesDetectionJobProperties.fromJson(
              json['EntitiesDetectionJobProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entitiesDetectionJobProperties = this.entitiesDetectionJobProperties;
    return {
      if (entitiesDetectionJobProperties != null)
        'EntitiesDetectionJobProperties': entitiesDetectionJobProperties,
    };
  }
}

class DescribeEntityRecognizerResponse {
  /// Describes information associated with an entity recognizer.
  final EntityRecognizerProperties? entityRecognizerProperties;

  DescribeEntityRecognizerResponse({
    this.entityRecognizerProperties,
  });

  factory DescribeEntityRecognizerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEntityRecognizerResponse(
      entityRecognizerProperties: json['EntityRecognizerProperties'] != null
          ? EntityRecognizerProperties.fromJson(
              json['EntityRecognizerProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entityRecognizerProperties = this.entityRecognizerProperties;
    return {
      if (entityRecognizerProperties != null)
        'EntityRecognizerProperties': entityRecognizerProperties,
    };
  }
}

class DescribeEventsDetectionJobResponse {
  /// An object that contains the properties associated with an event detection
  /// job.
  final EventsDetectionJobProperties? eventsDetectionJobProperties;

  DescribeEventsDetectionJobResponse({
    this.eventsDetectionJobProperties,
  });

  factory DescribeEventsDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEventsDetectionJobResponse(
      eventsDetectionJobProperties: json['EventsDetectionJobProperties'] != null
          ? EventsDetectionJobProperties.fromJson(
              json['EventsDetectionJobProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventsDetectionJobProperties = this.eventsDetectionJobProperties;
    return {
      if (eventsDetectionJobProperties != null)
        'EventsDetectionJobProperties': eventsDetectionJobProperties,
    };
  }
}

class DescribeFlywheelIterationResponse {
  /// The configuration properties of a flywheel iteration.
  final FlywheelIterationProperties? flywheelIterationProperties;

  DescribeFlywheelIterationResponse({
    this.flywheelIterationProperties,
  });

  factory DescribeFlywheelIterationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFlywheelIterationResponse(
      flywheelIterationProperties: json['FlywheelIterationProperties'] != null
          ? FlywheelIterationProperties.fromJson(
              json['FlywheelIterationProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flywheelIterationProperties = this.flywheelIterationProperties;
    return {
      if (flywheelIterationProperties != null)
        'FlywheelIterationProperties': flywheelIterationProperties,
    };
  }
}

class DescribeFlywheelResponse {
  /// The flywheel properties.
  final FlywheelProperties? flywheelProperties;

  DescribeFlywheelResponse({
    this.flywheelProperties,
  });

  factory DescribeFlywheelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFlywheelResponse(
      flywheelProperties: json['FlywheelProperties'] != null
          ? FlywheelProperties.fromJson(
              json['FlywheelProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flywheelProperties = this.flywheelProperties;
    return {
      if (flywheelProperties != null) 'FlywheelProperties': flywheelProperties,
    };
  }
}

class DescribeKeyPhrasesDetectionJobResponse {
  /// An object that contains the properties associated with a key phrases
  /// detection job.
  final KeyPhrasesDetectionJobProperties? keyPhrasesDetectionJobProperties;

  DescribeKeyPhrasesDetectionJobResponse({
    this.keyPhrasesDetectionJobProperties,
  });

  factory DescribeKeyPhrasesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeKeyPhrasesDetectionJobResponse(
      keyPhrasesDetectionJobProperties:
          json['KeyPhrasesDetectionJobProperties'] != null
              ? KeyPhrasesDetectionJobProperties.fromJson(
                  json['KeyPhrasesDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPhrasesDetectionJobProperties =
        this.keyPhrasesDetectionJobProperties;
    return {
      if (keyPhrasesDetectionJobProperties != null)
        'KeyPhrasesDetectionJobProperties': keyPhrasesDetectionJobProperties,
    };
  }
}

class DescribePiiEntitiesDetectionJobResponse {
  final PiiEntitiesDetectionJobProperties? piiEntitiesDetectionJobProperties;

  DescribePiiEntitiesDetectionJobResponse({
    this.piiEntitiesDetectionJobProperties,
  });

  factory DescribePiiEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePiiEntitiesDetectionJobResponse(
      piiEntitiesDetectionJobProperties:
          json['PiiEntitiesDetectionJobProperties'] != null
              ? PiiEntitiesDetectionJobProperties.fromJson(
                  json['PiiEntitiesDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final piiEntitiesDetectionJobProperties =
        this.piiEntitiesDetectionJobProperties;
    return {
      if (piiEntitiesDetectionJobProperties != null)
        'PiiEntitiesDetectionJobProperties': piiEntitiesDetectionJobProperties,
    };
  }
}

class DescribeResourcePolicyResponse {
  /// The time at which the policy was created.
  final DateTime? creationTime;

  /// The time at which the policy was last modified.
  final DateTime? lastModifiedTime;

  /// The revision ID of the policy. Each time you modify a policy, Amazon
  /// Comprehend assigns a new revision ID, and it deletes the prior version of
  /// the policy.
  final String? policyRevisionId;

  /// The JSON body of the resource-based policy.
  final String? resourcePolicy;

  DescribeResourcePolicyResponse({
    this.creationTime,
    this.lastModifiedTime,
    this.policyRevisionId,
    this.resourcePolicy,
  });

  factory DescribeResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResourcePolicyResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      policyRevisionId: json['PolicyRevisionId'] as String?,
      resourcePolicy: json['ResourcePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final policyRevisionId = this.policyRevisionId;
    final resourcePolicy = this.resourcePolicy;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
    };
  }
}

class DescribeSentimentDetectionJobResponse {
  /// An object that contains the properties associated with a sentiment detection
  /// job.
  final SentimentDetectionJobProperties? sentimentDetectionJobProperties;

  DescribeSentimentDetectionJobResponse({
    this.sentimentDetectionJobProperties,
  });

  factory DescribeSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSentimentDetectionJobResponse(
      sentimentDetectionJobProperties:
          json['SentimentDetectionJobProperties'] != null
              ? SentimentDetectionJobProperties.fromJson(
                  json['SentimentDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sentimentDetectionJobProperties =
        this.sentimentDetectionJobProperties;
    return {
      if (sentimentDetectionJobProperties != null)
        'SentimentDetectionJobProperties': sentimentDetectionJobProperties,
    };
  }
}

class DescribeTargetedSentimentDetectionJobResponse {
  /// An object that contains the properties associated with a targeted sentiment
  /// detection job.
  final TargetedSentimentDetectionJobProperties?
      targetedSentimentDetectionJobProperties;

  DescribeTargetedSentimentDetectionJobResponse({
    this.targetedSentimentDetectionJobProperties,
  });

  factory DescribeTargetedSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTargetedSentimentDetectionJobResponse(
      targetedSentimentDetectionJobProperties:
          json['TargetedSentimentDetectionJobProperties'] != null
              ? TargetedSentimentDetectionJobProperties.fromJson(
                  json['TargetedSentimentDetectionJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetedSentimentDetectionJobProperties =
        this.targetedSentimentDetectionJobProperties;
    return {
      if (targetedSentimentDetectionJobProperties != null)
        'TargetedSentimentDetectionJobProperties':
            targetedSentimentDetectionJobProperties,
    };
  }
}

class DescribeTopicsDetectionJobResponse {
  /// The list of properties for the requested job.
  final TopicsDetectionJobProperties? topicsDetectionJobProperties;

  DescribeTopicsDetectionJobResponse({
    this.topicsDetectionJobProperties,
  });

  factory DescribeTopicsDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTopicsDetectionJobResponse(
      topicsDetectionJobProperties: json['TopicsDetectionJobProperties'] != null
          ? TopicsDetectionJobProperties.fromJson(
              json['TopicsDetectionJobProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final topicsDetectionJobProperties = this.topicsDetectionJobProperties;
    return {
      if (topicsDetectionJobProperties != null)
        'TopicsDetectionJobProperties': topicsDetectionJobProperties,
    };
  }
}

class DetectDominantLanguageResponse {
  /// Array of languages that Amazon Comprehend detected in the input text. The
  /// array is sorted in descending order of the score (the dominant language is
  /// always the first element in the array).
  ///
  /// For each language, the response returns the RFC 5646 language code and the
  /// level of confidence that Amazon Comprehend has in the accuracy of its
  /// inference. For more information about RFC 5646, see <a
  /// href="https://tools.ietf.org/html/rfc5646">Tags for Identifying
  /// Languages</a> on the <i>IETF Tools</i> web site.
  final List<DominantLanguage>? languages;

  DetectDominantLanguageResponse({
    this.languages,
  });

  factory DetectDominantLanguageResponse.fromJson(Map<String, dynamic> json) {
    return DetectDominantLanguageResponse(
      languages: (json['Languages'] as List?)
          ?.whereNotNull()
          .map((e) => DominantLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final languages = this.languages;
    return {
      if (languages != null) 'Languages': languages,
    };
  }
}

class DetectEntitiesResponse {
  /// Information about each block of text in the input document. Blocks are
  /// nested. A page block contains a block for each line of text, which contains
  /// a block for each word.
  ///
  /// The <code>Block</code> content for a Word input document does not include a
  /// <code>Geometry</code> field.
  ///
  /// The <code>Block</code> field is not present in the response for plain-text
  /// inputs.
  final List<Block>? blocks;

  /// Information about the document, discovered during text extraction. This
  /// field is present in the response only if your request used the
  /// <code>Byte</code> parameter.
  final DocumentMetadata? documentMetadata;

  /// The document type for each page in the input document. This field is present
  /// in the response only if your request used the <code>Byte</code> parameter.
  final List<DocumentTypeListItem>? documentType;

  /// A collection of entities identified in the input text. For each entity, the
  /// response provides the entity text, entity type, where the entity text begins
  /// and ends, and the level of confidence that Amazon Comprehend has in the
  /// detection.
  ///
  /// If your request uses a custom entity recognition model, Amazon Comprehend
  /// detects the entities that the model is trained to recognize. Otherwise, it
  /// detects the default entity types. For a list of default entity types, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html">Entities</a>
  /// in the Comprehend Developer Guide.
  final List<Entity>? entities;

  /// Page-level errors that the system detected while processing the input
  /// document. The field is empty if the system encountered no errors.
  final List<ErrorsListItem>? errors;

  DetectEntitiesResponse({
    this.blocks,
    this.documentMetadata,
    this.documentType,
    this.entities,
    this.errors,
  });

  factory DetectEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return DetectEntitiesResponse(
      blocks: (json['Blocks'] as List?)
          ?.whereNotNull()
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      documentType: (json['DocumentType'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentTypeListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      entities: (json['Entities'] as List?)
          ?.whereNotNull()
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final blocks = this.blocks;
    final documentMetadata = this.documentMetadata;
    final documentType = this.documentType;
    final entities = this.entities;
    final errors = this.errors;
    return {
      if (blocks != null) 'Blocks': blocks,
      if (documentMetadata != null) 'DocumentMetadata': documentMetadata,
      if (documentType != null) 'DocumentType': documentType,
      if (entities != null) 'Entities': entities,
      if (errors != null) 'Errors': errors,
    };
  }
}

class DetectKeyPhrasesResponse {
  /// A collection of key phrases that Amazon Comprehend identified in the input
  /// text. For each key phrase, the response provides the text of the key phrase,
  /// where the key phrase begins and ends, and the level of confidence that
  /// Amazon Comprehend has in the accuracy of the detection.
  final List<KeyPhrase>? keyPhrases;

  DetectKeyPhrasesResponse({
    this.keyPhrases,
  });

  factory DetectKeyPhrasesResponse.fromJson(Map<String, dynamic> json) {
    return DetectKeyPhrasesResponse(
      keyPhrases: (json['KeyPhrases'] as List?)
          ?.whereNotNull()
          .map((e) => KeyPhrase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyPhrases = this.keyPhrases;
    return {
      if (keyPhrases != null) 'KeyPhrases': keyPhrases,
    };
  }
}

class DetectPiiEntitiesResponse {
  /// A collection of PII entities identified in the input text. For each entity,
  /// the response provides the entity type, where the entity text begins and
  /// ends, and the level of confidence that Amazon Comprehend has in the
  /// detection.
  final List<PiiEntity>? entities;

  DetectPiiEntitiesResponse({
    this.entities,
  });

  factory DetectPiiEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return DetectPiiEntitiesResponse(
      entities: (json['Entities'] as List?)
          ?.whereNotNull()
          .map((e) => PiiEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    return {
      if (entities != null) 'Entities': entities,
    };
  }
}

class DetectSentimentResponse {
  /// The inferred sentiment that Amazon Comprehend has the highest level of
  /// confidence in.
  final SentimentType? sentiment;

  /// An object that lists the sentiments, and their corresponding confidence
  /// levels.
  final SentimentScore? sentimentScore;

  DetectSentimentResponse({
    this.sentiment,
    this.sentimentScore,
  });

  factory DetectSentimentResponse.fromJson(Map<String, dynamic> json) {
    return DetectSentimentResponse(
      sentiment: (json['Sentiment'] as String?)?.toSentimentType(),
      sentimentScore: json['SentimentScore'] != null
          ? SentimentScore.fromJson(
              json['SentimentScore'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sentiment = this.sentiment;
    final sentimentScore = this.sentimentScore;
    return {
      if (sentiment != null) 'Sentiment': sentiment.toValue(),
      if (sentimentScore != null) 'SentimentScore': sentimentScore,
    };
  }
}

class DetectSyntaxResponse {
  /// A collection of syntax tokens describing the text. For each token, the
  /// response provides the text, the token type, where the text begins and ends,
  /// and the level of confidence that Amazon Comprehend has that the token is
  /// correct. For a list of token types, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html">Syntax</a>
  /// in the Comprehend Developer Guide.
  final List<SyntaxToken>? syntaxTokens;

  DetectSyntaxResponse({
    this.syntaxTokens,
  });

  factory DetectSyntaxResponse.fromJson(Map<String, dynamic> json) {
    return DetectSyntaxResponse(
      syntaxTokens: (json['SyntaxTokens'] as List?)
          ?.whereNotNull()
          .map((e) => SyntaxToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final syntaxTokens = this.syntaxTokens;
    return {
      if (syntaxTokens != null) 'SyntaxTokens': syntaxTokens,
    };
  }
}

class DetectTargetedSentimentResponse {
  /// Targeted sentiment analysis for each of the entities identified in the input
  /// text.
  final List<TargetedSentimentEntity>? entities;

  DetectTargetedSentimentResponse({
    this.entities,
  });

  factory DetectTargetedSentimentResponse.fromJson(Map<String, dynamic> json) {
    return DetectTargetedSentimentResponse(
      entities: (json['Entities'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TargetedSentimentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    return {
      if (entities != null) 'Entities': entities,
    };
  }
}

class DetectToxicContentResponse {
  /// Results of the content moderation analysis. Each entry in the results list
  /// contains a list of toxic content types identified in the text, along with a
  /// confidence score for each content type. The results list also includes a
  /// toxicity score for each entry in the results list.
  final List<ToxicLabels>? resultList;

  DetectToxicContentResponse({
    this.resultList,
  });

  factory DetectToxicContentResponse.fromJson(Map<String, dynamic> json) {
    return DetectToxicContentResponse(
      resultList: (json['ResultList'] as List?)
          ?.whereNotNull()
          .map((e) => ToxicLabels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resultList = this.resultList;
    return {
      if (resultList != null) 'ResultList': resultList,
    };
  }
}

/// Specifies the class that categorizes the document being analyzed
class DocumentClass {
  /// The name of the class.
  final String? name;

  /// Page number in the input document. This field is present in the response
  /// only if your request includes the <code>Byte</code> parameter.
  final int? page;

  /// The confidence score that Amazon Comprehend has this class correctly
  /// attributed.
  final double? score;

  DocumentClass({
    this.name,
    this.page,
    this.score,
  });

  factory DocumentClass.fromJson(Map<String, dynamic> json) {
    return DocumentClass(
      name: json['Name'] as String?,
      page: json['Page'] as int?,
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final page = this.page;
    final score = this.score;
    return {
      if (name != null) 'Name': name,
      if (page != null) 'Page': page,
      if (score != null) 'Score': score,
    };
  }
}

/// Configuration required for a document classification model.
class DocumentClassificationConfig {
  /// Classification mode indicates whether the documents are
  /// <code>MULTI_CLASS</code> or <code>MULTI_LABEL</code>.
  final DocumentClassifierMode mode;

  /// One or more labels to associate with the custom classifier.
  final List<String>? labels;

  DocumentClassificationConfig({
    required this.mode,
    this.labels,
  });

  factory DocumentClassificationConfig.fromJson(Map<String, dynamic> json) {
    return DocumentClassificationConfig(
      mode: (json['Mode'] as String).toDocumentClassifierMode(),
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final labels = this.labels;
    return {
      'Mode': mode.toValue(),
      if (labels != null) 'Labels': labels,
    };
  }
}

/// Provides information for filtering a list of document classification jobs.
/// For more information, see the operation. You can provide only one filter
/// parameter in each request.
class DocumentClassificationJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list based on job status. Returns only jobs with the specified
  /// status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  DocumentClassificationJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a document classification job.
class DocumentClassificationJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String? documentClassifierArn;

  /// The time that the document classification job completed.
  final DateTime? endTime;

  /// The Amazon Resource Number (ARN) of the flywheel
  final String? flywheelArn;

  /// The input data configuration that you supplied when you created the document
  /// classification job.
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the document classification job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:document-classification-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the document classification job.
  final String? jobId;

  /// The name that you assigned to the document classification job.
  final String? jobName;

  /// The current status of the document classification job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// A description of the status of the job.
  final String? message;

  /// The output data configuration that you supplied when you created the
  /// document classification job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the document classification job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt data on the storage volume attached to the ML
  /// compute instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your document classification job.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  DocumentClassificationJobProperties({
    this.dataAccessRoleArn,
    this.documentClassifierArn,
    this.endTime,
    this.flywheelArn,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory DocumentClassificationJobProperties.fromJson(
      Map<String, dynamic> json) {
    return DocumentClassificationJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      documentClassifierArn: json['DocumentClassifierArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      flywheelArn: json['FlywheelArn'] as String?,
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final documentClassifierArn = this.documentClassifierArn;
    final endTime = this.endTime;
    final flywheelArn = this.flywheelArn;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final message = this.message;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (documentClassifierArn != null)
        'DocumentClassifierArn': documentClassifierArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (message != null) 'Message': message,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

enum DocumentClassifierDataFormat {
  comprehendCsv,
  augmentedManifest,
}

extension DocumentClassifierDataFormatValueExtension
    on DocumentClassifierDataFormat {
  String toValue() {
    switch (this) {
      case DocumentClassifierDataFormat.comprehendCsv:
        return 'COMPREHEND_CSV';
      case DocumentClassifierDataFormat.augmentedManifest:
        return 'AUGMENTED_MANIFEST';
    }
  }
}

extension DocumentClassifierDataFormatFromString on String {
  DocumentClassifierDataFormat toDocumentClassifierDataFormat() {
    switch (this) {
      case 'COMPREHEND_CSV':
        return DocumentClassifierDataFormat.comprehendCsv;
      case 'AUGMENTED_MANIFEST':
        return DocumentClassifierDataFormat.augmentedManifest;
    }
    throw Exception('$this is not known in enum DocumentClassifierDataFormat');
  }
}

enum DocumentClassifierDocumentTypeFormat {
  plainTextDocument,
  semiStructuredDocument,
}

extension DocumentClassifierDocumentTypeFormatValueExtension
    on DocumentClassifierDocumentTypeFormat {
  String toValue() {
    switch (this) {
      case DocumentClassifierDocumentTypeFormat.plainTextDocument:
        return 'PLAIN_TEXT_DOCUMENT';
      case DocumentClassifierDocumentTypeFormat.semiStructuredDocument:
        return 'SEMI_STRUCTURED_DOCUMENT';
    }
  }
}

extension DocumentClassifierDocumentTypeFormatFromString on String {
  DocumentClassifierDocumentTypeFormat
      toDocumentClassifierDocumentTypeFormat() {
    switch (this) {
      case 'PLAIN_TEXT_DOCUMENT':
        return DocumentClassifierDocumentTypeFormat.plainTextDocument;
      case 'SEMI_STRUCTURED_DOCUMENT':
        return DocumentClassifierDocumentTypeFormat.semiStructuredDocument;
    }
    throw Exception(
        '$this is not known in enum DocumentClassifierDocumentTypeFormat');
  }
}

/// The location of the training documents. This parameter is required in a
/// request to create a semi-structured document classification model.
class DocumentClassifierDocuments {
  /// The S3 URI location of the training documents specified in the S3Uri CSV
  /// file.
  final String s3Uri;

  /// The S3 URI location of the test documents included in the TestS3Uri CSV
  /// file. This field is not required if you do not specify a test CSV file.
  final String? testS3Uri;

  DocumentClassifierDocuments({
    required this.s3Uri,
    this.testS3Uri,
  });

  factory DocumentClassifierDocuments.fromJson(Map<String, dynamic> json) {
    return DocumentClassifierDocuments(
      s3Uri: json['S3Uri'] as String,
      testS3Uri: json['TestS3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final testS3Uri = this.testS3Uri;
    return {
      'S3Uri': s3Uri,
      if (testS3Uri != null) 'TestS3Uri': testS3Uri,
    };
  }
}

/// Provides information for filtering a list of document classifiers. You can
/// only specify one filtering parameter in a request. For more information, see
/// the <code>ListDocumentClassifiers</code> operation.
class DocumentClassifierFilter {
  /// The name that you assigned to the document classifier
  final String? documentClassifierName;

  /// Filters the list of classifiers based on status.
  final ModelStatus? status;

  /// Filters the list of classifiers based on the time that the classifier was
  /// submitted for processing. Returns only classifiers submitted after the
  /// specified time. Classifiers are returned in descending order, newest to
  /// oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of classifiers based on the time that the classifier was
  /// submitted for processing. Returns only classifiers submitted before the
  /// specified time. Classifiers are returned in ascending order, oldest to
  /// newest.
  final DateTime? submitTimeBefore;

  DocumentClassifierFilter({
    this.documentClassifierName,
    this.status,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final documentClassifierName = this.documentClassifierName;
    final status = this.status;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (documentClassifierName != null)
        'DocumentClassifierName': documentClassifierName,
      if (status != null) 'Status': status.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// The input properties for training a document classifier.
///
/// For more information on how the input file is formatted, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/prep-classifier-data.html">Preparing
/// training data</a> in the Comprehend Developer Guide.
class DocumentClassifierInputDataConfig {
  /// A list of augmented manifest files that provide training data for your
  /// custom model. An augmented manifest file is a labeled dataset that is
  /// produced by Amazon SageMaker Ground Truth.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>AUGMENTED_MANIFEST</code>.
  final List<AugmentedManifestsListItem>? augmentedManifests;

  /// The format of your training data:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPREHEND_CSV</code>: A two-column CSV file, where labels are
  /// provided in the first column, and documents are provided in the second. If
  /// you use this value, you must provide the <code>S3Uri</code> parameter in
  /// your request.
  /// </li>
  /// <li>
  /// <code>AUGMENTED_MANIFEST</code>: A labeled dataset that is produced by
  /// Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line
  /// is a complete JSON object that contains a training document and its
  /// associated labels.
  ///
  /// If you use this value, you must provide the <code>AugmentedManifests</code>
  /// parameter in your request.
  /// </li>
  /// </ul>
  /// If you don't specify a value, Amazon Comprehend uses
  /// <code>COMPREHEND_CSV</code> as the default.
  final DocumentClassifierDataFormat? dataFormat;
  final DocumentReaderConfig? documentReaderConfig;

  /// The type of input documents for training the model. Provide plain-text
  /// documents to create a plain-text model, and provide semi-structured
  /// documents to create a native document model.
  final DocumentClassifierDocumentTypeFormat? documentType;

  /// The S3 location of the training documents. This parameter is required in a
  /// request to create a native document model.
  final DocumentClassifierDocuments? documents;

  /// Indicates the delimiter used to separate each label for training a
  /// multi-label classifier. The default delimiter between labels is a pipe (|).
  /// You can use a different character as a delimiter (if it's an allowed
  /// character) by specifying it under Delimiter for labels. If the training
  /// documents use a delimiter other than the default or the delimiter you
  /// specify, the labels on that line will be combined to make a single unique
  /// label, such as LABELLABELLABEL.
  final String? labelDelimiter;

  /// The Amazon S3 URI for the input data. The S3 bucket must be in the same
  /// Region as the API endpoint that you are calling. The URI can point to a
  /// single input file or it can provide the prefix for a collection of input
  /// files.
  ///
  /// For example, if you use the URI <code>S3://bucketName/prefix</code>, if the
  /// prefix is a single file, Amazon Comprehend uses that file as input. If more
  /// than one file begins with the prefix, Amazon Comprehend uses all of them as
  /// input.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>COMPREHEND_CSV</code>.
  final String? s3Uri;

  /// This specifies the Amazon S3 location that contains the test annotations for
  /// the document classifier. The URI must be in the same Amazon Web Services
  /// Region as the API endpoint that you are calling.
  final String? testS3Uri;

  DocumentClassifierInputDataConfig({
    this.augmentedManifests,
    this.dataFormat,
    this.documentReaderConfig,
    this.documentType,
    this.documents,
    this.labelDelimiter,
    this.s3Uri,
    this.testS3Uri,
  });

  factory DocumentClassifierInputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return DocumentClassifierInputDataConfig(
      augmentedManifests: (json['AugmentedManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AugmentedManifestsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataFormat:
          (json['DataFormat'] as String?)?.toDocumentClassifierDataFormat(),
      documentReaderConfig: json['DocumentReaderConfig'] != null
          ? DocumentReaderConfig.fromJson(
              json['DocumentReaderConfig'] as Map<String, dynamic>)
          : null,
      documentType: (json['DocumentType'] as String?)
          ?.toDocumentClassifierDocumentTypeFormat(),
      documents: json['Documents'] != null
          ? DocumentClassifierDocuments.fromJson(
              json['Documents'] as Map<String, dynamic>)
          : null,
      labelDelimiter: json['LabelDelimiter'] as String?,
      s3Uri: json['S3Uri'] as String?,
      testS3Uri: json['TestS3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final augmentedManifests = this.augmentedManifests;
    final dataFormat = this.dataFormat;
    final documentReaderConfig = this.documentReaderConfig;
    final documentType = this.documentType;
    final documents = this.documents;
    final labelDelimiter = this.labelDelimiter;
    final s3Uri = this.s3Uri;
    final testS3Uri = this.testS3Uri;
    return {
      if (augmentedManifests != null) 'AugmentedManifests': augmentedManifests,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (documentReaderConfig != null)
        'DocumentReaderConfig': documentReaderConfig,
      if (documentType != null) 'DocumentType': documentType.toValue(),
      if (documents != null) 'Documents': documents,
      if (labelDelimiter != null) 'LabelDelimiter': labelDelimiter,
      if (s3Uri != null) 'S3Uri': s3Uri,
      if (testS3Uri != null) 'TestS3Uri': testS3Uri,
    };
  }
}

enum DocumentClassifierMode {
  multiClass,
  multiLabel,
}

extension DocumentClassifierModeValueExtension on DocumentClassifierMode {
  String toValue() {
    switch (this) {
      case DocumentClassifierMode.multiClass:
        return 'MULTI_CLASS';
      case DocumentClassifierMode.multiLabel:
        return 'MULTI_LABEL';
    }
  }
}

extension DocumentClassifierModeFromString on String {
  DocumentClassifierMode toDocumentClassifierMode() {
    switch (this) {
      case 'MULTI_CLASS':
        return DocumentClassifierMode.multiClass;
      case 'MULTI_LABEL':
        return DocumentClassifierMode.multiLabel;
    }
    throw Exception('$this is not known in enum DocumentClassifierMode');
  }
}

/// Provide the location for output data from a custom classifier job. This
/// field is mandatory if you are training a native document model.
class DocumentClassifierOutputDataConfig {
  /// The Amazon S3 prefix for the data lake location of the flywheel statistics.
  final String? flywheelStatsS3Prefix;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt the output results from an analysis job. The
  /// KmsKeyId can be one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// KMS Key Alias: <code>"alias/ExampleAlias"</code>
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias:
  /// <code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code>
  /// </li>
  /// </ul>
  final String? kmsKeyId;

  /// When you use the <code>OutputDataConfig</code> object while creating a
  /// custom classifier, you specify the Amazon S3 location where you want to
  /// write the confusion matrix and other output files. The URI must be in the
  /// same Region as the API endpoint that you are calling. The location is used
  /// as the prefix for the actual location of this output file.
  ///
  /// When the custom classifier job is finished, the service creates the output
  /// file in a directory specific to the job. The <code>S3Uri</code> field
  /// contains the location of the output file, called <code>output.tar.gz</code>.
  /// It is a compressed archive that contains the confusion matrix.
  final String? s3Uri;

  DocumentClassifierOutputDataConfig({
    this.flywheelStatsS3Prefix,
    this.kmsKeyId,
    this.s3Uri,
  });

  factory DocumentClassifierOutputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return DocumentClassifierOutputDataConfig(
      flywheelStatsS3Prefix: json['FlywheelStatsS3Prefix'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      s3Uri: json['S3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flywheelStatsS3Prefix = this.flywheelStatsS3Prefix;
    final kmsKeyId = this.kmsKeyId;
    final s3Uri = this.s3Uri;
    return {
      if (flywheelStatsS3Prefix != null)
        'FlywheelStatsS3Prefix': flywheelStatsS3Prefix,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (s3Uri != null) 'S3Uri': s3Uri,
    };
  }
}

/// Provides information about a document classifier.
class DocumentClassifierProperties {
  /// Information about the document classifier, including the number of documents
  /// used for training the classifier, the number of documents used for test the
  /// classifier, and an accuracy rating.
  final ClassifierMetadata? classifierMetadata;

  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String? documentClassifierArn;

  /// The time that training the document classifier completed.
  final DateTime? endTime;

  /// The Amazon Resource Number (ARN) of the flywheel
  final String? flywheelArn;

  /// The input data configuration that you supplied when you created the document
  /// classifier for training.
  final DocumentClassifierInputDataConfig? inputDataConfig;

  /// The language code for the language of the documents that the classifier was
  /// trained on.
  final LanguageCode? languageCode;

  /// Additional information about the status of the classifier.
  final String? message;

  /// Indicates the mode in which the specific classifier was trained. This also
  /// indicates the format of input documents and the format of the confusion
  /// matrix. Each classifier can only be trained in one mode and this cannot be
  /// changed once the classifier is trained.
  final DocumentClassifierMode? mode;

  /// ID for the KMS key that Amazon Comprehend uses to encrypt trained custom
  /// models. The ModelKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? modelKmsKeyId;

  /// Provides output results configuration parameters for custom classifier jobs.
  final DocumentClassifierOutputDataConfig? outputDataConfig;

  /// The Amazon Resource Name (ARN) of the source model. This model was imported
  /// from a different Amazon Web Services account to create the document
  /// classifier model in your Amazon Web Services account.
  final String? sourceModelArn;

  /// The status of the document classifier. If the status is <code>TRAINED</code>
  /// the classifier is ready to use. If the status is
  /// <code>TRAINED_WITH_WARNINGS</code> the classifier training succeeded, but
  /// you should review the warnings returned in the
  /// <code>CreateDocumentClassifier</code> response.
  ///
  /// If the status is <code>FAILED</code> you can see additional information
  /// about why the classifier wasn't trained in the <code>Message</code> field.
  final ModelStatus? status;

  /// The time that the document classifier was submitted for training.
  final DateTime? submitTime;

  /// The time that training of the document classifier was completed. Indicates
  /// the time when the training completes on documentation classifiers. You are
  /// billed for the time interval between this time and the value of
  /// TrainingStartTime.
  final DateTime? trainingEndTime;

  /// Indicates the time when the training starts on documentation classifiers.
  /// You are billed for the time interval between this time and the value of
  /// TrainingEndTime.
  final DateTime? trainingStartTime;

  /// The version name that you assigned to the document classifier.
  final String? versionName;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt data on the storage volume attached to the ML
  /// compute instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your custom classifier. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  DocumentClassifierProperties({
    this.classifierMetadata,
    this.dataAccessRoleArn,
    this.documentClassifierArn,
    this.endTime,
    this.flywheelArn,
    this.inputDataConfig,
    this.languageCode,
    this.message,
    this.mode,
    this.modelKmsKeyId,
    this.outputDataConfig,
    this.sourceModelArn,
    this.status,
    this.submitTime,
    this.trainingEndTime,
    this.trainingStartTime,
    this.versionName,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory DocumentClassifierProperties.fromJson(Map<String, dynamic> json) {
    return DocumentClassifierProperties(
      classifierMetadata: json['ClassifierMetadata'] != null
          ? ClassifierMetadata.fromJson(
              json['ClassifierMetadata'] as Map<String, dynamic>)
          : null,
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      documentClassifierArn: json['DocumentClassifierArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      flywheelArn: json['FlywheelArn'] as String?,
      inputDataConfig: json['InputDataConfig'] != null
          ? DocumentClassifierInputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      mode: (json['Mode'] as String?)?.toDocumentClassifierMode(),
      modelKmsKeyId: json['ModelKmsKeyId'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? DocumentClassifierOutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      sourceModelArn: json['SourceModelArn'] as String?,
      status: (json['Status'] as String?)?.toModelStatus(),
      submitTime: timeStampFromJson(json['SubmitTime']),
      trainingEndTime: timeStampFromJson(json['TrainingEndTime']),
      trainingStartTime: timeStampFromJson(json['TrainingStartTime']),
      versionName: json['VersionName'] as String?,
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final classifierMetadata = this.classifierMetadata;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final documentClassifierArn = this.documentClassifierArn;
    final endTime = this.endTime;
    final flywheelArn = this.flywheelArn;
    final inputDataConfig = this.inputDataConfig;
    final languageCode = this.languageCode;
    final message = this.message;
    final mode = this.mode;
    final modelKmsKeyId = this.modelKmsKeyId;
    final outputDataConfig = this.outputDataConfig;
    final sourceModelArn = this.sourceModelArn;
    final status = this.status;
    final submitTime = this.submitTime;
    final trainingEndTime = this.trainingEndTime;
    final trainingStartTime = this.trainingStartTime;
    final versionName = this.versionName;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (classifierMetadata != null) 'ClassifierMetadata': classifierMetadata,
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (documentClassifierArn != null)
        'DocumentClassifierArn': documentClassifierArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (message != null) 'Message': message,
      if (mode != null) 'Mode': mode.toValue(),
      if (modelKmsKeyId != null) 'ModelKmsKeyId': modelKmsKeyId,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (sourceModelArn != null) 'SourceModelArn': sourceModelArn,
      if (status != null) 'Status': status.toValue(),
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (trainingEndTime != null)
        'TrainingEndTime': unixTimestampToJson(trainingEndTime),
      if (trainingStartTime != null)
        'TrainingStartTime': unixTimestampToJson(trainingStartTime),
      if (versionName != null) 'VersionName': versionName,
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// Describes information about a document classifier and its versions.
class DocumentClassifierSummary {
  /// The name that you assigned the document classifier.
  final String? documentClassifierName;

  /// The time that the latest document classifier version was submitted for
  /// processing.
  final DateTime? latestVersionCreatedAt;

  /// The version name you assigned to the latest document classifier version.
  final String? latestVersionName;

  /// Provides the status of the latest document classifier version.
  final ModelStatus? latestVersionStatus;

  /// The number of versions you created.
  final int? numberOfVersions;

  DocumentClassifierSummary({
    this.documentClassifierName,
    this.latestVersionCreatedAt,
    this.latestVersionName,
    this.latestVersionStatus,
    this.numberOfVersions,
  });

  factory DocumentClassifierSummary.fromJson(Map<String, dynamic> json) {
    return DocumentClassifierSummary(
      documentClassifierName: json['DocumentClassifierName'] as String?,
      latestVersionCreatedAt: timeStampFromJson(json['LatestVersionCreatedAt']),
      latestVersionName: json['LatestVersionName'] as String?,
      latestVersionStatus:
          (json['LatestVersionStatus'] as String?)?.toModelStatus(),
      numberOfVersions: json['NumberOfVersions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentClassifierName = this.documentClassifierName;
    final latestVersionCreatedAt = this.latestVersionCreatedAt;
    final latestVersionName = this.latestVersionName;
    final latestVersionStatus = this.latestVersionStatus;
    final numberOfVersions = this.numberOfVersions;
    return {
      if (documentClassifierName != null)
        'DocumentClassifierName': documentClassifierName,
      if (latestVersionCreatedAt != null)
        'LatestVersionCreatedAt': unixTimestampToJson(latestVersionCreatedAt),
      if (latestVersionName != null) 'LatestVersionName': latestVersionName,
      if (latestVersionStatus != null)
        'LatestVersionStatus': latestVersionStatus.toValue(),
      if (numberOfVersions != null) 'NumberOfVersions': numberOfVersions,
    };
  }
}

/// Specifies one of the label or labels that categorize the document being
/// analyzed.
class DocumentLabel {
  /// The name of the label.
  final String? name;

  /// Page number where the label occurs. This field is present in the response
  /// only if your request includes the <code>Byte</code> parameter.
  final int? page;

  /// The confidence score that Amazon Comprehend has this label correctly
  /// attributed.
  final double? score;

  DocumentLabel({
    this.name,
    this.page,
    this.score,
  });

  factory DocumentLabel.fromJson(Map<String, dynamic> json) {
    return DocumentLabel(
      name: json['Name'] as String?,
      page: json['Page'] as int?,
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final page = this.page;
    final score = this.score;
    return {
      if (name != null) 'Name': name,
      if (page != null) 'Page': page,
      if (score != null) 'Score': score,
    };
  }
}

/// Information about the document, discovered during text extraction.
class DocumentMetadata {
  /// List of pages in the document, with the number of characters extracted from
  /// each page.
  final List<ExtractedCharactersListItem>? extractedCharacters;

  /// Number of pages in the document.
  final int? pages;

  DocumentMetadata({
    this.extractedCharacters,
    this.pages,
  });

  factory DocumentMetadata.fromJson(Map<String, dynamic> json) {
    return DocumentMetadata(
      extractedCharacters: (json['ExtractedCharacters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ExtractedCharactersListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pages: json['Pages'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final extractedCharacters = this.extractedCharacters;
    final pages = this.pages;
    return {
      if (extractedCharacters != null)
        'ExtractedCharacters': extractedCharacters,
      if (pages != null) 'Pages': pages,
    };
  }
}

enum DocumentReadAction {
  textractDetectDocumentText,
  textractAnalyzeDocument,
}

extension DocumentReadActionValueExtension on DocumentReadAction {
  String toValue() {
    switch (this) {
      case DocumentReadAction.textractDetectDocumentText:
        return 'TEXTRACT_DETECT_DOCUMENT_TEXT';
      case DocumentReadAction.textractAnalyzeDocument:
        return 'TEXTRACT_ANALYZE_DOCUMENT';
    }
  }
}

extension DocumentReadActionFromString on String {
  DocumentReadAction toDocumentReadAction() {
    switch (this) {
      case 'TEXTRACT_DETECT_DOCUMENT_TEXT':
        return DocumentReadAction.textractDetectDocumentText;
      case 'TEXTRACT_ANALYZE_DOCUMENT':
        return DocumentReadAction.textractAnalyzeDocument;
    }
    throw Exception('$this is not known in enum DocumentReadAction');
  }
}

/// TABLES or FORMS
enum DocumentReadFeatureTypes {
  tables,
  forms,
}

extension DocumentReadFeatureTypesValueExtension on DocumentReadFeatureTypes {
  String toValue() {
    switch (this) {
      case DocumentReadFeatureTypes.tables:
        return 'TABLES';
      case DocumentReadFeatureTypes.forms:
        return 'FORMS';
    }
  }
}

extension DocumentReadFeatureTypesFromString on String {
  DocumentReadFeatureTypes toDocumentReadFeatureTypes() {
    switch (this) {
      case 'TABLES':
        return DocumentReadFeatureTypes.tables;
      case 'FORMS':
        return DocumentReadFeatureTypes.forms;
    }
    throw Exception('$this is not known in enum DocumentReadFeatureTypes');
  }
}

enum DocumentReadMode {
  serviceDefault,
  forceDocumentReadAction,
}

extension DocumentReadModeValueExtension on DocumentReadMode {
  String toValue() {
    switch (this) {
      case DocumentReadMode.serviceDefault:
        return 'SERVICE_DEFAULT';
      case DocumentReadMode.forceDocumentReadAction:
        return 'FORCE_DOCUMENT_READ_ACTION';
    }
  }
}

extension DocumentReadModeFromString on String {
  DocumentReadMode toDocumentReadMode() {
    switch (this) {
      case 'SERVICE_DEFAULT':
        return DocumentReadMode.serviceDefault;
      case 'FORCE_DOCUMENT_READ_ACTION':
        return DocumentReadMode.forceDocumentReadAction;
    }
    throw Exception('$this is not known in enum DocumentReadMode');
  }
}

/// Provides configuration parameters to override the default actions for
/// extracting text from PDF documents and image files.
///
/// By default, Amazon Comprehend performs the following actions to extract text
/// from files, based on the input file type:
///
/// <ul>
/// <li>
/// <b>Word files</b> - Amazon Comprehend parser extracts the text.
/// </li>
/// <li>
/// <b>Digital PDF files</b> - Amazon Comprehend parser extracts the text.
/// </li>
/// <li>
/// <b>Image files and scanned PDF files</b> - Amazon Comprehend uses the Amazon
/// Textract <code>DetectDocumentText</code> API to extract the text.
/// </li>
/// </ul>
/// <code>DocumentReaderConfig</code> does not apply to plain text files or Word
/// files.
///
/// For image files and PDF documents, you can override these default actions
/// using the fields listed below. For more information, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/idp-set-textract-options.html">
/// Setting text extraction options</a> in the Comprehend Developer Guide.
class DocumentReaderConfig {
  /// This field defines the Amazon Textract API operation that Amazon Comprehend
  /// uses to extract text from PDF files and image files. Enter one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>TEXTRACT_DETECT_DOCUMENT_TEXT</code> - The Amazon Comprehend service
  /// uses the <code>DetectDocumentText</code> API operation.
  /// </li>
  /// <li>
  /// <code>TEXTRACT_ANALYZE_DOCUMENT</code> - The Amazon Comprehend service uses
  /// the <code>AnalyzeDocument</code> API operation.
  /// </li>
  /// </ul>
  final DocumentReadAction documentReadAction;

  /// Determines the text extraction actions for PDF files. Enter one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>SERVICE_DEFAULT</code> - use the Amazon Comprehend service defaults
  /// for PDF files.
  /// </li>
  /// <li>
  /// <code>FORCE_DOCUMENT_READ_ACTION</code> - Amazon Comprehend uses the
  /// Textract API specified by DocumentReadAction for all PDF files, including
  /// digital PDF files.
  /// </li>
  /// </ul>
  final DocumentReadMode? documentReadMode;

  /// Specifies the type of Amazon Textract features to apply. If you chose
  /// <code>TEXTRACT_ANALYZE_DOCUMENT</code> as the read action, you must specify
  /// one or both of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>TABLES</code> - Returns additional information about any tables that
  /// are detected in the input document.
  /// </li>
  /// <li>
  /// <code>FORMS</code> - Returns additional information about any forms that are
  /// detected in the input document.
  /// </li>
  /// </ul>
  final List<DocumentReadFeatureTypes>? featureTypes;

  DocumentReaderConfig({
    required this.documentReadAction,
    this.documentReadMode,
    this.featureTypes,
  });

  factory DocumentReaderConfig.fromJson(Map<String, dynamic> json) {
    return DocumentReaderConfig(
      documentReadAction:
          (json['DocumentReadAction'] as String).toDocumentReadAction(),
      documentReadMode:
          (json['DocumentReadMode'] as String?)?.toDocumentReadMode(),
      featureTypes: (json['FeatureTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toDocumentReadFeatureTypes())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentReadAction = this.documentReadAction;
    final documentReadMode = this.documentReadMode;
    final featureTypes = this.featureTypes;
    return {
      'DocumentReadAction': documentReadAction.toValue(),
      if (documentReadMode != null)
        'DocumentReadMode': documentReadMode.toValue(),
      if (featureTypes != null)
        'FeatureTypes': featureTypes.map((e) => e.toValue()).toList(),
    };
  }
}

enum DocumentType {
  nativePdf,
  scannedPdf,
  msWord,
  image,
  plainText,
  textractDetectDocumentTextJson,
  textractAnalyzeDocumentJson,
}

extension DocumentTypeValueExtension on DocumentType {
  String toValue() {
    switch (this) {
      case DocumentType.nativePdf:
        return 'NATIVE_PDF';
      case DocumentType.scannedPdf:
        return 'SCANNED_PDF';
      case DocumentType.msWord:
        return 'MS_WORD';
      case DocumentType.image:
        return 'IMAGE';
      case DocumentType.plainText:
        return 'PLAIN_TEXT';
      case DocumentType.textractDetectDocumentTextJson:
        return 'TEXTRACT_DETECT_DOCUMENT_TEXT_JSON';
      case DocumentType.textractAnalyzeDocumentJson:
        return 'TEXTRACT_ANALYZE_DOCUMENT_JSON';
    }
  }
}

extension DocumentTypeFromString on String {
  DocumentType toDocumentType() {
    switch (this) {
      case 'NATIVE_PDF':
        return DocumentType.nativePdf;
      case 'SCANNED_PDF':
        return DocumentType.scannedPdf;
      case 'MS_WORD':
        return DocumentType.msWord;
      case 'IMAGE':
        return DocumentType.image;
      case 'PLAIN_TEXT':
        return DocumentType.plainText;
      case 'TEXTRACT_DETECT_DOCUMENT_TEXT_JSON':
        return DocumentType.textractDetectDocumentTextJson;
      case 'TEXTRACT_ANALYZE_DOCUMENT_JSON':
        return DocumentType.textractAnalyzeDocumentJson;
    }
    throw Exception('$this is not known in enum DocumentType');
  }
}

/// Document type for each page in the document.
class DocumentTypeListItem {
  /// Page number.
  final int? page;

  /// Document type.
  final DocumentType? type;

  DocumentTypeListItem({
    this.page,
    this.type,
  });

  factory DocumentTypeListItem.fromJson(Map<String, dynamic> json) {
    return DocumentTypeListItem(
      page: json['Page'] as int?,
      type: (json['Type'] as String?)?.toDocumentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final page = this.page;
    final type = this.type;
    return {
      if (page != null) 'Page': page,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Returns the code for the dominant language in the input text and the level
/// of confidence that Amazon Comprehend has in the accuracy of the detection.
class DominantLanguage {
  /// The RFC 5646 language code for the dominant language. For more information
  /// about RFC 5646, see <a href="https://tools.ietf.org/html/rfc5646">Tags for
  /// Identifying Languages</a> on the <i>IETF Tools</i> web site.
  final String? languageCode;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  DominantLanguage({
    this.languageCode,
    this.score,
  });

  factory DominantLanguage.fromJson(Map<String, dynamic> json) {
    return DominantLanguage(
      languageCode: json['LanguageCode'] as String?,
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final score = this.score;
    return {
      if (languageCode != null) 'LanguageCode': languageCode,
      if (score != null) 'Score': score,
    };
  }
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class DominantLanguageDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  DominantLanguageDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a dominant language detection job.
class DominantLanguageDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the dominant language detection job completed.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the dominant
  /// language detection job.
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the dominant language detection job. It is
  /// a unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:dominant-language-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the dominant language detection job.
  final String? jobId;

  /// The name that you assigned to the dominant language detection job.
  final String? jobName;

  /// The current status of the dominant language detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// A description for the status of a job.
  final String? message;

  /// The output data configuration that you supplied when you created the
  /// dominant language detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the dominant language detection job was submitted for
  /// processing.
  final DateTime? submitTime;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt data on the storage volume attached to the ML
  /// compute instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your dominant language detection
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  DominantLanguageDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory DominantLanguageDetectionJobProperties.fromJson(
      Map<String, dynamic> json) {
    return DominantLanguageDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final message = this.message;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (message != null) 'Message': message,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// The filter used to determine which endpoints are returned. You can filter
/// jobs on their name, model, status, or the date and time that they were
/// created. You can only set one filter at a time.
class EndpointFilter {
  /// Specifies a date after which the returned endpoint or endpoints were
  /// created.
  final DateTime? creationTimeAfter;

  /// Specifies a date before which the returned endpoint or endpoints were
  /// created.
  final DateTime? creationTimeBefore;

  /// The Amazon Resource Number (ARN) of the model to which the endpoint is
  /// attached.
  final String? modelArn;

  /// Specifies the status of the endpoint being returned. Possible values are:
  /// Creating, Ready, Updating, Deleting, Failed.
  final EndpointStatus? status;

  EndpointFilter({
    this.creationTimeAfter,
    this.creationTimeBefore,
    this.modelArn,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final creationTimeAfter = this.creationTimeAfter;
    final creationTimeBefore = this.creationTimeBefore;
    final modelArn = this.modelArn;
    final status = this.status;
    return {
      if (creationTimeAfter != null)
        'CreationTimeAfter': unixTimestampToJson(creationTimeAfter),
      if (creationTimeBefore != null)
        'CreationTimeBefore': unixTimestampToJson(creationTimeBefore),
      if (modelArn != null) 'ModelArn': modelArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Specifies information about the specified endpoint. For information about
/// endpoints, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing
/// endpoints</a>.
class EndpointProperties {
  /// The creation date and time of the endpoint.
  final DateTime? creationTime;

  /// The number of inference units currently used by the model using this
  /// endpoint.
  final int? currentInferenceUnits;

  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to trained custom models encrypted with a customer managed key
  /// (ModelKmsKeyId).
  final String? dataAccessRoleArn;

  /// Data access role ARN to use in case the new model is encrypted with a
  /// customer KMS key.
  final String? desiredDataAccessRoleArn;

  /// The desired number of inference units to be used by the model using this
  /// endpoint. Each inference unit represents of a throughput of 100 characters
  /// per second.
  final int? desiredInferenceUnits;

  /// ARN of the new model to use for updating an existing endpoint. This ARN is
  /// going to be different from the model ARN when the update is in progress
  final String? desiredModelArn;

  /// The Amazon Resource Number (ARN) of the endpoint.
  final String? endpointArn;

  /// The Amazon Resource Number (ARN) of the flywheel
  final String? flywheelArn;

  /// The date and time that the endpoint was last modified.
  final DateTime? lastModifiedTime;

  /// Specifies a reason for failure in cases of <code>Failed</code> status.
  final String? message;

  /// The Amazon Resource Number (ARN) of the model to which the endpoint is
  /// attached.
  final String? modelArn;

  /// Specifies the status of the endpoint. Because the endpoint updates and
  /// creation are asynchronous, so customers will need to wait for the endpoint
  /// to be <code>Ready</code> status before making inference requests.
  final EndpointStatus? status;

  EndpointProperties({
    this.creationTime,
    this.currentInferenceUnits,
    this.dataAccessRoleArn,
    this.desiredDataAccessRoleArn,
    this.desiredInferenceUnits,
    this.desiredModelArn,
    this.endpointArn,
    this.flywheelArn,
    this.lastModifiedTime,
    this.message,
    this.modelArn,
    this.status,
  });

  factory EndpointProperties.fromJson(Map<String, dynamic> json) {
    return EndpointProperties(
      creationTime: timeStampFromJson(json['CreationTime']),
      currentInferenceUnits: json['CurrentInferenceUnits'] as int?,
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      desiredDataAccessRoleArn: json['DesiredDataAccessRoleArn'] as String?,
      desiredInferenceUnits: json['DesiredInferenceUnits'] as int?,
      desiredModelArn: json['DesiredModelArn'] as String?,
      endpointArn: json['EndpointArn'] as String?,
      flywheelArn: json['FlywheelArn'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      message: json['Message'] as String?,
      modelArn: json['ModelArn'] as String?,
      status: (json['Status'] as String?)?.toEndpointStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final currentInferenceUnits = this.currentInferenceUnits;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final desiredDataAccessRoleArn = this.desiredDataAccessRoleArn;
    final desiredInferenceUnits = this.desiredInferenceUnits;
    final desiredModelArn = this.desiredModelArn;
    final endpointArn = this.endpointArn;
    final flywheelArn = this.flywheelArn;
    final lastModifiedTime = this.lastModifiedTime;
    final message = this.message;
    final modelArn = this.modelArn;
    final status = this.status;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentInferenceUnits != null)
        'CurrentInferenceUnits': currentInferenceUnits,
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (desiredDataAccessRoleArn != null)
        'DesiredDataAccessRoleArn': desiredDataAccessRoleArn,
      if (desiredInferenceUnits != null)
        'DesiredInferenceUnits': desiredInferenceUnits,
      if (desiredModelArn != null) 'DesiredModelArn': desiredModelArn,
      if (endpointArn != null) 'EndpointArn': endpointArn,
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (message != null) 'Message': message,
      if (modelArn != null) 'ModelArn': modelArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum EndpointStatus {
  creating,
  deleting,
  failed,
  inService,
  updating,
}

extension EndpointStatusValueExtension on EndpointStatus {
  String toValue() {
    switch (this) {
      case EndpointStatus.creating:
        return 'CREATING';
      case EndpointStatus.deleting:
        return 'DELETING';
      case EndpointStatus.failed:
        return 'FAILED';
      case EndpointStatus.inService:
        return 'IN_SERVICE';
      case EndpointStatus.updating:
        return 'UPDATING';
    }
  }
}

extension EndpointStatusFromString on String {
  EndpointStatus toEndpointStatus() {
    switch (this) {
      case 'CREATING':
        return EndpointStatus.creating;
      case 'DELETING':
        return EndpointStatus.deleting;
      case 'FAILED':
        return EndpointStatus.failed;
      case 'IN_SERVICE':
        return EndpointStatus.inService;
      case 'UPDATING':
        return EndpointStatus.updating;
    }
    throw Exception('$this is not known in enum EndpointStatus');
  }
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class EntitiesDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  EntitiesDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about an entities detection job.
class EntitiesDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the entities detection job completed
  final DateTime? endTime;

  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String? entityRecognizerArn;

  /// The Amazon Resource Name (ARN) of the flywheel associated with this job.
  final String? flywheelArn;

  /// The input data configuration that you supplied when you created the entities
  /// detection job.
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the entities detection job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:entities-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the entities detection job.
  final String? jobId;

  /// The name that you assigned the entities detection job.
  final String? jobName;

  /// The current status of the entities detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;

  /// The output data configuration that you supplied when you created the
  /// entities detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the entities detection job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt data on the storage volume attached to the ML
  /// compute instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your entity detection job. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  EntitiesDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.entityRecognizerArn,
    this.flywheelArn,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory EntitiesDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return EntitiesDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      entityRecognizerArn: json['EntityRecognizerArn'] as String?,
      flywheelArn: json['FlywheelArn'] as String?,
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final entityRecognizerArn = this.entityRecognizerArn;
    final flywheelArn = this.flywheelArn;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final languageCode = this.languageCode;
    final message = this.message;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (entityRecognizerArn != null)
        'EntityRecognizerArn': entityRecognizerArn,
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (message != null) 'Message': message,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// Provides information about an entity.
///
///
class Entity {
  /// The zero-based offset from the beginning of the source text to the first
  /// character in the entity.
  ///
  /// This field is empty for non-text input.
  final int? beginOffset;

  /// A reference to each block for this entity. This field is empty for
  /// plain-text input.
  final List<BlockReference>? blockReferences;

  /// The zero-based offset from the beginning of the source text to the last
  /// character in the entity.
  ///
  /// This field is empty for non-text input.
  final int? endOffset;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  /// The text of the entity.
  final String? text;

  /// The entity type. For entity detection using the built-in model, this field
  /// contains one of the standard entity types listed below.
  ///
  /// For custom entity detection, this field contains one of the entity types
  /// that you specified when you trained your custom model.
  final EntityType? type;

  Entity({
    this.beginOffset,
    this.blockReferences,
    this.endOffset,
    this.score,
    this.text,
    this.type,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      beginOffset: json['BeginOffset'] as int?,
      blockReferences: (json['BlockReferences'] as List?)
          ?.whereNotNull()
          .map((e) => BlockReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      endOffset: json['EndOffset'] as int?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      type: (json['Type'] as String?)?.toEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final blockReferences = this.blockReferences;
    final endOffset = this.endOffset;
    final score = this.score;
    final text = this.text;
    final type = this.type;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (blockReferences != null) 'BlockReferences': blockReferences,
      if (endOffset != null) 'EndOffset': endOffset,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Specifies one of the label or labels that categorize the personally
/// identifiable information (PII) entity being analyzed.
class EntityLabel {
  /// The name of the label.
  final PiiEntityType? name;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  EntityLabel({
    this.name,
    this.score,
  });

  factory EntityLabel.fromJson(Map<String, dynamic> json) {
    return EntityLabel(
      name: (json['Name'] as String?)?.toPiiEntityType(),
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final score = this.score;
    return {
      if (name != null) 'Name': name.toValue(),
      if (score != null) 'Score': score,
    };
  }
}

/// Configuration required for an entity recognition model.
class EntityRecognitionConfig {
  /// Up to 25 entity types that the model is trained to recognize.
  final List<EntityTypesListItem> entityTypes;

  EntityRecognitionConfig({
    required this.entityTypes,
  });

  factory EntityRecognitionConfig.fromJson(Map<String, dynamic> json) {
    return EntityRecognitionConfig(
      entityTypes: (json['EntityTypes'] as List)
          .whereNotNull()
          .map((e) => EntityTypesListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entityTypes = this.entityTypes;
    return {
      'EntityTypes': entityTypes,
    };
  }
}

/// Describes the annotations associated with a entity recognizer.
class EntityRecognizerAnnotations {
  /// Specifies the Amazon S3 location where the annotations for an entity
  /// recognizer are located. The URI must be in the same Region as the API
  /// endpoint that you are calling.
  final String s3Uri;

  /// Specifies the Amazon S3 location where the test annotations for an entity
  /// recognizer are located. The URI must be in the same Region as the API
  /// endpoint that you are calling.
  final String? testS3Uri;

  EntityRecognizerAnnotations({
    required this.s3Uri,
    this.testS3Uri,
  });

  factory EntityRecognizerAnnotations.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerAnnotations(
      s3Uri: json['S3Uri'] as String,
      testS3Uri: json['TestS3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final testS3Uri = this.testS3Uri;
    return {
      'S3Uri': s3Uri,
      if (testS3Uri != null) 'TestS3Uri': testS3Uri,
    };
  }
}

enum EntityRecognizerDataFormat {
  comprehendCsv,
  augmentedManifest,
}

extension EntityRecognizerDataFormatValueExtension
    on EntityRecognizerDataFormat {
  String toValue() {
    switch (this) {
      case EntityRecognizerDataFormat.comprehendCsv:
        return 'COMPREHEND_CSV';
      case EntityRecognizerDataFormat.augmentedManifest:
        return 'AUGMENTED_MANIFEST';
    }
  }
}

extension EntityRecognizerDataFormatFromString on String {
  EntityRecognizerDataFormat toEntityRecognizerDataFormat() {
    switch (this) {
      case 'COMPREHEND_CSV':
        return EntityRecognizerDataFormat.comprehendCsv;
      case 'AUGMENTED_MANIFEST':
        return EntityRecognizerDataFormat.augmentedManifest;
    }
    throw Exception('$this is not known in enum EntityRecognizerDataFormat');
  }
}

/// Describes the training documents submitted with an entity recognizer.
class EntityRecognizerDocuments {
  /// Specifies the Amazon S3 location where the training documents for an entity
  /// recognizer are located. The URI must be in the same Region as the API
  /// endpoint that you are calling.
  final String s3Uri;

  /// Specifies how the text in an input file should be processed. This is
  /// optional, and the default is ONE_DOC_PER_LINE. ONE_DOC_PER_FILE - Each file
  /// is considered a separate document. Use this option when you are processing
  /// large documents, such as newspaper articles or scientific papers.
  /// ONE_DOC_PER_LINE - Each line in a file is considered a separate document.
  /// Use this option when you are processing many short documents, such as text
  /// messages.
  final InputFormat? inputFormat;

  /// Specifies the Amazon S3 location where the test documents for an entity
  /// recognizer are located. The URI must be in the same Amazon Web Services
  /// Region as the API endpoint that you are calling.
  final String? testS3Uri;

  EntityRecognizerDocuments({
    required this.s3Uri,
    this.inputFormat,
    this.testS3Uri,
  });

  factory EntityRecognizerDocuments.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerDocuments(
      s3Uri: json['S3Uri'] as String,
      inputFormat: (json['InputFormat'] as String?)?.toInputFormat(),
      testS3Uri: json['TestS3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final inputFormat = this.inputFormat;
    final testS3Uri = this.testS3Uri;
    return {
      'S3Uri': s3Uri,
      if (inputFormat != null) 'InputFormat': inputFormat.toValue(),
      if (testS3Uri != null) 'TestS3Uri': testS3Uri,
    };
  }
}

/// Describes the entity list submitted with an entity recognizer.
class EntityRecognizerEntityList {
  /// Specifies the Amazon S3 location where the entity list is located. The URI
  /// must be in the same Region as the API endpoint that you are calling.
  final String s3Uri;

  EntityRecognizerEntityList({
    required this.s3Uri,
  });

  factory EntityRecognizerEntityList.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerEntityList(
      s3Uri: json['S3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      'S3Uri': s3Uri,
    };
  }
}

/// Detailed information about the accuracy of an entity recognizer.
class EntityRecognizerEvaluationMetrics {
  /// A measure of how accurate the recognizer results are for the test data. It
  /// is derived from the <code>Precision</code> and <code>Recall</code> values.
  /// The <code>F1Score</code> is the harmonic average of the two scores. For
  /// plain text entity recognizer models, the range is 0 to 100, where 100 is the
  /// best score. For PDF/Word entity recognizer models, the range is 0 to 1,
  /// where 1 is the best score.
  final double? f1Score;

  /// A measure of the usefulness of the recognizer results in the test data. High
  /// precision means that the recognizer returned substantially more relevant
  /// results than irrelevant ones.
  final double? precision;

  /// A measure of how complete the recognizer results are for the test data. High
  /// recall means that the recognizer returned most of the relevant results.
  final double? recall;

  EntityRecognizerEvaluationMetrics({
    this.f1Score,
    this.precision,
    this.recall,
  });

  factory EntityRecognizerEvaluationMetrics.fromJson(
      Map<String, dynamic> json) {
    return EntityRecognizerEvaluationMetrics(
      f1Score: json['F1Score'] as double?,
      precision: json['Precision'] as double?,
      recall: json['Recall'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final f1Score = this.f1Score;
    final precision = this.precision;
    final recall = this.recall;
    return {
      if (f1Score != null) 'F1Score': f1Score,
      if (precision != null) 'Precision': precision,
      if (recall != null) 'Recall': recall,
    };
  }
}

/// Provides information for filtering a list of entity recognizers. You can
/// only specify one filtering parameter in a request. For more information, see
/// the <code>ListEntityRecognizers</code> operation./&gt;
class EntityRecognizerFilter {
  /// The name that you assigned the entity recognizer.
  final String? recognizerName;

  /// The status of an entity recognizer.
  final ModelStatus? status;

  /// Filters the list of entities based on the time that the list was submitted
  /// for processing. Returns only jobs submitted after the specified time. Jobs
  /// are returned in ascending order, oldest to newest.
  final DateTime? submitTimeAfter;

  /// Filters the list of entities based on the time that the list was submitted
  /// for processing. Returns only jobs submitted before the specified time. Jobs
  /// are returned in descending order, newest to oldest.
  final DateTime? submitTimeBefore;

  EntityRecognizerFilter({
    this.recognizerName,
    this.status,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final recognizerName = this.recognizerName;
    final status = this.status;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (recognizerName != null) 'RecognizerName': recognizerName,
      if (status != null) 'Status': status.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Specifies the format and location of the input data.
class EntityRecognizerInputDataConfig {
  /// The entity types in the labeled training data that Amazon Comprehend uses to
  /// train the custom entity recognizer. Any entity types that you don't specify
  /// are ignored.
  ///
  /// A maximum of 25 entity types can be used at one time to train an entity
  /// recognizer. Entity types must not contain the following invalid characters:
  /// \n (line break), \\n (escaped line break), \r (carriage return), \\r
  /// (escaped carriage return), \t (tab), \\t (escaped tab), space, and ,
  /// (comma).
  final List<EntityTypesListItem> entityTypes;

  /// The S3 location of the CSV file that annotates your training documents.
  final EntityRecognizerAnnotations? annotations;

  /// A list of augmented manifest files that provide training data for your
  /// custom model. An augmented manifest file is a labeled dataset that is
  /// produced by Amazon SageMaker Ground Truth.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>AUGMENTED_MANIFEST</code>.
  final List<AugmentedManifestsListItem>? augmentedManifests;

  /// The format of your training data:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPREHEND_CSV</code>: A CSV file that supplements your training
  /// documents. The CSV file contains information about the custom entities that
  /// your trained model will detect. The required format of the file depends on
  /// whether you are providing annotations or an entity list.
  ///
  /// If you use this value, you must provide your CSV file by using either the
  /// <code>Annotations</code> or <code>EntityList</code> parameters. You must
  /// provide your training documents by using the <code>Documents</code>
  /// parameter.
  /// </li>
  /// <li>
  /// <code>AUGMENTED_MANIFEST</code>: A labeled dataset that is produced by
  /// Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line
  /// is a complete JSON object that contains a training document and its labels.
  /// Each label annotates a named entity in the training document.
  ///
  /// If you use this value, you must provide the <code>AugmentedManifests</code>
  /// parameter in your request.
  /// </li>
  /// </ul>
  /// If you don't specify a value, Amazon Comprehend uses
  /// <code>COMPREHEND_CSV</code> as the default.
  final EntityRecognizerDataFormat? dataFormat;

  /// The S3 location of the folder that contains the training documents for your
  /// custom entity recognizer.
  ///
  /// This parameter is required if you set <code>DataFormat</code> to
  /// <code>COMPREHEND_CSV</code>.
  final EntityRecognizerDocuments? documents;

  /// The S3 location of the CSV file that has the entity list for your custom
  /// entity recognizer.
  final EntityRecognizerEntityList? entityList;

  EntityRecognizerInputDataConfig({
    required this.entityTypes,
    this.annotations,
    this.augmentedManifests,
    this.dataFormat,
    this.documents,
    this.entityList,
  });

  factory EntityRecognizerInputDataConfig.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerInputDataConfig(
      entityTypes: (json['EntityTypes'] as List)
          .whereNotNull()
          .map((e) => EntityTypesListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      annotations: json['Annotations'] != null
          ? EntityRecognizerAnnotations.fromJson(
              json['Annotations'] as Map<String, dynamic>)
          : null,
      augmentedManifests: (json['AugmentedManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AugmentedManifestsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataFormat:
          (json['DataFormat'] as String?)?.toEntityRecognizerDataFormat(),
      documents: json['Documents'] != null
          ? EntityRecognizerDocuments.fromJson(
              json['Documents'] as Map<String, dynamic>)
          : null,
      entityList: json['EntityList'] != null
          ? EntityRecognizerEntityList.fromJson(
              json['EntityList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entityTypes = this.entityTypes;
    final annotations = this.annotations;
    final augmentedManifests = this.augmentedManifests;
    final dataFormat = this.dataFormat;
    final documents = this.documents;
    final entityList = this.entityList;
    return {
      'EntityTypes': entityTypes,
      if (annotations != null) 'Annotations': annotations,
      if (augmentedManifests != null) 'AugmentedManifests': augmentedManifests,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (documents != null) 'Documents': documents,
      if (entityList != null) 'EntityList': entityList,
    };
  }
}

/// Detailed information about an entity recognizer.
class EntityRecognizerMetadata {
  /// Entity types from the metadata of an entity recognizer.
  final List<EntityRecognizerMetadataEntityTypesListItem>? entityTypes;

  /// Detailed information about the accuracy of an entity recognizer.
  final EntityRecognizerEvaluationMetrics? evaluationMetrics;

  /// The number of documents in the input data that were used to test the entity
  /// recognizer. Typically this is 10 to 20 percent of the input documents.
  final int? numberOfTestDocuments;

  /// The number of documents in the input data that were used to train the entity
  /// recognizer. Typically this is 80 to 90 percent of the input documents.
  final int? numberOfTrainedDocuments;

  EntityRecognizerMetadata({
    this.entityTypes,
    this.evaluationMetrics,
    this.numberOfTestDocuments,
    this.numberOfTrainedDocuments,
  });

  factory EntityRecognizerMetadata.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerMetadata(
      entityTypes: (json['EntityTypes'] as List?)
          ?.whereNotNull()
          .map((e) => EntityRecognizerMetadataEntityTypesListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      evaluationMetrics: json['EvaluationMetrics'] != null
          ? EntityRecognizerEvaluationMetrics.fromJson(
              json['EvaluationMetrics'] as Map<String, dynamic>)
          : null,
      numberOfTestDocuments: json['NumberOfTestDocuments'] as int?,
      numberOfTrainedDocuments: json['NumberOfTrainedDocuments'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityTypes = this.entityTypes;
    final evaluationMetrics = this.evaluationMetrics;
    final numberOfTestDocuments = this.numberOfTestDocuments;
    final numberOfTrainedDocuments = this.numberOfTrainedDocuments;
    return {
      if (entityTypes != null) 'EntityTypes': entityTypes,
      if (evaluationMetrics != null) 'EvaluationMetrics': evaluationMetrics,
      if (numberOfTestDocuments != null)
        'NumberOfTestDocuments': numberOfTestDocuments,
      if (numberOfTrainedDocuments != null)
        'NumberOfTrainedDocuments': numberOfTrainedDocuments,
    };
  }
}

/// Individual item from the list of entity types in the metadata of an entity
/// recognizer.
class EntityRecognizerMetadataEntityTypesListItem {
  /// Detailed information about the accuracy of the entity recognizer for a
  /// specific item on the list of entity types.
  final EntityTypesEvaluationMetrics? evaluationMetrics;

  /// Indicates the number of times the given entity type was seen in the training
  /// data.
  final int? numberOfTrainMentions;

  /// Type of entity from the list of entity types in the metadata of an entity
  /// recognizer.
  final String? type;

  EntityRecognizerMetadataEntityTypesListItem({
    this.evaluationMetrics,
    this.numberOfTrainMentions,
    this.type,
  });

  factory EntityRecognizerMetadataEntityTypesListItem.fromJson(
      Map<String, dynamic> json) {
    return EntityRecognizerMetadataEntityTypesListItem(
      evaluationMetrics: json['EvaluationMetrics'] != null
          ? EntityTypesEvaluationMetrics.fromJson(
              json['EvaluationMetrics'] as Map<String, dynamic>)
          : null,
      numberOfTrainMentions: json['NumberOfTrainMentions'] as int?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationMetrics = this.evaluationMetrics;
    final numberOfTrainMentions = this.numberOfTrainMentions;
    final type = this.type;
    return {
      if (evaluationMetrics != null) 'EvaluationMetrics': evaluationMetrics,
      if (numberOfTrainMentions != null)
        'NumberOfTrainMentions': numberOfTrainMentions,
      if (type != null) 'Type': type,
    };
  }
}

/// Output data configuration.
class EntityRecognizerOutputDataConfig {
  /// The Amazon S3 prefix for the data lake location of the flywheel statistics.
  final String? flywheelStatsS3Prefix;

  EntityRecognizerOutputDataConfig({
    this.flywheelStatsS3Prefix,
  });

  factory EntityRecognizerOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerOutputDataConfig(
      flywheelStatsS3Prefix: json['FlywheelStatsS3Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flywheelStatsS3Prefix = this.flywheelStatsS3Prefix;
    return {
      if (flywheelStatsS3Prefix != null)
        'FlywheelStatsS3Prefix': flywheelStatsS3Prefix,
    };
  }
}

/// Describes information about an entity recognizer.
class EntityRecognizerProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the recognizer creation completed.
  final DateTime? endTime;

  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String? entityRecognizerArn;

  /// The Amazon Resource Number (ARN) of the flywheel
  final String? flywheelArn;

  /// The input data properties of an entity recognizer.
  final EntityRecognizerInputDataConfig? inputDataConfig;

  /// The language of the input documents. All documents must be in the same
  /// language. Only English ("en") is currently supported.
  final LanguageCode? languageCode;

  /// A description of the status of the recognizer.
  final String? message;

  /// ID for the KMS key that Amazon Comprehend uses to encrypt trained custom
  /// models. The ModelKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? modelKmsKeyId;

  /// Output data configuration.
  final EntityRecognizerOutputDataConfig? outputDataConfig;

  /// Provides information about an entity recognizer.
  final EntityRecognizerMetadata? recognizerMetadata;

  /// The Amazon Resource Name (ARN) of the source model. This model was imported
  /// from a different Amazon Web Services account to create the entity recognizer
  /// model in your Amazon Web Services account.
  final String? sourceModelArn;

  /// Provides the status of the entity recognizer.
  final ModelStatus? status;

  /// The time that the recognizer was submitted for processing.
  final DateTime? submitTime;

  /// The time that training of the entity recognizer was completed.
  final DateTime? trainingEndTime;

  /// The time that training of the entity recognizer started.
  final DateTime? trainingStartTime;

  /// The version name you assigned to the entity recognizer.
  final String? versionName;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt data on the storage volume attached to the ML
  /// compute instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your custom entity recognizer.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  EntityRecognizerProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.entityRecognizerArn,
    this.flywheelArn,
    this.inputDataConfig,
    this.languageCode,
    this.message,
    this.modelKmsKeyId,
    this.outputDataConfig,
    this.recognizerMetadata,
    this.sourceModelArn,
    this.status,
    this.submitTime,
    this.trainingEndTime,
    this.trainingStartTime,
    this.versionName,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory EntityRecognizerProperties.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      entityRecognizerArn: json['EntityRecognizerArn'] as String?,
      flywheelArn: json['FlywheelArn'] as String?,
      inputDataConfig: json['InputDataConfig'] != null
          ? EntityRecognizerInputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      modelKmsKeyId: json['ModelKmsKeyId'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? EntityRecognizerOutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      recognizerMetadata: json['RecognizerMetadata'] != null
          ? EntityRecognizerMetadata.fromJson(
              json['RecognizerMetadata'] as Map<String, dynamic>)
          : null,
      sourceModelArn: json['SourceModelArn'] as String?,
      status: (json['Status'] as String?)?.toModelStatus(),
      submitTime: timeStampFromJson(json['SubmitTime']),
      trainingEndTime: timeStampFromJson(json['TrainingEndTime']),
      trainingStartTime: timeStampFromJson(json['TrainingStartTime']),
      versionName: json['VersionName'] as String?,
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final entityRecognizerArn = this.entityRecognizerArn;
    final flywheelArn = this.flywheelArn;
    final inputDataConfig = this.inputDataConfig;
    final languageCode = this.languageCode;
    final message = this.message;
    final modelKmsKeyId = this.modelKmsKeyId;
    final outputDataConfig = this.outputDataConfig;
    final recognizerMetadata = this.recognizerMetadata;
    final sourceModelArn = this.sourceModelArn;
    final status = this.status;
    final submitTime = this.submitTime;
    final trainingEndTime = this.trainingEndTime;
    final trainingStartTime = this.trainingStartTime;
    final versionName = this.versionName;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (entityRecognizerArn != null)
        'EntityRecognizerArn': entityRecognizerArn,
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (message != null) 'Message': message,
      if (modelKmsKeyId != null) 'ModelKmsKeyId': modelKmsKeyId,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (recognizerMetadata != null) 'RecognizerMetadata': recognizerMetadata,
      if (sourceModelArn != null) 'SourceModelArn': sourceModelArn,
      if (status != null) 'Status': status.toValue(),
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (trainingEndTime != null)
        'TrainingEndTime': unixTimestampToJson(trainingEndTime),
      if (trainingStartTime != null)
        'TrainingStartTime': unixTimestampToJson(trainingStartTime),
      if (versionName != null) 'VersionName': versionName,
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// Describes the information about an entity recognizer and its versions.
class EntityRecognizerSummary {
  /// The time that the latest entity recognizer version was submitted for
  /// processing.
  final DateTime? latestVersionCreatedAt;

  /// The version name you assigned to the latest entity recognizer version.
  final String? latestVersionName;

  /// Provides the status of the latest entity recognizer version.
  final ModelStatus? latestVersionStatus;

  /// The number of versions you created.
  final int? numberOfVersions;

  /// The name that you assigned the entity recognizer.
  final String? recognizerName;

  EntityRecognizerSummary({
    this.latestVersionCreatedAt,
    this.latestVersionName,
    this.latestVersionStatus,
    this.numberOfVersions,
    this.recognizerName,
  });

  factory EntityRecognizerSummary.fromJson(Map<String, dynamic> json) {
    return EntityRecognizerSummary(
      latestVersionCreatedAt: timeStampFromJson(json['LatestVersionCreatedAt']),
      latestVersionName: json['LatestVersionName'] as String?,
      latestVersionStatus:
          (json['LatestVersionStatus'] as String?)?.toModelStatus(),
      numberOfVersions: json['NumberOfVersions'] as int?,
      recognizerName: json['RecognizerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestVersionCreatedAt = this.latestVersionCreatedAt;
    final latestVersionName = this.latestVersionName;
    final latestVersionStatus = this.latestVersionStatus;
    final numberOfVersions = this.numberOfVersions;
    final recognizerName = this.recognizerName;
    return {
      if (latestVersionCreatedAt != null)
        'LatestVersionCreatedAt': unixTimestampToJson(latestVersionCreatedAt),
      if (latestVersionName != null) 'LatestVersionName': latestVersionName,
      if (latestVersionStatus != null)
        'LatestVersionStatus': latestVersionStatus.toValue(),
      if (numberOfVersions != null) 'NumberOfVersions': numberOfVersions,
      if (recognizerName != null) 'RecognizerName': recognizerName,
    };
  }
}

enum EntityType {
  person,
  location,
  organization,
  commercialItem,
  event,
  date,
  quantity,
  title,
  other,
}

extension EntityTypeValueExtension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.person:
        return 'PERSON';
      case EntityType.location:
        return 'LOCATION';
      case EntityType.organization:
        return 'ORGANIZATION';
      case EntityType.commercialItem:
        return 'COMMERCIAL_ITEM';
      case EntityType.event:
        return 'EVENT';
      case EntityType.date:
        return 'DATE';
      case EntityType.quantity:
        return 'QUANTITY';
      case EntityType.title:
        return 'TITLE';
      case EntityType.other:
        return 'OTHER';
    }
  }
}

extension EntityTypeFromString on String {
  EntityType toEntityType() {
    switch (this) {
      case 'PERSON':
        return EntityType.person;
      case 'LOCATION':
        return EntityType.location;
      case 'ORGANIZATION':
        return EntityType.organization;
      case 'COMMERCIAL_ITEM':
        return EntityType.commercialItem;
      case 'EVENT':
        return EntityType.event;
      case 'DATE':
        return EntityType.date;
      case 'QUANTITY':
        return EntityType.quantity;
      case 'TITLE':
        return EntityType.title;
      case 'OTHER':
        return EntityType.other;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

/// Detailed information about the accuracy of an entity recognizer for a
/// specific entity type.
class EntityTypesEvaluationMetrics {
  /// A measure of how accurate the recognizer results are for a specific entity
  /// type in the test data. It is derived from the <code>Precision</code> and
  /// <code>Recall</code> values. The <code>F1Score</code> is the harmonic average
  /// of the two scores. The highest score is 1, and the worst score is 0.
  final double? f1Score;

  /// A measure of the usefulness of the recognizer results for a specific entity
  /// type in the test data. High precision means that the recognizer returned
  /// substantially more relevant results than irrelevant ones.
  final double? precision;

  /// A measure of how complete the recognizer results are for a specific entity
  /// type in the test data. High recall means that the recognizer returned most
  /// of the relevant results.
  final double? recall;

  EntityTypesEvaluationMetrics({
    this.f1Score,
    this.precision,
    this.recall,
  });

  factory EntityTypesEvaluationMetrics.fromJson(Map<String, dynamic> json) {
    return EntityTypesEvaluationMetrics(
      f1Score: json['F1Score'] as double?,
      precision: json['Precision'] as double?,
      recall: json['Recall'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final f1Score = this.f1Score;
    final precision = this.precision;
    final recall = this.recall;
    return {
      if (f1Score != null) 'F1Score': f1Score,
      if (precision != null) 'Precision': precision,
      if (recall != null) 'Recall': recall,
    };
  }
}

/// An entity type within a labeled training dataset that Amazon Comprehend uses
/// to train a custom entity recognizer.
class EntityTypesListItem {
  /// An entity type within a labeled training dataset that Amazon Comprehend uses
  /// to train a custom entity recognizer.
  ///
  /// Entity types must not contain the following invalid characters: \n (line
  /// break), \\n (escaped line break, \r (carriage return), \\r (escaped carriage
  /// return), \t (tab), \\t (escaped tab), and , (comma).
  final String type;

  EntityTypesListItem({
    required this.type,
  });

  factory EntityTypesListItem.fromJson(Map<String, dynamic> json) {
    return EntityTypesListItem(
      type: json['Type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'Type': type,
    };
  }
}

/// Text extraction encountered one or more page-level errors in the input
/// document.
///
/// The <code>ErrorCode</code> contains one of the following values:
///
/// <ul>
/// <li>
/// TEXTRACT_BAD_PAGE - Amazon Textract cannot read the page. For more
/// information about page limits in Amazon Textract, see <a
/// href="https://docs.aws.amazon.com/textract/latest/dg/limits-document.html">
/// Page Quotas in Amazon Textract</a>.
/// </li>
/// <li>
/// TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED - The number of requests exceeded
/// your throughput limit. For more information about throughput quotas in
/// Amazon Textract, see <a
/// href="https://docs.aws.amazon.com/textract/latest/dg/limits-quotas-explained.html">
/// Default quotas in Amazon Textract</a>.
/// </li>
/// <li>
/// PAGE_CHARACTERS_EXCEEDED - Too many text characters on the page (10,000
/// characters maximum).
/// </li>
/// <li>
/// PAGE_SIZE_EXCEEDED - The maximum page size is 10 MB.
/// </li>
/// <li>
/// INTERNAL_SERVER_ERROR - The request encountered a service issue. Try the API
/// request again.
/// </li>
/// </ul>
class ErrorsListItem {
  /// Error code for the cause of the error.
  final PageBasedErrorCode? errorCode;

  /// Text message explaining the reason for the error.
  final String? errorMessage;

  /// Page number where the error occurred.
  final int? page;

  ErrorsListItem({
    this.errorCode,
    this.errorMessage,
    this.page,
  });

  factory ErrorsListItem.fromJson(Map<String, dynamic> json) {
    return ErrorsListItem(
      errorCode: (json['ErrorCode'] as String?)?.toPageBasedErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      page: json['Page'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final page = this.page;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (page != null) 'Page': page,
    };
  }
}

/// Provides information for filtering a list of event detection jobs.
class EventsDetectionJobFilter {
  /// Filters on the name of the events detection job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  EventsDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about an events detection job.
class EventsDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the events detection job completed.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the events
  /// detection job.
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the events detection job. It is a unique,
  /// fully qualified identifier for the job. It includes the Amazon Web Services
  /// account, Amazon Web Services Region, and the job ID. The format of the ARN
  /// is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:events-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the events detection job.
  final String? jobId;

  /// The name you assigned the events detection job.
  final String? jobName;

  /// The current status of the events detection job.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of the events detection job.
  final String? message;

  /// The output data configuration that you supplied when you created the events
  /// detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the events detection job was submitted for processing.
  final DateTime? submitTime;

  /// The types of events that are detected by the job.
  final List<String>? targetEventTypes;

  EventsDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.targetEventTypes,
  });

  factory EventsDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return EventsDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      targetEventTypes: (json['TargetEventTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final languageCode = this.languageCode;
    final message = this.message;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final targetEventTypes = this.targetEventTypes;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (message != null) 'Message': message,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (targetEventTypes != null) 'TargetEventTypes': targetEventTypes,
    };
  }
}

/// Array of the number of characters extracted from each page.
class ExtractedCharactersListItem {
  /// Number of characters extracted from each page.
  final int? count;

  /// Page number.
  final int? page;

  ExtractedCharactersListItem({
    this.count,
    this.page,
  });

  factory ExtractedCharactersListItem.fromJson(Map<String, dynamic> json) {
    return ExtractedCharactersListItem(
      count: json['Count'] as int?,
      page: json['Page'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final page = this.page;
    return {
      if (count != null) 'Count': count,
      if (page != null) 'Page': page,
    };
  }
}

/// Filter the flywheels based on creation time or flywheel status.
class FlywheelFilter {
  /// Filter the flywheels to include flywheels created after the specified time.
  final DateTime? creationTimeAfter;

  /// Filter the flywheels to include flywheels created before the specified time.
  final DateTime? creationTimeBefore;

  /// Filter the flywheels based on the flywheel status.
  final FlywheelStatus? status;

  FlywheelFilter({
    this.creationTimeAfter,
    this.creationTimeBefore,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final creationTimeAfter = this.creationTimeAfter;
    final creationTimeBefore = this.creationTimeBefore;
    final status = this.status;
    return {
      if (creationTimeAfter != null)
        'CreationTimeAfter': unixTimestampToJson(creationTimeAfter),
      if (creationTimeBefore != null)
        'CreationTimeBefore': unixTimestampToJson(creationTimeBefore),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Filter the flywheel iterations based on creation time.
class FlywheelIterationFilter {
  /// Filter the flywheel iterations to include iterations created after the
  /// specified time.
  final DateTime? creationTimeAfter;

  /// Filter the flywheel iterations to include iterations created before the
  /// specified time.
  final DateTime? creationTimeBefore;

  FlywheelIterationFilter({
    this.creationTimeAfter,
    this.creationTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final creationTimeAfter = this.creationTimeAfter;
    final creationTimeBefore = this.creationTimeBefore;
    return {
      if (creationTimeAfter != null)
        'CreationTimeAfter': unixTimestampToJson(creationTimeAfter),
      if (creationTimeBefore != null)
        'CreationTimeBefore': unixTimestampToJson(creationTimeBefore),
    };
  }
}

/// The configuration properties of a flywheel iteration.
class FlywheelIterationProperties {
  /// The creation start time of the flywheel iteration.
  final DateTime? creationTime;

  /// The completion time of this flywheel iteration.
  final DateTime? endTime;

  /// The ARN of the evaluated model associated with this flywheel iteration.
  final String? evaluatedModelArn;
  final FlywheelModelEvaluationMetrics? evaluatedModelMetrics;

  /// <p/>
  final String? evaluationManifestS3Prefix;

  /// <p/>
  final String? flywheelArn;

  /// <p/>
  final String? flywheelIterationId;

  /// A description of the status of the flywheel iteration.
  final String? message;

  /// The status of the flywheel iteration.
  final FlywheelIterationStatus? status;

  /// The ARN of the trained model associated with this flywheel iteration.
  final String? trainedModelArn;

  /// The metrics associated with the trained model.
  final FlywheelModelEvaluationMetrics? trainedModelMetrics;

  FlywheelIterationProperties({
    this.creationTime,
    this.endTime,
    this.evaluatedModelArn,
    this.evaluatedModelMetrics,
    this.evaluationManifestS3Prefix,
    this.flywheelArn,
    this.flywheelIterationId,
    this.message,
    this.status,
    this.trainedModelArn,
    this.trainedModelMetrics,
  });

  factory FlywheelIterationProperties.fromJson(Map<String, dynamic> json) {
    return FlywheelIterationProperties(
      creationTime: timeStampFromJson(json['CreationTime']),
      endTime: timeStampFromJson(json['EndTime']),
      evaluatedModelArn: json['EvaluatedModelArn'] as String?,
      evaluatedModelMetrics: json['EvaluatedModelMetrics'] != null
          ? FlywheelModelEvaluationMetrics.fromJson(
              json['EvaluatedModelMetrics'] as Map<String, dynamic>)
          : null,
      evaluationManifestS3Prefix: json['EvaluationManifestS3Prefix'] as String?,
      flywheelArn: json['FlywheelArn'] as String?,
      flywheelIterationId: json['FlywheelIterationId'] as String?,
      message: json['Message'] as String?,
      status: (json['Status'] as String?)?.toFlywheelIterationStatus(),
      trainedModelArn: json['TrainedModelArn'] as String?,
      trainedModelMetrics: json['TrainedModelMetrics'] != null
          ? FlywheelModelEvaluationMetrics.fromJson(
              json['TrainedModelMetrics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final endTime = this.endTime;
    final evaluatedModelArn = this.evaluatedModelArn;
    final evaluatedModelMetrics = this.evaluatedModelMetrics;
    final evaluationManifestS3Prefix = this.evaluationManifestS3Prefix;
    final flywheelArn = this.flywheelArn;
    final flywheelIterationId = this.flywheelIterationId;
    final message = this.message;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final trainedModelMetrics = this.trainedModelMetrics;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (evaluatedModelArn != null) 'EvaluatedModelArn': evaluatedModelArn,
      if (evaluatedModelMetrics != null)
        'EvaluatedModelMetrics': evaluatedModelMetrics,
      if (evaluationManifestS3Prefix != null)
        'EvaluationManifestS3Prefix': evaluationManifestS3Prefix,
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (flywheelIterationId != null)
        'FlywheelIterationId': flywheelIterationId,
      if (message != null) 'Message': message,
      if (status != null) 'Status': status.toValue(),
      if (trainedModelArn != null) 'TrainedModelArn': trainedModelArn,
      if (trainedModelMetrics != null)
        'TrainedModelMetrics': trainedModelMetrics,
    };
  }
}

enum FlywheelIterationStatus {
  training,
  evaluating,
  completed,
  failed,
  stopRequested,
  stopped,
}

extension FlywheelIterationStatusValueExtension on FlywheelIterationStatus {
  String toValue() {
    switch (this) {
      case FlywheelIterationStatus.training:
        return 'TRAINING';
      case FlywheelIterationStatus.evaluating:
        return 'EVALUATING';
      case FlywheelIterationStatus.completed:
        return 'COMPLETED';
      case FlywheelIterationStatus.failed:
        return 'FAILED';
      case FlywheelIterationStatus.stopRequested:
        return 'STOP_REQUESTED';
      case FlywheelIterationStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension FlywheelIterationStatusFromString on String {
  FlywheelIterationStatus toFlywheelIterationStatus() {
    switch (this) {
      case 'TRAINING':
        return FlywheelIterationStatus.training;
      case 'EVALUATING':
        return FlywheelIterationStatus.evaluating;
      case 'COMPLETED':
        return FlywheelIterationStatus.completed;
      case 'FAILED':
        return FlywheelIterationStatus.failed;
      case 'STOP_REQUESTED':
        return FlywheelIterationStatus.stopRequested;
      case 'STOPPED':
        return FlywheelIterationStatus.stopped;
    }
    throw Exception('$this is not known in enum FlywheelIterationStatus');
  }
}

/// The evaluation metrics associated with the evaluated model.
class FlywheelModelEvaluationMetrics {
  /// Average accuracy metric for the model.
  final double? averageAccuracy;

  /// The average F1 score from the evaluation metrics.
  final double? averageF1Score;

  /// Average precision metric for the model.
  final double? averagePrecision;

  /// Average recall metric for the model.
  final double? averageRecall;

  FlywheelModelEvaluationMetrics({
    this.averageAccuracy,
    this.averageF1Score,
    this.averagePrecision,
    this.averageRecall,
  });

  factory FlywheelModelEvaluationMetrics.fromJson(Map<String, dynamic> json) {
    return FlywheelModelEvaluationMetrics(
      averageAccuracy: json['AverageAccuracy'] as double?,
      averageF1Score: json['AverageF1Score'] as double?,
      averagePrecision: json['AveragePrecision'] as double?,
      averageRecall: json['AverageRecall'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final averageAccuracy = this.averageAccuracy;
    final averageF1Score = this.averageF1Score;
    final averagePrecision = this.averagePrecision;
    final averageRecall = this.averageRecall;
    return {
      if (averageAccuracy != null) 'AverageAccuracy': averageAccuracy,
      if (averageF1Score != null) 'AverageF1Score': averageF1Score,
      if (averagePrecision != null) 'AveragePrecision': averagePrecision,
      if (averageRecall != null) 'AverageRecall': averageRecall,
    };
  }
}

/// The flywheel properties.
class FlywheelProperties {
  /// The Amazon Resource Number (ARN) of the active model version.
  final String? activeModelArn;

  /// Creation time of the flywheel.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// permission to access the flywheel data.
  final String? dataAccessRoleArn;

  /// Amazon S3 URI of the data lake location.
  final String? dataLakeS3Uri;

  /// Data security configuration.
  final DataSecurityConfig? dataSecurityConfig;

  /// The Amazon Resource Number (ARN) of the flywheel.
  final String? flywheelArn;

  /// Last modified time for the flywheel.
  final DateTime? lastModifiedTime;

  /// The most recent flywheel iteration.
  final String? latestFlywheelIteration;

  /// A description of the status of the flywheel.
  final String? message;

  /// Model type of the flywheel's model.
  final ModelType? modelType;

  /// The status of the flywheel.
  final FlywheelStatus? status;

  /// Configuration about the model associated with a flywheel.
  final TaskConfig? taskConfig;

  FlywheelProperties({
    this.activeModelArn,
    this.creationTime,
    this.dataAccessRoleArn,
    this.dataLakeS3Uri,
    this.dataSecurityConfig,
    this.flywheelArn,
    this.lastModifiedTime,
    this.latestFlywheelIteration,
    this.message,
    this.modelType,
    this.status,
    this.taskConfig,
  });

  factory FlywheelProperties.fromJson(Map<String, dynamic> json) {
    return FlywheelProperties(
      activeModelArn: json['ActiveModelArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      dataLakeS3Uri: json['DataLakeS3Uri'] as String?,
      dataSecurityConfig: json['DataSecurityConfig'] != null
          ? DataSecurityConfig.fromJson(
              json['DataSecurityConfig'] as Map<String, dynamic>)
          : null,
      flywheelArn: json['FlywheelArn'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      latestFlywheelIteration: json['LatestFlywheelIteration'] as String?,
      message: json['Message'] as String?,
      modelType: (json['ModelType'] as String?)?.toModelType(),
      status: (json['Status'] as String?)?.toFlywheelStatus(),
      taskConfig: json['TaskConfig'] != null
          ? TaskConfig.fromJson(json['TaskConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final activeModelArn = this.activeModelArn;
    final creationTime = this.creationTime;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final dataLakeS3Uri = this.dataLakeS3Uri;
    final dataSecurityConfig = this.dataSecurityConfig;
    final flywheelArn = this.flywheelArn;
    final lastModifiedTime = this.lastModifiedTime;
    final latestFlywheelIteration = this.latestFlywheelIteration;
    final message = this.message;
    final modelType = this.modelType;
    final status = this.status;
    final taskConfig = this.taskConfig;
    return {
      if (activeModelArn != null) 'ActiveModelArn': activeModelArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (dataLakeS3Uri != null) 'DataLakeS3Uri': dataLakeS3Uri,
      if (dataSecurityConfig != null) 'DataSecurityConfig': dataSecurityConfig,
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (latestFlywheelIteration != null)
        'LatestFlywheelIteration': latestFlywheelIteration,
      if (message != null) 'Message': message,
      if (modelType != null) 'ModelType': modelType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (taskConfig != null) 'TaskConfig': taskConfig,
    };
  }
}

enum FlywheelStatus {
  creating,
  active,
  updating,
  deleting,
  failed,
}

extension FlywheelStatusValueExtension on FlywheelStatus {
  String toValue() {
    switch (this) {
      case FlywheelStatus.creating:
        return 'CREATING';
      case FlywheelStatus.active:
        return 'ACTIVE';
      case FlywheelStatus.updating:
        return 'UPDATING';
      case FlywheelStatus.deleting:
        return 'DELETING';
      case FlywheelStatus.failed:
        return 'FAILED';
    }
  }
}

extension FlywheelStatusFromString on String {
  FlywheelStatus toFlywheelStatus() {
    switch (this) {
      case 'CREATING':
        return FlywheelStatus.creating;
      case 'ACTIVE':
        return FlywheelStatus.active;
      case 'UPDATING':
        return FlywheelStatus.updating;
      case 'DELETING':
        return FlywheelStatus.deleting;
      case 'FAILED':
        return FlywheelStatus.failed;
    }
    throw Exception('$this is not known in enum FlywheelStatus');
  }
}

/// Flywheel summary information.
class FlywheelSummary {
  /// ARN of the active model version for the flywheel.
  final String? activeModelArn;

  /// Creation time of the flywheel.
  final DateTime? creationTime;

  /// Amazon S3 URI of the data lake location.
  final String? dataLakeS3Uri;

  /// The Amazon Resource Number (ARN) of the flywheel
  final String? flywheelArn;

  /// Last modified time for the flywheel.
  final DateTime? lastModifiedTime;

  /// The most recent flywheel iteration.
  final String? latestFlywheelIteration;

  /// A description of the status of the flywheel.
  final String? message;

  /// Model type of the flywheel's model.
  final ModelType? modelType;

  /// The status of the flywheel.
  final FlywheelStatus? status;

  FlywheelSummary({
    this.activeModelArn,
    this.creationTime,
    this.dataLakeS3Uri,
    this.flywheelArn,
    this.lastModifiedTime,
    this.latestFlywheelIteration,
    this.message,
    this.modelType,
    this.status,
  });

  factory FlywheelSummary.fromJson(Map<String, dynamic> json) {
    return FlywheelSummary(
      activeModelArn: json['ActiveModelArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      dataLakeS3Uri: json['DataLakeS3Uri'] as String?,
      flywheelArn: json['FlywheelArn'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      latestFlywheelIteration: json['LatestFlywheelIteration'] as String?,
      message: json['Message'] as String?,
      modelType: (json['ModelType'] as String?)?.toModelType(),
      status: (json['Status'] as String?)?.toFlywheelStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeModelArn = this.activeModelArn;
    final creationTime = this.creationTime;
    final dataLakeS3Uri = this.dataLakeS3Uri;
    final flywheelArn = this.flywheelArn;
    final lastModifiedTime = this.lastModifiedTime;
    final latestFlywheelIteration = this.latestFlywheelIteration;
    final message = this.message;
    final modelType = this.modelType;
    final status = this.status;
    return {
      if (activeModelArn != null) 'ActiveModelArn': activeModelArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataLakeS3Uri != null) 'DataLakeS3Uri': dataLakeS3Uri,
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (latestFlywheelIteration != null)
        'LatestFlywheelIteration': latestFlywheelIteration,
      if (message != null) 'Message': message,
      if (modelType != null) 'ModelType': modelType.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Information about the location of items on a document page.
///
/// For additional information, see <a
/// href="https://docs.aws.amazon.com/textract/latest/dg/API_Geometry.html">Geometry</a>
/// in the Amazon Textract API reference.
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

class ImportModelResponse {
  /// The Amazon Resource Name (ARN) of the custom model being imported.
  final String? modelArn;

  ImportModelResponse({
    this.modelArn,
  });

  factory ImportModelResponse.fromJson(Map<String, dynamic> json) {
    return ImportModelResponse(
      modelArn: json['ModelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    return {
      if (modelArn != null) 'ModelArn': modelArn,
    };
  }
}

/// The input properties for an inference job. The document reader config field
/// applies only to non-text inputs for custom analysis.
class InputDataConfig {
  /// The Amazon S3 URI for the input data. The URI must be in same Region as the
  /// API endpoint that you are calling. The URI can point to a single input file
  /// or it can provide the prefix for a collection of data files.
  ///
  /// For example, if you use the URI <code>S3://bucketName/prefix</code>, if the
  /// prefix is a single file, Amazon Comprehend uses that file as input. If more
  /// than one file begins with the prefix, Amazon Comprehend uses all of them as
  /// input.
  final String s3Uri;

  /// Provides configuration parameters to override the default actions for
  /// extracting text from PDF documents and image files.
  final DocumentReaderConfig? documentReaderConfig;

  /// Specifies how the text in an input file should be processed:
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DOC_PER_FILE</code> - Each file is considered a separate document.
  /// Use this option when you are processing large documents, such as newspaper
  /// articles or scientific papers.
  /// </li>
  /// <li>
  /// <code>ONE_DOC_PER_LINE</code> - Each line in a file is considered a separate
  /// document. Use this option when you are processing many short documents, such
  /// as text messages.
  /// </li>
  /// </ul>
  final InputFormat? inputFormat;

  InputDataConfig({
    required this.s3Uri,
    this.documentReaderConfig,
    this.inputFormat,
  });

  factory InputDataConfig.fromJson(Map<String, dynamic> json) {
    return InputDataConfig(
      s3Uri: json['S3Uri'] as String,
      documentReaderConfig: json['DocumentReaderConfig'] != null
          ? DocumentReaderConfig.fromJson(
              json['DocumentReaderConfig'] as Map<String, dynamic>)
          : null,
      inputFormat: (json['InputFormat'] as String?)?.toInputFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final documentReaderConfig = this.documentReaderConfig;
    final inputFormat = this.inputFormat;
    return {
      'S3Uri': s3Uri,
      if (documentReaderConfig != null)
        'DocumentReaderConfig': documentReaderConfig,
      if (inputFormat != null) 'InputFormat': inputFormat.toValue(),
    };
  }
}

enum InputFormat {
  oneDocPerFile,
  oneDocPerLine,
}

extension InputFormatValueExtension on InputFormat {
  String toValue() {
    switch (this) {
      case InputFormat.oneDocPerFile:
        return 'ONE_DOC_PER_FILE';
      case InputFormat.oneDocPerLine:
        return 'ONE_DOC_PER_LINE';
    }
  }
}

extension InputFormatFromString on String {
  InputFormat toInputFormat() {
    switch (this) {
      case 'ONE_DOC_PER_FILE':
        return InputFormat.oneDocPerFile;
      case 'ONE_DOC_PER_LINE':
        return InputFormat.oneDocPerLine;
    }
    throw Exception('$this is not known in enum InputFormat');
  }
}

enum JobStatus {
  submitted,
  inProgress,
  completed,
  failed,
  stopRequested,
  stopped,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.stopRequested:
        return 'STOP_REQUESTED';
      case JobStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return JobStatus.submitted;
      case 'IN_PROGRESS':
        return JobStatus.inProgress;
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILED':
        return JobStatus.failed;
      case 'STOP_REQUESTED':
        return JobStatus.stopRequested;
      case 'STOPPED':
        return JobStatus.stopped;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// Describes a key noun phrase.
class KeyPhrase {
  /// The zero-based offset from the beginning of the source text to the first
  /// character in the key phrase.
  final int? beginOffset;

  /// The zero-based offset from the beginning of the source text to the last
  /// character in the key phrase.
  final int? endOffset;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  /// The text of a key noun phrase.
  final String? text;

  KeyPhrase({
    this.beginOffset,
    this.endOffset,
    this.score,
    this.text,
  });

  factory KeyPhrase.fromJson(Map<String, dynamic> json) {
    return KeyPhrase(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    final score = this.score;
    final text = this.text;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (endOffset != null) 'EndOffset': endOffset,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
    };
  }
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class KeyPhrasesDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  KeyPhrasesDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a key phrases detection job.
class KeyPhrasesDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the key phrases detection job completed.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the key
  /// phrases detection job.
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the key phrases detection job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:key-phrases-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the key phrases detection job.
  final String? jobId;

  /// The name that you assigned the key phrases detection job.
  final String? jobName;

  /// The current status of the key phrases detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;

  /// The output data configuration that you supplied when you created the key
  /// phrases detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the key phrases detection job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the KMS key that Amazon Comprehend uses to encrypt data on the
  /// storage volume attached to the ML compute instance(s) that process the
  /// analysis job. The VolumeKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your key phrases detection job.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  KeyPhrasesDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory KeyPhrasesDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return KeyPhrasesDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final languageCode = this.languageCode;
    final message = this.message;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (message != null) 'Message': message,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

enum LanguageCode {
  en,
  es,
  fr,
  de,
  it,
  pt,
  ar,
  hi,
  ja,
  ko,
  zh,
  zhTw,
}

extension LanguageCodeValueExtension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.en:
        return 'en';
      case LanguageCode.es:
        return 'es';
      case LanguageCode.fr:
        return 'fr';
      case LanguageCode.de:
        return 'de';
      case LanguageCode.it:
        return 'it';
      case LanguageCode.pt:
        return 'pt';
      case LanguageCode.ar:
        return 'ar';
      case LanguageCode.hi:
        return 'hi';
      case LanguageCode.ja:
        return 'ja';
      case LanguageCode.ko:
        return 'ko';
      case LanguageCode.zh:
        return 'zh';
      case LanguageCode.zhTw:
        return 'zh-TW';
    }
  }
}

extension LanguageCodeFromString on String {
  LanguageCode toLanguageCode() {
    switch (this) {
      case 'en':
        return LanguageCode.en;
      case 'es':
        return LanguageCode.es;
      case 'fr':
        return LanguageCode.fr;
      case 'de':
        return LanguageCode.de;
      case 'it':
        return LanguageCode.it;
      case 'pt':
        return LanguageCode.pt;
      case 'ar':
        return LanguageCode.ar;
      case 'hi':
        return LanguageCode.hi;
      case 'ja':
        return LanguageCode.ja;
      case 'ko':
        return LanguageCode.ko;
      case 'zh':
        return LanguageCode.zh;
      case 'zh-TW':
        return LanguageCode.zhTw;
    }
    throw Exception('$this is not known in enum LanguageCode');
  }
}

class ListDatasetsResponse {
  /// The dataset properties list.
  final List<DatasetProperties>? datasetPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDatasetsResponse({
    this.datasetPropertiesList,
    this.nextToken,
  });

  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetsResponse(
      datasetPropertiesList: (json['DatasetPropertiesList'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetPropertiesList = this.datasetPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (datasetPropertiesList != null)
        'DatasetPropertiesList': datasetPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDocumentClassificationJobsResponse {
  /// A list containing the properties of each job returned.
  final List<DocumentClassificationJobProperties>?
      documentClassificationJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDocumentClassificationJobsResponse({
    this.documentClassificationJobPropertiesList,
    this.nextToken,
  });

  factory ListDocumentClassificationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDocumentClassificationJobsResponse(
      documentClassificationJobPropertiesList:
          (json['DocumentClassificationJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => DocumentClassificationJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentClassificationJobPropertiesList =
        this.documentClassificationJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (documentClassificationJobPropertiesList != null)
        'DocumentClassificationJobPropertiesList':
            documentClassificationJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDocumentClassifierSummariesResponse {
  /// The list of summaries of document classifiers.
  final List<DocumentClassifierSummary>? documentClassifierSummariesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDocumentClassifierSummariesResponse({
    this.documentClassifierSummariesList,
    this.nextToken,
  });

  factory ListDocumentClassifierSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDocumentClassifierSummariesResponse(
      documentClassifierSummariesList:
          (json['DocumentClassifierSummariesList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  DocumentClassifierSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentClassifierSummariesList =
        this.documentClassifierSummariesList;
    final nextToken = this.nextToken;
    return {
      if (documentClassifierSummariesList != null)
        'DocumentClassifierSummariesList': documentClassifierSummariesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDocumentClassifiersResponse {
  /// A list containing the properties of each job returned.
  final List<DocumentClassifierProperties>? documentClassifierPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDocumentClassifiersResponse({
    this.documentClassifierPropertiesList,
    this.nextToken,
  });

  factory ListDocumentClassifiersResponse.fromJson(Map<String, dynamic> json) {
    return ListDocumentClassifiersResponse(
      documentClassifierPropertiesList:
          (json['DocumentClassifierPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => DocumentClassifierProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentClassifierPropertiesList =
        this.documentClassifierPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (documentClassifierPropertiesList != null)
        'DocumentClassifierPropertiesList': documentClassifierPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDominantLanguageDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<DominantLanguageDetectionJobProperties>?
      dominantLanguageDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDominantLanguageDetectionJobsResponse({
    this.dominantLanguageDetectionJobPropertiesList,
    this.nextToken,
  });

  factory ListDominantLanguageDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDominantLanguageDetectionJobsResponse(
      dominantLanguageDetectionJobPropertiesList:
          (json['DominantLanguageDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => DominantLanguageDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dominantLanguageDetectionJobPropertiesList =
        this.dominantLanguageDetectionJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (dominantLanguageDetectionJobPropertiesList != null)
        'DominantLanguageDetectionJobPropertiesList':
            dominantLanguageDetectionJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEndpointsResponse {
  /// Displays a list of endpoint properties being retrieved by the service in
  /// response to the request.
  final List<EndpointProperties>? endpointPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEndpointsResponse({
    this.endpointPropertiesList,
    this.nextToken,
  });

  factory ListEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListEndpointsResponse(
      endpointPropertiesList: (json['EndpointPropertiesList'] as List?)
          ?.whereNotNull()
          .map((e) => EndpointProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointPropertiesList = this.endpointPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (endpointPropertiesList != null)
        'EndpointPropertiesList': endpointPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEntitiesDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<EntitiesDetectionJobProperties>?
      entitiesDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEntitiesDetectionJobsResponse({
    this.entitiesDetectionJobPropertiesList,
    this.nextToken,
  });

  factory ListEntitiesDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEntitiesDetectionJobsResponse(
      entitiesDetectionJobPropertiesList:
          (json['EntitiesDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => EntitiesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitiesDetectionJobPropertiesList =
        this.entitiesDetectionJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (entitiesDetectionJobPropertiesList != null)
        'EntitiesDetectionJobPropertiesList':
            entitiesDetectionJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEntityRecognizerSummariesResponse {
  /// The list entity recognizer summaries.
  final List<EntityRecognizerSummary>? entityRecognizerSummariesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEntityRecognizerSummariesResponse({
    this.entityRecognizerSummariesList,
    this.nextToken,
  });

  factory ListEntityRecognizerSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEntityRecognizerSummariesResponse(
      entityRecognizerSummariesList:
          (json['EntityRecognizerSummariesList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  EntityRecognizerSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityRecognizerSummariesList = this.entityRecognizerSummariesList;
    final nextToken = this.nextToken;
    return {
      if (entityRecognizerSummariesList != null)
        'EntityRecognizerSummariesList': entityRecognizerSummariesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEntityRecognizersResponse {
  /// The list of properties of an entity recognizer.
  final List<EntityRecognizerProperties>? entityRecognizerPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEntityRecognizersResponse({
    this.entityRecognizerPropertiesList,
    this.nextToken,
  });

  factory ListEntityRecognizersResponse.fromJson(Map<String, dynamic> json) {
    return ListEntityRecognizersResponse(
      entityRecognizerPropertiesList: (json['EntityRecognizerPropertiesList']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              EntityRecognizerProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityRecognizerPropertiesList = this.entityRecognizerPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (entityRecognizerPropertiesList != null)
        'EntityRecognizerPropertiesList': entityRecognizerPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEventsDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<EventsDetectionJobProperties>? eventsDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEventsDetectionJobsResponse({
    this.eventsDetectionJobPropertiesList,
    this.nextToken,
  });

  factory ListEventsDetectionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventsDetectionJobsResponse(
      eventsDetectionJobPropertiesList:
          (json['EventsDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => EventsDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventsDetectionJobPropertiesList =
        this.eventsDetectionJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (eventsDetectionJobPropertiesList != null)
        'EventsDetectionJobPropertiesList': eventsDetectionJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFlywheelIterationHistoryResponse {
  /// List of flywheel iteration properties
  final List<FlywheelIterationProperties>? flywheelIterationPropertiesList;

  /// Next token
  final String? nextToken;

  ListFlywheelIterationHistoryResponse({
    this.flywheelIterationPropertiesList,
    this.nextToken,
  });

  factory ListFlywheelIterationHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFlywheelIterationHistoryResponse(
      flywheelIterationPropertiesList: (json['FlywheelIterationPropertiesList']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              FlywheelIterationProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flywheelIterationPropertiesList =
        this.flywheelIterationPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (flywheelIterationPropertiesList != null)
        'FlywheelIterationPropertiesList': flywheelIterationPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFlywheelsResponse {
  /// A list of flywheel properties retrieved by the service in response to the
  /// request.
  final List<FlywheelSummary>? flywheelSummaryList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListFlywheelsResponse({
    this.flywheelSummaryList,
    this.nextToken,
  });

  factory ListFlywheelsResponse.fromJson(Map<String, dynamic> json) {
    return ListFlywheelsResponse(
      flywheelSummaryList: (json['FlywheelSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => FlywheelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flywheelSummaryList = this.flywheelSummaryList;
    final nextToken = this.nextToken;
    return {
      if (flywheelSummaryList != null)
        'FlywheelSummaryList': flywheelSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListKeyPhrasesDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<KeyPhrasesDetectionJobProperties>?
      keyPhrasesDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListKeyPhrasesDetectionJobsResponse({
    this.keyPhrasesDetectionJobPropertiesList,
    this.nextToken,
  });

  factory ListKeyPhrasesDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListKeyPhrasesDetectionJobsResponse(
      keyPhrasesDetectionJobPropertiesList:
          (json['KeyPhrasesDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => KeyPhrasesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPhrasesDetectionJobPropertiesList =
        this.keyPhrasesDetectionJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (keyPhrasesDetectionJobPropertiesList != null)
        'KeyPhrasesDetectionJobPropertiesList':
            keyPhrasesDetectionJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPiiEntitiesDetectionJobsResponse {
  /// Identifies the next page of results to return.
  final String? nextToken;

  /// A list containing the properties of each job that is returned.
  final List<PiiEntitiesDetectionJobProperties>?
      piiEntitiesDetectionJobPropertiesList;

  ListPiiEntitiesDetectionJobsResponse({
    this.nextToken,
    this.piiEntitiesDetectionJobPropertiesList,
  });

  factory ListPiiEntitiesDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPiiEntitiesDetectionJobsResponse(
      nextToken: json['NextToken'] as String?,
      piiEntitiesDetectionJobPropertiesList:
          (json['PiiEntitiesDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => PiiEntitiesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final piiEntitiesDetectionJobPropertiesList =
        this.piiEntitiesDetectionJobPropertiesList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (piiEntitiesDetectionJobPropertiesList != null)
        'PiiEntitiesDetectionJobPropertiesList':
            piiEntitiesDetectionJobPropertiesList,
    };
  }
}

class ListSentimentDetectionJobsResponse {
  /// Identifies the next page of results to return.
  final String? nextToken;

  /// A list containing the properties of each job that is returned.
  final List<SentimentDetectionJobProperties>?
      sentimentDetectionJobPropertiesList;

  ListSentimentDetectionJobsResponse({
    this.nextToken,
    this.sentimentDetectionJobPropertiesList,
  });

  factory ListSentimentDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSentimentDetectionJobsResponse(
      nextToken: json['NextToken'] as String?,
      sentimentDetectionJobPropertiesList:
          (json['SentimentDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => SentimentDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sentimentDetectionJobPropertiesList =
        this.sentimentDetectionJobPropertiesList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sentimentDetectionJobPropertiesList != null)
        'SentimentDetectionJobPropertiesList':
            sentimentDetectionJobPropertiesList,
    };
  }
}

class ListTagsForResourceResponse {
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you
  /// are querying.
  final String? resourceArn;

  /// Tags associated with the Amazon Comprehend resource being queried. A tag is
  /// a key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.resourceArn,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceArn: json['ResourceArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTargetedSentimentDetectionJobsResponse {
  /// Identifies the next page of results to return.
  final String? nextToken;

  /// A list containing the properties of each job that is returned.
  final List<TargetedSentimentDetectionJobProperties>?
      targetedSentimentDetectionJobPropertiesList;

  ListTargetedSentimentDetectionJobsResponse({
    this.nextToken,
    this.targetedSentimentDetectionJobPropertiesList,
  });

  factory ListTargetedSentimentDetectionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTargetedSentimentDetectionJobsResponse(
      nextToken: json['NextToken'] as String?,
      targetedSentimentDetectionJobPropertiesList:
          (json['TargetedSentimentDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => TargetedSentimentDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targetedSentimentDetectionJobPropertiesList =
        this.targetedSentimentDetectionJobPropertiesList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (targetedSentimentDetectionJobPropertiesList != null)
        'TargetedSentimentDetectionJobPropertiesList':
            targetedSentimentDetectionJobPropertiesList,
    };
  }
}

class ListTopicsDetectionJobsResponse {
  /// Identifies the next page of results to return.
  final String? nextToken;

  /// A list containing the properties of each job that is returned.
  final List<TopicsDetectionJobProperties>? topicsDetectionJobPropertiesList;

  ListTopicsDetectionJobsResponse({
    this.nextToken,
    this.topicsDetectionJobPropertiesList,
  });

  factory ListTopicsDetectionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListTopicsDetectionJobsResponse(
      nextToken: json['NextToken'] as String?,
      topicsDetectionJobPropertiesList:
          (json['TopicsDetectionJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => TopicsDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final topicsDetectionJobPropertiesList =
        this.topicsDetectionJobPropertiesList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (topicsDetectionJobPropertiesList != null)
        'TopicsDetectionJobPropertiesList': topicsDetectionJobPropertiesList,
    };
  }
}

/// Contains the sentiment and sentiment score for one mention of an entity.
///
/// For more information about targeted sentiment, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html">Targeted
/// sentiment</a> in the <i>Amazon Comprehend Developer Guide</i>.
class MentionSentiment {
  /// The sentiment of the mention.
  final SentimentType? sentiment;
  final SentimentScore? sentimentScore;

  MentionSentiment({
    this.sentiment,
    this.sentimentScore,
  });

  factory MentionSentiment.fromJson(Map<String, dynamic> json) {
    return MentionSentiment(
      sentiment: (json['Sentiment'] as String?)?.toSentimentType(),
      sentimentScore: json['SentimentScore'] != null
          ? SentimentScore.fromJson(
              json['SentimentScore'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sentiment = this.sentiment;
    final sentimentScore = this.sentimentScore;
    return {
      if (sentiment != null) 'Sentiment': sentiment.toValue(),
      if (sentimentScore != null) 'SentimentScore': sentimentScore,
    };
  }
}

enum ModelStatus {
  submitted,
  training,
  deleting,
  stopRequested,
  stopped,
  inError,
  trained,
  trainedWithWarning,
}

extension ModelStatusValueExtension on ModelStatus {
  String toValue() {
    switch (this) {
      case ModelStatus.submitted:
        return 'SUBMITTED';
      case ModelStatus.training:
        return 'TRAINING';
      case ModelStatus.deleting:
        return 'DELETING';
      case ModelStatus.stopRequested:
        return 'STOP_REQUESTED';
      case ModelStatus.stopped:
        return 'STOPPED';
      case ModelStatus.inError:
        return 'IN_ERROR';
      case ModelStatus.trained:
        return 'TRAINED';
      case ModelStatus.trainedWithWarning:
        return 'TRAINED_WITH_WARNING';
    }
  }
}

extension ModelStatusFromString on String {
  ModelStatus toModelStatus() {
    switch (this) {
      case 'SUBMITTED':
        return ModelStatus.submitted;
      case 'TRAINING':
        return ModelStatus.training;
      case 'DELETING':
        return ModelStatus.deleting;
      case 'STOP_REQUESTED':
        return ModelStatus.stopRequested;
      case 'STOPPED':
        return ModelStatus.stopped;
      case 'IN_ERROR':
        return ModelStatus.inError;
      case 'TRAINED':
        return ModelStatus.trained;
      case 'TRAINED_WITH_WARNING':
        return ModelStatus.trainedWithWarning;
    }
    throw Exception('$this is not known in enum ModelStatus');
  }
}

enum ModelType {
  documentClassifier,
  entityRecognizer,
}

extension ModelTypeValueExtension on ModelType {
  String toValue() {
    switch (this) {
      case ModelType.documentClassifier:
        return 'DOCUMENT_CLASSIFIER';
      case ModelType.entityRecognizer:
        return 'ENTITY_RECOGNIZER';
    }
  }
}

extension ModelTypeFromString on String {
  ModelType toModelType() {
    switch (this) {
      case 'DOCUMENT_CLASSIFIER':
        return ModelType.documentClassifier;
      case 'ENTITY_RECOGNIZER':
        return ModelType.entityRecognizer;
    }
    throw Exception('$this is not known in enum ModelType');
  }
}

/// Provides configuration parameters for the output of inference jobs.
/// <p/>
class OutputDataConfig {
  /// When you use the <code>OutputDataConfig</code> object with asynchronous
  /// operations, you specify the Amazon S3 location where you want to write the
  /// output data. The URI must be in the same Region as the API endpoint that you
  /// are calling. The location is used as the prefix for the actual location of
  /// the output file.
  ///
  /// When the topic detection job is finished, the service creates an output file
  /// in a directory specific to the job. The <code>S3Uri</code> field contains
  /// the location of the output file, called <code>output.tar.gz</code>. It is a
  /// compressed archive that contains the ouput of the operation.
  ///
  /// For a PII entity detection job, the output file is plain text, not a
  /// compressed archive. The output file name is the same as the input file, with
  /// <code>.out</code> appended at the end.
  final String s3Uri;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt the output results from an analysis job. Specify
  /// the Key Id of a symmetric key, because you cannot use an asymmetric key for
  /// uploading data to S3.
  ///
  /// The KmsKeyId can be one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// KMS Key Alias: <code>"alias/ExampleAlias"</code>
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias:
  /// <code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code>
  /// </li>
  /// </ul>
  final String? kmsKeyId;

  OutputDataConfig({
    required this.s3Uri,
    this.kmsKeyId,
  });

  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
      s3Uri: json['S3Uri'] as String,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final kmsKeyId = this.kmsKeyId;
    return {
      'S3Uri': s3Uri,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

enum PageBasedErrorCode {
  textractBadPage,
  textractProvisionedThroughputExceeded,
  pageCharactersExceeded,
  pageSizeExceeded,
  internalServerError,
}

extension PageBasedErrorCodeValueExtension on PageBasedErrorCode {
  String toValue() {
    switch (this) {
      case PageBasedErrorCode.textractBadPage:
        return 'TEXTRACT_BAD_PAGE';
      case PageBasedErrorCode.textractProvisionedThroughputExceeded:
        return 'TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED';
      case PageBasedErrorCode.pageCharactersExceeded:
        return 'PAGE_CHARACTERS_EXCEEDED';
      case PageBasedErrorCode.pageSizeExceeded:
        return 'PAGE_SIZE_EXCEEDED';
      case PageBasedErrorCode.internalServerError:
        return 'INTERNAL_SERVER_ERROR';
    }
  }
}

extension PageBasedErrorCodeFromString on String {
  PageBasedErrorCode toPageBasedErrorCode() {
    switch (this) {
      case 'TEXTRACT_BAD_PAGE':
        return PageBasedErrorCode.textractBadPage;
      case 'TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED':
        return PageBasedErrorCode.textractProvisionedThroughputExceeded;
      case 'PAGE_CHARACTERS_EXCEEDED':
        return PageBasedErrorCode.pageCharactersExceeded;
      case 'PAGE_SIZE_EXCEEDED':
        return PageBasedErrorCode.pageSizeExceeded;
      case 'INTERNAL_SERVER_ERROR':
        return PageBasedErrorCode.internalServerError;
    }
    throw Exception('$this is not known in enum PageBasedErrorCode');
  }
}

enum PageBasedWarningCode {
  inferencingPlaintextWithNativeTrainedModel,
  inferencingNativeDocumentWithPlaintextTrainedModel,
}

extension PageBasedWarningCodeValueExtension on PageBasedWarningCode {
  String toValue() {
    switch (this) {
      case PageBasedWarningCode.inferencingPlaintextWithNativeTrainedModel:
        return 'INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL';
      case PageBasedWarningCode
            .inferencingNativeDocumentWithPlaintextTrainedModel:
        return 'INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL';
    }
  }
}

extension PageBasedWarningCodeFromString on String {
  PageBasedWarningCode toPageBasedWarningCode() {
    switch (this) {
      case 'INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL':
        return PageBasedWarningCode.inferencingPlaintextWithNativeTrainedModel;
      case 'INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL':
        return PageBasedWarningCode
            .inferencingNativeDocumentWithPlaintextTrainedModel;
    }
    throw Exception('$this is not known in enum PageBasedWarningCode');
  }
}

/// Identifies the part of speech represented by the token and gives the
/// confidence that Amazon Comprehend has that the part of speech was correctly
/// identified. For more information about the parts of speech that Amazon
/// Comprehend can identify, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html">Syntax</a>
/// in the Comprehend Developer Guide.
class PartOfSpeechTag {
  /// The confidence that Amazon Comprehend has that the part of speech was
  /// correctly identified.
  final double? score;

  /// Identifies the part of speech that the token represents.
  final PartOfSpeechTagType? tag;

  PartOfSpeechTag({
    this.score,
    this.tag,
  });

  factory PartOfSpeechTag.fromJson(Map<String, dynamic> json) {
    return PartOfSpeechTag(
      score: json['Score'] as double?,
      tag: (json['Tag'] as String?)?.toPartOfSpeechTagType(),
    );
  }

  Map<String, dynamic> toJson() {
    final score = this.score;
    final tag = this.tag;
    return {
      if (score != null) 'Score': score,
      if (tag != null) 'Tag': tag.toValue(),
    };
  }
}

enum PartOfSpeechTagType {
  adj,
  adp,
  adv,
  aux,
  conj,
  cconj,
  det,
  intj,
  noun,
  num,
  o,
  part,
  pron,
  propn,
  punct,
  sconj,
  sym,
  verb,
}

extension PartOfSpeechTagTypeValueExtension on PartOfSpeechTagType {
  String toValue() {
    switch (this) {
      case PartOfSpeechTagType.adj:
        return 'ADJ';
      case PartOfSpeechTagType.adp:
        return 'ADP';
      case PartOfSpeechTagType.adv:
        return 'ADV';
      case PartOfSpeechTagType.aux:
        return 'AUX';
      case PartOfSpeechTagType.conj:
        return 'CONJ';
      case PartOfSpeechTagType.cconj:
        return 'CCONJ';
      case PartOfSpeechTagType.det:
        return 'DET';
      case PartOfSpeechTagType.intj:
        return 'INTJ';
      case PartOfSpeechTagType.noun:
        return 'NOUN';
      case PartOfSpeechTagType.num:
        return 'NUM';
      case PartOfSpeechTagType.o:
        return 'O';
      case PartOfSpeechTagType.part:
        return 'PART';
      case PartOfSpeechTagType.pron:
        return 'PRON';
      case PartOfSpeechTagType.propn:
        return 'PROPN';
      case PartOfSpeechTagType.punct:
        return 'PUNCT';
      case PartOfSpeechTagType.sconj:
        return 'SCONJ';
      case PartOfSpeechTagType.sym:
        return 'SYM';
      case PartOfSpeechTagType.verb:
        return 'VERB';
    }
  }
}

extension PartOfSpeechTagTypeFromString on String {
  PartOfSpeechTagType toPartOfSpeechTagType() {
    switch (this) {
      case 'ADJ':
        return PartOfSpeechTagType.adj;
      case 'ADP':
        return PartOfSpeechTagType.adp;
      case 'ADV':
        return PartOfSpeechTagType.adv;
      case 'AUX':
        return PartOfSpeechTagType.aux;
      case 'CONJ':
        return PartOfSpeechTagType.conj;
      case 'CCONJ':
        return PartOfSpeechTagType.cconj;
      case 'DET':
        return PartOfSpeechTagType.det;
      case 'INTJ':
        return PartOfSpeechTagType.intj;
      case 'NOUN':
        return PartOfSpeechTagType.noun;
      case 'NUM':
        return PartOfSpeechTagType.num;
      case 'O':
        return PartOfSpeechTagType.o;
      case 'PART':
        return PartOfSpeechTagType.part;
      case 'PRON':
        return PartOfSpeechTagType.pron;
      case 'PROPN':
        return PartOfSpeechTagType.propn;
      case 'PUNCT':
        return PartOfSpeechTagType.punct;
      case 'SCONJ':
        return PartOfSpeechTagType.sconj;
      case 'SYM':
        return PartOfSpeechTagType.sym;
      case 'VERB':
        return PartOfSpeechTagType.verb;
    }
    throw Exception('$this is not known in enum PartOfSpeechTagType');
  }
}

/// Provides information for filtering a list of PII entity detection jobs.
class PiiEntitiesDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  PiiEntitiesDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a PII entities detection job.
class PiiEntitiesDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the PII entities detection job completed.
  final DateTime? endTime;

  /// The input properties for a PII entities detection job.
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the PII entities detection job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:pii-entities-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the PII entities detection job.
  final String? jobId;

  /// The name that you assigned the PII entities detection job.
  final String? jobName;

  /// The current status of the PII entities detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;

  /// Specifies whether the output provides the locations (offsets) of PII
  /// entities or a file in which PII entities are redacted.
  final PiiEntitiesDetectionMode? mode;

  /// The output data configuration that you supplied when you created the PII
  /// entities detection job.
  final PiiOutputDataConfig? outputDataConfig;

  /// Provides configuration parameters for PII entity redaction.
  ///
  /// This parameter is required if you set the <code>Mode</code> parameter to
  /// <code>ONLY_REDACTION</code>. In that case, you must provide a
  /// <code>RedactionConfig</code> definition that includes the
  /// <code>PiiEntityTypes</code> parameter.
  final RedactionConfig? redactionConfig;

  /// The time that the PII entities detection job was submitted for processing.
  final DateTime? submitTime;

  PiiEntitiesDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.mode,
    this.outputDataConfig,
    this.redactionConfig,
    this.submitTime,
  });

  factory PiiEntitiesDetectionJobProperties.fromJson(
      Map<String, dynamic> json) {
    return PiiEntitiesDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      mode: (json['Mode'] as String?)?.toPiiEntitiesDetectionMode(),
      outputDataConfig: json['OutputDataConfig'] != null
          ? PiiOutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      redactionConfig: json['RedactionConfig'] != null
          ? RedactionConfig.fromJson(
              json['RedactionConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final languageCode = this.languageCode;
    final message = this.message;
    final mode = this.mode;
    final outputDataConfig = this.outputDataConfig;
    final redactionConfig = this.redactionConfig;
    final submitTime = this.submitTime;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (message != null) 'Message': message,
      if (mode != null) 'Mode': mode.toValue(),
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (redactionConfig != null) 'RedactionConfig': redactionConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
    };
  }
}

enum PiiEntitiesDetectionMaskMode {
  mask,
  replaceWithPiiEntityType,
}

extension PiiEntitiesDetectionMaskModeValueExtension
    on PiiEntitiesDetectionMaskMode {
  String toValue() {
    switch (this) {
      case PiiEntitiesDetectionMaskMode.mask:
        return 'MASK';
      case PiiEntitiesDetectionMaskMode.replaceWithPiiEntityType:
        return 'REPLACE_WITH_PII_ENTITY_TYPE';
    }
  }
}

extension PiiEntitiesDetectionMaskModeFromString on String {
  PiiEntitiesDetectionMaskMode toPiiEntitiesDetectionMaskMode() {
    switch (this) {
      case 'MASK':
        return PiiEntitiesDetectionMaskMode.mask;
      case 'REPLACE_WITH_PII_ENTITY_TYPE':
        return PiiEntitiesDetectionMaskMode.replaceWithPiiEntityType;
    }
    throw Exception('$this is not known in enum PiiEntitiesDetectionMaskMode');
  }
}

enum PiiEntitiesDetectionMode {
  onlyRedaction,
  onlyOffsets,
}

extension PiiEntitiesDetectionModeValueExtension on PiiEntitiesDetectionMode {
  String toValue() {
    switch (this) {
      case PiiEntitiesDetectionMode.onlyRedaction:
        return 'ONLY_REDACTION';
      case PiiEntitiesDetectionMode.onlyOffsets:
        return 'ONLY_OFFSETS';
    }
  }
}

extension PiiEntitiesDetectionModeFromString on String {
  PiiEntitiesDetectionMode toPiiEntitiesDetectionMode() {
    switch (this) {
      case 'ONLY_REDACTION':
        return PiiEntitiesDetectionMode.onlyRedaction;
      case 'ONLY_OFFSETS':
        return PiiEntitiesDetectionMode.onlyOffsets;
    }
    throw Exception('$this is not known in enum PiiEntitiesDetectionMode');
  }
}

/// Provides information about a PII entity.
class PiiEntity {
  /// The zero-based offset from the beginning of the source text to the first
  /// character in the entity.
  final int? beginOffset;

  /// The zero-based offset from the beginning of the source text to the last
  /// character in the entity.
  final int? endOffset;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double? score;

  /// The entity's type.
  final PiiEntityType? type;

  PiiEntity({
    this.beginOffset,
    this.endOffset,
    this.score,
    this.type,
  });

  factory PiiEntity.fromJson(Map<String, dynamic> json) {
    return PiiEntity(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      score: json['Score'] as double?,
      type: (json['Type'] as String?)?.toPiiEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    final score = this.score;
    final type = this.type;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (endOffset != null) 'EndOffset': endOffset,
      if (score != null) 'Score': score,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum PiiEntityType {
  bankAccountNumber,
  bankRouting,
  creditDebitNumber,
  creditDebitCvv,
  creditDebitExpiry,
  pin,
  email,
  address,
  name,
  phone,
  ssn,
  dateTime,
  passportNumber,
  driverId,
  url,
  age,
  username,
  password,
  awsAccessKey,
  awsSecretKey,
  ipAddress,
  macAddress,
  all,
  licensePlate,
  vehicleIdentificationNumber,
  ukNationalInsuranceNumber,
  caSocialInsuranceNumber,
  usIndividualTaxIdentificationNumber,
  ukUniqueTaxpayerReferenceNumber,
  inPermanentAccountNumber,
  inNrega,
  internationalBankAccountNumber,
  swiftCode,
  ukNationalHealthServiceNumber,
  caHealthNumber,
  inAadhaar,
  inVoterNumber,
}

extension PiiEntityTypeValueExtension on PiiEntityType {
  String toValue() {
    switch (this) {
      case PiiEntityType.bankAccountNumber:
        return 'BANK_ACCOUNT_NUMBER';
      case PiiEntityType.bankRouting:
        return 'BANK_ROUTING';
      case PiiEntityType.creditDebitNumber:
        return 'CREDIT_DEBIT_NUMBER';
      case PiiEntityType.creditDebitCvv:
        return 'CREDIT_DEBIT_CVV';
      case PiiEntityType.creditDebitExpiry:
        return 'CREDIT_DEBIT_EXPIRY';
      case PiiEntityType.pin:
        return 'PIN';
      case PiiEntityType.email:
        return 'EMAIL';
      case PiiEntityType.address:
        return 'ADDRESS';
      case PiiEntityType.name:
        return 'NAME';
      case PiiEntityType.phone:
        return 'PHONE';
      case PiiEntityType.ssn:
        return 'SSN';
      case PiiEntityType.dateTime:
        return 'DATE_TIME';
      case PiiEntityType.passportNumber:
        return 'PASSPORT_NUMBER';
      case PiiEntityType.driverId:
        return 'DRIVER_ID';
      case PiiEntityType.url:
        return 'URL';
      case PiiEntityType.age:
        return 'AGE';
      case PiiEntityType.username:
        return 'USERNAME';
      case PiiEntityType.password:
        return 'PASSWORD';
      case PiiEntityType.awsAccessKey:
        return 'AWS_ACCESS_KEY';
      case PiiEntityType.awsSecretKey:
        return 'AWS_SECRET_KEY';
      case PiiEntityType.ipAddress:
        return 'IP_ADDRESS';
      case PiiEntityType.macAddress:
        return 'MAC_ADDRESS';
      case PiiEntityType.all:
        return 'ALL';
      case PiiEntityType.licensePlate:
        return 'LICENSE_PLATE';
      case PiiEntityType.vehicleIdentificationNumber:
        return 'VEHICLE_IDENTIFICATION_NUMBER';
      case PiiEntityType.ukNationalInsuranceNumber:
        return 'UK_NATIONAL_INSURANCE_NUMBER';
      case PiiEntityType.caSocialInsuranceNumber:
        return 'CA_SOCIAL_INSURANCE_NUMBER';
      case PiiEntityType.usIndividualTaxIdentificationNumber:
        return 'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER';
      case PiiEntityType.ukUniqueTaxpayerReferenceNumber:
        return 'UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER';
      case PiiEntityType.inPermanentAccountNumber:
        return 'IN_PERMANENT_ACCOUNT_NUMBER';
      case PiiEntityType.inNrega:
        return 'IN_NREGA';
      case PiiEntityType.internationalBankAccountNumber:
        return 'INTERNATIONAL_BANK_ACCOUNT_NUMBER';
      case PiiEntityType.swiftCode:
        return 'SWIFT_CODE';
      case PiiEntityType.ukNationalHealthServiceNumber:
        return 'UK_NATIONAL_HEALTH_SERVICE_NUMBER';
      case PiiEntityType.caHealthNumber:
        return 'CA_HEALTH_NUMBER';
      case PiiEntityType.inAadhaar:
        return 'IN_AADHAAR';
      case PiiEntityType.inVoterNumber:
        return 'IN_VOTER_NUMBER';
    }
  }
}

extension PiiEntityTypeFromString on String {
  PiiEntityType toPiiEntityType() {
    switch (this) {
      case 'BANK_ACCOUNT_NUMBER':
        return PiiEntityType.bankAccountNumber;
      case 'BANK_ROUTING':
        return PiiEntityType.bankRouting;
      case 'CREDIT_DEBIT_NUMBER':
        return PiiEntityType.creditDebitNumber;
      case 'CREDIT_DEBIT_CVV':
        return PiiEntityType.creditDebitCvv;
      case 'CREDIT_DEBIT_EXPIRY':
        return PiiEntityType.creditDebitExpiry;
      case 'PIN':
        return PiiEntityType.pin;
      case 'EMAIL':
        return PiiEntityType.email;
      case 'ADDRESS':
        return PiiEntityType.address;
      case 'NAME':
        return PiiEntityType.name;
      case 'PHONE':
        return PiiEntityType.phone;
      case 'SSN':
        return PiiEntityType.ssn;
      case 'DATE_TIME':
        return PiiEntityType.dateTime;
      case 'PASSPORT_NUMBER':
        return PiiEntityType.passportNumber;
      case 'DRIVER_ID':
        return PiiEntityType.driverId;
      case 'URL':
        return PiiEntityType.url;
      case 'AGE':
        return PiiEntityType.age;
      case 'USERNAME':
        return PiiEntityType.username;
      case 'PASSWORD':
        return PiiEntityType.password;
      case 'AWS_ACCESS_KEY':
        return PiiEntityType.awsAccessKey;
      case 'AWS_SECRET_KEY':
        return PiiEntityType.awsSecretKey;
      case 'IP_ADDRESS':
        return PiiEntityType.ipAddress;
      case 'MAC_ADDRESS':
        return PiiEntityType.macAddress;
      case 'ALL':
        return PiiEntityType.all;
      case 'LICENSE_PLATE':
        return PiiEntityType.licensePlate;
      case 'VEHICLE_IDENTIFICATION_NUMBER':
        return PiiEntityType.vehicleIdentificationNumber;
      case 'UK_NATIONAL_INSURANCE_NUMBER':
        return PiiEntityType.ukNationalInsuranceNumber;
      case 'CA_SOCIAL_INSURANCE_NUMBER':
        return PiiEntityType.caSocialInsuranceNumber;
      case 'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER':
        return PiiEntityType.usIndividualTaxIdentificationNumber;
      case 'UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER':
        return PiiEntityType.ukUniqueTaxpayerReferenceNumber;
      case 'IN_PERMANENT_ACCOUNT_NUMBER':
        return PiiEntityType.inPermanentAccountNumber;
      case 'IN_NREGA':
        return PiiEntityType.inNrega;
      case 'INTERNATIONAL_BANK_ACCOUNT_NUMBER':
        return PiiEntityType.internationalBankAccountNumber;
      case 'SWIFT_CODE':
        return PiiEntityType.swiftCode;
      case 'UK_NATIONAL_HEALTH_SERVICE_NUMBER':
        return PiiEntityType.ukNationalHealthServiceNumber;
      case 'CA_HEALTH_NUMBER':
        return PiiEntityType.caHealthNumber;
      case 'IN_AADHAAR':
        return PiiEntityType.inAadhaar;
      case 'IN_VOTER_NUMBER':
        return PiiEntityType.inVoterNumber;
    }
    throw Exception('$this is not known in enum PiiEntityType');
  }
}

/// Provides configuration parameters for the output of PII entity detection
/// jobs.
class PiiOutputDataConfig {
  /// When you use the <code>PiiOutputDataConfig</code> object with asynchronous
  /// operations, you specify the Amazon S3 location where you want to write the
  /// output data.
  ///
  /// For a PII entity detection job, the output file is plain text, not a
  /// compressed archive. The output file name is the same as the input file, with
  /// <code>.out</code> appended at the end.
  final String s3Uri;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt the output results from an analysis job.
  final String? kmsKeyId;

  PiiOutputDataConfig({
    required this.s3Uri,
    this.kmsKeyId,
  });

  factory PiiOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return PiiOutputDataConfig(
      s3Uri: json['S3Uri'] as String,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final kmsKeyId = this.kmsKeyId;
    return {
      'S3Uri': s3Uri,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

/// The X and Y coordinates of a point on a document page.
///
/// For additional information, see <a
/// href="https://docs.aws.amazon.com/textract/latest/dg/API_Point.html">Point</a>
/// in the Amazon Textract API reference.
class Point {
  /// The value of the X coordinate for a point on a polygon
  final double? x;

  /// The value of the Y coordinate for a point on a polygon
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

class PutResourcePolicyResponse {
  /// The revision ID of the policy. Each time you modify a policy, Amazon
  /// Comprehend assigns a new revision ID, and it deletes the prior version of
  /// the policy.
  final String? policyRevisionId;

  PutResourcePolicyResponse({
    this.policyRevisionId,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      policyRevisionId: json['PolicyRevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyRevisionId = this.policyRevisionId;
    return {
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
  }
}

/// Provides configuration parameters for PII entity redaction.
class RedactionConfig {
  /// A character that replaces each character in the redacted PII entity.
  final String? maskCharacter;

  /// Specifies whether the PII entity is redacted with the mask character or the
  /// entity type.
  final PiiEntitiesDetectionMaskMode? maskMode;

  /// An array of the types of PII entities that Amazon Comprehend detects in the
  /// input text for your request.
  final List<PiiEntityType>? piiEntityTypes;

  RedactionConfig({
    this.maskCharacter,
    this.maskMode,
    this.piiEntityTypes,
  });

  factory RedactionConfig.fromJson(Map<String, dynamic> json) {
    return RedactionConfig(
      maskCharacter: json['MaskCharacter'] as String?,
      maskMode: (json['MaskMode'] as String?)?.toPiiEntitiesDetectionMaskMode(),
      piiEntityTypes: (json['PiiEntityTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPiiEntityType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final maskCharacter = this.maskCharacter;
    final maskMode = this.maskMode;
    final piiEntityTypes = this.piiEntityTypes;
    return {
      if (maskCharacter != null) 'MaskCharacter': maskCharacter,
      if (maskMode != null) 'MaskMode': maskMode.toValue(),
      if (piiEntityTypes != null)
        'PiiEntityTypes': piiEntityTypes.map((e) => e.toValue()).toList(),
    };
  }
}

enum RelationshipType {
  child,
}

extension RelationshipTypeValueExtension on RelationshipType {
  String toValue() {
    switch (this) {
      case RelationshipType.child:
        return 'CHILD';
    }
  }
}

extension RelationshipTypeFromString on String {
  RelationshipType toRelationshipType() {
    switch (this) {
      case 'CHILD':
        return RelationshipType.child;
    }
    throw Exception('$this is not known in enum RelationshipType');
  }
}

/// List of child blocks for the current block.
class RelationshipsListItem {
  /// Identifers of the child blocks.
  final List<String>? ids;

  /// Only supported relationship is a child relationship.
  final RelationshipType? type;

  RelationshipsListItem({
    this.ids,
    this.type,
  });

  factory RelationshipsListItem.fromJson(Map<String, dynamic> json) {
    return RelationshipsListItem(
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

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class SentimentDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  SentimentDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a sentiment detection job.
class SentimentDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the sentiment detection job ended.
  final DateTime? endTime;

  /// The input data configuration that you supplied when you created the
  /// sentiment detection job.
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the sentiment detection job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:sentiment-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the sentiment detection job.
  final String? jobId;

  /// The name that you assigned to the sentiment detection job
  final String? jobName;

  /// The current status of the sentiment detection job. If the status is
  /// <code>FAILED</code>, the <code>Messages</code> field shows the reason for
  /// the failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;

  /// The output data configuration that you supplied when you created the
  /// sentiment detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the sentiment detection job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt data on the storage volume attached to the ML
  /// compute instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your sentiment detection job. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  SentimentDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory SentimentDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return SentimentDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final languageCode = this.languageCode;
    final message = this.message;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (message != null) 'Message': message,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// Describes the level of confidence that Amazon Comprehend has in the accuracy
/// of its detection of sentiments.
class SentimentScore {
  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>MIXED</code> sentiment.
  final double? mixed;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>NEGATIVE</code> sentiment.
  final double? negative;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>NEUTRAL</code> sentiment.
  final double? neutral;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>POSITIVE</code> sentiment.
  final double? positive;

  SentimentScore({
    this.mixed,
    this.negative,
    this.neutral,
    this.positive,
  });

  factory SentimentScore.fromJson(Map<String, dynamic> json) {
    return SentimentScore(
      mixed: json['Mixed'] as double?,
      negative: json['Negative'] as double?,
      neutral: json['Neutral'] as double?,
      positive: json['Positive'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final mixed = this.mixed;
    final negative = this.negative;
    final neutral = this.neutral;
    final positive = this.positive;
    return {
      if (mixed != null) 'Mixed': mixed,
      if (negative != null) 'Negative': negative,
      if (neutral != null) 'Neutral': neutral,
      if (positive != null) 'Positive': positive,
    };
  }
}

enum SentimentType {
  positive,
  negative,
  neutral,
  mixed,
}

extension SentimentTypeValueExtension on SentimentType {
  String toValue() {
    switch (this) {
      case SentimentType.positive:
        return 'POSITIVE';
      case SentimentType.negative:
        return 'NEGATIVE';
      case SentimentType.neutral:
        return 'NEUTRAL';
      case SentimentType.mixed:
        return 'MIXED';
    }
  }
}

extension SentimentTypeFromString on String {
  SentimentType toSentimentType() {
    switch (this) {
      case 'POSITIVE':
        return SentimentType.positive;
      case 'NEGATIVE':
        return SentimentType.negative;
      case 'NEUTRAL':
        return SentimentType.neutral;
      case 'MIXED':
        return SentimentType.mixed;
    }
    throw Exception('$this is not known in enum SentimentType');
  }
}

enum Split {
  train,
  test,
}

extension SplitValueExtension on Split {
  String toValue() {
    switch (this) {
      case Split.train:
        return 'TRAIN';
      case Split.test:
        return 'TEST';
    }
  }
}

extension SplitFromString on String {
  Split toSplit() {
    switch (this) {
      case 'TRAIN':
        return Split.train;
      case 'TEST':
        return Split.test;
    }
    throw Exception('$this is not known in enum Split');
  }
}

class StartDocumentClassificationJobResponse {
  /// The ARN of the custom classification model.
  final String? documentClassifierArn;

  /// The Amazon Resource Name (ARN) of the document classification job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:document-classification-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier generated for the job. To get the status of the job, use this
  /// identifier with the <code>DescribeDocumentClassificationJob</code>
  /// operation.
  final String? jobId;

  /// The status of the job:
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. For details, use the
  /// <code>DescribeDocumentClassificationJob</code> operation.
  /// </li>
  /// <li>
  /// STOP_REQUESTED - Amazon Comprehend has received a stop request for the job
  /// and is processing the request.
  /// </li>
  /// <li>
  /// STOPPED - The job was successfully stopped without completing.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartDocumentClassificationJobResponse({
    this.documentClassifierArn,
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartDocumentClassificationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDocumentClassificationJobResponse(
      documentClassifierArn: json['DocumentClassifierArn'] as String?,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentClassifierArn = this.documentClassifierArn;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (documentClassifierArn != null)
        'DocumentClassifierArn': documentClassifierArn,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StartDominantLanguageDetectionJobResponse {
  /// The Amazon Resource Name (ARN) of the dominant language detection job. It is
  /// a unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:dominant-language-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartDominantLanguageDetectionJobResponse({
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartDominantLanguageDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDominantLanguageDetectionJobResponse(
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StartEntitiesDetectionJobResponse {
  /// The ARN of the custom entity recognition model.
  final String? entityRecognizerArn;

  /// The Amazon Resource Name (ARN) of the entities detection job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:entities-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier generated for the job. To get the status of job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the operation.
  /// </li>
  /// <li>
  /// STOP_REQUESTED - Amazon Comprehend has received a stop request for the job
  /// and is processing the request.
  /// </li>
  /// <li>
  /// STOPPED - The job was successfully stopped without completing.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartEntitiesDetectionJobResponse({
    this.entityRecognizerArn,
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartEntitiesDetectionJobResponse(
      entityRecognizerArn: json['EntityRecognizerArn'] as String?,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final entityRecognizerArn = this.entityRecognizerArn;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (entityRecognizerArn != null)
        'EntityRecognizerArn': entityRecognizerArn,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StartEventsDetectionJobResponse {
  /// The Amazon Resource Name (ARN) of the events detection job. It is a unique,
  /// fully qualified identifier for the job. It includes the Amazon Web Services
  /// account, Amazon Web Services Region, and the job ID. The format of the ARN
  /// is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:events-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// An unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend generates one.
  final String? jobId;

  /// The status of the events detection job.
  final JobStatus? jobStatus;

  StartEventsDetectionJobResponse({
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartEventsDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartEventsDetectionJobResponse(
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StartFlywheelIterationResponse {
  /// <p/>
  final String? flywheelArn;

  /// <p/>
  final String? flywheelIterationId;

  StartFlywheelIterationResponse({
    this.flywheelArn,
    this.flywheelIterationId,
  });

  factory StartFlywheelIterationResponse.fromJson(Map<String, dynamic> json) {
    return StartFlywheelIterationResponse(
      flywheelArn: json['FlywheelArn'] as String?,
      flywheelIterationId: json['FlywheelIterationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flywheelArn = this.flywheelArn;
    final flywheelIterationId = this.flywheelIterationId;
    return {
      if (flywheelArn != null) 'FlywheelArn': flywheelArn,
      if (flywheelIterationId != null)
        'FlywheelIterationId': flywheelIterationId,
    };
  }
}

class StartKeyPhrasesDetectionJobResponse {
  /// The Amazon Resource Name (ARN) of the key phrase detection job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:key-phrases-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartKeyPhrasesDetectionJobResponse({
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartKeyPhrasesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartKeyPhrasesDetectionJobResponse(
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StartPiiEntitiesDetectionJobResponse {
  /// The Amazon Resource Name (ARN) of the PII entity detection job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:pii-entities-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier generated for the job.
  final String? jobId;

  /// The status of the job.
  final JobStatus? jobStatus;

  StartPiiEntitiesDetectionJobResponse({
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartPiiEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartPiiEntitiesDetectionJobResponse(
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StartSentimentDetectionJobResponse {
  /// The Amazon Resource Name (ARN) of the sentiment detection job. It is a
  /// unique, fully qualified identifier for the job. It includes the Amazon Web
  /// Services account, Amazon Web Services Region, and the job ID. The format of
  /// the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:sentiment-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartSentimentDetectionJobResponse({
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartSentimentDetectionJobResponse(
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StartTargetedSentimentDetectionJobResponse {
  /// The Amazon Resource Name (ARN) of the targeted sentiment detection job. It
  /// is a unique, fully qualified identifier for the job. It includes the Amazon
  /// Web Services account, Amazon Web Services Region, and the job ID. The format
  /// of the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:targeted-sentiment-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the <code>DescribeTargetedSentimentDetectionJob</code>
  /// operation.
  final String? jobId;

  /// The status of the job.
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the
  /// <code>DescribeTargetedSentimentDetectionJob</code> operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartTargetedSentimentDetectionJobResponse({
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartTargetedSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartTargetedSentimentDetectionJobResponse(
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StartTopicsDetectionJobResponse {
  /// The Amazon Resource Name (ARN) of the topics detection job. It is a unique,
  /// fully qualified identifier for the job. It includes the Amazon Web Services
  /// account, Amazon Web Services Region, and the job ID. The format of the ARN
  /// is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:topics-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier generated for the job. To get the status of the job, use this
  /// identifier with the <code>DescribeTopicDetectionJob</code> operation.
  final String? jobId;

  /// The status of the job:
  ///
  /// <ul>
  /// <li>
  /// SUBMITTED - The job has been received and is queued for processing.
  /// </li>
  /// <li>
  /// IN_PROGRESS - Amazon Comprehend is processing the job.
  /// </li>
  /// <li>
  /// COMPLETED - The job was successfully completed and the output is available.
  /// </li>
  /// <li>
  /// FAILED - The job did not complete. To get details, use the
  /// <code>DescribeTopicDetectionJob</code> operation.
  /// </li>
  /// </ul>
  final JobStatus? jobStatus;

  StartTopicsDetectionJobResponse({
    this.jobArn,
    this.jobId,
    this.jobStatus,
  });

  factory StartTopicsDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartTopicsDetectionJobResponse(
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StopDominantLanguageDetectionJobResponse {
  /// The identifier of the dominant language detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopDominantLanguageDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopDominantLanguageDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });

  factory StopDominantLanguageDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopDominantLanguageDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StopEntitiesDetectionJobResponse {
  /// The identifier of the entities detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopEntitiesDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopEntitiesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });

  factory StopEntitiesDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StopEntitiesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StopEventsDetectionJobResponse {
  /// The identifier of the events detection job to stop.
  final String? jobId;

  /// The status of the events detection job.
  final JobStatus? jobStatus;

  StopEventsDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });

  factory StopEventsDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StopEventsDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StopKeyPhrasesDetectionJobResponse {
  /// The identifier of the key phrases detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopKeyPhrasesDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopKeyPhrasesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });

  factory StopKeyPhrasesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopKeyPhrasesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StopPiiEntitiesDetectionJobResponse {
  /// The identifier of the PII entities detection job to stop.
  final String? jobId;

  /// The status of the PII entities detection job.
  final JobStatus? jobStatus;

  StopPiiEntitiesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });

  factory StopPiiEntitiesDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopPiiEntitiesDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StopSentimentDetectionJobResponse {
  /// The identifier of the sentiment detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopSentimentDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopSentimentDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });

  factory StopSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopSentimentDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StopTargetedSentimentDetectionJobResponse {
  /// The identifier of the targeted sentiment detection job to stop.
  final String? jobId;

  /// Either <code>STOP_REQUESTED</code> if the job is currently running, or
  /// <code>STOPPED</code> if the job was previously stopped with the
  /// <code>StopSentimentDetectionJob</code> operation.
  final JobStatus? jobStatus;

  StopTargetedSentimentDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });

  factory StopTargetedSentimentDetectionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopTargetedSentimentDetectionJobResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

class StopTrainingDocumentClassifierResponse {
  StopTrainingDocumentClassifierResponse();

  factory StopTrainingDocumentClassifierResponse.fromJson(
      Map<String, dynamic> _) {
    return StopTrainingDocumentClassifierResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopTrainingEntityRecognizerResponse {
  StopTrainingEntityRecognizerResponse();

  factory StopTrainingEntityRecognizerResponse.fromJson(
      Map<String, dynamic> _) {
    return StopTrainingEntityRecognizerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum SyntaxLanguageCode {
  en,
  es,
  fr,
  de,
  it,
  pt,
}

extension SyntaxLanguageCodeValueExtension on SyntaxLanguageCode {
  String toValue() {
    switch (this) {
      case SyntaxLanguageCode.en:
        return 'en';
      case SyntaxLanguageCode.es:
        return 'es';
      case SyntaxLanguageCode.fr:
        return 'fr';
      case SyntaxLanguageCode.de:
        return 'de';
      case SyntaxLanguageCode.it:
        return 'it';
      case SyntaxLanguageCode.pt:
        return 'pt';
    }
  }
}

extension SyntaxLanguageCodeFromString on String {
  SyntaxLanguageCode toSyntaxLanguageCode() {
    switch (this) {
      case 'en':
        return SyntaxLanguageCode.en;
      case 'es':
        return SyntaxLanguageCode.es;
      case 'fr':
        return SyntaxLanguageCode.fr;
      case 'de':
        return SyntaxLanguageCode.de;
      case 'it':
        return SyntaxLanguageCode.it;
      case 'pt':
        return SyntaxLanguageCode.pt;
    }
    throw Exception('$this is not known in enum SyntaxLanguageCode');
  }
}

/// Represents a work in the input text that was recognized and assigned a part
/// of speech. There is one syntax token record for each word in the source
/// text.
class SyntaxToken {
  /// The zero-based offset from the beginning of the source text to the first
  /// character in the word.
  final int? beginOffset;

  /// The zero-based offset from the beginning of the source text to the last
  /// character in the word.
  final int? endOffset;

  /// Provides the part of speech label and the confidence level that Amazon
  /// Comprehend has that the part of speech was correctly identified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html">Syntax</a>
  /// in the Comprehend Developer Guide.
  final PartOfSpeechTag? partOfSpeech;

  /// The word that was recognized in the source text.
  final String? text;

  /// A unique identifier for a token.
  final int? tokenId;

  SyntaxToken({
    this.beginOffset,
    this.endOffset,
    this.partOfSpeech,
    this.text,
    this.tokenId,
  });

  factory SyntaxToken.fromJson(Map<String, dynamic> json) {
    return SyntaxToken(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      partOfSpeech: json['PartOfSpeech'] != null
          ? PartOfSpeechTag.fromJson(
              json['PartOfSpeech'] as Map<String, dynamic>)
          : null,
      text: json['Text'] as String?,
      tokenId: json['TokenId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    final partOfSpeech = this.partOfSpeech;
    final text = this.text;
    final tokenId = this.tokenId;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (endOffset != null) 'EndOffset': endOffset,
      if (partOfSpeech != null) 'PartOfSpeech': partOfSpeech,
      if (text != null) 'Text': text,
      if (tokenId != null) 'TokenId': tokenId,
    };
  }
}

/// A key-value pair that adds as a metadata to a resource used by Amazon
/// Comprehend. For example, a tag with the key-value pair ‘Department’:’Sales’
/// might be added to a resource to indicate its use by a particular department.
class Tag {
  /// The initial part of a key-value pair that forms a tag associated with a
  /// given resource. For instance, if you want to show which resources are used
  /// by which departments, you might use “Department” as the key portion of the
  /// pair, with multiple possible values such as “sales,” “legal,” and
  /// “administration.”
  final String key;

  /// The second part of a key-value pair that forms a tag associated with a given
  /// resource. For instance, if you want to show which resources are used by
  /// which departments, you might use “Department” as the initial (key) portion
  /// of the pair, with a value of “sales” to indicate the sales department.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
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

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the
/// <code>ListTargetedSentimentDetectionJobs</code> operation.
class TargetedSentimentDetectionJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  TargetedSentimentDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a targeted sentiment detection job.
class TargetedSentimentDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the targeted sentiment detection job ended.
  final DateTime? endTime;
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the targeted sentiment detection job. It
  /// is a unique, fully qualified identifier for the job. It includes the Amazon
  /// Web Services account, Amazon Web Services Region, and the job ID. The format
  /// of the ARN is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:targeted-sentiment-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the targeted sentiment detection job.
  final String? jobId;

  /// The name that you assigned to the targeted sentiment detection job.
  final String? jobName;

  /// The current status of the targeted sentiment detection job. If the status is
  /// <code>FAILED</code>, the <code>Messages</code> field shows the reason for
  /// the failure.
  final JobStatus? jobStatus;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// A description of the status of a job.
  final String? message;
  final OutputDataConfig? outputDataConfig;

  /// The time that the targeted sentiment detection job was submitted for
  /// processing.
  final DateTime? submitTime;

  /// ID for the KMS key that Amazon Comprehend uses to encrypt the data on the
  /// storage volume attached to the ML compute instance(s) that process the
  /// targeted sentiment detection job. The VolumeKmsKeyId can be either of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;
  final VpcConfig? vpcConfig;

  TargetedSentimentDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.languageCode,
    this.message,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory TargetedSentimentDetectionJobProperties.fromJson(
      Map<String, dynamic> json) {
    return TargetedSentimentDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final languageCode = this.languageCode;
    final message = this.message;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (message != null) 'Message': message,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// Information about one of the entities found by targeted sentiment analysis.
///
/// For more information about targeted sentiment, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html">Targeted
/// sentiment</a> in the <i>Amazon Comprehend Developer Guide</i>.
class TargetedSentimentEntity {
  /// One or more index into the Mentions array that provides the best name for
  /// the entity group.
  final List<int>? descriptiveMentionIndex;

  /// An array of mentions of the entity in the document. The array represents a
  /// co-reference group. See <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html#how-targeted-sentiment-values">
  /// Co-reference group</a> for an example.
  final List<TargetedSentimentMention>? mentions;

  TargetedSentimentEntity({
    this.descriptiveMentionIndex,
    this.mentions,
  });

  factory TargetedSentimentEntity.fromJson(Map<String, dynamic> json) {
    return TargetedSentimentEntity(
      descriptiveMentionIndex: (json['DescriptiveMentionIndex'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      mentions: (json['Mentions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TargetedSentimentMention.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final descriptiveMentionIndex = this.descriptiveMentionIndex;
    final mentions = this.mentions;
    return {
      if (descriptiveMentionIndex != null)
        'DescriptiveMentionIndex': descriptiveMentionIndex,
      if (mentions != null) 'Mentions': mentions,
    };
  }
}

enum TargetedSentimentEntityType {
  person,
  location,
  organization,
  facility,
  brand,
  commercialItem,
  movie,
  music,
  book,
  software,
  game,
  personalTitle,
  event,
  date,
  quantity,
  attribute,
  other,
}

extension TargetedSentimentEntityTypeValueExtension
    on TargetedSentimentEntityType {
  String toValue() {
    switch (this) {
      case TargetedSentimentEntityType.person:
        return 'PERSON';
      case TargetedSentimentEntityType.location:
        return 'LOCATION';
      case TargetedSentimentEntityType.organization:
        return 'ORGANIZATION';
      case TargetedSentimentEntityType.facility:
        return 'FACILITY';
      case TargetedSentimentEntityType.brand:
        return 'BRAND';
      case TargetedSentimentEntityType.commercialItem:
        return 'COMMERCIAL_ITEM';
      case TargetedSentimentEntityType.movie:
        return 'MOVIE';
      case TargetedSentimentEntityType.music:
        return 'MUSIC';
      case TargetedSentimentEntityType.book:
        return 'BOOK';
      case TargetedSentimentEntityType.software:
        return 'SOFTWARE';
      case TargetedSentimentEntityType.game:
        return 'GAME';
      case TargetedSentimentEntityType.personalTitle:
        return 'PERSONAL_TITLE';
      case TargetedSentimentEntityType.event:
        return 'EVENT';
      case TargetedSentimentEntityType.date:
        return 'DATE';
      case TargetedSentimentEntityType.quantity:
        return 'QUANTITY';
      case TargetedSentimentEntityType.attribute:
        return 'ATTRIBUTE';
      case TargetedSentimentEntityType.other:
        return 'OTHER';
    }
  }
}

extension TargetedSentimentEntityTypeFromString on String {
  TargetedSentimentEntityType toTargetedSentimentEntityType() {
    switch (this) {
      case 'PERSON':
        return TargetedSentimentEntityType.person;
      case 'LOCATION':
        return TargetedSentimentEntityType.location;
      case 'ORGANIZATION':
        return TargetedSentimentEntityType.organization;
      case 'FACILITY':
        return TargetedSentimentEntityType.facility;
      case 'BRAND':
        return TargetedSentimentEntityType.brand;
      case 'COMMERCIAL_ITEM':
        return TargetedSentimentEntityType.commercialItem;
      case 'MOVIE':
        return TargetedSentimentEntityType.movie;
      case 'MUSIC':
        return TargetedSentimentEntityType.music;
      case 'BOOK':
        return TargetedSentimentEntityType.book;
      case 'SOFTWARE':
        return TargetedSentimentEntityType.software;
      case 'GAME':
        return TargetedSentimentEntityType.game;
      case 'PERSONAL_TITLE':
        return TargetedSentimentEntityType.personalTitle;
      case 'EVENT':
        return TargetedSentimentEntityType.event;
      case 'DATE':
        return TargetedSentimentEntityType.date;
      case 'QUANTITY':
        return TargetedSentimentEntityType.quantity;
      case 'ATTRIBUTE':
        return TargetedSentimentEntityType.attribute;
      case 'OTHER':
        return TargetedSentimentEntityType.other;
    }
    throw Exception('$this is not known in enum TargetedSentimentEntityType');
  }
}

/// Information about one mention of an entity. The mention information includes
/// the location of the mention in the text and the sentiment of the mention.
///
/// For more information about targeted sentiment, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html">Targeted
/// sentiment</a> in the <i>Amazon Comprehend Developer Guide</i>.
class TargetedSentimentMention {
  /// The offset into the document text where the mention begins.
  final int? beginOffset;

  /// The offset into the document text where the mention ends.
  final int? endOffset;

  /// The confidence that all the entities mentioned in the group relate to the
  /// same entity.
  final double? groupScore;

  /// Contains the sentiment and sentiment score for the mention.
  final MentionSentiment? mentionSentiment;

  /// Model confidence that the entity is relevant. Value range is zero to one,
  /// where one is highest confidence.
  final double? score;

  /// The text in the document that identifies the entity.
  final String? text;

  /// The type of the entity. Amazon Comprehend supports a variety of <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html#how-targeted-sentiment-entities">entity
  /// types</a>.
  final TargetedSentimentEntityType? type;

  TargetedSentimentMention({
    this.beginOffset,
    this.endOffset,
    this.groupScore,
    this.mentionSentiment,
    this.score,
    this.text,
    this.type,
  });

  factory TargetedSentimentMention.fromJson(Map<String, dynamic> json) {
    return TargetedSentimentMention(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      groupScore: json['GroupScore'] as double?,
      mentionSentiment: json['MentionSentiment'] != null
          ? MentionSentiment.fromJson(
              json['MentionSentiment'] as Map<String, dynamic>)
          : null,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      type: (json['Type'] as String?)?.toTargetedSentimentEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    final groupScore = this.groupScore;
    final mentionSentiment = this.mentionSentiment;
    final score = this.score;
    final text = this.text;
    final type = this.type;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (endOffset != null) 'EndOffset': endOffset,
      if (groupScore != null) 'GroupScore': groupScore,
      if (mentionSentiment != null) 'MentionSentiment': mentionSentiment,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Configuration about the model associated with a flywheel.
class TaskConfig {
  /// Language code for the language that the model supports.
  final LanguageCode languageCode;

  /// Configuration required for a document classification model.
  final DocumentClassificationConfig? documentClassificationConfig;

  /// Configuration required for an entity recognition model.
  final EntityRecognitionConfig? entityRecognitionConfig;

  TaskConfig({
    required this.languageCode,
    this.documentClassificationConfig,
    this.entityRecognitionConfig,
  });

  factory TaskConfig.fromJson(Map<String, dynamic> json) {
    return TaskConfig(
      languageCode: (json['LanguageCode'] as String).toLanguageCode(),
      documentClassificationConfig: json['DocumentClassificationConfig'] != null
          ? DocumentClassificationConfig.fromJson(
              json['DocumentClassificationConfig'] as Map<String, dynamic>)
          : null,
      entityRecognitionConfig: json['EntityRecognitionConfig'] != null
          ? EntityRecognitionConfig.fromJson(
              json['EntityRecognitionConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final documentClassificationConfig = this.documentClassificationConfig;
    final entityRecognitionConfig = this.entityRecognitionConfig;
    return {
      'LanguageCode': languageCode.toValue(),
      if (documentClassificationConfig != null)
        'DocumentClassificationConfig': documentClassificationConfig,
      if (entityRecognitionConfig != null)
        'EntityRecognitionConfig': entityRecognitionConfig,
    };
  }
}

/// One of the of text strings. Each string has a size limit of 1KB.
class TextSegment {
  /// The text content.
  final String text;

  TextSegment({
    required this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'Text': text,
    };
  }
}

/// Provides information for filtering topic detection jobs. For more
/// information, see .
class TopicsDetectionJobFilter {
  /// <p/>
  final String? jobName;

  /// Filters the list of topic detection jobs based on job status. Returns only
  /// jobs with the specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Only returns jobs submitted after the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Only returns jobs submitted before the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeBefore;

  TopicsDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a topic detection job.
class TopicsDetectionJobProperties {
  /// The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend
  /// read access to your job data.
  final String? dataAccessRoleArn;

  /// The time that the topic detection job was completed.
  final DateTime? endTime;

  /// The input data configuration supplied when you created the topic detection
  /// job.
  final InputDataConfig? inputDataConfig;

  /// The Amazon Resource Name (ARN) of the topics detection job. It is a unique,
  /// fully qualified identifier for the job. It includes the Amazon Web Services
  /// account, Amazon Web Services Region, and the job ID. The format of the ARN
  /// is as follows:
  ///
  /// <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:topics-detection-job/&lt;job-id&gt;</code>
  ///
  /// The following is an example job ARN:
  ///
  /// <code>arn:aws:comprehend:us-west-2:111122223333:topics-detection-job/1234abcd12ab34cd56ef1234567890ab</code>
  final String? jobArn;

  /// The identifier assigned to the topic detection job.
  final String? jobId;

  /// The name of the topic detection job.
  final String? jobName;

  /// The current status of the topic detection job. If the status is
  /// <code>Failed</code>, the reason for the failure is shown in the
  /// <code>Message</code> field.
  final JobStatus? jobStatus;

  /// A description for the status of a job.
  final String? message;

  /// The number of topics to detect supplied when you created the topic detection
  /// job. The default is 10.
  final int? numberOfTopics;

  /// The output data configuration supplied when you created the topic detection
  /// job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the topic detection job was submitted for processing.
  final DateTime? submitTime;

  /// ID for the Amazon Web Services Key Management Service (KMS) key that Amazon
  /// Comprehend uses to encrypt data on the storage volume attached to the ML
  /// compute instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your topic detection job. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
  /// VPC</a>.
  final VpcConfig? vpcConfig;

  TopicsDetectionJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobArn,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.numberOfTopics,
    this.outputDataConfig,
    this.submitTime,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  factory TopicsDetectionJobProperties.fromJson(Map<String, dynamic> json) {
    return TopicsDetectionJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      message: json['Message'] as String?,
      numberOfTopics: json['NumberOfTopics'] as int?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final message = this.message;
    final numberOfTopics = this.numberOfTopics;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (message != null) 'Message': message,
      if (numberOfTopics != null) 'NumberOfTopics': numberOfTopics,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// Toxic content analysis result for one string. For more information about
/// toxicity detection, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/toxicity-detection.html">Toxicity
/// detection</a> in the <i>Amazon Comprehend Developer Guide</i>
class ToxicContent {
  /// The name of the toxic content type.
  final ToxicContentType? name;

  /// Model confidence in the detected content type. Value range is zero to one,
  /// where one is highest confidence.
  final double? score;

  ToxicContent({
    this.name,
    this.score,
  });

  factory ToxicContent.fromJson(Map<String, dynamic> json) {
    return ToxicContent(
      name: (json['Name'] as String?)?.toToxicContentType(),
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final score = this.score;
    return {
      if (name != null) 'Name': name.toValue(),
      if (score != null) 'Score': score,
    };
  }
}

enum ToxicContentType {
  graphic,
  harassmentOrAbuse,
  hateSpeech,
  insult,
  profanity,
  sexual,
  violenceOrThreat,
}

extension ToxicContentTypeValueExtension on ToxicContentType {
  String toValue() {
    switch (this) {
      case ToxicContentType.graphic:
        return 'GRAPHIC';
      case ToxicContentType.harassmentOrAbuse:
        return 'HARASSMENT_OR_ABUSE';
      case ToxicContentType.hateSpeech:
        return 'HATE_SPEECH';
      case ToxicContentType.insult:
        return 'INSULT';
      case ToxicContentType.profanity:
        return 'PROFANITY';
      case ToxicContentType.sexual:
        return 'SEXUAL';
      case ToxicContentType.violenceOrThreat:
        return 'VIOLENCE_OR_THREAT';
    }
  }
}

extension ToxicContentTypeFromString on String {
  ToxicContentType toToxicContentType() {
    switch (this) {
      case 'GRAPHIC':
        return ToxicContentType.graphic;
      case 'HARASSMENT_OR_ABUSE':
        return ToxicContentType.harassmentOrAbuse;
      case 'HATE_SPEECH':
        return ToxicContentType.hateSpeech;
      case 'INSULT':
        return ToxicContentType.insult;
      case 'PROFANITY':
        return ToxicContentType.profanity;
      case 'SEXUAL':
        return ToxicContentType.sexual;
      case 'VIOLENCE_OR_THREAT':
        return ToxicContentType.violenceOrThreat;
    }
    throw Exception('$this is not known in enum ToxicContentType');
  }
}

/// Toxicity analysis result for one string. For more information about toxicity
/// detection, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/toxicity-detection.html">Toxicity
/// detection</a> in the <i>Amazon Comprehend Developer Guide</i>.
class ToxicLabels {
  /// Array of toxic content types identified in the string.
  final List<ToxicContent>? labels;

  /// Overall toxicity score for the string. Value range is zero to one, where one
  /// is the highest confidence.
  final double? toxicity;

  ToxicLabels({
    this.labels,
    this.toxicity,
  });

  factory ToxicLabels.fromJson(Map<String, dynamic> json) {
    return ToxicLabels(
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => ToxicContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      toxicity: json['Toxicity'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final labels = this.labels;
    final toxicity = this.toxicity;
    return {
      if (labels != null) 'Labels': labels,
      if (toxicity != null) 'Toxicity': toxicity,
    };
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

/// Data security configuration.
class UpdateDataSecurityConfig {
  /// ID for the KMS key that Amazon Comprehend uses to encrypt trained custom
  /// models. The ModelKmsKeyId can be either of the following formats:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key:
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  final String? modelKmsKeyId;

  /// ID for the KMS key that Amazon Comprehend uses to encrypt the volume.
  final String? volumeKmsKeyId;
  final VpcConfig? vpcConfig;

  UpdateDataSecurityConfig({
    this.modelKmsKeyId,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });

  Map<String, dynamic> toJson() {
    final modelKmsKeyId = this.modelKmsKeyId;
    final volumeKmsKeyId = this.volumeKmsKeyId;
    final vpcConfig = this.vpcConfig;
    return {
      if (modelKmsKeyId != null) 'ModelKmsKeyId': modelKmsKeyId,
      if (volumeKmsKeyId != null) 'VolumeKmsKeyId': volumeKmsKeyId,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

class UpdateEndpointResponse {
  /// The Amazon Resource Number (ARN) of the new model.
  final String? desiredModelArn;

  UpdateEndpointResponse({
    this.desiredModelArn,
  });

  factory UpdateEndpointResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEndpointResponse(
      desiredModelArn: json['DesiredModelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredModelArn = this.desiredModelArn;
    return {
      if (desiredModelArn != null) 'DesiredModelArn': desiredModelArn,
    };
  }
}

class UpdateFlywheelResponse {
  /// The flywheel properties.
  final FlywheelProperties? flywheelProperties;

  UpdateFlywheelResponse({
    this.flywheelProperties,
  });

  factory UpdateFlywheelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlywheelResponse(
      flywheelProperties: json['FlywheelProperties'] != null
          ? FlywheelProperties.fromJson(
              json['FlywheelProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flywheelProperties = this.flywheelProperties;
    return {
      if (flywheelProperties != null) 'FlywheelProperties': flywheelProperties,
    };
  }
}

/// Configuration parameters for an optional private Virtual Private Cloud (VPC)
/// containing the resources you are using for the job. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon
/// VPC</a>.
class VpcConfig {
  /// The ID number for a security group on an instance of your private VPC.
  /// Security groups on your VPC function serve as a virtual firewall to control
  /// inbound and outbound traffic and provides security for the resources that
  /// you’ll be accessing on the VPC. This ID number is preceded by "sg-", for
  /// instance: "sg-03b388029b0a285ea". For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html">Security
  /// Groups for your VPC</a>.
  final List<String> securityGroupIds;

  /// The ID for each subnet being used in your private VPC. This subnet is a
  /// subset of the a range of IPv4 addresses used by the VPC and is specific to a
  /// given availability zone in the VPC’s Region. This ID number is preceded by
  /// "subnet-", for instance: "subnet-04ccf456919e69055". For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">VPCs
  /// and Subnets</a>.
  final List<String> subnets;

  VpcConfig({
    required this.securityGroupIds,
    required this.subnets,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupIds: (json['SecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnets: (json['Subnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnets = this.subnets;
    return {
      'SecurityGroupIds': securityGroupIds,
      'Subnets': subnets,
    };
  }
}

/// The system identified one of the following warnings while processing the
/// input document:
///
/// <ul>
/// <li>
/// The document to classify is plain text, but the classifier is a native
/// document model.
/// </li>
/// <li>
/// The document to classify is semi-structured, but the classifier is a
/// plain-text model.
/// </li>
/// </ul>
class WarningsListItem {
  /// Page number in the input document.
  final int? page;

  /// The type of warning.
  final PageBasedWarningCode? warnCode;

  /// Text message associated with the warning.
  final String? warnMessage;

  WarningsListItem({
    this.page,
    this.warnCode,
    this.warnMessage,
  });

  factory WarningsListItem.fromJson(Map<String, dynamic> json) {
    return WarningsListItem(
      page: json['Page'] as int?,
      warnCode: (json['WarnCode'] as String?)?.toPageBasedWarningCode(),
      warnMessage: json['WarnMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final page = this.page;
    final warnCode = this.warnCode;
    final warnMessage = this.warnMessage;
    return {
      if (page != null) 'Page': page,
      if (warnCode != null) 'WarnCode': warnCode.toValue(),
      if (warnMessage != null) 'WarnMessage': warnMessage,
    };
  }
}

class BatchSizeLimitExceededException extends _s.GenericAwsException {
  BatchSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'BatchSizeLimitExceededException',
            message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidFilterException extends _s.GenericAwsException {
  InvalidFilterException({String? type, String? message})
      : super(type: type, code: 'InvalidFilterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class JobNotFoundException extends _s.GenericAwsException {
  JobNotFoundException({String? type, String? message})
      : super(type: type, code: 'JobNotFoundException', message: message);
}

class KmsKeyValidationException extends _s.GenericAwsException {
  KmsKeyValidationException({String? type, String? message})
      : super(type: type, code: 'KmsKeyValidationException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class TextSizeLimitExceededException extends _s.GenericAwsException {
  TextSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'TextSizeLimitExceededException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class TooManyTagKeysException extends _s.GenericAwsException {
  TooManyTagKeysException({String? type, String? message})
      : super(type: type, code: 'TooManyTagKeysException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnsupportedLanguageException extends _s.GenericAwsException {
  UnsupportedLanguageException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedLanguageException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BatchSizeLimitExceededException': (type, message) =>
      BatchSizeLimitExceededException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidFilterException': (type, message) =>
      InvalidFilterException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'JobNotFoundException': (type, message) =>
      JobNotFoundException(type: type, message: message),
  'KmsKeyValidationException': (type, message) =>
      KmsKeyValidationException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'TextSizeLimitExceededException': (type, message) =>
      TextSizeLimitExceededException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'TooManyTagKeysException': (type, message) =>
      TooManyTagKeysException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnsupportedLanguageException': (type, message) =>
      UnsupportedLanguageException(type: type, message: message),
};
