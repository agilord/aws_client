// ignore_for_file: deprecated_member_use_from_same_package
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        if (datasetType != null) 'DatasetType': datasetType.value,
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
        'LanguageCode': languageCode.value,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (mode != null) 'Mode': mode.value,
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
        'LanguageCode': languageCode.value,
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
        if (modelType != null) 'ModelType': modelType.value,
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
        if (languageCode != null) 'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
        'Mode': mode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
  plainTextDocument('PLAIN_TEXT_DOCUMENT'),
  semiStructuredDocument('SEMI_STRUCTURED_DOCUMENT'),
  ;

  final String value;

  const AugmentedManifestsDocumentTypeFormat(this.value);

  static AugmentedManifestsDocumentTypeFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AugmentedManifestsDocumentTypeFormat'));
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
          .nonNulls
          .map((e) => e as String)
          .toList(),
      s3Uri: json['S3Uri'] as String,
      annotationDataS3Uri: json['AnnotationDataS3Uri'] as String?,
      documentType: (json['DocumentType'] as String?)
          ?.let(AugmentedManifestsDocumentTypeFormat.fromString),
      sourceDocumentsS3Uri: json['SourceDocumentsS3Uri'] as String?,
      split: (json['Split'] as String?)?.let(Split.fromString),
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
      if (documentType != null) 'DocumentType': documentType.value,
      if (sourceDocumentsS3Uri != null)
        'SourceDocumentsS3Uri': sourceDocumentsS3Uri,
      if (split != null) 'Split': split.value,
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
          ?.nonNulls
          .map((e) => DominantLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          .nonNulls
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .nonNulls
          .map((e) => BatchDetectDominantLanguageItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: json['Index'] as int?,
    );
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
          .nonNulls
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .nonNulls
          .map((e) =>
              BatchDetectEntitiesItemResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) => KeyPhrase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          .nonNulls
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .nonNulls
          .map((e) => BatchDetectKeyPhrasesItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
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
      sentiment: (json['Sentiment'] as String?)?.let(SentimentType.fromString),
      sentimentScore: json['SentimentScore'] != null
          ? SentimentScore.fromJson(
              json['SentimentScore'] as Map<String, dynamic>)
          : null,
    );
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
          .nonNulls
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .nonNulls
          .map((e) => BatchDetectSentimentItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) => SyntaxToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          .nonNulls
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .nonNulls
          .map((e) =>
              BatchDetectSyntaxItemResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) =>
              TargetedSentimentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: json['Index'] as int?,
    );
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
          .nonNulls
          .map((e) => BatchItemError.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultList: (json['ResultList'] as List)
          .nonNulls
          .map((e) => BatchDetectTargetedSentimentItemResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
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
      blockType: (json['BlockType'] as String?)?.let(BlockType.fromString),
      geometry: json['Geometry'] != null
          ? Geometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      page: json['Page'] as int?,
      relationships: (json['Relationships'] as List?)
          ?.nonNulls
          .map((e) => RelationshipsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['Text'] as String?,
    );
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
          ?.nonNulls
          .map((e) => ChildBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      endOffset: json['EndOffset'] as int?,
    );
  }
}

enum BlockType {
  line('LINE'),
  word('WORD'),
  ;

  final String value;

  const BlockType(this.value);

  static BlockType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum BlockType'));
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
          ?.nonNulls
          .map((e) => DocumentClass.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      documentType: (json['DocumentType'] as List?)
          ?.nonNulls
          .map((e) => DocumentTypeListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => ErrorsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      labels: (json['Labels'] as List?)
          ?.nonNulls
          .map((e) => DocumentLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      warnings: (json['Warnings'] as List?)
          ?.nonNulls
          .map((e) => WarningsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) => EntityLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
      if (documentType != null) 'DocumentType': documentType.value,
      if (sourceDocumentsS3Uri != null)
        'SourceDocumentsS3Uri': sourceDocumentsS3Uri,
    };
  }
}

enum DatasetDataFormat {
  comprehendCsv('COMPREHEND_CSV'),
  augmentedManifest('AUGMENTED_MANIFEST'),
  ;

