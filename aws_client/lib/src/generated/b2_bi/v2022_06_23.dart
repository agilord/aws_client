// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// This is the <i>Amazon Web Services B2B Data Interchange API Reference</i>.
/// It provides descriptions, API request parameters, and the XML response for
/// each of the B2BI API actions.
///
/// B2BI enables automated exchange of EDI (electronic data interchange) based
/// business-critical transactions at cloud scale, with elasticity and
/// pay-as-you-go pricing. Businesses use EDI documents to exchange
/// transactional data with trading partners, such as suppliers and end
/// customers, using standardized formats such as X12.
/// <note>
/// Rather than actually running a command, you can use the
/// <code>--generate-cli-skeleton</code> parameter with any API call to generate
/// and display a parameter template. You can then use the generated template to
/// customize and use as input on a later command. For details, see <a
/// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-skeleton.html#cli-usage-skeleton-generate">Generate
/// and use a parameter skeleton file</a>.
/// </note>
class B2Bi {
  final _s.JsonProtocol _protocol;
  B2Bi({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'b2bi',
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

  /// Amazon Web Services B2B Data Interchange uses a mapping template in
  /// JSONata or XSLT format to transform a customer input file into a JSON or
  /// XML file that can be converted to EDI.
  ///
  /// If you provide a sample EDI file with the same structure as the EDI files
  /// that you wish to generate, then the service can generate a mapping
  /// template. The starter template contains placeholder values which you can
  /// replace with JSONata or XSLT expressions to take data from your input file
  /// and insert it into the JSON or XML file that is used to generate the EDI.
  ///
  /// If you do not provide a sample EDI file, then the service can generate a
  /// mapping template based on the EDI settings in the
  /// <code>templateDetails</code> parameter.
  ///
  /// Currently, we only support generating a template that can generate the
  /// input to produce an Outbound X12 EDI file.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mappingType] :
  /// Specify the format for the mapping template: either JSONATA or XSLT.
  ///
  /// Parameter [templateDetails] :
  /// Describes the details needed for generating the template. Specify the X12
  /// transaction set and version for which the template is used: currently, we
  /// only support X12.
  ///
  /// Parameter [outputSampleLocation] :
  /// Specify the location of the sample EDI file that is used to generate the
  /// mapping template.
  Future<CreateStarterMappingTemplateResponse> createStarterMappingTemplate({
    required MappingType mappingType,
    required TemplateDetails templateDetails,
    S3Location? outputSampleLocation,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.CreateStarterMappingTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'mappingType': mappingType.value,
        'templateDetails': templateDetails,
        if (outputSampleLocation != null)
          'outputSampleLocation': outputSampleLocation,
      },
    );

    return CreateStarterMappingTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Takes sample input and output documents and uses Amazon Bedrock to
  /// generate a mapping automatically. Depending on the accuracy and other
  /// factors, you can then edit the mapping for your needs.
  /// <note>
  /// Before you can use the AI-assisted feature for Amazon Web Services B2B
  /// Data Interchange you must enable models in Amazon Bedrock. For details,
  /// see <a
  /// href="https://docs.aws.amazon.com/b2bi/latest/userguide/ai-assisted-mapping.html#ai-assist-prereq">AI-assisted
  /// template mapping prerequisites</a> in the <i>Amazon Web Services B2B Data
  /// Interchange User guide</i>.
  /// </note>
  /// To generate a mapping, perform the following steps:
  /// <ol>
  /// <li>
  /// Start with an X12 EDI document to use as the input.
  /// </li>
  /// <li>
  /// Call <code>TestMapping</code> using your EDI document.
  /// </li>
  /// <li>
  /// Use the output from the <code>TestMapping</code> operation as either input
  /// or output for your GenerateMapping call, along with your sample file.
  /// </li> </ol>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputFileContent] :
  /// Provide the contents of a sample X12 EDI file, either in JSON or XML
  /// format, to use as a starting point for the mapping.
  ///
  /// Parameter [mappingType] :
  /// Specify the mapping type: either <code>JSONATA</code> or
  /// <code>XSLT.</code>
  ///
  /// Parameter [outputFileContent] :
  /// Provide the contents of a sample X12 EDI file, either in JSON or XML
  /// format, to use as a target for the mapping.
  Future<GenerateMappingResponse> generateMapping({
    required String inputFileContent,
    required MappingType mappingType,
    required String outputFileContent,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.GenerateMapping'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'inputFileContent': inputFileContent,
        'mappingType': mappingType.value,
        'outputFileContent': outputFileContent,
      },
    );

    return GenerateMappingResponse.fromJson(jsonResponse.body);
  }

  /// Returns the details of the transformer run, based on the Transformer job
  /// ID.
  /// <note>
  /// If 30 days have elapsed since your transformer job was started, the system
  /// deletes it. So, if you run <code>GetTransformerJob</code> and supply a
  /// <code>transformerId</code> and <code>transformerJobId</code> for a job
  /// that was started more than 30 days previously, you receive a 404 response.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [transformerId] :
  /// Specifies the system-assigned unique identifier for the transformer.
  ///
  /// Parameter [transformerJobId] :
  /// Specifies the unique, system-generated identifier for a transformer run.
  Future<GetTransformerJobResponse> getTransformerJob({
    required String transformerId,
    required String transformerJobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.GetTransformerJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'transformerId': transformerId,
        'transformerJobId': transformerJobId,
      },
    );

    return GetTransformerJobResponse.fromJson(jsonResponse.body);
  }

  /// Lists all of the tags associated with the Amazon Resource Name (ARN) that
  /// you specify. The resource can be a capability, partnership, profile, or
  /// transformer.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// Requests the tags associated with a particular Amazon Resource Name (ARN).
  /// An ARN is an identifier for a specific Amazon Web Services resource, such
  /// as a capability, partnership, profile, or transformer.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Runs a job, using a transformer, to parse input EDI (electronic data
  /// interchange) file into the output structures used by Amazon Web Services
  /// B2B Data Interchange.
  ///
  /// If you only want to transform EDI (electronic data interchange) documents,
  /// you don't need to create profiles, partnerships or capabilities. Just
  /// create and configure a transformer, and then run the
  /// <code>StartTransformerJob</code> API to process your files.
  /// <note>
  /// The system stores transformer jobs for 30 days. During that period, you
  /// can run <a
  /// href="https://docs.aws.amazon.com/b2bi/latest/APIReference/API_GetTransformerJob.html">GetTransformerJob</a>
  /// and supply its <code>transformerId</code> and
  /// <code>transformerJobId</code> to return details of the job.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputFile] :
  /// Specifies the location of the input file for the transformation. The
  /// location consists of an Amazon S3 bucket and prefix.
  ///
  /// Parameter [outputLocation] :
  /// Specifies the location of the output file for the transformation. The
  /// location consists of an Amazon S3 bucket and prefix.
  ///
  /// Parameter [transformerId] :
  /// Specifies the system-assigned unique identifier for the transformer.
  ///
  /// Parameter [clientToken] :
  /// Reserved for future use.
  Future<StartTransformerJobResponse> startTransformerJob({
    required S3Location inputFile,
    required S3Location outputLocation,
    required String transformerId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.StartTransformerJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'inputFile': inputFile,
        'outputLocation': outputLocation,
        'transformerId': transformerId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return StartTransformerJobResponse.fromJson(jsonResponse.body);
  }

  /// Attaches a key-value pair to a resource, as identified by its Amazon
  /// Resource Name (ARN). Resources are capability, partnership, profile,
  /// transformers and other entities.
  ///
  /// There is no response returned from this call.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// Specifies an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  ///
  /// Parameter [tags] :
  /// Specifies the key-value pairs assigned to ARNs that you can use to group
  /// and search for resources by type. You can attach this metadata to
  /// resources (capabilities, partnerships, and so on) for any purpose.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// This operation mimics the latter half of a typical Outbound EDI request.
  /// It takes an input JSON/XML in the B2Bi shape as input, converts it to an
  /// X12 EDI string, and return that string.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [source] :
  /// Specify the source file for an outbound EDI request.
  ///
  /// Parameter [target] :
  /// Specify the format (X12 is the only currently supported format), and other
  /// details for the conversion target.
  Future<TestConversionResponse> testConversion({
    required ConversionSource source,
    required ConversionTarget target,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.TestConversion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'source': source,
        'target': target,
      },
    );

    return TestConversionResponse.fromJson(jsonResponse.body);
  }

  /// Maps the input file according to the provided template file. The API call
  /// downloads the file contents from the Amazon S3 location, and passes the
  /// contents in as a string, to the <code>inputFileContent</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileFormat] :
  /// Specifies that the currently supported file formats for EDI
  /// transformations are <code>JSON</code> and <code>XML</code>.
  ///
  /// Parameter [inputFileContent] :
  /// Specify the contents of the EDI (electronic data interchange) XML or JSON
  /// file that is used as input for the transform.
  ///
  /// Parameter [mappingTemplate] :
  /// Specifies the mapping template for the transformer. This template is used
  /// to map the parsed EDI file using JSONata or XSLT.
  /// <note>
  /// This parameter is available for backwards compatibility. Use the <a
  /// href="https://docs.aws.amazon.com/b2bi/latest/APIReference/API_Mapping.html">Mapping</a>
  /// data type instead.
  /// </note>
  Future<TestMappingResponse> testMapping({
    required FileFormat fileFormat,
    required String inputFileContent,
    required String mappingTemplate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.TestMapping'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fileFormat': fileFormat.value,
        'inputFileContent': inputFileContent,
        'mappingTemplate': mappingTemplate,
      },
    );