  final String value;

  const DatasetDataFormat(this.value);

  static DatasetDataFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DatasetDataFormat'));
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
      if (inputFormat != null) 'InputFormat': inputFormat.value,
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
      if (datasetType != null) 'DatasetType': datasetType.value,
      if (status != null) 'Status': status.value,
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
      if (dataFormat != null) 'DataFormat': dataFormat.value,
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
      datasetType:
          (json['DatasetType'] as String?)?.let(DatasetType.fromString),
      description: json['Description'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      message: json['Message'] as String?,
      numberOfDocuments: json['NumberOfDocuments'] as int?,
      status: (json['Status'] as String?)?.let(DatasetStatus.fromString),
    );
  }
}

enum DatasetStatus {
  creating('CREATING'),
  completed('COMPLETED'),
  failed('FAILED'),
  ;

  final String value;

  const DatasetStatus(this.value);

  static DatasetStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DatasetStatus'));
}

enum DatasetType {
  train('TRAIN'),
  test('TEST'),
  ;

  final String value;

  const DatasetType(this.value);

  static DatasetType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DatasetType'));
}

class DeleteDocumentClassifierResponse {
  DeleteDocumentClassifierResponse();

  factory DeleteDocumentClassifierResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDocumentClassifierResponse();
  }
}

class DeleteEndpointResponse {
  DeleteEndpointResponse();

  factory DeleteEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEndpointResponse();
  }
}

class DeleteEntityRecognizerResponse {
  DeleteEntityRecognizerResponse();

  factory DeleteEntityRecognizerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEntityRecognizerResponse();
  }
}

class DeleteFlywheelResponse {
  DeleteFlywheelResponse();