    return TestMappingResponse.fromJson(jsonResponse.body);
  }

  /// Parses the input EDI (electronic data interchange) file. The input file
  /// has a file size limit of 250 KB.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ediType] :
  /// Specifies the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards
  /// and corresponding messages that define specific business documents.
  ///
  /// Parameter [fileFormat] :
  /// Specifies that the currently supported file formats for EDI
  /// transformations are <code>JSON</code> and <code>XML</code>.
  ///
  /// Parameter [inputFile] :
  /// Specifies an <code>S3Location</code> object, which contains the Amazon S3
  /// bucket and prefix for the location of the input file.
  ///
  /// Parameter [advancedOptions] :
  /// Specifies advanced options for parsing the input EDI file. These options
  /// allow for more granular control over the parsing process, including split
  /// options for X12 files.
  Future<TestParsingResponse> testParsing({
    required EdiType ediType,
    required FileFormat fileFormat,
    required S3Location inputFile,
    AdvancedOptions? advancedOptions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.TestParsing'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ediType': ediType,
        'fileFormat': fileFormat.value,
        'inputFile': inputFile,
        if (advancedOptions != null) 'advancedOptions': advancedOptions,
      },
    );

    return TestParsingResponse.fromJson(jsonResponse.body);
  }

  /// Detaches a key-value pair from the specified resource, as identified by
  /// its Amazon Resource Name (ARN). Resources are capability, partnership,
  /// profile, transformers and other entities.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// Specifies an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  ///
  /// Parameter [tagKeys] :
  /// Specifies the key-value pairs assigned to ARNs that you can use to group
  /// and search for resources by type. You can attach this metadata to
  /// resources (capabilities, partnerships, and so on) for any purpose.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Instantiates a capability based on the specified parameters. A trading
  /// capability contains the information required to transform incoming EDI
  /// documents into JSON or XML outputs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// Specifies a structure that contains the details for a capability.
  ///
  /// Parameter [name] :
  /// Specifies the name of the capability, used to identify it.
  ///
  /// Parameter [type] :
  /// Specifies the type of the capability. Currently, only <code>edi</code> is
  /// supported.
  ///
  /// Parameter [clientToken] :
  /// Reserved for future use.
  ///
  /// Parameter [instructionsDocuments] :
  /// Specifies one or more locations in Amazon S3, each specifying an EDI
  /// document that can be used with this capability. Each item contains the
  /// name of the bucket and the key, to identify the document's location.
  ///
  /// Parameter [tags] :
  /// Specifies the key-value pairs assigned to ARNs that you can use to group
  /// and search for resources by type. You can attach this metadata to
  /// resources (capabilities, partnerships, and so on) for any purpose.
  Future<CreateCapabilityResponse> createCapability({
    required CapabilityConfiguration configuration,
    required String name,
    required CapabilityType type,
    String? clientToken,
    List<S3Location>? instructionsDocuments,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.CreateCapability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configuration': configuration,
        'name': name,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (instructionsDocuments != null)
          'instructionsDocuments': instructionsDocuments,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateCapabilityResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details for the specified capability. A trading capability
  /// contains the information required to transform incoming EDI documents into
  /// JSON or XML outputs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [capabilityId] :
  /// Specifies a system-assigned unique identifier for the capability.
  Future<GetCapabilityResponse> getCapability({
    required String capabilityId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.GetCapability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'capabilityId': capabilityId,
      },
    );

    return GetCapabilityResponse.fromJson(jsonResponse.body);
  }

  /// Updates some of the parameters for a capability, based on the specified
  /// parameters. A trading capability contains the information required to
  /// transform incoming EDI documents into JSON or XML outputs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [capabilityId] :
  /// Specifies a system-assigned unique identifier for the capability.
  ///
  /// Parameter [configuration] :
  /// Specifies a structure that contains the details for a capability.
  ///
  /// Parameter [instructionsDocuments] :
  /// Specifies one or more locations in Amazon S3, each specifying an EDI
  /// document that can be used with this capability. Each item contains the
  /// name of the bucket and the key, to identify the document's location.
  ///
  /// Parameter [name] :
  /// Specifies a new name for the capability, to replace the existing name.
  Future<UpdateCapabilityResponse> updateCapability({
    required String capabilityId,
    CapabilityConfiguration? configuration,
    List<S3Location>? instructionsDocuments,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.UpdateCapability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'capabilityId': capabilityId,
        if (configuration != null) 'configuration': configuration,
        if (instructionsDocuments != null)
          'instructionsDocuments': instructionsDocuments,
        if (name != null) 'name': name,
      },
    );

    return UpdateCapabilityResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified capability. A trading capability contains the
  /// information required to transform incoming EDI documents into JSON or XML
  /// outputs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [capabilityId] :
  /// Specifies a system-assigned unique identifier for the capability.
  Future<void> deleteCapability({
    required String capabilityId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.DeleteCapability'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'capabilityId': capabilityId,
      },
    );
  }

  /// Lists the capabilities associated with your Amazon Web Services account
  /// for your current or specified region. A trading capability contains the
  /// information required to transform incoming EDI documents into JSON or XML
  /// outputs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of capabilities to return.
  ///
  /// Parameter [nextToken] :
  /// When additional results are obtained from the command, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional resources.
  Future<ListCapabilitiesResponse> listCapabilities({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.ListCapabilities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListCapabilitiesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a partnership between a customer and a trading partner, based on
  /// the supplied parameters. A partnership represents the connection between
  /// you and your trading partner. It ties together a profile and one or more
  /// trading capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [capabilities] :
  /// Specifies a list of the capabilities associated with this partnership.
  ///
  /// Parameter [email] :
  /// Specifies the email address associated with this trading partner.
  ///
  /// Parameter [name] :
  /// Specifies a descriptive name for the partnership.
  ///
  /// Parameter [profileId] :
  /// Specifies the unique, system-generated identifier for the profile
  /// connected to this partnership.
  ///
  /// Parameter [capabilityOptions] :
  /// Specify the structure that contains the details for the associated
  /// capabilities.
  ///
  /// Parameter [clientToken] :
  /// Reserved for future use.
  ///
  /// Parameter [phone] :
  /// Specifies the phone number associated with the partnership.
  ///
  /// Parameter [tags] :
  /// Specifies the key-value pairs assigned to ARNs that you can use to group
  /// and search for resources by type. You can attach this metadata to
  /// resources (capabilities, partnerships, and so on) for any purpose.
  Future<CreatePartnershipResponse> createPartnership({
    required List<String> capabilities,
    required String email,
    required String name,
    required String profileId,
    CapabilityOptions? capabilityOptions,
    String? clientToken,
    String? phone,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.CreatePartnership'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'capabilities': capabilities,
        'email': email,
        'name': name,
        'profileId': profileId,
        if (capabilityOptions != null) 'capabilityOptions': capabilityOptions,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (phone != null) 'phone': phone,
        if (tags != null) 'tags': tags,
      },
    );

    return CreatePartnershipResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details for a partnership, based on the partner and profile
  /// IDs specified. A partnership represents the connection between you and
  /// your trading partner. It ties together a profile and one or more trading
  /// capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [partnershipId] :
  /// Specifies the unique, system-generated identifier for a partnership.
  Future<GetPartnershipResponse> getPartnership({
    required String partnershipId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.GetPartnership'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'partnershipId': partnershipId,
      },
    );

    return GetPartnershipResponse.fromJson(jsonResponse.body);
  }

  /// Updates some of the parameters for a partnership between a customer and
  /// trading partner. A partnership represents the connection between you and
  /// your trading partner. It ties together a profile and one or more trading
  /// capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [partnershipId] :
  /// Specifies the unique, system-generated identifier for a partnership.
  ///
  /// Parameter [capabilities] :
  /// List of the capabilities associated with this partnership.
  ///
  /// Parameter [capabilityOptions] :
  /// To update, specify the structure that contains the details for the
  /// associated capabilities.
  ///
  /// Parameter [name] :
  /// The name of the partnership, used to identify it.
  Future<UpdatePartnershipResponse> updatePartnership({
    required String partnershipId,
    List<String>? capabilities,
    CapabilityOptions? capabilityOptions,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.UpdatePartnership'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'partnershipId': partnershipId,
        if (capabilities != null) 'capabilities': capabilities,
        if (capabilityOptions != null) 'capabilityOptions': capabilityOptions,
        if (name != null) 'name': name,
      },
    );

    return UpdatePartnershipResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified partnership. A partnership represents the connection
  /// between you and your trading partner. It ties together a profile and one
  /// or more trading capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [partnershipId] :
  /// Specifies the unique, system-generated identifier for a partnership.
  Future<void> deletePartnership({
    required String partnershipId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.DeletePartnership'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'partnershipId': partnershipId,
      },
    );
  }

  /// Lists the partnerships associated with your Amazon Web Services account
  /// for your current or specified region. A partnership represents the
  /// connection between you and your trading partner. It ties together a
  /// profile and one or more trading capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of capabilities to return.
  ///
  /// Parameter [nextToken] :
  /// When additional results are obtained from the command, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional resources.
  ///
  /// Parameter [profileId] :
  /// Specifies the unique, system-generated identifier for the profile
  /// connected to this partnership.
  Future<ListPartnershipsResponse> listPartnerships({
    int? maxResults,
    String? nextToken,
    String? profileId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.ListPartnerships'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (profileId != null) 'profileId': profileId,
      },
    );

    return ListPartnershipsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a customer profile. You can have up to five customer profiles,
  /// each representing a distinct private network. A profile is the mechanism
  /// used to create the concept of a private network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [businessName] :
  /// Specifies the name for the business associated with this profile.
  ///
  /// Parameter [logging] :
  /// Specifies whether or not logging is enabled for this profile.
  ///
  /// Parameter [name] :
  /// Specifies the name of the profile.
  ///
  /// Parameter [phone] :
  /// Specifies the phone number associated with the profile.
  ///
  /// Parameter [clientToken] :
  /// Reserved for future use.
  ///
  /// Parameter [email] :
  /// Specifies the email address associated with this customer profile.
  ///
  /// Parameter [tags] :
  /// Specifies the key-value pairs assigned to ARNs that you can use to group
  /// and search for resources by type. You can attach this metadata to
  /// resources (capabilities, partnerships, and so on) for any purpose.
  Future<CreateProfileResponse> createProfile({
    required String businessName,
    required Logging logging,
    required String name,
    required String phone,
    String? clientToken,
    String? email,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.CreateProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'businessName': businessName,
        'logging': logging.value,
        'name': name,
        'phone': phone,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (email != null) 'email': email,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateProfileResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details for the profile specified by the profile ID. A
  /// profile is the mechanism used to create the concept of a private network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileId] :
  /// Specifies the unique, system-generated identifier for the profile.
  Future<GetProfileResponse> getProfile({
    required String profileId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.GetProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'profileId': profileId,
      },
    );

    return GetProfileResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified parameters for a profile. A profile is the mechanism
  /// used to create the concept of a private network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileId] :
  /// Specifies the unique, system-generated identifier for the profile.
  ///
  /// Parameter [businessName] :
  /// Specifies the name for the business associated with this profile.
  ///
  /// Parameter [email] :
  /// Specifies the email address associated with this customer profile.
  ///
  /// Parameter [name] :
  /// The name of the profile, used to identify it.
  ///
  /// Parameter [phone] :
  /// Specifies the phone number associated with the profile.
  Future<UpdateProfileResponse> updateProfile({
    required String profileId,
    String? businessName,
    String? email,
    String? name,
    String? phone,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.UpdateProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'profileId': profileId,
        if (businessName != null) 'businessName': businessName,
        if (email != null) 'email': email,
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
      },
    );

    return UpdateProfileResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified profile. A profile is the mechanism used to create
  /// the concept of a private network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileId] :
  /// Specifies the unique, system-generated identifier for the profile.
  Future<void> deleteProfile({
    required String profileId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.DeleteProfile'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'profileId': profileId,
      },
    );
  }

  /// Lists the profiles associated with your Amazon Web Services account for
  /// your current or specified region. A profile is the mechanism used to
  /// create the concept of a private network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of profiles to return.
  ///
  /// Parameter [nextToken] :
  /// When additional results are obtained from the command, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional resources.
  Future<ListProfilesResponse> listProfiles({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.ListProfiles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListProfilesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a transformer. Amazon Web Services B2B Data Interchange currently
  /// supports two scenarios:
  ///
  /// <ul>
  /// <li>
  /// <i>Inbound EDI</i>: the Amazon Web Services customer receives an EDI file
  /// from their trading partner. Amazon Web Services B2B Data Interchange
  /// converts this EDI file into a JSON or XML file with a service-defined
  /// structure. A mapping template provided by the customer, in JSONata or XSLT
  /// format, is optionally applied to this file to produce a JSON or XML file
  /// with the structure the customer requires.
  /// </li>
  /// <li>
  /// <i>Outbound EDI</i>: the Amazon Web Services customer has a JSON or XML
  /// file containing data that they wish to use in an EDI file. A mapping
  /// template, provided by the customer (in either JSONata or XSLT format) is
  /// applied to this file to generate a JSON or XML file in the service-defined
  /// structure. This file is then converted to an EDI file.
  /// </li>
  /// </ul> <note>
  /// The following fields are provided for backwards compatibility only:
  /// <code>fileFormat</code>, <code>mappingTemplate</code>,
  /// <code>ediType</code>, and <code>sampleDocument</code>.
  ///
  /// <ul>
  /// <li>
  /// Use the <code>mapping</code> data type in place of
  /// <code>mappingTemplate</code> and <code>fileFormat</code>
  /// </li>
  /// <li>
  /// Use the <code>sampleDocuments</code> data type in place of
  /// <code>sampleDocument</code>
  /// </li>
  /// <li>
  /// Use either the <code>inputConversion</code> or
  /// <code>outputConversion</code> in place of <code>ediType</code>
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// Specifies the name of the transformer, used to identify it.
  ///
  /// Parameter [clientToken] :
  /// Reserved for future use.
  ///
  /// Parameter [ediType] :
  /// Specifies the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards
  /// and corresponding messages that define specific business documents.
  ///
  /// Parameter [fileFormat] :
  /// Specifies that the currently supported file formats for EDI
  /// transformations are <code>JSON</code> and <code>XML</code>.
  ///
  /// Parameter [inputConversion] :
  /// Specify the <code>InputConversion</code> object, which contains the format
  /// options for the inbound transformation.
  ///
  /// Parameter [mapping] :
  /// Specify the structure that contains the mapping template and its language
  /// (either XSLT or JSONATA).
  ///
  /// Parameter [mappingTemplate] :
  /// Specifies the mapping template for the transformer. This template is used
  /// to map the parsed EDI file using JSONata or XSLT.
  /// <note>
  /// This parameter is available for backwards compatibility. Use the <a
  /// href="https://docs.aws.amazon.com/b2bi/latest/APIReference/API_Mapping.html">Mapping</a>
  /// data type instead.
  /// </note>
  ///
  /// Parameter [outputConversion] :
  /// A structure that contains the <code>OutputConversion</code> object, which
  /// contains the format options for the outbound transformation.
  ///
  /// Parameter [sampleDocument] :
  /// Specifies a sample EDI document that is used by a transformer as a guide
  /// for processing the EDI data.
  ///
  /// Parameter [sampleDocuments] :
  /// Specify a structure that contains the Amazon S3 bucket and an array of the
  /// corresponding keys used to identify the location for your sample
  /// documents.
  ///
  /// Parameter [tags] :
  /// Specifies the key-value pairs assigned to ARNs that you can use to group
  /// and search for resources by type. You can attach this metadata to
  /// resources (capabilities, partnerships, and so on) for any purpose.
  Future<CreateTransformerResponse> createTransformer({
    required String name,
    String? clientToken,
    EdiType? ediType,
    FileFormat? fileFormat,
    InputConversion? inputConversion,
    Mapping? mapping,
    String? mappingTemplate,
    OutputConversion? outputConversion,
    String? sampleDocument,
    SampleDocuments? sampleDocuments,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.CreateTransformer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (ediType != null) 'ediType': ediType,
        if (fileFormat != null) 'fileFormat': fileFormat.value,
        if (inputConversion != null) 'inputConversion': inputConversion,
        if (mapping != null) 'mapping': mapping,
        if (mappingTemplate != null) 'mappingTemplate': mappingTemplate,
        if (outputConversion != null) 'outputConversion': outputConversion,
        if (sampleDocument != null) 'sampleDocument': sampleDocument,
        if (sampleDocuments != null) 'sampleDocuments': sampleDocuments,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateTransformerResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details for the transformer specified by the transformer ID.
  /// A transformer can take an EDI file as input and transform it into a
  /// JSON-or XML-formatted document. Alternatively, a transformer can take a
  /// JSON-or XML-formatted document as input and transform it into an EDI file.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [transformerId] :
  /// Specifies the system-assigned unique identifier for the transformer.
  Future<GetTransformerResponse> getTransformer({
    required String transformerId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.GetTransformer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'transformerId': transformerId,
      },
    );

    return GetTransformerResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified parameters for a transformer. A transformer can take
  /// an EDI file as input and transform it into a JSON-or XML-formatted
  /// document. Alternatively, a transformer can take a JSON-or XML-formatted
  /// document as input and transform it into an EDI file.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [transformerId] :
  /// Specifies the system-assigned unique identifier for the transformer.
  ///
  /// Parameter [ediType] :
  /// Specifies the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards
  /// and corresponding messages that define specific business documents.
  ///
  /// Parameter [fileFormat] :
  /// Specifies that the currently supported file formats for EDI
  /// transformations are <code>JSON</code> and <code>XML</code>.
  ///
  /// Parameter [inputConversion] :
  /// To update, specify the <code>InputConversion</code> object, which contains
  /// the format options for the inbound transformation.
  ///
  /// Parameter [mapping] :
  /// Specify the structure that contains the mapping template and its language
  /// (either XSLT or JSONATA).
  ///
  /// Parameter [mappingTemplate] :
  /// Specifies the mapping template for the transformer. This template is used
  /// to map the parsed EDI file using JSONata or XSLT.
  /// <note>
  /// This parameter is available for backwards compatibility. Use the <a
  /// href="https://docs.aws.amazon.com/b2bi/latest/APIReference/API_Mapping.html">Mapping</a>
  /// data type instead.
  /// </note>
  ///
  /// Parameter [name] :
  /// Specify a new name for the transformer, if you want to update it.
  ///
  /// Parameter [outputConversion] :
  /// To update, specify the <code>OutputConversion</code> object, which
  /// contains the format options for the outbound transformation.
  ///
  /// Parameter [sampleDocument] :
  /// Specifies a sample EDI document that is used by a transformer as a guide
  /// for processing the EDI data.
  ///
  /// Parameter [sampleDocuments] :
  /// Specify a structure that contains the Amazon S3 bucket and an array of the
  /// corresponding keys used to identify the location for your sample
  /// documents.
  ///
  /// Parameter [status] :
  /// Specifies the transformer's status. You can update the state of the
  /// transformer from <code>inactive</code> to <code>active</code>.
  Future<UpdateTransformerResponse> updateTransformer({
    required String transformerId,
    EdiType? ediType,
    FileFormat? fileFormat,
    InputConversion? inputConversion,
    Mapping? mapping,
    String? mappingTemplate,
    String? name,
    OutputConversion? outputConversion,
    String? sampleDocument,
    SampleDocuments? sampleDocuments,
    TransformerStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.UpdateTransformer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'transformerId': transformerId,
        if (ediType != null) 'ediType': ediType,
        if (fileFormat != null) 'fileFormat': fileFormat.value,
        if (inputConversion != null) 'inputConversion': inputConversion,
        if (mapping != null) 'mapping': mapping,
        if (mappingTemplate != null) 'mappingTemplate': mappingTemplate,
        if (name != null) 'name': name,
        if (outputConversion != null) 'outputConversion': outputConversion,
        if (sampleDocument != null) 'sampleDocument': sampleDocument,
        if (sampleDocuments != null) 'sampleDocuments': sampleDocuments,
        if (status != null) 'status': status.value,
      },
    );

    return UpdateTransformerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified transformer. A transformer can take an EDI file as
  /// input and transform it into a JSON-or XML-formatted document.
  /// Alternatively, a transformer can take a JSON-or XML-formatted document as
  /// input and transform it into an EDI file.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [transformerId] :
  /// Specifies the system-assigned unique identifier for the transformer.
  Future<void> deleteTransformer({
    required String transformerId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.DeleteTransformer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'transformerId': transformerId,
      },
    );
  }

  /// Lists the available transformers. A transformer can take an EDI file as
  /// input and transform it into a JSON-or XML-formatted document.
  /// Alternatively, a transformer can take a JSON-or XML-formatted document as
  /// input and transform it into an EDI file.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of items to return for the API response.
  ///
  /// Parameter [nextToken] :
  /// When additional results are obtained from the command, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional resources.
  Future<ListTransformersResponse> listTransformers({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'B2BI.ListTransformers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTransformersResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class CreateStarterMappingTemplateResponse {
  /// Returns a string that represents the mapping template.
  final String mappingTemplate;

  CreateStarterMappingTemplateResponse({
    required this.mappingTemplate,
  });

  factory CreateStarterMappingTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateStarterMappingTemplateResponse(
      mappingTemplate: (json['mappingTemplate'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final mappingTemplate = this.mappingTemplate;
    return {
      'mappingTemplate': mappingTemplate,
    };
  }
}

/// @nodoc
class GenerateMappingResponse {
  /// Returns a mapping template based on your inputs.
  final String mappingTemplate;

  /// Returns a percentage that estimates the accuracy of the generated mapping.
  final double? mappingAccuracy;

  GenerateMappingResponse({
    required this.mappingTemplate,
    this.mappingAccuracy,
  });

  factory GenerateMappingResponse.fromJson(Map<String, dynamic> json) {
    return GenerateMappingResponse(
      mappingTemplate: (json['mappingTemplate'] as String?) ?? '',
      mappingAccuracy: json['mappingAccuracy'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final mappingTemplate = this.mappingTemplate;
    final mappingAccuracy = this.mappingAccuracy;
    return {
      'mappingTemplate': mappingTemplate,
      if (mappingAccuracy != null) 'mappingAccuracy': mappingAccuracy,
    };
  }
}

/// @nodoc
class GetTransformerJobResponse {
  /// Returns the current state of the transformer job, either
  /// <code>running</code>, <code>succeeded</code>, or <code>failed</code>.
  final TransformerJobStatus status;

  /// Returns an optional error message, which gets populated when the job is not
  /// run successfully.
  final String? message;

  /// Returns the location for the output files. If the caller specified a
  /// directory for the output, then this contains the full path to the output
  /// file, including the file name generated by the service.
  final List<S3Location>? outputFiles;

  GetTransformerJobResponse({
    required this.status,
    this.message,
    this.outputFiles,
  });

  factory GetTransformerJobResponse.fromJson(Map<String, dynamic> json) {
    return GetTransformerJobResponse(
      status:
          TransformerJobStatus.fromString((json['status'] as String?) ?? ''),
      message: json['message'] as String?,
      outputFiles: (json['outputFiles'] as List?)
          ?.nonNulls
          .map((e) => S3Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final message = this.message;
    final outputFiles = this.outputFiles;
    return {
      'status': status.value,
      if (message != null) 'message': message,
      if (outputFiles != null) 'outputFiles': outputFiles,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Returns the key-value pairs assigned to ARNs that you can use to group and
  /// search for resources by type. You can attach this metadata to resources
  /// (capabilities, partnerships, and so on) for any purpose.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class StartTransformerJobResponse {
  /// Returns the unique, system-generated identifier for a transformer run.
  final String transformerJobId;

  StartTransformerJobResponse({
    required this.transformerJobId,
  });

  factory StartTransformerJobResponse.fromJson(Map<String, dynamic> json) {
    return StartTransformerJobResponse(
      transformerJobId: (json['transformerJobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final transformerJobId = this.transformerJobId;
    return {
      'transformerJobId': transformerJobId,
    };
  }
}

/// @nodoc
class TestConversionResponse {
  /// Returns the converted file content.
  final String convertedFileContent;

  /// Returns an array of validation messages that Amazon Web Services B2B Data
  /// Interchange generates during the conversion process. These messages include
  /// both standard EDI validation results and custom validation messages when
  /// custom validation rules are configured. Custom validation messages provide
  /// detailed feedback on element length constraints, code list validations, and
  /// element requirement checks applied during the outbound EDI generation
  /// process.
  final List<String>? validationMessages;

  TestConversionResponse({
    required this.convertedFileContent,
    this.validationMessages,
  });

  factory TestConversionResponse.fromJson(Map<String, dynamic> json) {
    return TestConversionResponse(
      convertedFileContent: (json['convertedFileContent'] as String?) ?? '',
      validationMessages: (json['validationMessages'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final convertedFileContent = this.convertedFileContent;
    final validationMessages = this.validationMessages;
    return {
      'convertedFileContent': convertedFileContent,
      if (validationMessages != null) 'validationMessages': validationMessages,
    };
  }
}

/// @nodoc
class TestMappingResponse {
  /// Returns a string for the mapping that can be used to identify the mapping.
  /// Similar to a fingerprint
  final String mappedFileContent;

  TestMappingResponse({
    required this.mappedFileContent,
  });

  factory TestMappingResponse.fromJson(Map<String, dynamic> json) {
    return TestMappingResponse(
      mappedFileContent: (json['mappedFileContent'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final mappedFileContent = this.mappedFileContent;
    return {
      'mappedFileContent': mappedFileContent,
    };
  }
}

/// @nodoc
class TestParsingResponse {
  /// Returns the contents of the input file being tested, parsed according to the
  /// specified EDI (electronic data interchange) type.
  final String parsedFileContent;

  /// Returns an array of parsed file contents when the input file is split
  /// according to the specified split options. Each element in the array
  /// represents a separate split file's parsed content.
  final List<String>? parsedSplitFileContents;

  /// Returns an array of validation messages generated during EDI validation.
  /// These messages provide detailed information about validation errors,
  /// warnings, or confirmations based on the configured X12 validation rules such
  /// as element length constraints, code list validations, and element
  /// requirement checks. This field is populated when the
  /// <code>TestParsing</code> API validates EDI documents.
  final List<String>? validationMessages;

  TestParsingResponse({
    required this.parsedFileContent,
    this.parsedSplitFileContents,
    this.validationMessages,
  });

  factory TestParsingResponse.fromJson(Map<String, dynamic> json) {
    return TestParsingResponse(
      parsedFileContent: (json['parsedFileContent'] as String?) ?? '',
      parsedSplitFileContents: (json['parsedSplitFileContents'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      validationMessages: (json['validationMessages'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final parsedFileContent = this.parsedFileContent;
    final parsedSplitFileContents = this.parsedSplitFileContents;
    final validationMessages = this.validationMessages;
    return {
      'parsedFileContent': parsedFileContent,
      if (parsedSplitFileContents != null)
        'parsedSplitFileContents': parsedSplitFileContents,
      if (validationMessages != null) 'validationMessages': validationMessages,
    };
  }
}

/// @nodoc
class CreateCapabilityResponse {
  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String capabilityArn;

  /// Returns a system-assigned unique identifier for the capability.
  final String capabilityId;

  /// Returns a structure that contains the details for a capability.
  final CapabilityConfiguration configuration;

  /// Returns a timestamp for creation date and time of the capability.
  final DateTime createdAt;

  /// Returns the name of the capability used to identify it.
  final String name;

  /// Returns the type of the capability. Currently, only <code>edi</code> is
  /// supported.
  final CapabilityType type;

  /// Returns one or more locations in Amazon S3, each specifying an EDI document
  /// that can be used with this capability. Each item contains the name of the
  /// bucket and the key, to identify the document's location.
  final List<S3Location>? instructionsDocuments;

  CreateCapabilityResponse({
    required this.capabilityArn,
    required this.capabilityId,
    required this.configuration,
    required this.createdAt,
    required this.name,
    required this.type,
    this.instructionsDocuments,
  });

  factory CreateCapabilityResponse.fromJson(Map<String, dynamic> json) {
    return CreateCapabilityResponse(
      capabilityArn: (json['capabilityArn'] as String?) ?? '',
      capabilityId: (json['capabilityId'] as String?) ?? '',
      configuration: CapabilityConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      type: CapabilityType.fromString((json['type'] as String?) ?? ''),
      instructionsDocuments: (json['instructionsDocuments'] as List?)
          ?.nonNulls
          .map((e) => S3Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilityArn = this.capabilityArn;
    final capabilityId = this.capabilityId;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final name = this.name;
    final type = this.type;
    final instructionsDocuments = this.instructionsDocuments;
    return {
      'capabilityArn': capabilityArn,
      'capabilityId': capabilityId,
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'type': type.value,
      if (instructionsDocuments != null)
        'instructionsDocuments': instructionsDocuments,
    };
  }
}

/// @nodoc
class GetCapabilityResponse {
  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String capabilityArn;

  /// Returns a system-assigned unique identifier for the capability.
  final String capabilityId;

  /// Returns a structure that contains the details for a capability.
  final CapabilityConfiguration configuration;

  /// Returns a timestamp for creation date and time of the capability.
  final DateTime createdAt;

  /// Returns the name of the capability, used to identify it.
  final String name;

  /// Returns the type of the capability. Currently, only <code>edi</code> is
  /// supported.
  final CapabilityType type;

  /// Returns one or more locations in Amazon S3, each specifying an EDI document
  /// that can be used with this capability. Each item contains the name of the
  /// bucket and the key, to identify the document's location.
  final List<S3Location>? instructionsDocuments;

  /// Returns a timestamp for last time the capability was modified.
  final DateTime? modifiedAt;

  GetCapabilityResponse({
    required this.capabilityArn,
    required this.capabilityId,
    required this.configuration,
    required this.createdAt,
    required this.name,
    required this.type,
    this.instructionsDocuments,
    this.modifiedAt,
  });

  factory GetCapabilityResponse.fromJson(Map<String, dynamic> json) {
    return GetCapabilityResponse(
      capabilityArn: (json['capabilityArn'] as String?) ?? '',
      capabilityId: (json['capabilityId'] as String?) ?? '',
      configuration: CapabilityConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      type: CapabilityType.fromString((json['type'] as String?) ?? ''),
      instructionsDocuments: (json['instructionsDocuments'] as List?)
          ?.nonNulls
          .map((e) => S3Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilityArn = this.capabilityArn;
    final capabilityId = this.capabilityId;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final name = this.name;
    final type = this.type;
    final instructionsDocuments = this.instructionsDocuments;
    final modifiedAt = this.modifiedAt;
    return {
      'capabilityArn': capabilityArn,
      'capabilityId': capabilityId,
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'type': type.value,
      if (instructionsDocuments != null)
        'instructionsDocuments': instructionsDocuments,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// @nodoc
class UpdateCapabilityResponse {
  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String capabilityArn;

  /// Returns a system-assigned unique identifier for the capability.
  final String capabilityId;

  /// Returns a structure that contains the details for a capability.
  final CapabilityConfiguration configuration;

  /// Returns a timestamp for creation date and time of the capability.
  final DateTime createdAt;

  /// Returns the name of the capability, used to identify it.
  final String name;

  /// Returns the type of the capability. Currently, only <code>edi</code> is
  /// supported.
  final CapabilityType type;

  /// Returns one or more locations in Amazon S3, each specifying an EDI document
  /// that can be used with this capability. Each item contains the name of the
  /// bucket and the key, to identify the document's location.
  final List<S3Location>? instructionsDocuments;

  /// Returns a timestamp for last time the capability was modified.
  final DateTime? modifiedAt;

  UpdateCapabilityResponse({
    required this.capabilityArn,
    required this.capabilityId,
    required this.configuration,
    required this.createdAt,
    required this.name,
    required this.type,
    this.instructionsDocuments,
    this.modifiedAt,
  });

  factory UpdateCapabilityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCapabilityResponse(
      capabilityArn: (json['capabilityArn'] as String?) ?? '',
      capabilityId: (json['capabilityId'] as String?) ?? '',
      configuration: CapabilityConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      type: CapabilityType.fromString((json['type'] as String?) ?? ''),
      instructionsDocuments: (json['instructionsDocuments'] as List?)
          ?.nonNulls
          .map((e) => S3Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilityArn = this.capabilityArn;
    final capabilityId = this.capabilityId;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final name = this.name;
    final type = this.type;
    final instructionsDocuments = this.instructionsDocuments;
    final modifiedAt = this.modifiedAt;
    return {
      'capabilityArn': capabilityArn,
      'capabilityId': capabilityId,
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'type': type.value,
      if (instructionsDocuments != null)
        'instructionsDocuments': instructionsDocuments,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// @nodoc
class ListCapabilitiesResponse {
  /// Returns one or more capabilities associated with this partnership.
  final List<CapabilitySummary> capabilities;

  /// When additional results are obtained from the command, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional resources.
  final String? nextToken;

  ListCapabilitiesResponse({
    required this.capabilities,
    this.nextToken,
  });

  factory ListCapabilitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListCapabilitiesResponse(
      capabilities: ((json['capabilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => CapabilitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final nextToken = this.nextToken;
    return {
      'capabilities': capabilities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreatePartnershipResponse {
  /// Returns a timestamp for creation date and time of the partnership.
  final DateTime createdAt;

  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String partnershipArn;

  /// Returns the unique, system-generated identifier for a partnership.
  final String partnershipId;

  /// Returns the unique, system-generated identifier for the profile connected to
  /// this partnership.
  final String profileId;

  /// Returns one or more capabilities associated with this partnership.
  final List<String>? capabilities;

  /// Returns the structure that contains the details for the associated
  /// capabilities.
  final CapabilityOptions? capabilityOptions;

  /// Returns the email address associated with this trading partner.
  final String? email;

  /// Returns a descriptive name for the partnership.
  final String? name;

  /// Returns the phone number associated with the partnership.
  final String? phone;

  /// Returns the unique, system-generated identifier for a trading partner.
  final String? tradingPartnerId;

  CreatePartnershipResponse({
    required this.createdAt,
    required this.partnershipArn,
    required this.partnershipId,
    required this.profileId,
    this.capabilities,
    this.capabilityOptions,
    this.email,
    this.name,
    this.phone,
    this.tradingPartnerId,
  });

  factory CreatePartnershipResponse.fromJson(Map<String, dynamic> json) {
    return CreatePartnershipResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      partnershipArn: (json['partnershipArn'] as String?) ?? '',
      partnershipId: (json['partnershipId'] as String?) ?? '',
      profileId: (json['profileId'] as String?) ?? '',
      capabilities: (json['capabilities'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      capabilityOptions: json['capabilityOptions'] != null
          ? CapabilityOptions.fromJson(
              json['capabilityOptions'] as Map<String, dynamic>)
          : null,
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      tradingPartnerId: json['tradingPartnerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final partnershipArn = this.partnershipArn;
    final partnershipId = this.partnershipId;
    final profileId = this.profileId;
    final capabilities = this.capabilities;
    final capabilityOptions = this.capabilityOptions;
    final email = this.email;
    final name = this.name;
    final phone = this.phone;
    final tradingPartnerId = this.tradingPartnerId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'partnershipArn': partnershipArn,
      'partnershipId': partnershipId,
      'profileId': profileId,
      if (capabilities != null) 'capabilities': capabilities,
      if (capabilityOptions != null) 'capabilityOptions': capabilityOptions,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (tradingPartnerId != null) 'tradingPartnerId': tradingPartnerId,
    };
  }
}

/// @nodoc
class GetPartnershipResponse {
  /// Returns a timestamp for creation date and time of the partnership.
  final DateTime createdAt;

  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String partnershipArn;

  /// Returns the unique, system-generated identifier for a partnership.
  final String partnershipId;

  /// Returns the unique, system-generated identifier for the profile connected to
  /// this partnership.
  final String profileId;

  /// Returns one or more capabilities associated with this partnership.
  final List<String>? capabilities;
  final CapabilityOptions? capabilityOptions;

  /// Returns the email address associated with this trading partner.
  final String? email;

  /// Returns a timestamp that identifies the most recent date and time that the
  /// partnership was modified.
  final DateTime? modifiedAt;

  /// Returns the display name of the partnership
  final String? name;

  /// Returns the phone number associated with the partnership.
  final String? phone;

  /// Returns the unique identifier for the partner for this partnership.
  final String? tradingPartnerId;

  GetPartnershipResponse({
    required this.createdAt,
    required this.partnershipArn,
    required this.partnershipId,
    required this.profileId,
    this.capabilities,
    this.capabilityOptions,
    this.email,
    this.modifiedAt,
    this.name,
    this.phone,
    this.tradingPartnerId,
  });

  factory GetPartnershipResponse.fromJson(Map<String, dynamic> json) {
    return GetPartnershipResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      partnershipArn: (json['partnershipArn'] as String?) ?? '',
      partnershipId: (json['partnershipId'] as String?) ?? '',
      profileId: (json['profileId'] as String?) ?? '',
      capabilities: (json['capabilities'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      capabilityOptions: json['capabilityOptions'] != null
          ? CapabilityOptions.fromJson(
              json['capabilityOptions'] as Map<String, dynamic>)
          : null,
      email: json['email'] as String?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      tradingPartnerId: json['tradingPartnerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final partnershipArn = this.partnershipArn;
    final partnershipId = this.partnershipId;
    final profileId = this.profileId;
    final capabilities = this.capabilities;
    final capabilityOptions = this.capabilityOptions;
    final email = this.email;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final phone = this.phone;
    final tradingPartnerId = this.tradingPartnerId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'partnershipArn': partnershipArn,
      'partnershipId': partnershipId,
      'profileId': profileId,
      if (capabilities != null) 'capabilities': capabilities,
      if (capabilityOptions != null) 'capabilityOptions': capabilityOptions,
      if (email != null) 'email': email,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (tradingPartnerId != null) 'tradingPartnerId': tradingPartnerId,
    };
  }
}

/// @nodoc
class UpdatePartnershipResponse {
  /// Returns a timestamp that identifies the most recent date and time that the
  /// partnership was modified.
  final DateTime createdAt;

  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String partnershipArn;

  /// Returns the unique, system-generated identifier for a partnership.
  final String partnershipId;

  /// Returns the unique, system-generated identifier for the profile connected to
  /// this partnership.
  final String profileId;

  /// Returns one or more capabilities associated with this partnership.
  final List<String>? capabilities;

  /// Returns the structure that contains the details for the associated
  /// capabilities.
  final CapabilityOptions? capabilityOptions;

  /// Returns the email address associated with this trading partner.
  final String? email;

  /// Returns a timestamp that identifies the most recent date and time that the
  /// partnership was modified.
  final DateTime? modifiedAt;

  /// The name of the partnership, used to identify it.
  final String? name;

  /// Returns the phone number associated with the partnership.
  final String? phone;

  /// Returns the unique, system-generated identifier for a trading partner.
  final String? tradingPartnerId;

  UpdatePartnershipResponse({
    required this.createdAt,
    required this.partnershipArn,
    required this.partnershipId,
    required this.profileId,
    this.capabilities,
    this.capabilityOptions,
    this.email,
    this.modifiedAt,
    this.name,
    this.phone,
    this.tradingPartnerId,
  });

  factory UpdatePartnershipResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePartnershipResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      partnershipArn: (json['partnershipArn'] as String?) ?? '',
      partnershipId: (json['partnershipId'] as String?) ?? '',
      profileId: (json['profileId'] as String?) ?? '',
      capabilities: (json['capabilities'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      capabilityOptions: json['capabilityOptions'] != null
          ? CapabilityOptions.fromJson(
              json['capabilityOptions'] as Map<String, dynamic>)
          : null,
      email: json['email'] as String?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      tradingPartnerId: json['tradingPartnerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final partnershipArn = this.partnershipArn;
    final partnershipId = this.partnershipId;
    final profileId = this.profileId;
    final capabilities = this.capabilities;
    final capabilityOptions = this.capabilityOptions;
    final email = this.email;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final phone = this.phone;
    final tradingPartnerId = this.tradingPartnerId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'partnershipArn': partnershipArn,
      'partnershipId': partnershipId,
      'profileId': profileId,
      if (capabilities != null) 'capabilities': capabilities,
      if (capabilityOptions != null) 'capabilityOptions': capabilityOptions,
      if (email != null) 'email': email,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (tradingPartnerId != null) 'tradingPartnerId': tradingPartnerId,
    };
  }
}

/// @nodoc
class ListPartnershipsResponse {
  /// Specifies a list of your partnerships.
  final List<PartnershipSummary> partnerships;

  /// When additional results are obtained from the command, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional resources.
  final String? nextToken;

  ListPartnershipsResponse({
    required this.partnerships,
    this.nextToken,
  });

  factory ListPartnershipsResponse.fromJson(Map<String, dynamic> json) {
    return ListPartnershipsResponse(
      partnerships: ((json['partnerships'] as List?) ?? const [])
          .nonNulls
          .map((e) => PartnershipSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final partnerships = this.partnerships;
    final nextToken = this.nextToken;
    return {
      'partnerships': partnerships,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateProfileResponse {
  /// Returns the name for the business associated with this profile.
  final String businessName;

  /// Returns a timestamp representing the time the profile was created.
  final DateTime createdAt;

  /// Returns the name of the profile, used to identify it.
  final String name;

  /// Returns the phone number associated with the profile.
  final String phone;

  /// Returns an Amazon Resource Name (ARN) for the profile.
  final String profileArn;

  /// Returns the unique, system-generated identifier for the profile.
  final String profileId;

  /// Returns the email address associated with this customer profile.
  final String? email;

  /// Returns the name of the logging group.
  final String? logGroupName;

  /// Returns whether or not logging is turned on for this profile.
  final Logging? logging;

  CreateProfileResponse({
    required this.businessName,
    required this.createdAt,
    required this.name,
    required this.phone,
    required this.profileArn,
    required this.profileId,
    this.email,
    this.logGroupName,
    this.logging,
  });

  factory CreateProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateProfileResponse(
      businessName: (json['businessName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      phone: (json['phone'] as String?) ?? '',
      profileArn: (json['profileArn'] as String?) ?? '',
      profileId: (json['profileId'] as String?) ?? '',
      email: json['email'] as String?,
      logGroupName: json['logGroupName'] as String?,
      logging: (json['logging'] as String?)?.let(Logging.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final businessName = this.businessName;
    final createdAt = this.createdAt;
    final name = this.name;
    final phone = this.phone;
    final profileArn = this.profileArn;
    final profileId = this.profileId;
    final email = this.email;
    final logGroupName = this.logGroupName;
    final logging = this.logging;
    return {
      'businessName': businessName,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'phone': phone,
      'profileArn': profileArn,
      'profileId': profileId,
      if (email != null) 'email': email,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (logging != null) 'logging': logging.value,
    };
  }
}

/// @nodoc
class GetProfileResponse {
  /// Returns the name for the business associated with this profile.
  final String businessName;

  /// Returns a timestamp for creation date and time of the transformer.
  final DateTime createdAt;

  /// Returns the name of the profile, used to identify it.
  final String name;

  /// Returns the phone number associated with the profile.
  final String phone;

  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String profileArn;

  /// Returns the unique, system-generated identifier for the profile.
  final String profileId;

  /// Returns the email address associated with this customer profile.
  final String? email;

  /// Returns the name of the logging group.
  final String? logGroupName;

  /// Returns whether or not logging is enabled for this profile.
  final Logging? logging;

  /// Returns a timestamp for last time the profile was modified.
  final DateTime? modifiedAt;

  GetProfileResponse({
    required this.businessName,
    required this.createdAt,
    required this.name,
    required this.phone,
    required this.profileArn,
    required this.profileId,
    this.email,
    this.logGroupName,
    this.logging,
    this.modifiedAt,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileResponse(
      businessName: (json['businessName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      phone: (json['phone'] as String?) ?? '',
      profileArn: (json['profileArn'] as String?) ?? '',
      profileId: (json['profileId'] as String?) ?? '',
      email: json['email'] as String?,
      logGroupName: json['logGroupName'] as String?,
      logging: (json['logging'] as String?)?.let(Logging.fromString),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final businessName = this.businessName;
    final createdAt = this.createdAt;
    final name = this.name;
    final phone = this.phone;
    final profileArn = this.profileArn;
    final profileId = this.profileId;
    final email = this.email;
    final logGroupName = this.logGroupName;
    final logging = this.logging;
    final modifiedAt = this.modifiedAt;
    return {
      'businessName': businessName,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'phone': phone,
      'profileArn': profileArn,
      'profileId': profileId,
      if (email != null) 'email': email,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (logging != null) 'logging': logging.value,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// @nodoc
class UpdateProfileResponse {
  /// Returns the name for the business associated with this profile.
  final String businessName;

  /// Returns a timestamp for creation date and time of the profile.
  final DateTime createdAt;

  /// Returns the name of the profile.
  final String name;

  /// Returns the phone number associated with the profile.
  final String phone;

  /// Returns an Amazon Resource Name (ARN) for the profile.
  final String profileArn;

  /// Returns the unique, system-generated identifier for the profile.
  final String profileId;

  /// Returns the email address associated with this customer profile.
  final String? email;

  /// Returns the name of the logging group.
  final String? logGroupName;

  /// Specifies whether or not logging is enabled for this profile.
  final Logging? logging;

  /// Returns a timestamp for last time the profile was modified.
  final DateTime? modifiedAt;

  UpdateProfileResponse({
    required this.businessName,
    required this.createdAt,
    required this.name,
    required this.phone,
    required this.profileArn,
    required this.profileId,
    this.email,
    this.logGroupName,
    this.logging,
    this.modifiedAt,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      businessName: (json['businessName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      phone: (json['phone'] as String?) ?? '',
      profileArn: (json['profileArn'] as String?) ?? '',
      profileId: (json['profileId'] as String?) ?? '',
      email: json['email'] as String?,
      logGroupName: json['logGroupName'] as String?,
      logging: (json['logging'] as String?)?.let(Logging.fromString),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final businessName = this.businessName;
    final createdAt = this.createdAt;
    final name = this.name;
    final phone = this.phone;
    final profileArn = this.profileArn;
    final profileId = this.profileId;
    final email = this.email;
    final logGroupName = this.logGroupName;
    final logging = this.logging;
    final modifiedAt = this.modifiedAt;
    return {
      'businessName': businessName,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'phone': phone,
      'profileArn': profileArn,
      'profileId': profileId,
      if (email != null) 'email': email,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (logging != null) 'logging': logging.value,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// @nodoc
class ListProfilesResponse {
  /// Returns an array of <code>ProfileSummary</code> objects.
  final List<ProfileSummary> profiles;

  /// When additional results are obtained from the command, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional resources.
  final String? nextToken;

  ListProfilesResponse({
    required this.profiles,
    this.nextToken,
  });

  factory ListProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListProfilesResponse(
      profiles: ((json['profiles'] as List?) ?? const [])
          .nonNulls
          .map((e) => ProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final profiles = this.profiles;
    final nextToken = this.nextToken;
    return {
      'profiles': profiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateTransformerResponse {
  /// Returns a timestamp for creation date and time of the transformer.
  final DateTime createdAt;

  /// Returns the name of the transformer, used to identify it.
  final String name;

  /// Returns the state of the newly created transformer. The transformer can be
  /// either <code>active</code> or <code>inactive</code>. For the transformer to
  /// be used in a capability, its status must <code>active</code>.
  final TransformerStatus status;

  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String transformerArn;

  /// Returns the system-assigned unique identifier for the transformer.
  final String transformerId;

  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final EdiType? ediType;

  /// Returns that the currently supported file formats for EDI transformations
  /// are <code>JSON</code> and <code>XML</code>.
  final FileFormat? fileFormat;

  /// Returns the <code>InputConversion</code> object, which contains the format
  /// options for the inbound transformation.
  final InputConversion? inputConversion;

  /// Returns the structure that contains the mapping template and its language
  /// (either XSLT or JSONATA).
  final Mapping? mapping;

  /// Returns the mapping template for the transformer. This template is used to
  /// map the parsed EDI file using JSONata or XSLT.
  final String? mappingTemplate;

  /// Returns the <code>OutputConversion</code> object, which contains the format
  /// options for the outbound transformation.
  final OutputConversion? outputConversion;

  /// Returns a sample EDI document that is used by a transformer as a guide for
  /// processing the EDI data.
  final String? sampleDocument;

  /// Returns a structure that contains the Amazon S3 bucket and an array of the
  /// corresponding keys used to identify the location for your sample documents.
  final SampleDocuments? sampleDocuments;

  CreateTransformerResponse({
    required this.createdAt,
    required this.name,
    required this.status,
    required this.transformerArn,
    required this.transformerId,
    this.ediType,
    this.fileFormat,
    this.inputConversion,
    this.mapping,
    this.mappingTemplate,
    this.outputConversion,
    this.sampleDocument,
    this.sampleDocuments,
  });

  factory CreateTransformerResponse.fromJson(Map<String, dynamic> json) {
    return CreateTransformerResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: TransformerStatus.fromString((json['status'] as String?) ?? ''),
      transformerArn: (json['transformerArn'] as String?) ?? '',
      transformerId: (json['transformerId'] as String?) ?? '',
      ediType: json['ediType'] != null
          ? EdiType.fromJson(json['ediType'] as Map<String, dynamic>)
          : null,
      fileFormat: (json['fileFormat'] as String?)?.let(FileFormat.fromString),
      inputConversion: json['inputConversion'] != null
          ? InputConversion.fromJson(
              json['inputConversion'] as Map<String, dynamic>)
          : null,
      mapping: json['mapping'] != null
          ? Mapping.fromJson(json['mapping'] as Map<String, dynamic>)
          : null,
      mappingTemplate: json['mappingTemplate'] as String?,
      outputConversion: json['outputConversion'] != null
          ? OutputConversion.fromJson(
              json['outputConversion'] as Map<String, dynamic>)
          : null,
      sampleDocument: json['sampleDocument'] as String?,
      sampleDocuments: json['sampleDocuments'] != null
          ? SampleDocuments.fromJson(
              json['sampleDocuments'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final status = this.status;
    final transformerArn = this.transformerArn;
    final transformerId = this.transformerId;
    final ediType = this.ediType;
    final fileFormat = this.fileFormat;
    final inputConversion = this.inputConversion;
    final mapping = this.mapping;
    final mappingTemplate = this.mappingTemplate;
    final outputConversion = this.outputConversion;
    final sampleDocument = this.sampleDocument;
    final sampleDocuments = this.sampleDocuments;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'status': status.value,
      'transformerArn': transformerArn,
      'transformerId': transformerId,
      if (ediType != null) 'ediType': ediType,
      if (fileFormat != null) 'fileFormat': fileFormat.value,
      if (inputConversion != null) 'inputConversion': inputConversion,
      if (mapping != null) 'mapping': mapping,
      if (mappingTemplate != null) 'mappingTemplate': mappingTemplate,
      if (outputConversion != null) 'outputConversion': outputConversion,
      if (sampleDocument != null) 'sampleDocument': sampleDocument,
      if (sampleDocuments != null) 'sampleDocuments': sampleDocuments,
    };
  }
}

/// @nodoc
class GetTransformerResponse {
  /// Returns a timestamp for creation date and time of the transformer.
  final DateTime createdAt;

  /// Returns the name of the transformer, used to identify it.
  final String name;

  /// Returns the state of the newly created transformer. The transformer can be
  /// either <code>active</code> or <code>inactive</code>. For the transformer to
  /// be used in a capability, its status must <code>active</code>.
  final TransformerStatus status;

  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String transformerArn;

  /// Returns the system-assigned unique identifier for the transformer.
  final String transformerId;

  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final EdiType? ediType;

  /// Returns that the currently supported file formats for EDI transformations
  /// are <code>JSON</code> and <code>XML</code>.
  final FileFormat? fileFormat;

  /// Returns the <code>InputConversion</code> object, which contains the format
  /// options for the inbound transformation.
  final InputConversion? inputConversion;

  /// Returns the structure that contains the mapping template and its language
  /// (either XSLT or JSONATA).
  final Mapping? mapping;

  /// Returns the mapping template for the transformer. This template is used to
  /// map the parsed EDI file using JSONata or XSLT.
  final String? mappingTemplate;

  /// Returns a timestamp for last time the transformer was modified.
  final DateTime? modifiedAt;

  /// Returns the <code>OutputConversion</code> object, which contains the format
  /// options for the outbound transformation.
  final OutputConversion? outputConversion;

  /// Returns a sample EDI document that is used by a transformer as a guide for
  /// processing the EDI data.
  final String? sampleDocument;

  /// Returns a structure that contains the Amazon S3 bucket and an array of the
  /// corresponding keys used to identify the location for your sample documents.
  final SampleDocuments? sampleDocuments;

  GetTransformerResponse({
    required this.createdAt,
    required this.name,
    required this.status,
    required this.transformerArn,
    required this.transformerId,
    this.ediType,
    this.fileFormat,
    this.inputConversion,
    this.mapping,
    this.mappingTemplate,
    this.modifiedAt,
    this.outputConversion,
    this.sampleDocument,
    this.sampleDocuments,
  });

  factory GetTransformerResponse.fromJson(Map<String, dynamic> json) {
    return GetTransformerResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: TransformerStatus.fromString((json['status'] as String?) ?? ''),
      transformerArn: (json['transformerArn'] as String?) ?? '',
      transformerId: (json['transformerId'] as String?) ?? '',
      ediType: json['ediType'] != null
          ? EdiType.fromJson(json['ediType'] as Map<String, dynamic>)
          : null,
      fileFormat: (json['fileFormat'] as String?)?.let(FileFormat.fromString),
      inputConversion: json['inputConversion'] != null
          ? InputConversion.fromJson(
              json['inputConversion'] as Map<String, dynamic>)
          : null,
      mapping: json['mapping'] != null
          ? Mapping.fromJson(json['mapping'] as Map<String, dynamic>)
          : null,
      mappingTemplate: json['mappingTemplate'] as String?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      outputConversion: json['outputConversion'] != null
          ? OutputConversion.fromJson(
              json['outputConversion'] as Map<String, dynamic>)
          : null,
      sampleDocument: json['sampleDocument'] as String?,
      sampleDocuments: json['sampleDocuments'] != null
          ? SampleDocuments.fromJson(
              json['sampleDocuments'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final status = this.status;
    final transformerArn = this.transformerArn;
    final transformerId = this.transformerId;
    final ediType = this.ediType;
    final fileFormat = this.fileFormat;
    final inputConversion = this.inputConversion;
    final mapping = this.mapping;
    final mappingTemplate = this.mappingTemplate;
    final modifiedAt = this.modifiedAt;
    final outputConversion = this.outputConversion;
    final sampleDocument = this.sampleDocument;
    final sampleDocuments = this.sampleDocuments;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'status': status.value,
      'transformerArn': transformerArn,
      'transformerId': transformerId,
      if (ediType != null) 'ediType': ediType,
      if (fileFormat != null) 'fileFormat': fileFormat.value,
      if (inputConversion != null) 'inputConversion': inputConversion,
      if (mapping != null) 'mapping': mapping,
      if (mappingTemplate != null) 'mappingTemplate': mappingTemplate,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (outputConversion != null) 'outputConversion': outputConversion,
      if (sampleDocument != null) 'sampleDocument': sampleDocument,
      if (sampleDocuments != null) 'sampleDocuments': sampleDocuments,
    };
  }
}

/// @nodoc
class UpdateTransformerResponse {
  /// Returns a timestamp for creation date and time of the transformer.
  final DateTime createdAt;

  /// Returns a timestamp for last time the transformer was modified.
  final DateTime modifiedAt;

  /// Returns the name of the transformer.
  final String name;

  /// Returns the state of the newly created transformer. The transformer can be
  /// either <code>active</code> or <code>inactive</code>. For the transformer to
  /// be used in a capability, its status must <code>active</code>.
  final TransformerStatus status;

  /// Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services
  /// resource, such as a capability, partnership, profile, or transformer.
  final String transformerArn;

  /// Returns the system-assigned unique identifier for the transformer.
  final String transformerId;

  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final EdiType? ediType;

  /// Returns that the currently supported file formats for EDI transformations
  /// are <code>JSON</code> and <code>XML</code>.
  final FileFormat? fileFormat;

  /// Returns the <code>InputConversion</code> object, which contains the format
  /// options for the inbound transformation.
  final InputConversion? inputConversion;

  /// Returns the structure that contains the mapping template and its language
  /// (either XSLT or JSONATA).
  final Mapping? mapping;

  /// Returns the mapping template for the transformer. This template is used to
  /// map the parsed EDI file using JSONata or XSLT.
  final String? mappingTemplate;

  /// Returns the <code>OutputConversion</code> object, which contains the format
  /// options for the outbound transformation.
  final OutputConversion? outputConversion;

  /// Returns a sample EDI document that is used by a transformer as a guide for
  /// processing the EDI data.
  final String? sampleDocument;

  /// Returns a structure that contains the Amazon S3 bucket and an array of the
  /// corresponding keys used to identify the location for your sample documents.
  final SampleDocuments? sampleDocuments;

  UpdateTransformerResponse({
    required this.createdAt,
    required this.modifiedAt,
    required this.name,
    required this.status,
    required this.transformerArn,
    required this.transformerId,
    this.ediType,
    this.fileFormat,
    this.inputConversion,
    this.mapping,
    this.mappingTemplate,
    this.outputConversion,
    this.sampleDocument,
    this.sampleDocuments,
  });

  factory UpdateTransformerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTransformerResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: TransformerStatus.fromString((json['status'] as String?) ?? ''),
      transformerArn: (json['transformerArn'] as String?) ?? '',
      transformerId: (json['transformerId'] as String?) ?? '',
      ediType: json['ediType'] != null
          ? EdiType.fromJson(json['ediType'] as Map<String, dynamic>)
          : null,
      fileFormat: (json['fileFormat'] as String?)?.let(FileFormat.fromString),
      inputConversion: json['inputConversion'] != null
          ? InputConversion.fromJson(
              json['inputConversion'] as Map<String, dynamic>)
          : null,
      mapping: json['mapping'] != null
          ? Mapping.fromJson(json['mapping'] as Map<String, dynamic>)
          : null,
      mappingTemplate: json['mappingTemplate'] as String?,
      outputConversion: json['outputConversion'] != null
          ? OutputConversion.fromJson(
              json['outputConversion'] as Map<String, dynamic>)
          : null,
      sampleDocument: json['sampleDocument'] as String?,
      sampleDocuments: json['sampleDocuments'] != null
          ? SampleDocuments.fromJson(
              json['sampleDocuments'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    final transformerArn = this.transformerArn;
    final transformerId = this.transformerId;
    final ediType = this.ediType;
    final fileFormat = this.fileFormat;
    final inputConversion = this.inputConversion;
    final mapping = this.mapping;
    final mappingTemplate = this.mappingTemplate;
    final outputConversion = this.outputConversion;
    final sampleDocument = this.sampleDocument;
    final sampleDocuments = this.sampleDocuments;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'status': status.value,
      'transformerArn': transformerArn,
      'transformerId': transformerId,
      if (ediType != null) 'ediType': ediType,
      if (fileFormat != null) 'fileFormat': fileFormat.value,
      if (inputConversion != null) 'inputConversion': inputConversion,
      if (mapping != null) 'mapping': mapping,
      if (mappingTemplate != null) 'mappingTemplate': mappingTemplate,
      if (outputConversion != null) 'outputConversion': outputConversion,
      if (sampleDocument != null) 'sampleDocument': sampleDocument,
      if (sampleDocuments != null) 'sampleDocuments': sampleDocuments,
    };
  }
}

/// @nodoc
class ListTransformersResponse {
  /// Returns an array of one or more transformer objects.
  ///
  /// For each transformer, a <code>TransformerSummary</code> object is returned.
  /// The <code>TransformerSummary</code> contains all the details for a specific
  /// transformer.
  final List<TransformerSummary> transformers;

  /// When additional results are obtained from the command, a
  /// <code>NextToken</code> parameter is returned in the output. You can then
  /// pass the <code>NextToken</code> parameter in a subsequent command to
  /// continue listing additional resources.
  final String? nextToken;

  ListTransformersResponse({
    required this.transformers,
    this.nextToken,
  });

  factory ListTransformersResponse.fromJson(Map<String, dynamic> json) {
    return ListTransformersResponse(
      transformers: ((json['transformers'] as List?) ?? const [])
          .nonNulls
          .map((e) => TransformerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transformers = this.transformers;
    final nextToken = this.nextToken;
    return {
      'transformers': transformers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains the details for a transformer object. A transformer can take an EDI
/// file as input and transform it into a JSON-or XML-formatted document.
/// Alternatively, a transformer can take a JSON-or XML-formatted document as
/// input and transform it into an EDI file.
///
/// @nodoc
class TransformerSummary {
  /// Returns a timestamp indicating when the transformer was created. For
  /// example, <code>2023-07-20T19:58:44.624Z</code>.
  final DateTime createdAt;

  /// Returns the descriptive name for the transformer.
  final String name;

  /// Returns the state of the newly created transformer. The transformer can be
  /// either <code>active</code> or <code>inactive</code>. For the transformer to
  /// be used in a capability, its status must <code>active</code>.
  final TransformerStatus status;

  /// Returns the system-assigned unique identifier for the transformer.
  final String transformerId;

  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final EdiType? ediType;

  /// Returns that the currently supported file formats for EDI transformations
  /// are <code>JSON</code> and <code>XML</code>.
  final FileFormat? fileFormat;

  /// Returns a structure that contains the format options for the transformation.
  final InputConversion? inputConversion;

  /// Returns the structure that contains the mapping template and its language
  /// (either XSLT or JSONATA).
  final Mapping? mapping;

  /// Returns the mapping template for the transformer. This template is used to
  /// map the parsed EDI file using JSONata or XSLT.
  final String? mappingTemplate;

  /// Returns a timestamp representing the date and time for the most recent
  /// change for the transformer object.
  final DateTime? modifiedAt;

  /// Returns the <code>OutputConversion</code> object, which contains the format
  /// options for the outbound transformation.
  final OutputConversion? outputConversion;

  /// Returns a sample EDI document that is used by a transformer as a guide for
  /// processing the EDI data.
  final String? sampleDocument;

  /// Returns a structure that contains the Amazon S3 bucket and an array of the
  /// corresponding keys used to identify the location for your sample documents.
  final SampleDocuments? sampleDocuments;

  TransformerSummary({
    required this.createdAt,
    required this.name,
    required this.status,
    required this.transformerId,
    this.ediType,
    this.fileFormat,
    this.inputConversion,
    this.mapping,
    this.mappingTemplate,
    this.modifiedAt,
    this.outputConversion,
    this.sampleDocument,
    this.sampleDocuments,
  });

  factory TransformerSummary.fromJson(Map<String, dynamic> json) {
    return TransformerSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: TransformerStatus.fromString((json['status'] as String?) ?? ''),
      transformerId: (json['transformerId'] as String?) ?? '',
      ediType: json['ediType'] != null
          ? EdiType.fromJson(json['ediType'] as Map<String, dynamic>)
          : null,
      fileFormat: (json['fileFormat'] as String?)?.let(FileFormat.fromString),
      inputConversion: json['inputConversion'] != null
          ? InputConversion.fromJson(
              json['inputConversion'] as Map<String, dynamic>)
          : null,
      mapping: json['mapping'] != null
          ? Mapping.fromJson(json['mapping'] as Map<String, dynamic>)
          : null,
      mappingTemplate: json['mappingTemplate'] as String?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      outputConversion: json['outputConversion'] != null
          ? OutputConversion.fromJson(
              json['outputConversion'] as Map<String, dynamic>)
          : null,
      sampleDocument: json['sampleDocument'] as String?,
      sampleDocuments: json['sampleDocuments'] != null
          ? SampleDocuments.fromJson(
              json['sampleDocuments'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final status = this.status;
    final transformerId = this.transformerId;
    final ediType = this.ediType;
    final fileFormat = this.fileFormat;
    final inputConversion = this.inputConversion;
    final mapping = this.mapping;
    final mappingTemplate = this.mappingTemplate;
    final modifiedAt = this.modifiedAt;
    final outputConversion = this.outputConversion;
    final sampleDocument = this.sampleDocument;
    final sampleDocuments = this.sampleDocuments;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'status': status.value,
      'transformerId': transformerId,
      if (ediType != null) 'ediType': ediType,
      if (fileFormat != null) 'fileFormat': fileFormat.value,
      if (inputConversion != null) 'inputConversion': inputConversion,
      if (mapping != null) 'mapping': mapping,
      if (mappingTemplate != null) 'mappingTemplate': mappingTemplate,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (outputConversion != null) 'outputConversion': outputConversion,
      if (sampleDocument != null) 'sampleDocument': sampleDocument,
      if (sampleDocuments != null) 'sampleDocuments': sampleDocuments,
    };
  }
}

/// @nodoc
class TransformerStatus {
  static const active = TransformerStatus._('active');
  static const inactive = TransformerStatus._('inactive');

  final String value;

  const TransformerStatus._(this.value);

  static const values = [active, inactive];

  static TransformerStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TransformerStatus._(value));

  @override
  bool operator ==(other) => other is TransformerStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FileFormat {
  static const xml = FileFormat._('XML');
  static const json = FileFormat._('JSON');
  static const notUsed = FileFormat._('NOT_USED');

  final String value;

  const FileFormat._(this.value);

  static const values = [xml, json, notUsed];

  static FileFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FileFormat._(value));

  @override
  bool operator ==(other) => other is FileFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the details for the EDI standard that is being used for the
/// transformer. Currently, only X12 is supported. X12 is a set of standards and
/// corresponding messages that define specific business documents.
///
/// @nodoc
class EdiType {
  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final X12Details? x12Details;

  EdiType({
    this.x12Details,
  });

  factory EdiType.fromJson(Map<String, dynamic> json) {
    return EdiType(
      x12Details: json['x12Details'] != null
          ? X12Details.fromJson(json['x12Details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final x12Details = this.x12Details;
    return {
      if (x12Details != null) 'x12Details': x12Details,
    };
  }
}

/// Contains the input formatting options for an inbound transformer (takes an
/// X12-formatted EDI document as input and converts it to JSON or XML.
///
/// @nodoc
class InputConversion {
  /// The format for the transformer input: currently on <code>X12</code> is
  /// supported.
  final FromFormat fromFormat;

  /// Specifies advanced options for the input conversion process. These options
  /// provide additional control over how EDI files are processed during
  /// transformation.
  final AdvancedOptions? advancedOptions;

  /// A structure that contains the formatting options for an inbound transformer.
  final FormatOptions? formatOptions;

  InputConversion({
    required this.fromFormat,
    this.advancedOptions,
    this.formatOptions,
  });

  factory InputConversion.fromJson(Map<String, dynamic> json) {
    return InputConversion(
      fromFormat: FromFormat.fromString((json['fromFormat'] as String?) ?? ''),
      advancedOptions: json['advancedOptions'] != null
          ? AdvancedOptions.fromJson(
              json['advancedOptions'] as Map<String, dynamic>)
          : null,
      formatOptions: json['formatOptions'] != null
          ? FormatOptions.fromJson(
              json['formatOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fromFormat = this.fromFormat;
    final advancedOptions = this.advancedOptions;
    final formatOptions = this.formatOptions;
    return {
      'fromFormat': fromFormat.value,
      if (advancedOptions != null) 'advancedOptions': advancedOptions,
      if (formatOptions != null) 'formatOptions': formatOptions,
    };
  }
}

/// Specifies the mapping template for the transformer. This template is used to
/// map the parsed EDI file using JSONata or XSLT.
///
/// @nodoc
class Mapping {
  /// The transformation language for the template, either XSLT or JSONATA.
  final MappingTemplateLanguage templateLanguage;

  /// A string that represents the mapping template, in the transformation
  /// language specified in <code>templateLanguage</code>.
  final String? template;

  Mapping({
    required this.templateLanguage,
    this.template,
  });

  factory Mapping.fromJson(Map<String, dynamic> json) {
    return Mapping(
      templateLanguage: MappingTemplateLanguage.fromString(
          (json['templateLanguage'] as String?) ?? ''),
      template: json['template'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateLanguage = this.templateLanguage;
    final template = this.template;
    return {
      'templateLanguage': templateLanguage.value,
      if (template != null) 'template': template,
    };
  }
}

/// Contains the formatting options for an outbound transformer (takes JSON or
/// XML as input and converts it to an EDI document (currently only X12 format
/// is supported).
///
/// @nodoc
class OutputConversion {
  /// The format for the output from an outbound transformer: only X12 is
  /// currently supported.
  final ToFormat toFormat;
  final AdvancedOptions? advancedOptions;

  /// A structure that contains the X12 transaction set and version for the
  /// transformer output.
  final FormatOptions? formatOptions;

  OutputConversion({
    required this.toFormat,
    this.advancedOptions,
    this.formatOptions,
  });

  factory OutputConversion.fromJson(Map<String, dynamic> json) {
    return OutputConversion(
      toFormat: ToFormat.fromString((json['toFormat'] as String?) ?? ''),
      advancedOptions: json['advancedOptions'] != null
          ? AdvancedOptions.fromJson(
              json['advancedOptions'] as Map<String, dynamic>)
          : null,
      formatOptions: json['formatOptions'] != null
          ? FormatOptions.fromJson(
              json['formatOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final toFormat = this.toFormat;
    final advancedOptions = this.advancedOptions;
    final formatOptions = this.formatOptions;
    return {
      'toFormat': toFormat.value,
      if (advancedOptions != null) 'advancedOptions': advancedOptions,
      if (formatOptions != null) 'formatOptions': formatOptions,
    };
  }
}

/// Describes a structure that contains the Amazon S3 bucket and an array of the
/// corresponding keys used to identify the location for your sample documents.
///
/// @nodoc
class SampleDocuments {
  /// Contains the Amazon S3 bucket that is used to hold your sample documents.
  final String bucketName;

  /// Contains an array of the Amazon S3 keys used to identify the location for
  /// your sample documents.
  final List<SampleDocumentKeys> keys;

  SampleDocuments({
    required this.bucketName,
    required this.keys,
  });

  factory SampleDocuments.fromJson(Map<String, dynamic> json) {
    return SampleDocuments(
      bucketName: (json['bucketName'] as String?) ?? '',
      keys: ((json['keys'] as List?) ?? const [])
          .nonNulls
          .map((e) => SampleDocumentKeys.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final keys = this.keys;
    return {
      'bucketName': bucketName,
      'keys': keys,
    };
  }
}

/// An array of the Amazon S3 keys used to identify the location for your sample
/// documents.
///
/// @nodoc
class SampleDocumentKeys {
  /// An array of keys for your input sample documents.
  final String? input;

  /// An array of keys for your output sample documents.
  final String? output;

  SampleDocumentKeys({
    this.input,
    this.output,
  });

  factory SampleDocumentKeys.fromJson(Map<String, dynamic> json) {
    return SampleDocumentKeys(
      input: json['input'] as String?,
      output: json['output'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final output = this.output;
    return {
      if (input != null) 'input': input,
      if (output != null) 'output': output,
    };
  }
}

/// @nodoc
class ToFormat {
  static const x12 = ToFormat._('X12');

  final String value;

  const ToFormat._(this.value);

  static const values = [x12];

  static ToFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ToFormat._(value));

  @override
  bool operator ==(other) => other is ToFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains the X12 transaction set and version.
///
/// @nodoc
class FormatOptions {
  final X12Details? x12;

  FormatOptions({
    this.x12,
  });

  factory FormatOptions.fromJson(Map<String, dynamic> json) {
    return FormatOptions(
      x12: json['x12'] != null
          ? X12Details.fromJson(json['x12'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final x12 = this.x12;
    return {
      if (x12 != null) 'x12': x12,
    };
  }
}

/// A structure that contains advanced options for EDI processing. Currently,
/// only X12 advanced options are supported.
///
/// @nodoc
class AdvancedOptions {
  /// A structure that contains X12-specific advanced options, such as split
  /// options for processing X12 EDI files.
  final X12AdvancedOptions? x12;

  AdvancedOptions({
    this.x12,
  });

  factory AdvancedOptions.fromJson(Map<String, dynamic> json) {
    return AdvancedOptions(
      x12: json['x12'] != null
          ? X12AdvancedOptions.fromJson(json['x12'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final x12 = this.x12;
    return {
      if (x12 != null) 'x12': x12,
    };
  }
}

/// Contains advanced options specific to X12 EDI processing, such as splitting
/// large X12 files into smaller units.
///
/// @nodoc
class X12AdvancedOptions {
  /// Specifies options for splitting X12 EDI files. These options control how
  /// large X12 files are divided into smaller, more manageable units.
  final X12SplitOptions? splitOptions;

  /// Specifies validation options for X12 EDI processing. These options control
  /// how validation rules are applied during EDI document processing, including
  /// custom validation rules for element length constraints, code list
  /// validations, and element requirement checks.
  final X12ValidationOptions? validationOptions;

  X12AdvancedOptions({
    this.splitOptions,
    this.validationOptions,
  });

  factory X12AdvancedOptions.fromJson(Map<String, dynamic> json) {
    return X12AdvancedOptions(
      splitOptions: json['splitOptions'] != null
          ? X12SplitOptions.fromJson(
              json['splitOptions'] as Map<String, dynamic>)
          : null,
      validationOptions: json['validationOptions'] != null
          ? X12ValidationOptions.fromJson(
              json['validationOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final splitOptions = this.splitOptions;
    final validationOptions = this.validationOptions;
    return {
      if (splitOptions != null) 'splitOptions': splitOptions,
      if (validationOptions != null) 'validationOptions': validationOptions,
    };
  }
}

/// Contains options for splitting X12 EDI files into smaller units. This is
/// useful for processing large EDI files more efficiently.
///
/// @nodoc
class X12SplitOptions {
  /// Specifies the method used to split X12 EDI files. Valid values include
  /// <code>TRANSACTION</code> (split by individual transaction sets), or
  /// <code>NONE</code> (no splitting).
  final X12SplitBy splitBy;

  X12SplitOptions({
    required this.splitBy,
  });

  factory X12SplitOptions.fromJson(Map<String, dynamic> json) {
    return X12SplitOptions(
      splitBy: X12SplitBy.fromString((json['splitBy'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final splitBy = this.splitBy;
    return {
      'splitBy': splitBy.value,
    };
  }
}

/// Contains configuration options for X12 EDI validation. This structure allows
/// you to specify custom validation rules that will be applied during EDI
/// document processing, including element length constraints, code list
/// modifications, and element requirement changes. These validation options
/// provide flexibility to accommodate trading partner-specific requirements
/// while maintaining EDI compliance. The validation rules are applied in
/// addition to standard X12 validation to ensure documents meet both standard
/// and custom requirements.
///
/// @nodoc
class X12ValidationOptions {
  /// Specifies a list of validation rules to apply during EDI document
  /// processing. These rules can include code list modifications, element length
  /// constraints, and element requirement changes.
  final List<X12ValidationRule>? validationRules;

  X12ValidationOptions({
    this.validationRules,
  });

  factory X12ValidationOptions.fromJson(Map<String, dynamic> json) {
    return X12ValidationOptions(
      validationRules: (json['validationRules'] as List?)
          ?.nonNulls
          .map((e) => X12ValidationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final validationRules = this.validationRules;
    return {
      if (validationRules != null) 'validationRules': validationRules,
    };
  }
}

/// Represents a single validation rule that can be applied during X12 EDI
/// processing. This is a union type that can contain one of several specific
/// validation rule types: code list validation rules for modifying allowed
/// element codes, element length validation rules for enforcing custom length
/// constraints, or element requirement validation rules for changing
/// mandatory/optional status. Each validation rule targets specific aspects of
/// EDI document validation to ensure compliance with trading partner
/// requirements and business rules.
///
/// @nodoc
class X12ValidationRule {
  /// Specifies a code list validation rule that modifies the allowed code values
  /// for a specific X12 element. This rule enables you to customize which codes
  /// are considered valid for an element, allowing for trading partner-specific
  /// code requirements.
  final X12CodeListValidationRule? codeListValidationRule;

  /// Specifies an element length validation rule that defines custom length
  /// constraints for a specific X12 element. This rule allows you to enforce
  /// minimum and maximum length requirements that may differ from the standard
  /// X12 specification.
  final X12ElementLengthValidationRule? elementLengthValidationRule;

  /// Specifies an element requirement validation rule that modifies whether a
  /// specific X12 element is required or optional within a segment. This rule
  /// provides flexibility to accommodate different trading partner requirements
  /// for element presence.
  final X12ElementRequirementValidationRule? elementRequirementValidationRule;

  X12ValidationRule({
    this.codeListValidationRule,
    this.elementLengthValidationRule,
    this.elementRequirementValidationRule,
  });

  factory X12ValidationRule.fromJson(Map<String, dynamic> json) {
    return X12ValidationRule(
      codeListValidationRule: json['codeListValidationRule'] != null
          ? X12CodeListValidationRule.fromJson(
              json['codeListValidationRule'] as Map<String, dynamic>)
          : null,
      elementLengthValidationRule: json['elementLengthValidationRule'] != null
          ? X12ElementLengthValidationRule.fromJson(
              json['elementLengthValidationRule'] as Map<String, dynamic>)
          : null,
      elementRequirementValidationRule:
          json['elementRequirementValidationRule'] != null
              ? X12ElementRequirementValidationRule.fromJson(
                  json['elementRequirementValidationRule']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final codeListValidationRule = this.codeListValidationRule;
    final elementLengthValidationRule = this.elementLengthValidationRule;
    final elementRequirementValidationRule =
        this.elementRequirementValidationRule;
    return {
      if (codeListValidationRule != null)
        'codeListValidationRule': codeListValidationRule,
      if (elementLengthValidationRule != null)
        'elementLengthValidationRule': elementLengthValidationRule,
      if (elementRequirementValidationRule != null)
        'elementRequirementValidationRule': elementRequirementValidationRule,
    };
  }
}

/// Defines a validation rule that modifies the allowed code values for a
/// specific X12 element. This rule allows you to add or remove valid codes from
/// an element's standard code list, providing flexibility to accommodate
/// trading partner-specific requirements or industry variations. You can
/// specify codes to add to expand the allowed values beyond the X12 standard,
/// or codes to remove to restrict the allowed values for stricter validation.
///
/// @nodoc
class X12CodeListValidationRule {
  /// Specifies the four-digit element ID to which the code list modifications
  /// apply. This identifies which X12 element will have its allowed code values
  /// modified.
  final String elementId;

  /// Specifies a list of code values to add to the element's allowed values.
  /// These codes will be considered valid for the specified element in addition
  /// to the standard codes defined by the X12 specification.
  final List<String>? codesToAdd;

  /// Specifies a list of code values to remove from the element's allowed values.
  /// These codes will be considered invalid for the specified element, even if
  /// they are part of the standard codes defined by the X12 specification.
  final List<String>? codesToRemove;

  X12CodeListValidationRule({
    required this.elementId,
    this.codesToAdd,
    this.codesToRemove,
  });

  factory X12CodeListValidationRule.fromJson(Map<String, dynamic> json) {
    return X12CodeListValidationRule(
      elementId: (json['elementId'] as String?) ?? '',
      codesToAdd: (json['codesToAdd'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      codesToRemove: (json['codesToRemove'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final elementId = this.elementId;
    final codesToAdd = this.codesToAdd;
    final codesToRemove = this.codesToRemove;
    return {
      'elementId': elementId,
      if (codesToAdd != null) 'codesToAdd': codesToAdd,
      if (codesToRemove != null) 'codesToRemove': codesToRemove,
    };
  }
}

/// Defines a validation rule that specifies custom length constraints for a
/// specific X12 element. This rule allows you to override the standard minimum
/// and maximum length requirements for an element, enabling validation of
/// trading partner-specific length requirements that may differ from the X12
/// specification. Both minimum and maximum length values must be specified and
/// must be between 1 and 200 characters.
///
/// @nodoc
class X12ElementLengthValidationRule {
  /// Specifies the four-digit element ID to which the length constraints will be
  /// applied. This identifies which X12 element will have its length requirements
  /// modified.
  final String elementId;

  /// Specifies the maximum allowed length for the identified element. This value
  /// must be between 1 and 200 characters and defines the upper limit for the
  /// element's content length.
  final int maxLength;

  /// Specifies the minimum required length for the identified element. This value
  /// must be between 1 and 200 characters and defines the lower limit for the
  /// element's content length.
  final int minLength;

  X12ElementLengthValidationRule({
    required this.elementId,
    required this.maxLength,
    required this.minLength,
  });

  factory X12ElementLengthValidationRule.fromJson(Map<String, dynamic> json) {
    return X12ElementLengthValidationRule(
      elementId: (json['elementId'] as String?) ?? '',
      maxLength: (json['maxLength'] as int?) ?? 0,
      minLength: (json['minLength'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final elementId = this.elementId;
    final maxLength = this.maxLength;
    final minLength = this.minLength;
    return {
      'elementId': elementId,
      'maxLength': maxLength,
      'minLength': minLength,
    };
  }
}

/// Defines a validation rule that modifies the requirement status of a specific
/// X12 element within a segment. This rule allows you to make optional elements
/// mandatory or mandatory elements optional, providing flexibility to
/// accommodate different trading partner requirements and business rules. The
/// rule targets a specific element position within a segment and sets its
/// requirement status to either OPTIONAL or MANDATORY.
///
/// @nodoc
class X12ElementRequirementValidationRule {
  /// Specifies the position of the element within an X12 segment for which the
  /// requirement status will be modified. The format follows the pattern of
  /// segment identifier followed by element position (e.g., "ST-01" for the first
  /// element of the ST segment).
  final String elementPosition;

  /// Specifies the requirement status for the element at the specified position.
  /// Valid values are OPTIONAL (the element may be omitted) or MANDATORY (the
  /// element must be present).
  final ElementRequirement requirement;

  X12ElementRequirementValidationRule({
    required this.elementPosition,
    required this.requirement,
  });

  factory X12ElementRequirementValidationRule.fromJson(
      Map<String, dynamic> json) {
    return X12ElementRequirementValidationRule(
      elementPosition: (json['elementPosition'] as String?) ?? '',
      requirement:
          ElementRequirement.fromString((json['requirement'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final elementPosition = this.elementPosition;
    final requirement = this.requirement;
    return {
      'elementPosition': elementPosition,
      'requirement': requirement.value,
    };
  }
}

/// @nodoc
class ElementRequirement {
  static const optional = ElementRequirement._('OPTIONAL');
  static const mandatory = ElementRequirement._('MANDATORY');

  final String value;

  const ElementRequirement._(this.value);

  static const values = [optional, mandatory];

  static ElementRequirement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ElementRequirement._(value));

  @override
  bool operator ==(other) =>
      other is ElementRequirement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class X12SplitBy {
  static const none = X12SplitBy._('NONE');
  static const transaction = X12SplitBy._('TRANSACTION');

  final String value;

  const X12SplitBy._(this.value);

  static const values = [none, transaction];

  static X12SplitBy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => X12SplitBy._(value));

  @override
  bool operator ==(other) => other is X12SplitBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains the X12 transaction set and version. The X12
/// structure is used when the system transforms an EDI (electronic data
/// interchange) file.
/// <note>
/// If an EDI input file contains more than one transaction, each transaction
/// must have the same transaction set and version, for example 214/4010. If
/// not, the transformer cannot parse the file.
/// </note>
///
/// @nodoc
class X12Details {
  /// Returns an enumerated type where each value identifies an X12 transaction
  /// set. Transaction sets are maintained by the X12 Accredited Standards
  /// Committee.
  final X12TransactionSet? transactionSet;

  /// Returns the version to use for the specified X12 transaction set.
  final X12Version? version;

  X12Details({
    this.transactionSet,
    this.version,
  });

  factory X12Details.fromJson(Map<String, dynamic> json) {
    return X12Details(
      transactionSet: (json['transactionSet'] as String?)
          ?.let(X12TransactionSet.fromString),
      version: (json['version'] as String?)?.let(X12Version.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final transactionSet = this.transactionSet;
    final version = this.version;
    return {
      if (transactionSet != null) 'transactionSet': transactionSet.value,
      if (version != null) 'version': version.value,
    };
  }
}

/// @nodoc
class X12TransactionSet {
  static const x12_100 = X12TransactionSet._('X12_100');
  static const x12_101 = X12TransactionSet._('X12_101');
  static const x12_102 = X12TransactionSet._('X12_102');
  static const x12_103 = X12TransactionSet._('X12_103');
  static const x12_104 = X12TransactionSet._('X12_104');
  static const x12_105 = X12TransactionSet._('X12_105');
  static const x12_106 = X12TransactionSet._('X12_106');
  static const x12_107 = X12TransactionSet._('X12_107');
  static const x12_108 = X12TransactionSet._('X12_108');
  static const x12_109 = X12TransactionSet._('X12_109');
  static const x12_110 = X12TransactionSet._('X12_110');
  static const x12_111 = X12TransactionSet._('X12_111');
  static const x12_112 = X12TransactionSet._('X12_112');
  static const x12_113 = X12TransactionSet._('X12_113');
  static const x12_120 = X12TransactionSet._('X12_120');
  static const x12_121 = X12TransactionSet._('X12_121');
  static const x12_124 = X12TransactionSet._('X12_124');
  static const x12_125 = X12TransactionSet._('X12_125');
  static const x12_126 = X12TransactionSet._('X12_126');
  static const x12_127 = X12TransactionSet._('X12_127');
  static const x12_128 = X12TransactionSet._('X12_128');
  static const x12_129 = X12TransactionSet._('X12_129');
  static const x12_130 = X12TransactionSet._('X12_130');
  static const x12_131 = X12TransactionSet._('X12_131');
  static const x12_132 = X12TransactionSet._('X12_132');
  static const x12_133 = X12TransactionSet._('X12_133');
  static const x12_135 = X12TransactionSet._('X12_135');
  static const x12_138 = X12TransactionSet._('X12_138');
  static const x12_139 = X12TransactionSet._('X12_139');
  static const x12_140 = X12TransactionSet._('X12_140');
  static const x12_141 = X12TransactionSet._('X12_141');
  static const x12_142 = X12TransactionSet._('X12_142');
  static const x12_143 = X12TransactionSet._('X12_143');
  static const x12_144 = X12TransactionSet._('X12_144');
  static const x12_146 = X12TransactionSet._('X12_146');
  static const x12_147 = X12TransactionSet._('X12_147');
  static const x12_148 = X12TransactionSet._('X12_148');
  static const x12_149 = X12TransactionSet._('X12_149');
  static const x12_150 = X12TransactionSet._('X12_150');
  static const x12_151 = X12TransactionSet._('X12_151');
  static const x12_152 = X12TransactionSet._('X12_152');
  static const x12_153 = X12TransactionSet._('X12_153');
  static const x12_154 = X12TransactionSet._('X12_154');
  static const x12_155 = X12TransactionSet._('X12_155');
  static const x12_157 = X12TransactionSet._('X12_157');
  static const x12_158 = X12TransactionSet._('X12_158');
  static const x12_159 = X12TransactionSet._('X12_159');
  static const x12_160 = X12TransactionSet._('X12_160');
  static const x12_161 = X12TransactionSet._('X12_161');
  static const x12_163 = X12TransactionSet._('X12_163');
  static const x12_170 = X12TransactionSet._('X12_170');
  static const x12_175 = X12TransactionSet._('X12_175');
  static const x12_176 = X12TransactionSet._('X12_176');
  static const x12_179 = X12TransactionSet._('X12_179');
  static const x12_180 = X12TransactionSet._('X12_180');
  static const x12_185 = X12TransactionSet._('X12_185');
  static const x12_186 = X12TransactionSet._('X12_186');
  static const x12_187 = X12TransactionSet._('X12_187');
  static const x12_188 = X12TransactionSet._('X12_188');
  static const x12_189 = X12TransactionSet._('X12_189');
  static const x12_190 = X12TransactionSet._('X12_190');
  static const x12_191 = X12TransactionSet._('X12_191');
  static const x12_194 = X12TransactionSet._('X12_194');
  static const x12_195 = X12TransactionSet._('X12_195');
  static const x12_196 = X12TransactionSet._('X12_196');
  static const x12_197 = X12TransactionSet._('X12_197');
  static const x12_198 = X12TransactionSet._('X12_198');
  static const x12_199 = X12TransactionSet._('X12_199');
  static const x12_200 = X12TransactionSet._('X12_200');
  static const x12_201 = X12TransactionSet._('X12_201');
  static const x12_202 = X12TransactionSet._('X12_202');
  static const x12_203 = X12TransactionSet._('X12_203');
  static const x12_204 = X12TransactionSet._('X12_204');
  static const x12_205 = X12TransactionSet._('X12_205');
  static const x12_206 = X12TransactionSet._('X12_206');
  static const x12_210 = X12TransactionSet._('X12_210');
  static const x12_211 = X12TransactionSet._('X12_211');
  static const x12_212 = X12TransactionSet._('X12_212');
  static const x12_213 = X12TransactionSet._('X12_213');
  static const x12_214 = X12TransactionSet._('X12_214');
  static const x12_215 = X12TransactionSet._('X12_215');
  static const x12_216 = X12TransactionSet._('X12_216');
  static const x12_217 = X12TransactionSet._('X12_217');
  static const x12_218 = X12TransactionSet._('X12_218');
  static const x12_219 = X12TransactionSet._('X12_219');
  static const x12_220 = X12TransactionSet._('X12_220');
  static const x12_222 = X12TransactionSet._('X12_222');
  static const x12_223 = X12TransactionSet._('X12_223');
  static const x12_224 = X12TransactionSet._('X12_224');
  static const x12_225 = X12TransactionSet._('X12_225');
  static const x12_227 = X12TransactionSet._('X12_227');
  static const x12_228 = X12TransactionSet._('X12_228');
  static const x12_240 = X12TransactionSet._('X12_240');
  static const x12_242 = X12TransactionSet._('X12_242');
  static const x12_244 = X12TransactionSet._('X12_244');
  static const x12_245 = X12TransactionSet._('X12_245');
  static const x12_248 = X12TransactionSet._('X12_248');
  static const x12_249 = X12TransactionSet._('X12_249');
  static const x12_250 = X12TransactionSet._('X12_250');
  static const x12_251 = X12TransactionSet._('X12_251');
  static const x12_252 = X12TransactionSet._('X12_252');
  static const x12_255 = X12TransactionSet._('X12_255');
  static const x12_256 = X12TransactionSet._('X12_256');
  static const x12_259 = X12TransactionSet._('X12_259');
  static const x12_260 = X12TransactionSet._('X12_260');
  static const x12_261 = X12TransactionSet._('X12_261');
  static const x12_262 = X12TransactionSet._('X12_262');
  static const x12_263 = X12TransactionSet._('X12_263');
  static const x12_264 = X12TransactionSet._('X12_264');
  static const x12_265 = X12TransactionSet._('X12_265');
  static const x12_266 = X12TransactionSet._('X12_266');
  static const x12_267 = X12TransactionSet._('X12_267');
  static const x12_268 = X12TransactionSet._('X12_268');
  static const x12_269 = X12TransactionSet._('X12_269');
  static const x12_270 = X12TransactionSet._('X12_270');
  static const x12_271 = X12TransactionSet._('X12_271');
  static const x12_272 = X12TransactionSet._('X12_272');
  static const x12_273 = X12TransactionSet._('X12_273');
  static const x12_274 = X12TransactionSet._('X12_274');
  static const x12_275 = X12TransactionSet._('X12_275');
  static const x12_276 = X12TransactionSet._('X12_276');
  static const x12_277 = X12TransactionSet._('X12_277');
  static const x12_278 = X12TransactionSet._('X12_278');
  static const x12_280 = X12TransactionSet._('X12_280');
  static const x12_283 = X12TransactionSet._('X12_283');
  static const x12_284 = X12TransactionSet._('X12_284');
  static const x12_285 = X12TransactionSet._('X12_285');
  static const x12_286 = X12TransactionSet._('X12_286');
  static const x12_288 = X12TransactionSet._('X12_288');
  static const x12_290 = X12TransactionSet._('X12_290');
  static const x12_300 = X12TransactionSet._('X12_300');
  static const x12_301 = X12TransactionSet._('X12_301');
  static const x12_303 = X12TransactionSet._('X12_303');
  static const x12_304 = X12TransactionSet._('X12_304');
  static const x12_309 = X12TransactionSet._('X12_309');
  static const x12_310 = X12TransactionSet._('X12_310');
  static const x12_311 = X12TransactionSet._('X12_311');
  static const x12_312 = X12TransactionSet._('X12_312');
  static const x12_313 = X12TransactionSet._('X12_313');
  static const x12_315 = X12TransactionSet._('X12_315');
  static const x12_317 = X12TransactionSet._('X12_317');
  static const x12_319 = X12TransactionSet._('X12_319');
  static const x12_322 = X12TransactionSet._('X12_322');
  static const x12_323 = X12TransactionSet._('X12_323');
  static const x12_324 = X12TransactionSet._('X12_324');
  static const x12_325 = X12TransactionSet._('X12_325');
  static const x12_326 = X12TransactionSet._('X12_326');
  static const x12_350 = X12TransactionSet._('X12_350');
  static const x12_352 = X12TransactionSet._('X12_352');
  static const x12_353 = X12TransactionSet._('X12_353');
  static const x12_354 = X12TransactionSet._('X12_354');
  static const x12_355 = X12TransactionSet._('X12_355');
  static const x12_356 = X12TransactionSet._('X12_356');
  static const x12_357 = X12TransactionSet._('X12_357');
  static const x12_358 = X12TransactionSet._('X12_358');
  static const x12_361 = X12TransactionSet._('X12_361');
  static const x12_362 = X12TransactionSet._('X12_362');
  static const x12_404 = X12TransactionSet._('X12_404');
  static const x12_410 = X12TransactionSet._('X12_410');
  static const x12_412 = X12TransactionSet._('X12_412');
  static const x12_414 = X12TransactionSet._('X12_414');
  static const x12_417 = X12TransactionSet._('X12_417');
  static const x12_418 = X12TransactionSet._('X12_418');
  static const x12_419 = X12TransactionSet._('X12_419');
  static const x12_420 = X12TransactionSet._('X12_420');
  static const x12_421 = X12TransactionSet._('X12_421');
  static const x12_422 = X12TransactionSet._('X12_422');
  static const x12_423 = X12TransactionSet._('X12_423');
  static const x12_424 = X12TransactionSet._('X12_424');
  static const x12_425 = X12TransactionSet._('X12_425');
  static const x12_426 = X12TransactionSet._('X12_426');
  static const x12_429 = X12TransactionSet._('X12_429');
  static const x12_431 = X12TransactionSet._('X12_431');
  static const x12_432 = X12TransactionSet._('X12_432');
  static const x12_433 = X12TransactionSet._('X12_433');
  static const x12_434 = X12TransactionSet._('X12_434');
  static const x12_435 = X12TransactionSet._('X12_435');
  static const x12_436 = X12TransactionSet._('X12_436');
  static const x12_437 = X12TransactionSet._('X12_437');
  static const x12_440 = X12TransactionSet._('X12_440');
  static const x12_451 = X12TransactionSet._('X12_451');
  static const x12_452 = X12TransactionSet._('X12_452');
  static const x12_453 = X12TransactionSet._('X12_453');
  static const x12_455 = X12TransactionSet._('X12_455');
  static const x12_456 = X12TransactionSet._('X12_456');
  static const x12_460 = X12TransactionSet._('X12_460');
  static const x12_463 = X12TransactionSet._('X12_463');
  static const x12_466 = X12TransactionSet._('X12_466');
  static const x12_468 = X12TransactionSet._('X12_468');
  static const x12_470 = X12TransactionSet._('X12_470');
  static const x12_475 = X12TransactionSet._('X12_475');
  static const x12_485 = X12TransactionSet._('X12_485');
  static const x12_486 = X12TransactionSet._('X12_486');
  static const x12_490 = X12TransactionSet._('X12_490');
  static const x12_492 = X12TransactionSet._('X12_492');
  static const x12_494 = X12TransactionSet._('X12_494');
  static const x12_500 = X12TransactionSet._('X12_500');
  static const x12_501 = X12TransactionSet._('X12_501');
  static const x12_503 = X12TransactionSet._('X12_503');
  static const x12_504 = X12TransactionSet._('X12_504');
  static const x12_511 = X12TransactionSet._('X12_511');
  static const x12_517 = X12TransactionSet._('X12_517');
  static const x12_521 = X12TransactionSet._('X12_521');
  static const x12_527 = X12TransactionSet._('X12_527');
  static const x12_536 = X12TransactionSet._('X12_536');
  static const x12_540 = X12TransactionSet._('X12_540');
  static const x12_561 = X12TransactionSet._('X12_561');
  static const x12_567 = X12TransactionSet._('X12_567');
  static const x12_568 = X12TransactionSet._('X12_568');
  static const x12_601 = X12TransactionSet._('X12_601');
  static const x12_602 = X12TransactionSet._('X12_602');
  static const x12_620 = X12TransactionSet._('X12_620');
  static const x12_625 = X12TransactionSet._('X12_625');
  static const x12_650 = X12TransactionSet._('X12_650');
  static const x12_715 = X12TransactionSet._('X12_715');
  static const x12_753 = X12TransactionSet._('X12_753');
  static const x12_754 = X12TransactionSet._('X12_754');
  static const x12_805 = X12TransactionSet._('X12_805');
  static const x12_806 = X12TransactionSet._('X12_806');
  static const x12_810 = X12TransactionSet._('X12_810');
  static const x12_811 = X12TransactionSet._('X12_811');
  static const x12_812 = X12TransactionSet._('X12_812');
  static const x12_813 = X12TransactionSet._('X12_813');
  static const x12_814 = X12TransactionSet._('X12_814');
  static const x12_815 = X12TransactionSet._('X12_815');
  static const x12_816 = X12TransactionSet._('X12_816');
  static const x12_818 = X12TransactionSet._('X12_818');
  static const x12_819 = X12TransactionSet._('X12_819');
  static const x12_820 = X12TransactionSet._('X12_820');
  static const x12_821 = X12TransactionSet._('X12_821');
  static const x12_822 = X12TransactionSet._('X12_822');
  static const x12_823 = X12TransactionSet._('X12_823');
  static const x12_824 = X12TransactionSet._('X12_824');
  static const x12_826 = X12TransactionSet._('X12_826');
  static const x12_827 = X12TransactionSet._('X12_827');
  static const x12_828 = X12TransactionSet._('X12_828');
  static const x12_829 = X12TransactionSet._('X12_829');
  static const x12_830 = X12TransactionSet._('X12_830');
  static const x12_831 = X12TransactionSet._('X12_831');
  static const x12_832 = X12TransactionSet._('X12_832');
  static const x12_833 = X12TransactionSet._('X12_833');
  static const x12_834 = X12TransactionSet._('X12_834');
  static const x12_835 = X12TransactionSet._('X12_835');
  static const x12_836 = X12TransactionSet._('X12_836');
  static const x12_837 = X12TransactionSet._('X12_837');
  static const x12_838 = X12TransactionSet._('X12_838');
  static const x12_839 = X12TransactionSet._('X12_839');
  static const x12_840 = X12TransactionSet._('X12_840');
  static const x12_841 = X12TransactionSet._('X12_841');
  static const x12_842 = X12TransactionSet._('X12_842');
  static const x12_843 = X12TransactionSet._('X12_843');
  static const x12_844 = X12TransactionSet._('X12_844');
  static const x12_845 = X12TransactionSet._('X12_845');
  static const x12_846 = X12TransactionSet._('X12_846');
  static const x12_847 = X12TransactionSet._('X12_847');
  static const x12_848 = X12TransactionSet._('X12_848');
  static const x12_849 = X12TransactionSet._('X12_849');
  static const x12_850 = X12TransactionSet._('X12_850');
  static const x12_851 = X12TransactionSet._('X12_851');
  static const x12_852 = X12TransactionSet._('X12_852');
  static const x12_853 = X12TransactionSet._('X12_853');
  static const x12_854 = X12TransactionSet._('X12_854');
  static const x12_855 = X12TransactionSet._('X12_855');
  static const x12_856 = X12TransactionSet._('X12_856');
  static const x12_857 = X12TransactionSet._('X12_857');
  static const x12_858 = X12TransactionSet._('X12_858');
  static const x12_859 = X12TransactionSet._('X12_859');
  static const x12_860 = X12TransactionSet._('X12_860');
  static const x12_861 = X12TransactionSet._('X12_861');
  static const x12_862 = X12TransactionSet._('X12_862');
  static const x12_863 = X12TransactionSet._('X12_863');
  static const x12_864 = X12TransactionSet._('X12_864');
  static const x12_865 = X12TransactionSet._('X12_865');
  static const x12_866 = X12TransactionSet._('X12_866');
  static const x12_867 = X12TransactionSet._('X12_867');
  static const x12_868 = X12TransactionSet._('X12_868');
  static const x12_869 = X12TransactionSet._('X12_869');
  static const x12_870 = X12TransactionSet._('X12_870');
  static const x12_871 = X12TransactionSet._('X12_871');
  static const x12_872 = X12TransactionSet._('X12_872');
  static const x12_873 = X12TransactionSet._('X12_873');
  static const x12_874 = X12TransactionSet._('X12_874');
  static const x12_875 = X12TransactionSet._('X12_875');
  static const x12_876 = X12TransactionSet._('X12_876');
  static const x12_877 = X12TransactionSet._('X12_877');
  static const x12_878 = X12TransactionSet._('X12_878');
  static const x12_879 = X12TransactionSet._('X12_879');
  static const x12_880 = X12TransactionSet._('X12_880');
  static const x12_881 = X12TransactionSet._('X12_881');
  static const x12_882 = X12TransactionSet._('X12_882');
  static const x12_883 = X12TransactionSet._('X12_883');
  static const x12_884 = X12TransactionSet._('X12_884');
  static const x12_885 = X12TransactionSet._('X12_885');
  static const x12_886 = X12TransactionSet._('X12_886');
  static const x12_887 = X12TransactionSet._('X12_887');
  static const x12_888 = X12TransactionSet._('X12_888');
  static const x12_889 = X12TransactionSet._('X12_889');
  static const x12_891 = X12TransactionSet._('X12_891');
  static const x12_893 = X12TransactionSet._('X12_893');
  static const x12_894 = X12TransactionSet._('X12_894');
  static const x12_895 = X12TransactionSet._('X12_895');
  static const x12_896 = X12TransactionSet._('X12_896');
  static const x12_920 = X12TransactionSet._('X12_920');
  static const x12_924 = X12TransactionSet._('X12_924');
  static const x12_925 = X12TransactionSet._('X12_925');
  static const x12_926 = X12TransactionSet._('X12_926');
  static const x12_928 = X12TransactionSet._('X12_928');
  static const x12_940 = X12TransactionSet._('X12_940');
  static const x12_943 = X12TransactionSet._('X12_943');
  static const x12_944 = X12TransactionSet._('X12_944');
  static const x12_945 = X12TransactionSet._('X12_945');
  static const x12_947 = X12TransactionSet._('X12_947');
  static const x12_980 = X12TransactionSet._('X12_980');
  static const x12_990 = X12TransactionSet._('X12_990');
  static const x12_993 = X12TransactionSet._('X12_993');
  static const x12_996 = X12TransactionSet._('X12_996');
  static const x12_997 = X12TransactionSet._('X12_997');
  static const x12_998 = X12TransactionSet._('X12_998');
  static const x12_999 = X12TransactionSet._('X12_999');
  static const x12_270x279 = X12TransactionSet._('X12_270_X279');
  static const x12_271x279 = X12TransactionSet._('X12_271_X279');
  static const x12_275x210 = X12TransactionSet._('X12_275_X210');
  static const x12_275x211 = X12TransactionSet._('X12_275_X211');
  static const x12_276x212 = X12TransactionSet._('X12_276_X212');
  static const x12_277x212 = X12TransactionSet._('X12_277_X212');
  static const x12_277x214 = X12TransactionSet._('X12_277_X214');
  static const x12_277x364 = X12TransactionSet._('X12_277_X364');
  static const x12_278x217 = X12TransactionSet._('X12_278_X217');
  static const x12_820x218 = X12TransactionSet._('X12_820_X218');
  static const x12_820x306 = X12TransactionSet._('X12_820_X306');
  static const x12_824x186 = X12TransactionSet._('X12_824_X186');
  static const x12_834x220 = X12TransactionSet._('X12_834_X220');
  static const x12_834x307 = X12TransactionSet._('X12_834_X307');
  static const x12_834x318 = X12TransactionSet._('X12_834_X318');
  static const x12_835x221 = X12TransactionSet._('X12_835_X221');
  static const x12_837x222 = X12TransactionSet._('X12_837_X222');
  static const x12_837x223 = X12TransactionSet._('X12_837_X223');
  static const x12_837x224 = X12TransactionSet._('X12_837_X224');
  static const x12_837x291 = X12TransactionSet._('X12_837_X291');
  static const x12_837x292 = X12TransactionSet._('X12_837_X292');
  static const x12_837x298 = X12TransactionSet._('X12_837_X298');
  static const x12_999x231 = X12TransactionSet._('X12_999_X231');

  final String value;

  const X12TransactionSet._(this.value);

  static const values = [
    x12_100,
    x12_101,
    x12_102,
    x12_103,
    x12_104,
    x12_105,
    x12_106,
    x12_107,
    x12_108,
    x12_109,
    x12_110,
    x12_111,
    x12_112,
    x12_113,
    x12_120,
    x12_121,
    x12_124,
    x12_125,
    x12_126,
    x12_127,
    x12_128,
    x12_129,
    x12_130,
    x12_131,
    x12_132,
    x12_133,
    x12_135,
    x12_138,
    x12_139,
    x12_140,
    x12_141,
    x12_142,
    x12_143,
    x12_144,
    x12_146,
    x12_147,
    x12_148,
    x12_149,
    x12_150,
    x12_151,
    x12_152,
    x12_153,
    x12_154,
    x12_155,
    x12_157,
    x12_158,
    x12_159,
    x12_160,
    x12_161,
    x12_163,
    x12_170,
    x12_175,
    x12_176,
    x12_179,
    x12_180,
    x12_185,
    x12_186,
    x12_187,
    x12_188,
    x12_189,
    x12_190,
    x12_191,
    x12_194,
    x12_195,
    x12_196,
    x12_197,
    x12_198,
    x12_199,
    x12_200,
    x12_201,
    x12_202,
    x12_203,
    x12_204,
    x12_205,
    x12_206,
    x12_210,
    x12_211,
    x12_212,
    x12_213,
    x12_214,
    x12_215,
    x12_216,
    x12_217,
    x12_218,
    x12_219,
    x12_220,
    x12_222,
    x12_223,
    x12_224,
    x12_225,
    x12_227,
    x12_228,
    x12_240,
    x12_242,
    x12_244,
    x12_245,
    x12_248,
    x12_249,
    x12_250,
    x12_251,
    x12_252,
    x12_255,
    x12_256,
    x12_259,
    x12_260,
    x12_261,
    x12_262,
    x12_263,
    x12_264,
    x12_265,
    x12_266,
    x12_267,
    x12_268,
    x12_269,
    x12_270,
    x12_271,
    x12_272,
    x12_273,
    x12_274,
    x12_275,
    x12_276,
    x12_277,
    x12_278,
    x12_280,
    x12_283,
    x12_284,
    x12_285,
    x12_286,
    x12_288,
    x12_290,
    x12_300,
    x12_301,
    x12_303,
    x12_304,
    x12_309,
    x12_310,
    x12_311,
    x12_312,
    x12_313,
    x12_315,
    x12_317,
    x12_319,
    x12_322,
    x12_323,
    x12_324,
    x12_325,
    x12_326,
    x12_350,
    x12_352,
    x12_353,
    x12_354,
    x12_355,
    x12_356,
    x12_357,
    x12_358,
    x12_361,
    x12_362,
    x12_404,
    x12_410,
    x12_412,
    x12_414,
    x12_417,
    x12_418,
    x12_419,
    x12_420,
    x12_421,
    x12_422,
    x12_423,
    x12_424,
    x12_425,
    x12_426,
    x12_429,
    x12_431,
    x12_432,
    x12_433,
    x12_434,
    x12_435,
    x12_436,
    x12_437,
    x12_440,
    x12_451,
    x12_452,
    x12_453,
    x12_455,
    x12_456,
    x12_460,
    x12_463,
    x12_466,
    x12_468,
    x12_470,
    x12_475,
    x12_485,
    x12_486,
    x12_490,
    x12_492,
    x12_494,
    x12_500,
    x12_501,
    x12_503,
    x12_504,
    x12_511,
    x12_517,
    x12_521,
    x12_527,
    x12_536,
    x12_540,
    x12_561,
    x12_567,
    x12_568,
    x12_601,
    x12_602,
    x12_620,
    x12_625,
    x12_650,
    x12_715,
    x12_753,
    x12_754,
    x12_805,
    x12_806,
    x12_810,
    x12_811,
    x12_812,
    x12_813,
    x12_814,
    x12_815,
    x12_816,
    x12_818,
    x12_819,
    x12_820,
    x12_821,
    x12_822,
    x12_823,
    x12_824,
    x12_826,
    x12_827,
    x12_828,
    x12_829,
    x12_830,
    x12_831,
    x12_832,
    x12_833,
    x12_834,
    x12_835,
    x12_836,
    x12_837,
    x12_838,
    x12_839,
    x12_840,
    x12_841,
    x12_842,
    x12_843,
    x12_844,
    x12_845,
    x12_846,
    x12_847,
    x12_848,
    x12_849,
    x12_850,
    x12_851,
    x12_852,
    x12_853,
    x12_854,
    x12_855,
    x12_856,
    x12_857,
    x12_858,
    x12_859,
    x12_860,
    x12_861,
    x12_862,
    x12_863,
    x12_864,
    x12_865,
    x12_866,
    x12_867,
    x12_868,
    x12_869,
    x12_870,
    x12_871,
    x12_872,
    x12_873,
    x12_874,
    x12_875,
    x12_876,
    x12_877,
    x12_878,
    x12_879,
    x12_880,
    x12_881,
    x12_882,
    x12_883,
    x12_884,
    x12_885,
    x12_886,
    x12_887,
    x12_888,
    x12_889,
    x12_891,
    x12_893,
    x12_894,
    x12_895,
    x12_896,
    x12_920,
    x12_924,
    x12_925,
    x12_926,
    x12_928,
    x12_940,
    x12_943,
    x12_944,
    x12_945,
    x12_947,
    x12_980,
    x12_990,
    x12_993,
    x12_996,
    x12_997,
    x12_998,
    x12_999,
    x12_270x279,
    x12_271x279,
    x12_275x210,
    x12_275x211,
    x12_276x212,
    x12_277x212,
    x12_277x214,
    x12_277x364,
    x12_278x217,
    x12_820x218,
    x12_820x306,
    x12_824x186,
    x12_834x220,
    x12_834x307,
    x12_834x318,
    x12_835x221,
    x12_837x222,
    x12_837x223,
    x12_837x224,
    x12_837x291,
    x12_837x292,
    x12_837x298,
    x12_999x231
  ];

  static X12TransactionSet fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => X12TransactionSet._(value));

  @override
  bool operator ==(other) => other is X12TransactionSet && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class X12Version {
  static const version_4010 = X12Version._('VERSION_4010');
  static const version_4030 = X12Version._('VERSION_4030');
  static const version_4050 = X12Version._('VERSION_4050');
  static const version_4060 = X12Version._('VERSION_4060');
  static const version_5010 = X12Version._('VERSION_5010');
  static const version_5010Hipaa = X12Version._('VERSION_5010_HIPAA');

  final String value;

  const X12Version._(this.value);

  static const values = [
    version_4010,
    version_4030,
    version_4050,
    version_4060,
    version_5010,
    version_5010Hipaa
  ];

  static X12Version fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => X12Version._(value));

  @override
  bool operator ==(other) => other is X12Version && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MappingTemplateLanguage {
  static const xslt = MappingTemplateLanguage._('XSLT');
  static const jsonata = MappingTemplateLanguage._('JSONATA');

  final String value;

  const MappingTemplateLanguage._(this.value);

  static const values = [xslt, jsonata];

  static MappingTemplateLanguage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MappingTemplateLanguage._(value));

  @override
  bool operator ==(other) =>
      other is MappingTemplateLanguage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FromFormat {
  static const x12 = FromFormat._('X12');

  final String value;

  const FromFormat._(this.value);

  static const values = [x12];

  static FromFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FromFormat._(value));

  @override
  bool operator ==(other) => other is FromFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Creates a key-value pair for a specific resource. Tags are metadata that you
/// can use to search for and group a resource for various purposes. You can
/// apply tags to capabilities, partnerships, profiles and transformers. A tag
/// key can take more than one value. For example, to group capabilities for
/// accounting purposes, you might create a tag called <code>Group</code> and
/// assign the values <code>Research</code> and <code>Accounting</code> to that
/// group.
///
/// @nodoc
class Tag {
  /// Specifies the name assigned to the tag that you create.
  final String key;

  /// Contains one or more values that you assigned to the key name that you
  /// create.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// Contains the details for a profile. A profile is the mechanism used to
/// create the concept of a private network.
///
/// @nodoc
class ProfileSummary {
  /// Returns the name for the business associated with this profile.
  final String businessName;

  /// Returns the timestamp for creation date and time of the profile.
  final DateTime createdAt;

  /// Returns the display name for profile.
  final String name;

  /// Returns the unique, system-generated identifier for the profile.
  final String profileId;

  /// Returns the name of the logging group.
  final String? logGroupName;

  /// Specifies whether or not logging is enabled for this profile.
  final Logging? logging;

  /// Returns the timestamp that identifies the most recent date and time that the
  /// profile was modified.
  final DateTime? modifiedAt;

  ProfileSummary({
    required this.businessName,
    required this.createdAt,
    required this.name,
    required this.profileId,
    this.logGroupName,
    this.logging,
    this.modifiedAt,
  });

  factory ProfileSummary.fromJson(Map<String, dynamic> json) {
    return ProfileSummary(
      businessName: (json['businessName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      profileId: (json['profileId'] as String?) ?? '',
      logGroupName: json['logGroupName'] as String?,
      logging: (json['logging'] as String?)?.let(Logging.fromString),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final businessName = this.businessName;
    final createdAt = this.createdAt;
    final name = this.name;
    final profileId = this.profileId;
    final logGroupName = this.logGroupName;
    final logging = this.logging;
    final modifiedAt = this.modifiedAt;
    return {
      'businessName': businessName,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'profileId': profileId,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (logging != null) 'logging': logging.value,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// @nodoc
class Logging {
  static const enabled = Logging._('ENABLED');
  static const disabled = Logging._('DISABLED');

  final String value;

  const Logging._(this.value);

  static const values = [enabled, disabled];

  static Logging fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Logging._(value));

  @override
  bool operator ==(other) => other is Logging && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains the details for a partnership. A partnership
/// represents the connection between you and your trading partner. It ties
/// together a profile and one or more trading capabilities.
///
/// @nodoc
class PartnershipSummary {
  /// Returns a timestamp for creation date and time of the partnership.
  final DateTime createdAt;

  /// Returns the unique, system-generated identifier for a partnership.
  final String partnershipId;

  /// Returns the unique, system-generated identifier for the profile connected to
  /// this partnership.
  final String profileId;

  /// Returns one or more capabilities associated with this partnership.
  final List<String>? capabilities;
  final CapabilityOptions? capabilityOptions;

  /// Returns a timestamp that identifies the most recent date and time that the
  /// partnership was modified.
  final DateTime? modifiedAt;

  /// Returns the name of the partnership.
  final String? name;

  /// Returns the unique, system-generated identifier for a trading partner.
  final String? tradingPartnerId;

  PartnershipSummary({
    required this.createdAt,
    required this.partnershipId,
    required this.profileId,
    this.capabilities,
    this.capabilityOptions,
    this.modifiedAt,
    this.name,
    this.tradingPartnerId,
  });

  factory PartnershipSummary.fromJson(Map<String, dynamic> json) {
    return PartnershipSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      partnershipId: (json['partnershipId'] as String?) ?? '',
      profileId: (json['profileId'] as String?) ?? '',
      capabilities: (json['capabilities'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      capabilityOptions: json['capabilityOptions'] != null
          ? CapabilityOptions.fromJson(
              json['capabilityOptions'] as Map<String, dynamic>)
          : null,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      name: json['name'] as String?,
      tradingPartnerId: json['tradingPartnerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final partnershipId = this.partnershipId;
    final profileId = this.profileId;
    final capabilities = this.capabilities;
    final capabilityOptions = this.capabilityOptions;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final tradingPartnerId = this.tradingPartnerId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'partnershipId': partnershipId,
      'profileId': profileId,
      if (capabilities != null) 'capabilities': capabilities,
      if (capabilityOptions != null) 'capabilityOptions': capabilityOptions,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (name != null) 'name': name,
      if (tradingPartnerId != null) 'tradingPartnerId': tradingPartnerId,
    };
  }
}

/// Contains the details for an Outbound EDI capability.
///
/// @nodoc
class CapabilityOptions {
  /// A structure that contains the inbound EDI options for the capability.
  final InboundEdiOptions? inboundEdi;

  /// A structure that contains the outbound EDI options.
  final OutboundEdiOptions? outboundEdi;

  CapabilityOptions({
    this.inboundEdi,
    this.outboundEdi,
  });

  factory CapabilityOptions.fromJson(Map<String, dynamic> json) {
    return CapabilityOptions(
      inboundEdi: json['inboundEdi'] != null
          ? InboundEdiOptions.fromJson(
              json['inboundEdi'] as Map<String, dynamic>)
          : null,
      outboundEdi: json['outboundEdi'] != null
          ? OutboundEdiOptions.fromJson(
              json['outboundEdi'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inboundEdi = this.inboundEdi;
    final outboundEdi = this.outboundEdi;
    return {
      if (inboundEdi != null) 'inboundEdi': inboundEdi,
      if (outboundEdi != null) 'outboundEdi': outboundEdi,
    };
  }
}

/// A container for outbound EDI options.
///
/// @nodoc
class OutboundEdiOptions {
  /// A structure that contains an X12 envelope structure.
  final X12Envelope? x12;

  OutboundEdiOptions({
    this.x12,
  });

  factory OutboundEdiOptions.fromJson(Map<String, dynamic> json) {
    return OutboundEdiOptions(
      x12: json['x12'] != null
          ? X12Envelope.fromJson(json['x12'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final x12 = this.x12;
    return {
      if (x12 != null) 'x12': x12,
    };
  }
}

/// Contains options for processing inbound EDI files. These options allow for
/// customizing how incoming EDI documents are processed.
///
/// @nodoc
class InboundEdiOptions {
  /// A structure that contains X12-specific options for processing inbound X12
  /// EDI files.
  final X12InboundEdiOptions? x12;

  InboundEdiOptions({
    this.x12,
  });

  factory InboundEdiOptions.fromJson(Map<String, dynamic> json) {
    return InboundEdiOptions(
      x12: json['x12'] != null
          ? X12InboundEdiOptions.fromJson(json['x12'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final x12 = this.x12;
    return {
      if (x12 != null) 'x12': x12,
    };
  }
}

/// Contains options specific to processing inbound X12 EDI files.
///
/// @nodoc
class X12InboundEdiOptions {
  /// Specifies acknowledgment options for inbound X12 EDI files. These options
  /// control how functional and technical acknowledgments are handled.
  final X12AcknowledgmentOptions? acknowledgmentOptions;

  X12InboundEdiOptions({
    this.acknowledgmentOptions,
  });

  factory X12InboundEdiOptions.fromJson(Map<String, dynamic> json) {
    return X12InboundEdiOptions(
      acknowledgmentOptions: json['acknowledgmentOptions'] != null
          ? X12AcknowledgmentOptions.fromJson(
              json['acknowledgmentOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgmentOptions = this.acknowledgmentOptions;
    return {
      if (acknowledgmentOptions != null)
        'acknowledgmentOptions': acknowledgmentOptions,
    };
  }
}

/// Contains options for configuring X12 acknowledgments. These options control
/// how functional and technical acknowledgments are handled.
///
/// @nodoc
class X12AcknowledgmentOptions {
  /// Specifies whether functional acknowledgments (997/999) should be generated
  /// for incoming X12 transactions. Valid values are
  /// <code>DO_NOT_GENERATE</code>, <code>GENERATE_ALL_SEGMENTS</code> and
  /// <code>GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP</code>.
  ///
  /// If you choose <code>GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP</code>,
  /// Amazon Web Services B2B Data Interchange skips the AK2_Loop when generating
  /// an acknowledgment document.
  final X12FunctionalAcknowledgment functionalAcknowledgment;

  /// Specifies whether technical acknowledgments (TA1) should be generated for
  /// incoming X12 interchanges. Valid values are <code>DO_NOT_GENERATE</code> and
  /// <code>GENERATE_ALL_SEGMENTS</code> and.
  final X12TechnicalAcknowledgment technicalAcknowledgment;

  X12AcknowledgmentOptions({
    required this.functionalAcknowledgment,
    required this.technicalAcknowledgment,
  });

  factory X12AcknowledgmentOptions.fromJson(Map<String, dynamic> json) {
    return X12AcknowledgmentOptions(
      functionalAcknowledgment: X12FunctionalAcknowledgment.fromString(
          (json['functionalAcknowledgment'] as String?) ?? ''),
      technicalAcknowledgment: X12TechnicalAcknowledgment.fromString(
          (json['technicalAcknowledgment'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final functionalAcknowledgment = this.functionalAcknowledgment;
    final technicalAcknowledgment = this.technicalAcknowledgment;
    return {
      'functionalAcknowledgment': functionalAcknowledgment.value,
      'technicalAcknowledgment': technicalAcknowledgment.value,
    };
  }
}

/// @nodoc
class X12FunctionalAcknowledgment {
  static const doNotGenerate = X12FunctionalAcknowledgment._('DO_NOT_GENERATE');
  static const generateAllSegments =
      X12FunctionalAcknowledgment._('GENERATE_ALL_SEGMENTS');
  static const generateWithoutTransactionSetResponseLoop =
      X12FunctionalAcknowledgment._(
          'GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP');

  final String value;

  const X12FunctionalAcknowledgment._(this.value);

  static const values = [
    doNotGenerate,
    generateAllSegments,
    generateWithoutTransactionSetResponseLoop
  ];

  static X12FunctionalAcknowledgment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => X12FunctionalAcknowledgment._(value));

  @override
  bool operator ==(other) =>
      other is X12FunctionalAcknowledgment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class X12TechnicalAcknowledgment {
  static const doNotGenerate = X12TechnicalAcknowledgment._('DO_NOT_GENERATE');
  static const generateAllSegments =
      X12TechnicalAcknowledgment._('GENERATE_ALL_SEGMENTS');

  final String value;

  const X12TechnicalAcknowledgment._(this.value);

  static const values = [doNotGenerate, generateAllSegments];

  static X12TechnicalAcknowledgment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => X12TechnicalAcknowledgment._(value));

  @override
  bool operator ==(other) =>
      other is X12TechnicalAcknowledgment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A wrapper structure for an X12 definition object.
///
/// the X12 envelope ensures the integrity of the data and the efficiency of the
/// information exchange. The X12 message structure has hierarchical levels.
/// From highest to the lowest, they are:
///
/// <ul>
/// <li>
/// Interchange Envelope
/// </li>
/// <li>
/// Functional Group
/// </li>
/// <li>
/// Transaction Set
/// </li>
/// </ul>
///
/// @nodoc
class X12Envelope {
  /// A container for the X12 outbound EDI headers.
  final X12OutboundEdiHeaders? common;
  final WrapOptions? wrapOptions;

  X12Envelope({
    this.common,
    this.wrapOptions,
  });

  factory X12Envelope.fromJson(Map<String, dynamic> json) {
    return X12Envelope(
      common: json['common'] != null
          ? X12OutboundEdiHeaders.fromJson(
              json['common'] as Map<String, dynamic>)
          : null,
      wrapOptions: json['wrapOptions'] != null
          ? WrapOptions.fromJson(json['wrapOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final common = this.common;
    final wrapOptions = this.wrapOptions;
    return {
      if (common != null) 'common': common,
      if (wrapOptions != null) 'wrapOptions': wrapOptions,
    };
  }
}

/// A structure containing the details for an outbound EDI object.
///
/// @nodoc
class X12OutboundEdiHeaders {
  /// Specifies control number configuration for outbound X12 EDI headers. These
  /// settings determine the starting values for interchange, functional group,
  /// and transaction set control numbers.
  final X12ControlNumbers? controlNumbers;

  /// The delimiters, for example semicolon (<code>;</code>), that separates
  /// sections of the headers for the X12 object.
  final X12Delimiters? delimiters;

  /// The functional group headers for the X12 object.
  final X12FunctionalGroupHeaders? functionalGroupHeaders;
  final X12GS05TimeFormat? gs05TimeFormat;

  /// In X12 EDI messages, delimiters are used to mark the end of segments or
  /// elements, and are defined in the interchange control header.
  final X12InterchangeControlHeaders? interchangeControlHeaders;

  /// Specifies whether or not to validate the EDI for this X12 object:
  /// <code>TRUE</code> or <code>FALSE</code>. When enabled, this performs both
  /// standard EDI validation and applies any configured custom validation rules
  /// including element length constraints, code list validations, and element
  /// requirement checks. Validation results are returned in the response
  /// validation messages.
  final bool? validateEdi;

  X12OutboundEdiHeaders({
    this.controlNumbers,
    this.delimiters,
    this.functionalGroupHeaders,
    this.gs05TimeFormat,
    this.interchangeControlHeaders,
    this.validateEdi,
  });

  factory X12OutboundEdiHeaders.fromJson(Map<String, dynamic> json) {
    return X12OutboundEdiHeaders(
      controlNumbers: json['controlNumbers'] != null
          ? X12ControlNumbers.fromJson(
              json['controlNumbers'] as Map<String, dynamic>)
          : null,
      delimiters: json['delimiters'] != null
          ? X12Delimiters.fromJson(json['delimiters'] as Map<String, dynamic>)
          : null,
      functionalGroupHeaders: json['functionalGroupHeaders'] != null
          ? X12FunctionalGroupHeaders.fromJson(
              json['functionalGroupHeaders'] as Map<String, dynamic>)
          : null,
      gs05TimeFormat: (json['gs05TimeFormat'] as String?)
          ?.let(X12GS05TimeFormat.fromString),
      interchangeControlHeaders: json['interchangeControlHeaders'] != null
          ? X12InterchangeControlHeaders.fromJson(
              json['interchangeControlHeaders'] as Map<String, dynamic>)
          : null,
      validateEdi: json['validateEdi'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlNumbers = this.controlNumbers;
    final delimiters = this.delimiters;
    final functionalGroupHeaders = this.functionalGroupHeaders;
    final gs05TimeFormat = this.gs05TimeFormat;
    final interchangeControlHeaders = this.interchangeControlHeaders;
    final validateEdi = this.validateEdi;
    return {
      if (controlNumbers != null) 'controlNumbers': controlNumbers,
      if (delimiters != null) 'delimiters': delimiters,
      if (functionalGroupHeaders != null)
        'functionalGroupHeaders': functionalGroupHeaders,
      if (gs05TimeFormat != null) 'gs05TimeFormat': gs05TimeFormat.value,
      if (interchangeControlHeaders != null)
        'interchangeControlHeaders': interchangeControlHeaders,
      if (validateEdi != null) 'validateEdi': validateEdi,
    };
  }
}

/// Contains options for wrapping (line folding) in X12 EDI files. Wrapping
/// controls how long lines are handled in the EDI output.
///
/// @nodoc
class WrapOptions {
  /// Specifies the method used for wrapping lines in the EDI output. Valid
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>SEGMENT</code>: Wraps by segment.
  /// </li>
  /// <li>
  /// <code>ONE_LINE</code>: Indicates that the entire content is on a single
  /// line.
  /// <note>
  /// When you specify <code>ONE_LINE</code>, do not provide either the line
  /// length nor the line terminator value.
  /// </note> </li>
  /// <li>
  /// <code>LINE_LENGTH</code>: Wraps by character count, as specified by
  /// <code>lineLength</code> value.
  /// </li>
  /// </ul>
  final WrapFormat wrapBy;

  /// Specifies the maximum length of a line before wrapping occurs. This value is
  /// used when <code>wrapBy</code> is set to <code>LINE_LENGTH</code>.
  final int? lineLength;

  /// Specifies the character sequence used to terminate lines when wrapping.
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>CRLF</code>: carriage return and line feed
  /// </li>
  /// <li>
  /// <code>LF</code>: line feed)
  /// </li>
  /// <li>
  /// <code>CR</code>: carriage return
  /// </li>
  /// </ul>
  final LineTerminator? lineTerminator;

  WrapOptions({
    required this.wrapBy,
    this.lineLength,
    this.lineTerminator,
  });

  factory WrapOptions.fromJson(Map<String, dynamic> json) {
    return WrapOptions(
      wrapBy: WrapFormat.fromString((json['wrapBy'] as String?) ?? ''),
      lineLength: json['lineLength'] as int?,
      lineTerminator:
          (json['lineTerminator'] as String?)?.let(LineTerminator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final wrapBy = this.wrapBy;
    final lineLength = this.lineLength;
    final lineTerminator = this.lineTerminator;
    return {
      'wrapBy': wrapBy.value,
      if (lineLength != null) 'lineLength': lineLength,
      if (lineTerminator != null) 'lineTerminator': lineTerminator.value,
    };
  }
}

/// @nodoc
class WrapFormat {
  static const segment = WrapFormat._('SEGMENT');
  static const oneLine = WrapFormat._('ONE_LINE');
  static const lineLength = WrapFormat._('LINE_LENGTH');

  final String value;

  const WrapFormat._(this.value);

  static const values = [segment, oneLine, lineLength];

  static WrapFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => WrapFormat._(value));

  @override
  bool operator ==(other) => other is WrapFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LineTerminator {
  static const crlf = LineTerminator._('CRLF');
  static const lf = LineTerminator._('LF');
  static const cr = LineTerminator._('CR');

  final String value;

  const LineTerminator._(this.value);

  static const values = [crlf, lf, cr];

  static LineTerminator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LineTerminator._(value));

  @override
  bool operator ==(other) => other is LineTerminator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// In X12, the Interchange Control Header is the first segment of an EDI
/// document and is part of the Interchange Envelope. It contains information
/// about the sender and receiver, the date and time of transmission, and the
/// X12 version being used. It also includes delivery information, such as the
/// sender and receiver IDs.
///
/// @nodoc
class X12InterchangeControlHeaders {
  /// Located at position ISA-14 in the header. The value "1" indicates that the
  /// sender is requesting an interchange acknowledgment at receipt of the
  /// interchange. The value "0" is used otherwise.
  final String? acknowledgmentRequestedCode;

  /// Located at position ISA-08 in the header. This value (along with the
  /// <code>receiverIdQualifier</code>) identifies the intended recipient of the
  /// interchange.
  final String? receiverId;

  /// Located at position ISA-07 in the header. Qualifier for the receiver ID.
  /// Together, the ID and qualifier uniquely identify the receiving trading
  /// partner.
  final String? receiverIdQualifier;

  /// Located at position ISA-11 in the header. This string makes it easier when
  /// you need to group similar adjacent element values together without using
  /// extra segments.
  /// <note>
  /// This parameter is only honored for version greater than 401
  /// (<code>VERSION_4010</code> and higher).
  ///
  /// For versions less than 401, this field is called <a
  /// href="https://www.stedi.com/edi/x12-004010/segment/ISA#ISA-11">StandardsId</a>,
  /// in which case our service sets the value to <code>U</code>.
  /// </note>
  final String? repetitionSeparator;

  /// Located at position ISA-06 in the header. This value (along with the
  /// <code>senderIdQualifier</code>) identifies the sender of the interchange.
  final String? senderId;

  /// Located at position ISA-05 in the header. Qualifier for the sender ID.
  /// Together, the ID and qualifier uniquely identify the sending trading
  /// partner.
  final String? senderIdQualifier;

  /// Located at position ISA-15 in the header. Specifies how this interchange is
  /// being used:
  ///
  /// <ul>
  /// <li>
  /// <code>T</code> indicates this interchange is for testing.
  /// </li>
  /// <li>
  /// <code>P</code> indicates this interchange is for production.
  /// </li>
  /// <li>
  /// <code>I</code> indicates this interchange is informational.
  /// </li>
  /// </ul>
  final String? usageIndicatorCode;

  X12InterchangeControlHeaders({
    this.acknowledgmentRequestedCode,
    this.receiverId,
    this.receiverIdQualifier,
    this.repetitionSeparator,
    this.senderId,
    this.senderIdQualifier,
    this.usageIndicatorCode,
  });

  factory X12InterchangeControlHeaders.fromJson(Map<String, dynamic> json) {
    return X12InterchangeControlHeaders(
      acknowledgmentRequestedCode:
          json['acknowledgmentRequestedCode'] as String?,
      receiverId: json['receiverId'] as String?,
      receiverIdQualifier: json['receiverIdQualifier'] as String?,
      repetitionSeparator: json['repetitionSeparator'] as String?,
      senderId: json['senderId'] as String?,
      senderIdQualifier: json['senderIdQualifier'] as String?,
      usageIndicatorCode: json['usageIndicatorCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgmentRequestedCode = this.acknowledgmentRequestedCode;
    final receiverId = this.receiverId;
    final receiverIdQualifier = this.receiverIdQualifier;
    final repetitionSeparator = this.repetitionSeparator;
    final senderId = this.senderId;
    final senderIdQualifier = this.senderIdQualifier;
    final usageIndicatorCode = this.usageIndicatorCode;
    return {
      if (acknowledgmentRequestedCode != null)
        'acknowledgmentRequestedCode': acknowledgmentRequestedCode,
      if (receiverId != null) 'receiverId': receiverId,
      if (receiverIdQualifier != null)
        'receiverIdQualifier': receiverIdQualifier,
      if (repetitionSeparator != null)
        'repetitionSeparator': repetitionSeparator,
      if (senderId != null) 'senderId': senderId,
      if (senderIdQualifier != null) 'senderIdQualifier': senderIdQualifier,
      if (usageIndicatorCode != null) 'usageIndicatorCode': usageIndicatorCode,
    };
  }
}

/// Part of the X12 message structure. These are the functional group headers
/// for the X12 EDI object.
///
/// @nodoc
class X12FunctionalGroupHeaders {
  /// A value representing the code used to identify the party receiving a
  /// message, at position GS-03.
  final String? applicationReceiverCode;

  /// A value representing the code used to identify the party transmitting a
  /// message, at position GS-02.
  final String? applicationSenderCode;

  /// A code that identifies the issuer of the standard, at position GS-07.
  final String? responsibleAgencyCode;

  X12FunctionalGroupHeaders({
    this.applicationReceiverCode,
    this.applicationSenderCode,
    this.responsibleAgencyCode,
  });

  factory X12FunctionalGroupHeaders.fromJson(Map<String, dynamic> json) {
    return X12FunctionalGroupHeaders(
      applicationReceiverCode: json['applicationReceiverCode'] as String?,
      applicationSenderCode: json['applicationSenderCode'] as String?,
      responsibleAgencyCode: json['responsibleAgencyCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationReceiverCode = this.applicationReceiverCode;
    final applicationSenderCode = this.applicationSenderCode;
    final responsibleAgencyCode = this.responsibleAgencyCode;
    return {
      if (applicationReceiverCode != null)
        'applicationReceiverCode': applicationReceiverCode,
      if (applicationSenderCode != null)
        'applicationSenderCode': applicationSenderCode,
      if (responsibleAgencyCode != null)
        'responsibleAgencyCode': responsibleAgencyCode,
    };
  }
}

/// In X12 EDI messages, delimiters are used to mark the end of segments or
/// elements, and are defined in the interchange control header. The delimiters
/// are part of the message's syntax and divide up its different elements.
///
/// @nodoc
class X12Delimiters {
  /// The component, or sub-element, separator. The default value is
  /// <code>:</code> (colon).
  final String? componentSeparator;

  /// The data element separator. The default value is <code>*</code> (asterisk).
  final String? dataElementSeparator;

  /// The segment terminator. The default value is <code>~</code> (tilde).
  final String? segmentTerminator;

  X12Delimiters({
    this.componentSeparator,
    this.dataElementSeparator,
    this.segmentTerminator,
  });

  factory X12Delimiters.fromJson(Map<String, dynamic> json) {
    return X12Delimiters(
      componentSeparator: json['componentSeparator'] as String?,
      dataElementSeparator: json['dataElementSeparator'] as String?,
      segmentTerminator: json['segmentTerminator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentSeparator = this.componentSeparator;
    final dataElementSeparator = this.dataElementSeparator;
    final segmentTerminator = this.segmentTerminator;
    return {
      if (componentSeparator != null) 'componentSeparator': componentSeparator,
      if (dataElementSeparator != null)
        'dataElementSeparator': dataElementSeparator,
      if (segmentTerminator != null) 'segmentTerminator': segmentTerminator,
    };
  }
}

/// Contains configuration for X12 control numbers used in X12 EDI generation.
/// Control numbers are used to uniquely identify interchanges, functional
/// groups, and transaction sets.
///
/// @nodoc
class X12ControlNumbers {
  /// Specifies the starting functional group control number (GS06) to use for X12
  /// EDI generation. This number is incremented for each new functional group.
  /// For the GS (functional group) envelope, Amazon Web Services B2B Data
  /// Interchange generates a functional group control number that is unique to
  /// the sender ID, receiver ID, and functional identifier code combination.
  final int? startingFunctionalGroupControlNumber;

  /// Specifies the starting interchange control number (ISA13) to use for X12 EDI
  /// generation. This number is incremented for each new interchange. For the ISA
  /// (interchange) envelope, Amazon Web Services B2B Data Interchange generates
  /// an interchange control number that is unique for the ISA05 and ISA06
  /// (sender) &amp; ISA07 and ISA08 (receiver) combination.
  final int? startingInterchangeControlNumber;

  /// Specifies the starting transaction set control number (ST02) to use for X12
  /// EDI generation. This number is incremented for each new transaction set.
  final int? startingTransactionSetControlNumber;

  X12ControlNumbers({
    this.startingFunctionalGroupControlNumber,
    this.startingInterchangeControlNumber,
    this.startingTransactionSetControlNumber,
  });

  factory X12ControlNumbers.fromJson(Map<String, dynamic> json) {
    return X12ControlNumbers(
      startingFunctionalGroupControlNumber:
          json['startingFunctionalGroupControlNumber'] as int?,
      startingInterchangeControlNumber:
          json['startingInterchangeControlNumber'] as int?,
      startingTransactionSetControlNumber:
          json['startingTransactionSetControlNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final startingFunctionalGroupControlNumber =
        this.startingFunctionalGroupControlNumber;
    final startingInterchangeControlNumber =
        this.startingInterchangeControlNumber;
    final startingTransactionSetControlNumber =
        this.startingTransactionSetControlNumber;
    return {
      if (startingFunctionalGroupControlNumber != null)
        'startingFunctionalGroupControlNumber':
            startingFunctionalGroupControlNumber,
      if (startingInterchangeControlNumber != null)
        'startingInterchangeControlNumber': startingInterchangeControlNumber,
      if (startingTransactionSetControlNumber != null)
        'startingTransactionSetControlNumber':
            startingTransactionSetControlNumber,
    };
  }
}

/// Specifies the time format in the GS05 element (time) of the functional group
/// header. The following formats use 24-hour clock time:
///
/// <ul>
/// <li>
/// <code>HHMM</code> - Hours and minutes
/// </li>
/// <li>
/// <code>HHMMSS</code> - Hours, minutes, and seconds
/// </li>
/// <li>
/// <code>HHMMSSDD</code> - Hours, minutes, seconds, and decimal seconds
/// </li>
/// </ul>
/// Where:
///
/// <ul>
/// <li>
/// <code>HH</code> - Hours (00-23)
/// </li>
/// <li>
/// <code>MM</code> - Minutes (00-59)
/// </li>
/// <li>
/// <code>SS</code> - Seconds (00-59)
/// </li>
/// <li>
/// <code>DD</code> - Hundredths of seconds (00-99)
/// </li>
/// </ul>
///
/// @nodoc
class X12GS05TimeFormat {
  static const hhmm = X12GS05TimeFormat._('HHMM');
  static const hhmmss = X12GS05TimeFormat._('HHMMSS');
  static const hhmmssdd = X12GS05TimeFormat._('HHMMSSDD');

  final String value;

  const X12GS05TimeFormat._(this.value);

  static const values = [hhmm, hhmmss, hhmmssdd];

  static X12GS05TimeFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => X12GS05TimeFormat._(value));

  @override
  bool operator ==(other) => other is X12GS05TimeFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Returns the capability summary details. A trading capability contains the
/// information required to transform incoming EDI documents into JSON or XML
/// outputs.
///
/// @nodoc
class CapabilitySummary {
  /// Returns a system-assigned unique identifier for the capability.
  final String capabilityId;

  /// Returns a timestamp for creation date and time of the capability.
  final DateTime createdAt;

  /// The display name of the capability.
  final String name;

  /// Returns the type of the capability. Currently, only <code>edi</code> is
  /// supported.
  final CapabilityType type;

  /// Returns a timestamp that identifies the most recent date and time that the
  /// capability was modified.
  final DateTime? modifiedAt;

  CapabilitySummary({
    required this.capabilityId,
    required this.createdAt,
    required this.name,
    required this.type,
    this.modifiedAt,
  });

  factory CapabilitySummary.fromJson(Map<String, dynamic> json) {
    return CapabilitySummary(
      capabilityId: (json['capabilityId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      type: CapabilityType.fromString((json['type'] as String?) ?? ''),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilityId = this.capabilityId;
    final createdAt = this.createdAt;
    final name = this.name;
    final type = this.type;
    final modifiedAt = this.modifiedAt;
    return {
      'capabilityId': capabilityId,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'type': type.value,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// @nodoc
class CapabilityType {
  static const edi = CapabilityType._('edi');

  final String value;

  const CapabilityType._(this.value);

  static const values = [edi];

  static CapabilityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapabilityType._(value));

  @override
  bool operator ==(other) => other is CapabilityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A capability object. Currently, only EDI (electronic data interchange)
/// capabilities are supported. A trading capability contains the information
/// required to transform incoming EDI documents into JSON or XML outputs.
///
/// @nodoc
class CapabilityConfiguration {
  /// An EDI (electronic data interchange) configuration object.
  final EdiConfiguration? edi;

  CapabilityConfiguration({
    this.edi,
  });

  factory CapabilityConfiguration.fromJson(Map<String, dynamic> json) {
    return CapabilityConfiguration(
      edi: json['edi'] != null
          ? EdiConfiguration.fromJson(json['edi'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final edi = this.edi;
    return {
      if (edi != null) 'edi': edi,
    };
  }
}

/// Specifies the details for the Amazon S3 file location that is being used
/// with Amazon Web Services B2B Data Interchange. File locations in Amazon S3
/// are identified using a combination of the bucket and key.
///
/// @nodoc
class S3Location {
  /// Specifies the name of the Amazon S3 bucket.
  final String? bucketName;

  /// Specifies the Amazon S3 key for the file location.
  final String? key;

  S3Location({
    this.bucketName,
    this.key,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucketName: json['bucketName'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final key = this.key;
    return {
      if (bucketName != null) 'bucketName': bucketName,
      if (key != null) 'key': key,
    };
  }
}

/// Specifies the details for the EDI (electronic data interchange)
/// transformation.
///
/// @nodoc
class EdiConfiguration {
  /// Contains the Amazon S3 bucket and prefix for the location of the input file,
  /// which is contained in an <code>S3Location</code> object.
  final S3Location inputLocation;

  /// Contains the Amazon S3 bucket and prefix for the location of the output
  /// file, which is contained in an <code>S3Location</code> object.
  final S3Location outputLocation;

  /// Returns the system-assigned unique identifier for the transformer.
  final String transformerId;

  /// Returns the type of the capability. Currently, only <code>edi</code> is
  /// supported.
  final EdiType type;

  /// Specifies whether this is capability is for inbound or outbound
  /// transformations.
  final CapabilityDirection? capabilityDirection;

  EdiConfiguration({
    required this.inputLocation,
    required this.outputLocation,
    required this.transformerId,
    required this.type,
    this.capabilityDirection,
  });

  factory EdiConfiguration.fromJson(Map<String, dynamic> json) {
    return EdiConfiguration(
      inputLocation: S3Location.fromJson(
          (json['inputLocation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      outputLocation: S3Location.fromJson(
          (json['outputLocation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      transformerId: (json['transformerId'] as String?) ?? '',
      type: EdiType.fromJson(
          (json['type'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      capabilityDirection: (json['capabilityDirection'] as String?)
          ?.let(CapabilityDirection.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final inputLocation = this.inputLocation;
    final outputLocation = this.outputLocation;
    final transformerId = this.transformerId;
    final type = this.type;
    final capabilityDirection = this.capabilityDirection;
    return {
      'inputLocation': inputLocation,
      'outputLocation': outputLocation,
      'transformerId': transformerId,
      'type': type,
      if (capabilityDirection != null)
        'capabilityDirection': capabilityDirection.value,
    };
  }
}

/// @nodoc
class CapabilityDirection {
  static const inbound = CapabilityDirection._('INBOUND');
  static const outbound = CapabilityDirection._('OUTBOUND');

  final String value;

  const CapabilityDirection._(this.value);

  static const values = [inbound, outbound];

  static CapabilityDirection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapabilityDirection._(value));

  @override
  bool operator ==(other) =>
      other is CapabilityDirection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the input for an outbound transformation.
///
/// @nodoc
class ConversionSource {
  /// The format for the input file: either JSON or XML.
  final ConversionSourceFormat fileFormat;

  /// File to be converted
  final InputFileSource inputFile;

  ConversionSource({
    required this.fileFormat,
    required this.inputFile,
  });

  Map<String, dynamic> toJson() {
    final fileFormat = this.fileFormat;
    final inputFile = this.inputFile;
    return {
      'fileFormat': fileFormat.value,
      'inputFile': inputFile,
    };
  }
}

/// Provide a sample of what the output of the transformation should look like.
///
/// @nodoc
class ConversionTarget {
  /// Currently, only X12 format is supported.
  final ConversionTargetFormat fileFormat;
  final AdvancedOptions? advancedOptions;

  /// A structure that contains the formatting details for the conversion target.
  final ConversionTargetFormatDetails? formatDetails;

  /// Customer uses this to provide a sample on what should file look like after
  /// conversion X12 EDI use case around this would be discovering the file syntax
  final OutputSampleFileSource? outputSampleFile;

  ConversionTarget({
    required this.fileFormat,
    this.advancedOptions,
    this.formatDetails,
    this.outputSampleFile,
  });

  Map<String, dynamic> toJson() {
    final fileFormat = this.fileFormat;
    final advancedOptions = this.advancedOptions;
    final formatDetails = this.formatDetails;
    final outputSampleFile = this.outputSampleFile;
    return {
      'fileFormat': fileFormat.value,
      if (advancedOptions != null) 'advancedOptions': advancedOptions,
      if (formatDetails != null) 'formatDetails': formatDetails,
      if (outputSampleFile != null) 'outputSampleFile': outputSampleFile,
    };
  }
}

/// @nodoc
class ConversionTargetFormat {
  static const x12 = ConversionTargetFormat._('X12');

  final String value;

  const ConversionTargetFormat._(this.value);

  static const values = [x12];

  static ConversionTargetFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConversionTargetFormat._(value));

  @override
  bool operator ==(other) =>
      other is ConversionTargetFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains a structure describing the X12 details for the conversion target.
///
/// @nodoc
class ConversionTargetFormatDetails {
  final X12Details? x12;

  ConversionTargetFormatDetails({
    this.x12,
  });

  Map<String, dynamic> toJson() {
    final x12 = this.x12;
    return {
      if (x12 != null) 'x12': x12,
    };
  }
}

/// Container for the location of a sample file used for outbound
/// transformations.
///
/// @nodoc
class OutputSampleFileSource {
  final S3Location? fileLocation;

  OutputSampleFileSource({
    this.fileLocation,
  });

  Map<String, dynamic> toJson() {
    final fileLocation = this.fileLocation;
    return {
      if (fileLocation != null) 'fileLocation': fileLocation,
    };
  }
}

/// @nodoc
class ConversionSourceFormat {
  static const json = ConversionSourceFormat._('JSON');
  static const xml = ConversionSourceFormat._('XML');

  final String value;

  const ConversionSourceFormat._(this.value);

  static const values = [json, xml];

  static ConversionSourceFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConversionSourceFormat._(value));

  @override
  bool operator ==(other) =>
      other is ConversionSourceFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The input file to use for an outbound transformation.
///
/// @nodoc
class InputFileSource {
  /// Specify the input contents, as a string, for the source of an outbound
  /// transformation.
  final String? fileContent;

  InputFileSource({
    this.fileContent,
  });

  Map<String, dynamic> toJson() {
    final fileContent = this.fileContent;
    return {
      if (fileContent != null) 'fileContent': fileContent,
    };
  }
}

/// @nodoc
class TransformerJobStatus {
  static const running = TransformerJobStatus._('running');
  static const succeeded = TransformerJobStatus._('succeeded');
  static const failed = TransformerJobStatus._('failed');

  final String value;

  const TransformerJobStatus._(this.value);

  static const values = [running, succeeded, failed];

  static TransformerJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TransformerJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is TransformerJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MappingType {
  static const jsonata = MappingType._('JSONATA');
  static const xslt = MappingType._('XSLT');

  final String value;

  const MappingType._(this.value);

  static const values = [jsonata, xslt];

  static MappingType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MappingType._(value));

  @override
  bool operator ==(other) => other is MappingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A data structure that contains the information to use when generating a
/// mapping template.
///
/// @nodoc
class TemplateDetails {
  final X12Details? x12;

  TemplateDetails({
    this.x12,
  });

  Map<String, dynamic> toJson() {
    final x12 = this.x12;
    return {
      if (x12 != null) 'x12': x12,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