  factory DeleteFlywheelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFlywheelResponse();
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
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
          ?.nonNulls
          .map((e) => DominantLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentMetadata: json['DocumentMetadata'] != null
          ? DocumentMetadata.fromJson(
              json['DocumentMetadata'] as Map<String, dynamic>)
          : null,
      documentType: (json['DocumentType'] as List?)
          ?.nonNulls
          .map((e) => DocumentTypeListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      entities: (json['Entities'] as List?)
          ?.nonNulls
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => ErrorsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) => KeyPhrase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) => PiiEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
      sentiment: (json['Sentiment'] as String?)?.let(SentimentType.fromString),
      sentimentScore: json['SentimentScore'] != null
          ? SentimentScore.fromJson(
              json['SentimentScore'] as Map<String, dynamic>)
          : null,
    );
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
          ?.nonNulls
          .map((e) => SyntaxToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) =>
              TargetedSentimentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.nonNulls
          .map((e) => ToxicLabels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
      mode: DocumentClassifierMode.fromString((json['Mode'] as String)),
      labels:
          (json['Labels'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final labels = this.labels;
    return {
      'Mode': mode.value,
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
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
}

enum DocumentClassifierDataFormat {
  comprehendCsv('COMPREHEND_CSV'),
  augmentedManifest('AUGMENTED_MANIFEST'),
  ;

  final String value;

  const DocumentClassifierDataFormat(this.value);

  static DocumentClassifierDataFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DocumentClassifierDataFormat'));
}

enum DocumentClassifierDocumentTypeFormat {
  plainTextDocument('PLAIN_TEXT_DOCUMENT'),
  semiStructuredDocument('SEMI_STRUCTURED_DOCUMENT'),
  ;

  final String value;

  const DocumentClassifierDocumentTypeFormat(this.value);

  static DocumentClassifierDocumentTypeFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DocumentClassifierDocumentTypeFormat'));
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
      if (status != null) 'Status': status.value,
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
          ?.nonNulls
          .map((e) =>
              AugmentedManifestsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataFormat: (json['DataFormat'] as String?)
          ?.let(DocumentClassifierDataFormat.fromString),
      documentReaderConfig: json['DocumentReaderConfig'] != null
          ? DocumentReaderConfig.fromJson(
              json['DocumentReaderConfig'] as Map<String, dynamic>)
          : null,
      documentType: (json['DocumentType'] as String?)
          ?.let(DocumentClassifierDocumentTypeFormat.fromString),
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
      if (dataFormat != null) 'DataFormat': dataFormat.value,
      if (documentReaderConfig != null)
        'DocumentReaderConfig': documentReaderConfig,
      if (documentType != null) 'DocumentType': documentType.value,
      if (documents != null) 'Documents': documents,
      if (labelDelimiter != null) 'LabelDelimiter': labelDelimiter,
      if (s3Uri != null) 'S3Uri': s3Uri,
      if (testS3Uri != null) 'TestS3Uri': testS3Uri,
    };
  }
}

enum DocumentClassifierMode {
  multiClass('MULTI_CLASS'),
  multiLabel('MULTI_LABEL'),
  ;

  final String value;

  const DocumentClassifierMode(this.value);

  static DocumentClassifierMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DocumentClassifierMode'));
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
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      message: json['Message'] as String?,
      mode: (json['Mode'] as String?)?.let(DocumentClassifierMode.fromString),
      modelKmsKeyId: json['ModelKmsKeyId'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? DocumentClassifierOutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      sourceModelArn: json['SourceModelArn'] as String?,
      status: (json['Status'] as String?)?.let(ModelStatus.fromString),
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
          (json['LatestVersionStatus'] as String?)?.let(ModelStatus.fromString),
      numberOfVersions: json['NumberOfVersions'] as int?,
    );
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
          ?.nonNulls
          .map((e) =>
              ExtractedCharactersListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pages: json['Pages'] as int?,
    );
  }
}

enum DocumentReadAction {
  textractDetectDocumentText('TEXTRACT_DETECT_DOCUMENT_TEXT'),
  textractAnalyzeDocument('TEXTRACT_ANALYZE_DOCUMENT'),
  ;

  final String value;

  const DocumentReadAction(this.value);

  static DocumentReadAction fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DocumentReadAction'));
}

/// TABLES or FORMS
enum DocumentReadFeatureTypes {
  tables('TABLES'),
  forms('FORMS'),
  ;

  final String value;

  const DocumentReadFeatureTypes(this.value);

  static DocumentReadFeatureTypes fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DocumentReadFeatureTypes'));
}

enum DocumentReadMode {
  serviceDefault('SERVICE_DEFAULT'),
  forceDocumentReadAction('FORCE_DOCUMENT_READ_ACTION'),
  ;

  final String value;

  const DocumentReadMode(this.value);

  static DocumentReadMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DocumentReadMode'));
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
          DocumentReadAction.fromString((json['DocumentReadAction'] as String)),
      documentReadMode: (json['DocumentReadMode'] as String?)
          ?.let(DocumentReadMode.fromString),
      featureTypes: (json['FeatureTypes'] as List?)
          ?.nonNulls
          .map((e) => DocumentReadFeatureTypes.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentReadAction = this.documentReadAction;
    final documentReadMode = this.documentReadMode;
    final featureTypes = this.featureTypes;
    return {
      'DocumentReadAction': documentReadAction.value,
      if (documentReadMode != null) 'DocumentReadMode': documentReadMode.value,
      if (featureTypes != null)
        'FeatureTypes': featureTypes.map((e) => e.value).toList(),
    };
  }
}

enum DocumentType {
  nativePdf('NATIVE_PDF'),
  scannedPdf('SCANNED_PDF'),
  msWord('MS_WORD'),
  image('IMAGE'),
  plainText('PLAIN_TEXT'),
  textractDetectDocumentTextJson('TEXTRACT_DETECT_DOCUMENT_TEXT_JSON'),
  textractAnalyzeDocumentJson('TEXTRACT_ANALYZE_DOCUMENT_JSON'),
  ;

  final String value;

  const DocumentType(this.value);

  static DocumentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DocumentType'));
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
      type: (json['Type'] as String?)?.let(DocumentType.fromString),
    );
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
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
      if (status != null) 'Status': status.value,
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
      status: (json['Status'] as String?)?.let(EndpointStatus.fromString),
    );
  }
}

enum EndpointStatus {
  creating('CREATING'),
  deleting('DELETING'),
  failed('FAILED'),
  inService('IN_SERVICE'),
  updating('UPDATING'),
  ;

  final String value;

  const EndpointStatus(this.value);

  static EndpointStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EndpointStatus'));
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
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
          ?.nonNulls
          .map((e) => BlockReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      endOffset: json['EndOffset'] as int?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      type: (json['Type'] as String?)?.let(EntityType.fromString),
    );
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
      name: (json['Name'] as String?)?.let(PiiEntityType.fromString),
      score: json['Score'] as double?,
    );
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
          .nonNulls
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
  comprehendCsv('COMPREHEND_CSV'),
  augmentedManifest('AUGMENTED_MANIFEST'),
  ;

  final String value;

  const EntityRecognizerDataFormat(this.value);

  static EntityRecognizerDataFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EntityRecognizerDataFormat'));
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
      inputFormat:
          (json['InputFormat'] as String?)?.let(InputFormat.fromString),
      testS3Uri: json['TestS3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final inputFormat = this.inputFormat;
    final testS3Uri = this.testS3Uri;
    return {
      'S3Uri': s3Uri,
      if (inputFormat != null) 'InputFormat': inputFormat.value,
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
      if (status != null) 'Status': status.value,
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
          .nonNulls
          .map((e) => EntityTypesListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      annotations: json['Annotations'] != null
          ? EntityRecognizerAnnotations.fromJson(
              json['Annotations'] as Map<String, dynamic>)
          : null,
      augmentedManifests: (json['AugmentedManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              AugmentedManifestsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataFormat: (json['DataFormat'] as String?)
          ?.let(EntityRecognizerDataFormat.fromString),
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
      if (dataFormat != null) 'DataFormat': dataFormat.value,
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
          ?.nonNulls
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
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
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
      status: (json['Status'] as String?)?.let(ModelStatus.fromString),
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
          (json['LatestVersionStatus'] as String?)?.let(ModelStatus.fromString),
      numberOfVersions: json['NumberOfVersions'] as int?,
      recognizerName: json['RecognizerName'] as String?,
    );
  }
}

enum EntityType {
  person('PERSON'),
  location('LOCATION'),
  organization('ORGANIZATION'),
  commercialItem('COMMERCIAL_ITEM'),
  event('EVENT'),
  date('DATE'),
  quantity('QUANTITY'),
  title('TITLE'),
  other('OTHER'),
  ;

  final String value;

  const EntityType(this.value);

  static EntityType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EntityType'));
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
      errorCode:
          (json['ErrorCode'] as String?)?.let(PageBasedErrorCode.fromString),
      errorMessage: json['ErrorMessage'] as String?,
      page: json['Page'] as int?,
    );
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      message: json['Message'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
      targetEventTypes: (json['TargetEventTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
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
      if (status != null) 'Status': status.value,
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
      status:
          (json['Status'] as String?)?.let(FlywheelIterationStatus.fromString),
      trainedModelArn: json['TrainedModelArn'] as String?,
      trainedModelMetrics: json['TrainedModelMetrics'] != null
          ? FlywheelModelEvaluationMetrics.fromJson(
              json['TrainedModelMetrics'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum FlywheelIterationStatus {
  training('TRAINING'),
  evaluating('EVALUATING'),
  completed('COMPLETED'),
  failed('FAILED'),
  stopRequested('STOP_REQUESTED'),
  stopped('STOPPED'),
  ;

  final String value;

  const FlywheelIterationStatus(this.value);

  static FlywheelIterationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum FlywheelIterationStatus'));
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
      modelType: (json['ModelType'] as String?)?.let(ModelType.fromString),
      status: (json['Status'] as String?)?.let(FlywheelStatus.fromString),
      taskConfig: json['TaskConfig'] != null
          ? TaskConfig.fromJson(json['TaskConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum FlywheelStatus {
  creating('CREATING'),
  active('ACTIVE'),
  updating('UPDATING'),
  deleting('DELETING'),
  failed('FAILED'),
  ;

  final String value;

  const FlywheelStatus(this.value);

  static FlywheelStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum FlywheelStatus'));
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
      modelType: (json['ModelType'] as String?)?.let(ModelType.fromString),
      status: (json['Status'] as String?)?.let(FlywheelStatus.fromString),
    );
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
          ?.nonNulls
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
      inputFormat:
          (json['InputFormat'] as String?)?.let(InputFormat.fromString),
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
      if (inputFormat != null) 'InputFormat': inputFormat.value,
    };
  }
}

enum InputFormat {
  oneDocPerFile('ONE_DOC_PER_FILE'),
  oneDocPerLine('ONE_DOC_PER_LINE'),
  ;

  final String value;

  const InputFormat(this.value);

  static InputFormat fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum InputFormat'));
}

enum JobStatus {
  submitted('SUBMITTED'),
  inProgress('IN_PROGRESS'),
  completed('COMPLETED'),
  failed('FAILED'),
  stopRequested('STOP_REQUESTED'),
  stopped('STOPPED'),
  ;

  final String value;

  const JobStatus(this.value);

  static JobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum JobStatus'));
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
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
}

enum LanguageCode {
  en('en'),
  es('es'),
  fr('fr'),
  de('de'),
  it('it'),
  pt('pt'),
  ar('ar'),
  hi('hi'),
  ja('ja'),
  ko('ko'),
  zh('zh'),
  zhTw('zh-TW'),
  ;

  final String value;

  const LanguageCode(this.value);

  static LanguageCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LanguageCode'));
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
          ?.nonNulls
          .map((e) => DatasetProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) => DocumentClassificationJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) =>
                  DocumentClassifierSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) => DocumentClassifierProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) => DominantLanguageDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
          ?.nonNulls
          .map((e) => EndpointProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) => EntitiesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) =>
                  EntityRecognizerSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
          ?.nonNulls
          .map((e) =>
              EntityRecognizerProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) => EventsDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
          ?.nonNulls
          .map((e) =>
              FlywheelIterationProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
          ?.nonNulls
          .map((e) => FlywheelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) => KeyPhrasesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
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
              ?.nonNulls
              .map((e) => PiiEntitiesDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
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
              ?.nonNulls
              .map((e) => SentimentDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
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
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
              ?.nonNulls
              .map((e) => TargetedSentimentDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
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
              ?.nonNulls
              .map((e) => TopicsDetectionJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
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
      sentiment: (json['Sentiment'] as String?)?.let(SentimentType.fromString),
      sentimentScore: json['SentimentScore'] != null
          ? SentimentScore.fromJson(
              json['SentimentScore'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum ModelStatus {
  submitted('SUBMITTED'),
  training('TRAINING'),
  deleting('DELETING'),
  stopRequested('STOP_REQUESTED'),
  stopped('STOPPED'),
  inError('IN_ERROR'),
  trained('TRAINED'),
  trainedWithWarning('TRAINED_WITH_WARNING'),
  ;

  final String value;

  const ModelStatus(this.value);

  static ModelStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ModelStatus'));
}

enum ModelType {
  documentClassifier('DOCUMENT_CLASSIFIER'),
  entityRecognizer('ENTITY_RECOGNIZER'),
  ;

  final String value;

  const ModelType(this.value);

  static ModelType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ModelType'));
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
  textractBadPage('TEXTRACT_BAD_PAGE'),
  textractProvisionedThroughputExceeded(
      'TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED'),
  pageCharactersExceeded('PAGE_CHARACTERS_EXCEEDED'),
  pageSizeExceeded('PAGE_SIZE_EXCEEDED'),
  internalServerError('INTERNAL_SERVER_ERROR'),
  ;

  final String value;

  const PageBasedErrorCode(this.value);

  static PageBasedErrorCode fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PageBasedErrorCode'));
}

enum PageBasedWarningCode {
  inferencingPlaintextWithNativeTrainedModel(
      'INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL'),
  inferencingNativeDocumentWithPlaintextTrainedModel(
      'INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL'),
  ;

  final String value;

  const PageBasedWarningCode(this.value);

  static PageBasedWarningCode fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PageBasedWarningCode'));
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
      tag: (json['Tag'] as String?)?.let(PartOfSpeechTagType.fromString),
    );
  }
}

enum PartOfSpeechTagType {
  adj('ADJ'),
  adp('ADP'),
  adv('ADV'),
  aux('AUX'),
  conj('CONJ'),
  cconj('CCONJ'),
  det('DET'),
  intj('INTJ'),
  noun('NOUN'),
  num('NUM'),
  o('O'),
  part('PART'),
  pron('PRON'),
  propn('PROPN'),
  punct('PUNCT'),
  sconj('SCONJ'),
  sym('SYM'),
  verb('VERB'),
  ;

  final String value;

  const PartOfSpeechTagType(this.value);

  static PartOfSpeechTagType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PartOfSpeechTagType'));
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      message: json['Message'] as String?,
      mode: (json['Mode'] as String?)?.let(PiiEntitiesDetectionMode.fromString),
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
}

enum PiiEntitiesDetectionMaskMode {
  mask('MASK'),
  replaceWithPiiEntityType('REPLACE_WITH_PII_ENTITY_TYPE'),
  ;

  final String value;

  const PiiEntitiesDetectionMaskMode(this.value);

  static PiiEntitiesDetectionMaskMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PiiEntitiesDetectionMaskMode'));
}

enum PiiEntitiesDetectionMode {
  onlyRedaction('ONLY_REDACTION'),
  onlyOffsets('ONLY_OFFSETS'),
  ;

  final String value;

  const PiiEntitiesDetectionMode(this.value);

  static PiiEntitiesDetectionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PiiEntitiesDetectionMode'));
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
      type: (json['Type'] as String?)?.let(PiiEntityType.fromString),
    );
  }
}

enum PiiEntityType {
  bankAccountNumber('BANK_ACCOUNT_NUMBER'),
  bankRouting('BANK_ROUTING'),
  creditDebitNumber('CREDIT_DEBIT_NUMBER'),
  creditDebitCvv('CREDIT_DEBIT_CVV'),
  creditDebitExpiry('CREDIT_DEBIT_EXPIRY'),
  pin('PIN'),
  email('EMAIL'),
  address('ADDRESS'),
  name('NAME'),
  phone('PHONE'),
  ssn('SSN'),
  dateTime('DATE_TIME'),
  passportNumber('PASSPORT_NUMBER'),
  driverId('DRIVER_ID'),
  url('URL'),
  age('AGE'),
  username('USERNAME'),
  password('PASSWORD'),
  awsAccessKey('AWS_ACCESS_KEY'),
  awsSecretKey('AWS_SECRET_KEY'),
  ipAddress('IP_ADDRESS'),
  macAddress('MAC_ADDRESS'),
  all('ALL'),
  licensePlate('LICENSE_PLATE'),
  vehicleIdentificationNumber('VEHICLE_IDENTIFICATION_NUMBER'),
  ukNationalInsuranceNumber('UK_NATIONAL_INSURANCE_NUMBER'),
  caSocialInsuranceNumber('CA_SOCIAL_INSURANCE_NUMBER'),
  usIndividualTaxIdentificationNumber(
      'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER'),
  ukUniqueTaxpayerReferenceNumber('UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER'),
  inPermanentAccountNumber('IN_PERMANENT_ACCOUNT_NUMBER'),
  inNrega('IN_NREGA'),
  internationalBankAccountNumber('INTERNATIONAL_BANK_ACCOUNT_NUMBER'),
  swiftCode('SWIFT_CODE'),
  ukNationalHealthServiceNumber('UK_NATIONAL_HEALTH_SERVICE_NUMBER'),
  caHealthNumber('CA_HEALTH_NUMBER'),
  inAadhaar('IN_AADHAAR'),
  inVoterNumber('IN_VOTER_NUMBER'),
  ;

  final String value;

  const PiiEntityType(this.value);

  static PiiEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PiiEntityType'));
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
      maskMode: (json['MaskMode'] as String?)
          ?.let(PiiEntitiesDetectionMaskMode.fromString),
      piiEntityTypes: (json['PiiEntityTypes'] as List?)
          ?.nonNulls
          .map((e) => PiiEntityType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final maskCharacter = this.maskCharacter;
    final maskMode = this.maskMode;
    final piiEntityTypes = this.piiEntityTypes;
    return {
      if (maskCharacter != null) 'MaskCharacter': maskCharacter,
      if (maskMode != null) 'MaskMode': maskMode.value,
      if (piiEntityTypes != null)
        'PiiEntityTypes': piiEntityTypes.map((e) => e.value).toList(),
    };
  }
}

enum RelationshipType {
  child('CHILD'),
  ;

  final String value;

  const RelationshipType(this.value);

  static RelationshipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum RelationshipType'));
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
      ids: (json['Ids'] as List?)?.nonNulls.map((e) => e as String).toList(),
      type: (json['Type'] as String?)?.let(RelationshipType.fromString),
    );
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
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
}

enum SentimentType {
  positive('POSITIVE'),
  negative('NEGATIVE'),
  neutral('NEUTRAL'),
  mixed('MIXED'),
  ;

  final String value;

  const SentimentType(this.value);

  static SentimentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SentimentType'));
}

enum Split {
  train('TRAIN'),
  test('TEST'),
  ;

  final String value;

  const Split(this.value);

  static Split fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Split'));
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
    );
  }
}

class StopTrainingDocumentClassifierResponse {
  StopTrainingDocumentClassifierResponse();

  factory StopTrainingDocumentClassifierResponse.fromJson(
      Map<String, dynamic> _) {
    return StopTrainingDocumentClassifierResponse();
  }
}

class StopTrainingEntityRecognizerResponse {
  StopTrainingEntityRecognizerResponse();

  factory StopTrainingEntityRecognizerResponse.fromJson(
      Map<String, dynamic> _) {
    return StopTrainingEntityRecognizerResponse();
  }
}

enum SyntaxLanguageCode {
  en('en'),
  es('es'),
  fr('fr'),
  de('de'),
  it('it'),
  pt('pt'),
  ;

  final String value;

  const SyntaxLanguageCode(this.value);

  static SyntaxLanguageCode fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SyntaxLanguageCode'));
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
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
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      mentions: (json['Mentions'] as List?)
          ?.nonNulls
          .map((e) =>
              TargetedSentimentMention.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum TargetedSentimentEntityType {
  person('PERSON'),
  location('LOCATION'),
  organization('ORGANIZATION'),
  facility('FACILITY'),
  brand('BRAND'),
  commercialItem('COMMERCIAL_ITEM'),
  movie('MOVIE'),
  music('MUSIC'),
  book('BOOK'),
  software('SOFTWARE'),
  game('GAME'),
  personalTitle('PERSONAL_TITLE'),
  event('EVENT'),
  date('DATE'),
  quantity('QUANTITY'),
  attribute('ATTRIBUTE'),
  other('OTHER'),
  ;

  final String value;

  const TargetedSentimentEntityType(this.value);

  static TargetedSentimentEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum TargetedSentimentEntityType'));
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
      type: (json['Type'] as String?)
          ?.let(TargetedSentimentEntityType.fromString),
    );
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
      languageCode: LanguageCode.fromString((json['LanguageCode'] as String)),
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
      'LanguageCode': languageCode.value,
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
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
      name: (json['Name'] as String?)?.let(ToxicContentType.fromString),
      score: json['Score'] as double?,
    );
  }
}

enum ToxicContentType {
  graphic('GRAPHIC'),
  harassmentOrAbuse('HARASSMENT_OR_ABUSE'),
  hateSpeech('HATE_SPEECH'),
  insult('INSULT'),
  profanity('PROFANITY'),
  sexual('SEXUAL'),
  violenceOrThreat('VIOLENCE_OR_THREAT'),
  ;

  final String value;

  const ToxicContentType(this.value);

  static ToxicContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ToxicContentType'));
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
          ?.nonNulls
          .map((e) => ToxicContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      toxicity: json['Toxicity'] as double?,
    );
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
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
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnets:
          (json['Subnets'] as List).nonNulls.map((e) => e as String).toList(),
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
      warnCode:
          (json['WarnCode'] as String?)?.let(PageBasedWarningCode.fromString),
      warnMessage: json['WarnMessage'] as String?,
    );
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
