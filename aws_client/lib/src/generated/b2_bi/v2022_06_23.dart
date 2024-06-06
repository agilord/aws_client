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
class B2BI {
  final _s.JsonProtocol _protocol;
  B2BI({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'b2bi',
            signingName: 'b2bi',
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

  /// Instantiates a capability based on the specified parameters. A trading
  /// capability contains the information required to transform incoming EDI
  /// documents into JSON or XML outputs.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
        'type': type.toValue(),
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (instructionsDocuments != null)
          'instructionsDocuments': instructionsDocuments,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateCapabilityResponse.fromJson(jsonResponse.body);
  }

  /// Creates a partnership between a customer and a trading partner, based on
  /// the supplied parameters. A partnership represents the connection between
  /// you and your trading partner. It ties together a profile and one or more
  /// trading capabilities.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
  /// Parameter [capabilities] :
  /// Specifies a list of the capabilities associated with this partnership.
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
    required String email,
    required String name,
    required String profileId,
    List<String>? capabilities,
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
        'email': email,
        'name': name,
        'profileId': profileId,
        if (capabilities != null) 'capabilities': capabilities,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (phone != null) 'phone': phone,
        if (tags != null) 'tags': tags,
      },
    );

    return CreatePartnershipResponse.fromJson(jsonResponse.body);
  }

  /// Creates a customer profile. You can have up to five customer profiles,
  /// each representing a distinct private network. A profile is the mechanism
  /// used to create the concept of a private network.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
        'logging': logging.toValue(),
        'name': name,
        'phone': phone,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (email != null) 'email': email,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateProfileResponse.fromJson(jsonResponse.body);
  }

  /// Creates a transformer. A transformer describes how to process the incoming
  /// EDI documents and extract the necessary information to the output file.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
  /// Parameter [mappingTemplate] :
  /// Specifies the mapping template for the transformer. This template is used
  /// to map the parsed EDI file using JSONata or XSLT.
  ///
  /// Parameter [name] :
  /// Specifies the name of the transformer, used to identify it.
  ///
  /// Parameter [clientToken] :
  /// Reserved for future use.
  ///
  /// Parameter [sampleDocument] :
  /// Specifies a sample EDI document that is used by a transformer as a guide
  /// for processing the EDI data.
  ///
  /// Parameter [tags] :
  /// Specifies the key-value pairs assigned to ARNs that you can use to group
  /// and search for resources by type. You can attach this metadata to
  /// resources (capabilities, partnerships, and so on) for any purpose.
  Future<CreateTransformerResponse> createTransformer({
    required EdiType ediType,
    required FileFormat fileFormat,
    required String mappingTemplate,
    required String name,
    String? clientToken,
    String? sampleDocument,
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
        'ediType': ediType,
        'fileFormat': fileFormat.toValue(),
        'mappingTemplate': mappingTemplate,
        'name': name,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (sampleDocument != null) 'sampleDocument': sampleDocument,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateTransformerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified capability. A trading capability contains the
  /// information required to transform incoming EDI documents into JSON or XML
  /// outputs.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Deletes the specified partnership. A partnership represents the connection
  /// between you and your trading partner. It ties together a profile and one
  /// or more trading capabilities.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Deletes the specified profile. A profile is the mechanism used to create
  /// the concept of a private network.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Deletes the specified transformer. A transformer describes how to process
  /// the incoming EDI documents and extract the necessary information to the
  /// output file.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Retrieves the details for the specified capability. A trading capability
  /// contains the information required to transform incoming EDI documents into
  /// JSON or XML outputs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Retrieves the details for a partnership, based on the partner and profile
  /// IDs specified. A partnership represents the connection between you and
  /// your trading partner. It ties together a profile and one or more trading
  /// capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Retrieves the details for the profile specified by the profile ID. A
  /// profile is the mechanism used to create the concept of a private network.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Retrieves the details for the transformer specified by the transformer ID.
  /// A transformer describes how to process the incoming EDI documents and
  /// extract the necessary information to the output file.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Returns the details of the transformer run, based on the Transformer job
  /// ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Lists the capabilities associated with your Amazon Web Services account
  /// for your current or specified region. A trading capability contains the
  /// information required to transform incoming EDI documents into JSON or XML
  /// outputs.
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

  /// Lists the partnerships associated with your Amazon Web Services account
  /// for your current or specified region. A partnership represents the
  /// connection between you and your trading partner. It ties together a
  /// profile and one or more trading capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Lists the profiles associated with your Amazon Web Services account for
  /// your current or specified region. A profile is the mechanism used to
  /// create the concept of a private network.
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

  /// Lists all of the tags associated with the Amazon Resource Name (ARN) that
  /// you specify. The resource can be a capability, partnership, profile, or
  /// transformer.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Lists the available transformers. A transformer describes how to process
  /// the incoming EDI documents and extract the necessary information to the
  /// output file.
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

  /// Runs a job, using a transformer, to parse input EDI (electronic data
  /// interchange) file into the output structures used by Amazon Web Services
  /// B2BI Data Interchange.
  ///
  /// If you only want to transform EDI (electronic data interchange) documents,
  /// you don't need to create profiles, partnerships or capabilities. Just
  /// create and configure a transformer, and then run the
  /// <code>StartTransformerJob</code> API to process your files.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Maps the input file according to the provided template file. The API call
  /// downloads the file contents from the Amazon S3 location, and passes the
  /// contents in as a string, to the <code>inputFileContent</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
        'fileFormat': fileFormat.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
  Future<TestParsingResponse> testParsing({
    required EdiType ediType,
    required FileFormat fileFormat,
    required S3Location inputFile,
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
        'fileFormat': fileFormat.toValue(),
        'inputFile': inputFile,
      },
    );

    return TestParsingResponse.fromJson(jsonResponse.body);
  }

  /// Detaches a key-value pair from the specified resource, as identified by
  /// its Amazon Resource Name (ARN). Resources are capability, partnership,
  /// profile, transformers and other entities.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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

  /// Updates some of the parameters for a capability, based on the specified
  /// parameters. A trading capability contains the information required to
  /// transform incoming EDI documents into JSON or XML outputs.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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

  /// Updates some of the parameters for a partnership between a customer and
  /// trading partner. A partnership represents the connection between you and
  /// your trading partner. It ties together a profile and one or more trading
  /// capabilities.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [partnershipId] :
  /// Specifies the unique, system-generated identifier for a partnership.
  ///
  /// Parameter [capabilities] :
  /// List of the capabilities associated with this partnership.
  ///
  /// Parameter [name] :
  /// The name of the partnership, used to identify it.
  Future<UpdatePartnershipResponse> updatePartnership({
    required String partnershipId,
    List<String>? capabilities,
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
        if (name != null) 'name': name,
      },
    );

    return UpdatePartnershipResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified parameters for a profile. A profile is the mechanism
  /// used to create the concept of a private network.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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

  /// Updates the specified parameters for a transformer. A transformer
  /// describes how to process the incoming EDI documents and extract the
  /// necessary information to the output file.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
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
  /// Parameter [mappingTemplate] :
  /// Specifies the mapping template for the transformer. This template is used
  /// to map the parsed EDI file using JSONata or XSLT.
  ///
  /// Parameter [name] :
  /// Specify a new name for the transformer, if you want to update it.
  ///
  /// Parameter [sampleDocument] :
  /// Specifies a sample EDI document that is used by a transformer as a guide
  /// for processing the EDI data.
  ///
  /// Parameter [status] :
  /// Specifies the transformer's status. You can update the state of the
  /// transformer, from <code>active</code> to <code>inactive</code>, or
  /// <code>inactive</code> to <code>active</code>.
  Future<UpdateTransformerResponse> updateTransformer({
    required String transformerId,
    EdiType? ediType,
    FileFormat? fileFormat,
    String? mappingTemplate,
    String? name,
    String? sampleDocument,
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
        if (fileFormat != null) 'fileFormat': fileFormat.toValue(),
        if (mappingTemplate != null) 'mappingTemplate': mappingTemplate,
        if (name != null) 'name': name,
        if (sampleDocument != null) 'sampleDocument': sampleDocument,
        if (status != null) 'status': status.toValue(),
      },
    );

    return UpdateTransformerResponse.fromJson(jsonResponse.body);
  }
}

/// A capability object. Currently, only EDI (electronic data interchange)
/// capabilities are supported. A trading capability contains the information
/// required to transform incoming EDI documents into JSON or XML outputs.
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

/// Returns the capability summary details. A trading capability contains the
/// information required to transform incoming EDI documents into JSON or XML
/// outputs.
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
      capabilityId: json['capabilityId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      type: (json['type'] as String).toCapabilityType(),
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
      'type': type.toValue(),
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

enum CapabilityType {
  edi,
}

extension CapabilityTypeValueExtension on CapabilityType {
  String toValue() {
    switch (this) {
      case CapabilityType.edi:
        return 'edi';
    }
  }
}

extension CapabilityTypeFromString on String {
  CapabilityType toCapabilityType() {
    switch (this) {
      case 'edi':
        return CapabilityType.edi;
    }
    throw Exception('$this is not known in enum CapabilityType');
  }
}

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
      capabilityArn: json['capabilityArn'] as String,
      capabilityId: json['capabilityId'] as String,
      configuration: CapabilityConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      type: (json['type'] as String).toCapabilityType(),
      instructionsDocuments: (json['instructionsDocuments'] as List?)
          ?.whereNotNull()
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
      'type': type.toValue(),
      if (instructionsDocuments != null)
        'instructionsDocuments': instructionsDocuments,
    };
  }
}

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
    this.email,
    this.name,
    this.phone,
    this.tradingPartnerId,
  });

  factory CreatePartnershipResponse.fromJson(Map<String, dynamic> json) {
    return CreatePartnershipResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      partnershipArn: json['partnershipArn'] as String,
      partnershipId: json['partnershipId'] as String,
      profileId: json['profileId'] as String,
      capabilities: (json['capabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (tradingPartnerId != null) 'tradingPartnerId': tradingPartnerId,
    };
  }
}

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
      businessName: json['businessName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      phone: json['phone'] as String,
      profileArn: json['profileArn'] as String,
      profileId: json['profileId'] as String,
      email: json['email'] as String?,
      logGroupName: json['logGroupName'] as String?,
      logging: (json['logging'] as String?)?.toLogging(),
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
      if (logging != null) 'logging': logging.toValue(),
    };
  }
}

class CreateTransformerResponse {
  /// Returns a timestamp for creation date and time of the transformer.
  final DateTime createdAt;

  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final EdiType ediType;

  /// Returns that the currently supported file formats for EDI transformations
  /// are <code>JSON</code> and <code>XML</code>.
  final FileFormat fileFormat;

  /// Returns the mapping template for the transformer. This template is used to
  /// map the parsed EDI file using JSONata or XSLT.
  final String mappingTemplate;

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

  /// Returns a sample EDI document that is used by a transformer as a guide for
  /// processing the EDI data.
  final String? sampleDocument;

  CreateTransformerResponse({
    required this.createdAt,
    required this.ediType,
    required this.fileFormat,
    required this.mappingTemplate,
    required this.name,
    required this.status,
    required this.transformerArn,
    required this.transformerId,
    this.sampleDocument,
  });

  factory CreateTransformerResponse.fromJson(Map<String, dynamic> json) {
    return CreateTransformerResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      ediType: EdiType.fromJson(json['ediType'] as Map<String, dynamic>),
      fileFormat: (json['fileFormat'] as String).toFileFormat(),
      mappingTemplate: json['mappingTemplate'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toTransformerStatus(),
      transformerArn: json['transformerArn'] as String,
      transformerId: json['transformerId'] as String,
      sampleDocument: json['sampleDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final ediType = this.ediType;
    final fileFormat = this.fileFormat;
    final mappingTemplate = this.mappingTemplate;
    final name = this.name;
    final status = this.status;
    final transformerArn = this.transformerArn;
    final transformerId = this.transformerId;
    final sampleDocument = this.sampleDocument;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'ediType': ediType,
      'fileFormat': fileFormat.toValue(),
      'mappingTemplate': mappingTemplate,
      'name': name,
      'status': status.toValue(),
      'transformerArn': transformerArn,
      'transformerId': transformerId,
      if (sampleDocument != null) 'sampleDocument': sampleDocument,
    };
  }
}

/// Specifies the details for the EDI (electronic data interchange)
/// transformation.
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

  EdiConfiguration({
    required this.inputLocation,
    required this.outputLocation,
    required this.transformerId,
    required this.type,
  });

  factory EdiConfiguration.fromJson(Map<String, dynamic> json) {
    return EdiConfiguration(
      inputLocation:
          S3Location.fromJson(json['inputLocation'] as Map<String, dynamic>),
      outputLocation:
          S3Location.fromJson(json['outputLocation'] as Map<String, dynamic>),
      transformerId: json['transformerId'] as String,
      type: EdiType.fromJson(json['type'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final inputLocation = this.inputLocation;
    final outputLocation = this.outputLocation;
    final transformerId = this.transformerId;
    final type = this.type;
    return {
      'inputLocation': inputLocation,
      'outputLocation': outputLocation,
      'transformerId': transformerId,
      'type': type,
    };
  }
}

/// Specifies the details for the EDI standard that is being used for the
/// transformer. Currently, only X12 is supported. X12 is a set of standards and
/// corresponding messages that define specific business documents.
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

enum FileFormat {
  xml,
  json,
}

extension FileFormatValueExtension on FileFormat {
  String toValue() {
    switch (this) {
      case FileFormat.xml:
        return 'XML';
      case FileFormat.json:
        return 'JSON';
    }
  }
}

extension FileFormatFromString on String {
  FileFormat toFileFormat() {
    switch (this) {
      case 'XML':
        return FileFormat.xml;
      case 'JSON':
        return FileFormat.json;
    }
    throw Exception('$this is not known in enum FileFormat');
  }
}

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
      capabilityArn: json['capabilityArn'] as String,
      capabilityId: json['capabilityId'] as String,
      configuration: CapabilityConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      type: (json['type'] as String).toCapabilityType(),
      instructionsDocuments: (json['instructionsDocuments'] as List?)
          ?.whereNotNull()
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
      'type': type.toValue(),
      if (instructionsDocuments != null)
        'instructionsDocuments': instructionsDocuments,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

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
    this.email,
    this.modifiedAt,
    this.name,
    this.phone,
    this.tradingPartnerId,
  });

  factory GetPartnershipResponse.fromJson(Map<String, dynamic> json) {
    return GetPartnershipResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      partnershipArn: json['partnershipArn'] as String,
      partnershipId: json['partnershipId'] as String,
      profileId: json['profileId'] as String,
      capabilities: (json['capabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      if (email != null) 'email': email,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (tradingPartnerId != null) 'tradingPartnerId': tradingPartnerId,
    };
  }
}

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
      businessName: json['businessName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      phone: json['phone'] as String,
      profileArn: json['profileArn'] as String,
      profileId: json['profileId'] as String,
      email: json['email'] as String?,
      logGroupName: json['logGroupName'] as String?,
      logging: (json['logging'] as String?)?.toLogging(),
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
      if (logging != null) 'logging': logging.toValue(),
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

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
      status: (json['status'] as String).toTransformerJobStatus(),
      message: json['message'] as String?,
      outputFiles: (json['outputFiles'] as List?)
          ?.whereNotNull()
          .map((e) => S3Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final message = this.message;
    final outputFiles = this.outputFiles;
    return {
      'status': status.toValue(),
      if (message != null) 'message': message,
      if (outputFiles != null) 'outputFiles': outputFiles,
    };
  }
}

class GetTransformerResponse {
  /// Returns a timestamp for creation date and time of the transformer.
  final DateTime createdAt;

  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final EdiType ediType;

  /// Returns that the currently supported file formats for EDI transformations
  /// are <code>JSON</code> and <code>XML</code>.
  final FileFormat fileFormat;

  /// Returns the mapping template for the transformer. This template is used to
  /// map the parsed EDI file using JSONata or XSLT.
  final String mappingTemplate;

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

  /// Returns a timestamp for last time the transformer was modified.
  final DateTime? modifiedAt;

  /// Returns a sample EDI document that is used by a transformer as a guide for
  /// processing the EDI data.
  final String? sampleDocument;

  GetTransformerResponse({
    required this.createdAt,
    required this.ediType,
    required this.fileFormat,
    required this.mappingTemplate,
    required this.name,
    required this.status,
    required this.transformerArn,
    required this.transformerId,
    this.modifiedAt,
    this.sampleDocument,
  });

  factory GetTransformerResponse.fromJson(Map<String, dynamic> json) {
    return GetTransformerResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      ediType: EdiType.fromJson(json['ediType'] as Map<String, dynamic>),
      fileFormat: (json['fileFormat'] as String).toFileFormat(),
      mappingTemplate: json['mappingTemplate'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toTransformerStatus(),
      transformerArn: json['transformerArn'] as String,
      transformerId: json['transformerId'] as String,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      sampleDocument: json['sampleDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final ediType = this.ediType;
    final fileFormat = this.fileFormat;
    final mappingTemplate = this.mappingTemplate;
    final name = this.name;
    final status = this.status;
    final transformerArn = this.transformerArn;
    final transformerId = this.transformerId;
    final modifiedAt = this.modifiedAt;
    final sampleDocument = this.sampleDocument;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'ediType': ediType,
      'fileFormat': fileFormat.toValue(),
      'mappingTemplate': mappingTemplate,
      'name': name,
      'status': status.toValue(),
      'transformerArn': transformerArn,
      'transformerId': transformerId,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (sampleDocument != null) 'sampleDocument': sampleDocument,
    };
  }
}

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
      capabilities: (json['capabilities'] as List)
          .whereNotNull()
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
      partnerships: (json['partnerships'] as List)
          .whereNotNull()
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
      profiles: (json['profiles'] as List)
          .whereNotNull()
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
          ?.whereNotNull()
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
      transformers: (json['transformers'] as List)
          .whereNotNull()
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

enum Logging {
  enabled,
  disabled,
}

extension LoggingValueExtension on Logging {
  String toValue() {
    switch (this) {
      case Logging.enabled:
        return 'ENABLED';
      case Logging.disabled:
        return 'DISABLED';
    }
  }
}

extension LoggingFromString on String {
  Logging toLogging() {
    switch (this) {
      case 'ENABLED':
        return Logging.enabled;
      case 'DISABLED':
        return Logging.disabled;
    }
    throw Exception('$this is not known in enum Logging');
  }
}

/// A structure that contains the details for a partnership. A partnership
/// represents the connection between you and your trading partner. It ties
/// together a profile and one or more trading capabilities.
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
    this.modifiedAt,
    this.name,
    this.tradingPartnerId,
  });

  factory PartnershipSummary.fromJson(Map<String, dynamic> json) {
    return PartnershipSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      partnershipId: json['partnershipId'] as String,
      profileId: json['profileId'] as String,
      capabilities: (json['capabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final tradingPartnerId = this.tradingPartnerId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'partnershipId': partnershipId,
      'profileId': profileId,
      if (capabilities != null) 'capabilities': capabilities,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (name != null) 'name': name,
      if (tradingPartnerId != null) 'tradingPartnerId': tradingPartnerId,
    };
  }
}

/// Contains the details for a profile. A profile is the mechanism used to
/// create the concept of a private network.
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
      businessName: json['businessName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      profileId: json['profileId'] as String,
      logGroupName: json['logGroupName'] as String?,
      logging: (json['logging'] as String?)?.toLogging(),
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
      if (logging != null) 'logging': logging.toValue(),
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// Specifies the details for the Amazon S3 file location that is being used
/// with Amazon Web Services B2BI Data Interchange. File locations in Amazon S3
/// are identified using a combination of the bucket and key.
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

class StartTransformerJobResponse {
  /// Returns the unique, system-generated identifier for a transformer run.
  final String transformerJobId;

  StartTransformerJobResponse({
    required this.transformerJobId,
  });

  factory StartTransformerJobResponse.fromJson(Map<String, dynamic> json) {
    return StartTransformerJobResponse(
      transformerJobId: json['transformerJobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final transformerJobId = this.transformerJobId;
    return {
      'transformerJobId': transformerJobId,
    };
  }
}

/// Creates a key-value pair for a specific resource. Tags are metadata that you
/// can use to search for and group a resource for various purposes. You can
/// apply tags to capabilities, partnerships, profiles and transformers. A tag
/// key can take more than one value. For example, to group capabilities for
/// accounting purposes, you might create a tag called <code>Group</code> and
/// assign the values <code>Research</code> and <code>Accounting</code> to that
/// group.
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
      key: json['Key'] as String,
      value: json['Value'] as String,
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

class TestMappingResponse {
  /// Returns a string for the mapping that can be used to identify the mapping.
  /// Similar to a fingerprint
  final String mappedFileContent;

  TestMappingResponse({
    required this.mappedFileContent,
  });

  factory TestMappingResponse.fromJson(Map<String, dynamic> json) {
    return TestMappingResponse(
      mappedFileContent: json['mappedFileContent'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final mappedFileContent = this.mappedFileContent;
    return {
      'mappedFileContent': mappedFileContent,
    };
  }
}

class TestParsingResponse {
  /// Returns the contents of the input file being tested, parsed according to the
  /// specified EDI (electronic data interchange) type.
  final String parsedFileContent;

  TestParsingResponse({
    required this.parsedFileContent,
  });

  factory TestParsingResponse.fromJson(Map<String, dynamic> json) {
    return TestParsingResponse(
      parsedFileContent: json['parsedFileContent'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parsedFileContent = this.parsedFileContent;
    return {
      'parsedFileContent': parsedFileContent,
    };
  }
}

enum TransformerJobStatus {
  running,
  succeeded,
  failed,
}

extension TransformerJobStatusValueExtension on TransformerJobStatus {
  String toValue() {
    switch (this) {
      case TransformerJobStatus.running:
        return 'running';
      case TransformerJobStatus.succeeded:
        return 'succeeded';
      case TransformerJobStatus.failed:
        return 'failed';
    }
  }
}

extension TransformerJobStatusFromString on String {
  TransformerJobStatus toTransformerJobStatus() {
    switch (this) {
      case 'running':
        return TransformerJobStatus.running;
      case 'succeeded':
        return TransformerJobStatus.succeeded;
      case 'failed':
        return TransformerJobStatus.failed;
    }
    throw Exception('$this is not known in enum TransformerJobStatus');
  }
}

enum TransformerStatus {
  active,
  inactive,
}

extension TransformerStatusValueExtension on TransformerStatus {
  String toValue() {
    switch (this) {
      case TransformerStatus.active:
        return 'active';
      case TransformerStatus.inactive:
        return 'inactive';
    }
  }
}

extension TransformerStatusFromString on String {
  TransformerStatus toTransformerStatus() {
    switch (this) {
      case 'active':
        return TransformerStatus.active;
      case 'inactive':
        return TransformerStatus.inactive;
    }
    throw Exception('$this is not known in enum TransformerStatus');
  }
}

/// Contains the details for a transformer object. A transformer describes how
/// to process the incoming EDI documents and extract the necessary information
/// to the output file.
class TransformerSummary {
  /// Returns a timestamp indicating when the transformer was created. For
  /// example, <code>2023-07-20T19:58:44.624Z</code>.
  final DateTime createdAt;

  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final EdiType ediType;

  /// Returns that the currently supported file formats for EDI transformations
  /// are <code>JSON</code> and <code>XML</code>.
  final FileFormat fileFormat;

  /// Returns the mapping template for the transformer. This template is used to
  /// map the parsed EDI file using JSONata or XSLT.
  final String mappingTemplate;

  /// Returns the descriptive name for the transformer.
  final String name;

  /// Returns the state of the newly created transformer. The transformer can be
  /// either <code>active</code> or <code>inactive</code>. For the transformer to
  /// be used in a capability, its status must <code>active</code>.
  final TransformerStatus status;

  /// Returns the system-assigned unique identifier for the transformer.
  final String transformerId;

  /// Returns a timestamp representing the date and time for the most recent
  /// change for the transformer object.
  final DateTime? modifiedAt;

  /// Returns a sample EDI document that is used by a transformer as a guide for
  /// processing the EDI data.
  final String? sampleDocument;

  TransformerSummary({
    required this.createdAt,
    required this.ediType,
    required this.fileFormat,
    required this.mappingTemplate,
    required this.name,
    required this.status,
    required this.transformerId,
    this.modifiedAt,
    this.sampleDocument,
  });

  factory TransformerSummary.fromJson(Map<String, dynamic> json) {
    return TransformerSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      ediType: EdiType.fromJson(json['ediType'] as Map<String, dynamic>),
      fileFormat: (json['fileFormat'] as String).toFileFormat(),
      mappingTemplate: json['mappingTemplate'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toTransformerStatus(),
      transformerId: json['transformerId'] as String,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      sampleDocument: json['sampleDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final ediType = this.ediType;
    final fileFormat = this.fileFormat;
    final mappingTemplate = this.mappingTemplate;
    final name = this.name;
    final status = this.status;
    final transformerId = this.transformerId;
    final modifiedAt = this.modifiedAt;
    final sampleDocument = this.sampleDocument;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'ediType': ediType,
      'fileFormat': fileFormat.toValue(),
      'mappingTemplate': mappingTemplate,
      'name': name,
      'status': status.toValue(),
      'transformerId': transformerId,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (sampleDocument != null) 'sampleDocument': sampleDocument,
    };
  }
}

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
      capabilityArn: json['capabilityArn'] as String,
      capabilityId: json['capabilityId'] as String,
      configuration: CapabilityConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      type: (json['type'] as String).toCapabilityType(),
      instructionsDocuments: (json['instructionsDocuments'] as List?)
          ?.whereNotNull()
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
      'type': type.toValue(),
      if (instructionsDocuments != null)
        'instructionsDocuments': instructionsDocuments,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

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
    this.email,
    this.modifiedAt,
    this.name,
    this.phone,
    this.tradingPartnerId,
  });

  factory UpdatePartnershipResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePartnershipResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      partnershipArn: json['partnershipArn'] as String,
      partnershipId: json['partnershipId'] as String,
      profileId: json['profileId'] as String,
      capabilities: (json['capabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      if (email != null) 'email': email,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (tradingPartnerId != null) 'tradingPartnerId': tradingPartnerId,
    };
  }
}

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
      businessName: json['businessName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      phone: json['phone'] as String,
      profileArn: json['profileArn'] as String,
      profileId: json['profileId'] as String,
      email: json['email'] as String?,
      logGroupName: json['logGroupName'] as String?,
      logging: (json['logging'] as String?)?.toLogging(),
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
      if (logging != null) 'logging': logging.toValue(),
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

class UpdateTransformerResponse {
  /// Returns a timestamp for creation date and time of the transformer.
  final DateTime createdAt;

  /// Returns the details for the EDI standard that is being used for the
  /// transformer. Currently, only X12 is supported. X12 is a set of standards and
  /// corresponding messages that define specific business documents.
  final EdiType ediType;

  /// Returns that the currently supported file formats for EDI transformations
  /// are <code>JSON</code> and <code>XML</code>.
  final FileFormat fileFormat;

  /// Returns the mapping template for the transformer. This template is used to
  /// map the parsed EDI file using JSONata or XSLT.
  final String mappingTemplate;

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

  /// Returns a sample EDI document that is used by a transformer as a guide for
  /// processing the EDI data.
  final String? sampleDocument;

  UpdateTransformerResponse({
    required this.createdAt,
    required this.ediType,
    required this.fileFormat,
    required this.mappingTemplate,
    required this.modifiedAt,
    required this.name,
    required this.status,
    required this.transformerArn,
    required this.transformerId,
    this.sampleDocument,
  });

  factory UpdateTransformerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTransformerResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      ediType: EdiType.fromJson(json['ediType'] as Map<String, dynamic>),
      fileFormat: (json['fileFormat'] as String).toFileFormat(),
      mappingTemplate: json['mappingTemplate'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toTransformerStatus(),
      transformerArn: json['transformerArn'] as String,
      transformerId: json['transformerId'] as String,
      sampleDocument: json['sampleDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final ediType = this.ediType;
    final fileFormat = this.fileFormat;
    final mappingTemplate = this.mappingTemplate;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    final transformerArn = this.transformerArn;
    final transformerId = this.transformerId;
    final sampleDocument = this.sampleDocument;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'ediType': ediType,
      'fileFormat': fileFormat.toValue(),
      'mappingTemplate': mappingTemplate,
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'status': status.toValue(),
      'transformerArn': transformerArn,
      'transformerId': transformerId,
      if (sampleDocument != null) 'sampleDocument': sampleDocument,
    };
  }
}

/// A structure that contains the X12 transaction set and version. The X12
/// structure is used when the system transforms an EDI (electronic data
/// interchange) file.
/// <note>
/// If an EDI input file contains more than one transaction, each transaction
/// must have the same transaction set and version, for example 214/4010. If
/// not, the transformer cannot parse the file.
/// </note>
class X12Details {
  /// Returns an enumerated type where each value identifies an X12 transaction
  /// set. Transaction sets are maintained by the X12 Accredited Standards
  /// Committee.
  final X12TransactionSet? transactionSet;

  /// Returns the version to use for the specified X12 transaction set.
  /// <pre><code> &lt;/p&gt; </code></pre>
  final X12Version? version;

  X12Details({
    this.transactionSet,
    this.version,
  });

  factory X12Details.fromJson(Map<String, dynamic> json) {
    return X12Details(
      transactionSet:
          (json['transactionSet'] as String?)?.toX12TransactionSet(),
      version: (json['version'] as String?)?.toX12Version(),
    );
  }

  Map<String, dynamic> toJson() {
    final transactionSet = this.transactionSet;
    final version = this.version;
    return {
      if (transactionSet != null) 'transactionSet': transactionSet.toValue(),
      if (version != null) 'version': version.toValue(),
    };
  }
}

enum X12TransactionSet {
  x12_110,
  x12_180,
  x12_204,
  x12_210,
  x12_211,
  x12_214,
  x12_215,
  x12_259,
  x12_260,
  x12_266,
  x12_269,
  x12_270,
  x12_271,
  x12_274,
  x12_275,
  x12_276,
  x12_277,
  x12_278,
  x12_310,
  x12_315,
  x12_322,
  x12_404,
  x12_410,
  x12_417,
  x12_421,
  x12_426,
  x12_810,
  x12_820,
  x12_824,
  x12_830,
  x12_832,
  x12_834,
  x12_835,
  x12_837,
  x12_844,
  x12_846,
  x12_849,
  x12_850,
  x12_852,
  x12_855,
  x12_856,
  x12_860,
  x12_861,
  x12_864,
  x12_865,
  x12_869,
  x12_870,
  x12_940,
  x12_945,
  x12_990,
  x12_997,
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
  x12_999x231,
}

extension X12TransactionSetValueExtension on X12TransactionSet {
  String toValue() {
    switch (this) {
      case X12TransactionSet.x12_110:
        return 'X12_110';
      case X12TransactionSet.x12_180:
        return 'X12_180';
      case X12TransactionSet.x12_204:
        return 'X12_204';
      case X12TransactionSet.x12_210:
        return 'X12_210';
      case X12TransactionSet.x12_211:
        return 'X12_211';
      case X12TransactionSet.x12_214:
        return 'X12_214';
      case X12TransactionSet.x12_215:
        return 'X12_215';
      case X12TransactionSet.x12_259:
        return 'X12_259';
      case X12TransactionSet.x12_260:
        return 'X12_260';
      case X12TransactionSet.x12_266:
        return 'X12_266';
      case X12TransactionSet.x12_269:
        return 'X12_269';
      case X12TransactionSet.x12_270:
        return 'X12_270';
      case X12TransactionSet.x12_271:
        return 'X12_271';
      case X12TransactionSet.x12_274:
        return 'X12_274';
      case X12TransactionSet.x12_275:
        return 'X12_275';
      case X12TransactionSet.x12_276:
        return 'X12_276';
      case X12TransactionSet.x12_277:
        return 'X12_277';
      case X12TransactionSet.x12_278:
        return 'X12_278';
      case X12TransactionSet.x12_310:
        return 'X12_310';
      case X12TransactionSet.x12_315:
        return 'X12_315';
      case X12TransactionSet.x12_322:
        return 'X12_322';
      case X12TransactionSet.x12_404:
        return 'X12_404';
      case X12TransactionSet.x12_410:
        return 'X12_410';
      case X12TransactionSet.x12_417:
        return 'X12_417';
      case X12TransactionSet.x12_421:
        return 'X12_421';
      case X12TransactionSet.x12_426:
        return 'X12_426';
      case X12TransactionSet.x12_810:
        return 'X12_810';
      case X12TransactionSet.x12_820:
        return 'X12_820';
      case X12TransactionSet.x12_824:
        return 'X12_824';
      case X12TransactionSet.x12_830:
        return 'X12_830';
      case X12TransactionSet.x12_832:
        return 'X12_832';
      case X12TransactionSet.x12_834:
        return 'X12_834';
      case X12TransactionSet.x12_835:
        return 'X12_835';
      case X12TransactionSet.x12_837:
        return 'X12_837';
      case X12TransactionSet.x12_844:
        return 'X12_844';
      case X12TransactionSet.x12_846:
        return 'X12_846';
      case X12TransactionSet.x12_849:
        return 'X12_849';
      case X12TransactionSet.x12_850:
        return 'X12_850';
      case X12TransactionSet.x12_852:
        return 'X12_852';
      case X12TransactionSet.x12_855:
        return 'X12_855';
      case X12TransactionSet.x12_856:
        return 'X12_856';
      case X12TransactionSet.x12_860:
        return 'X12_860';
      case X12TransactionSet.x12_861:
        return 'X12_861';
      case X12TransactionSet.x12_864:
        return 'X12_864';
      case X12TransactionSet.x12_865:
        return 'X12_865';
      case X12TransactionSet.x12_869:
        return 'X12_869';
      case X12TransactionSet.x12_870:
        return 'X12_870';
      case X12TransactionSet.x12_940:
        return 'X12_940';
      case X12TransactionSet.x12_945:
        return 'X12_945';
      case X12TransactionSet.x12_990:
        return 'X12_990';
      case X12TransactionSet.x12_997:
        return 'X12_997';
      case X12TransactionSet.x12_999:
        return 'X12_999';
      case X12TransactionSet.x12_270x279:
        return 'X12_270_X279';
      case X12TransactionSet.x12_271x279:
        return 'X12_271_X279';
      case X12TransactionSet.x12_275x210:
        return 'X12_275_X210';
      case X12TransactionSet.x12_275x211:
        return 'X12_275_X211';
      case X12TransactionSet.x12_276x212:
        return 'X12_276_X212';
      case X12TransactionSet.x12_277x212:
        return 'X12_277_X212';
      case X12TransactionSet.x12_277x214:
        return 'X12_277_X214';
      case X12TransactionSet.x12_277x364:
        return 'X12_277_X364';
      case X12TransactionSet.x12_278x217:
        return 'X12_278_X217';
      case X12TransactionSet.x12_820x218:
        return 'X12_820_X218';
      case X12TransactionSet.x12_820x306:
        return 'X12_820_X306';
      case X12TransactionSet.x12_824x186:
        return 'X12_824_X186';
      case X12TransactionSet.x12_834x220:
        return 'X12_834_X220';
      case X12TransactionSet.x12_834x307:
        return 'X12_834_X307';
      case X12TransactionSet.x12_834x318:
        return 'X12_834_X318';
      case X12TransactionSet.x12_835x221:
        return 'X12_835_X221';
      case X12TransactionSet.x12_837x222:
        return 'X12_837_X222';
      case X12TransactionSet.x12_837x223:
        return 'X12_837_X223';
      case X12TransactionSet.x12_837x224:
        return 'X12_837_X224';
      case X12TransactionSet.x12_837x291:
        return 'X12_837_X291';
      case X12TransactionSet.x12_837x292:
        return 'X12_837_X292';
      case X12TransactionSet.x12_837x298:
        return 'X12_837_X298';
      case X12TransactionSet.x12_999x231:
        return 'X12_999_X231';
    }
  }
}

extension X12TransactionSetFromString on String {
  X12TransactionSet toX12TransactionSet() {
    switch (this) {
      case 'X12_110':
        return X12TransactionSet.x12_110;
      case 'X12_180':
        return X12TransactionSet.x12_180;
      case 'X12_204':
        return X12TransactionSet.x12_204;
      case 'X12_210':
        return X12TransactionSet.x12_210;
      case 'X12_211':
        return X12TransactionSet.x12_211;
      case 'X12_214':
        return X12TransactionSet.x12_214;
      case 'X12_215':
        return X12TransactionSet.x12_215;
      case 'X12_259':
        return X12TransactionSet.x12_259;
      case 'X12_260':
        return X12TransactionSet.x12_260;
      case 'X12_266':
        return X12TransactionSet.x12_266;
      case 'X12_269':
        return X12TransactionSet.x12_269;
      case 'X12_270':
        return X12TransactionSet.x12_270;
      case 'X12_271':
        return X12TransactionSet.x12_271;
      case 'X12_274':
        return X12TransactionSet.x12_274;
      case 'X12_275':
        return X12TransactionSet.x12_275;
      case 'X12_276':
        return X12TransactionSet.x12_276;
      case 'X12_277':
        return X12TransactionSet.x12_277;
      case 'X12_278':
        return X12TransactionSet.x12_278;
      case 'X12_310':
        return X12TransactionSet.x12_310;
      case 'X12_315':
        return X12TransactionSet.x12_315;
      case 'X12_322':
        return X12TransactionSet.x12_322;
      case 'X12_404':
        return X12TransactionSet.x12_404;
      case 'X12_410':
        return X12TransactionSet.x12_410;
      case 'X12_417':
        return X12TransactionSet.x12_417;
      case 'X12_421':
        return X12TransactionSet.x12_421;
      case 'X12_426':
        return X12TransactionSet.x12_426;
      case 'X12_810':
        return X12TransactionSet.x12_810;
      case 'X12_820':
        return X12TransactionSet.x12_820;
      case 'X12_824':
        return X12TransactionSet.x12_824;
      case 'X12_830':
        return X12TransactionSet.x12_830;
      case 'X12_832':
        return X12TransactionSet.x12_832;
      case 'X12_834':
        return X12TransactionSet.x12_834;
      case 'X12_835':
        return X12TransactionSet.x12_835;
      case 'X12_837':
        return X12TransactionSet.x12_837;
      case 'X12_844':
        return X12TransactionSet.x12_844;
      case 'X12_846':
        return X12TransactionSet.x12_846;
      case 'X12_849':
        return X12TransactionSet.x12_849;
      case 'X12_850':
        return X12TransactionSet.x12_850;
      case 'X12_852':
        return X12TransactionSet.x12_852;
      case 'X12_855':
        return X12TransactionSet.x12_855;
      case 'X12_856':
        return X12TransactionSet.x12_856;
      case 'X12_860':
        return X12TransactionSet.x12_860;
      case 'X12_861':
        return X12TransactionSet.x12_861;
      case 'X12_864':
        return X12TransactionSet.x12_864;
      case 'X12_865':
        return X12TransactionSet.x12_865;
      case 'X12_869':
        return X12TransactionSet.x12_869;
      case 'X12_870':
        return X12TransactionSet.x12_870;
      case 'X12_940':
        return X12TransactionSet.x12_940;
      case 'X12_945':
        return X12TransactionSet.x12_945;
      case 'X12_990':
        return X12TransactionSet.x12_990;
      case 'X12_997':
        return X12TransactionSet.x12_997;
      case 'X12_999':
        return X12TransactionSet.x12_999;
      case 'X12_270_X279':
        return X12TransactionSet.x12_270x279;
      case 'X12_271_X279':
        return X12TransactionSet.x12_271x279;
      case 'X12_275_X210':
        return X12TransactionSet.x12_275x210;
      case 'X12_275_X211':
        return X12TransactionSet.x12_275x211;
      case 'X12_276_X212':
        return X12TransactionSet.x12_276x212;
      case 'X12_277_X212':
        return X12TransactionSet.x12_277x212;
      case 'X12_277_X214':
        return X12TransactionSet.x12_277x214;
      case 'X12_277_X364':
        return X12TransactionSet.x12_277x364;
      case 'X12_278_X217':
        return X12TransactionSet.x12_278x217;
      case 'X12_820_X218':
        return X12TransactionSet.x12_820x218;
      case 'X12_820_X306':
        return X12TransactionSet.x12_820x306;
      case 'X12_824_X186':
        return X12TransactionSet.x12_824x186;
      case 'X12_834_X220':
        return X12TransactionSet.x12_834x220;
      case 'X12_834_X307':
        return X12TransactionSet.x12_834x307;
      case 'X12_834_X318':
        return X12TransactionSet.x12_834x318;
      case 'X12_835_X221':
        return X12TransactionSet.x12_835x221;
      case 'X12_837_X222':
        return X12TransactionSet.x12_837x222;
      case 'X12_837_X223':
        return X12TransactionSet.x12_837x223;
      case 'X12_837_X224':
        return X12TransactionSet.x12_837x224;
      case 'X12_837_X291':
        return X12TransactionSet.x12_837x291;
      case 'X12_837_X292':
        return X12TransactionSet.x12_837x292;
      case 'X12_837_X298':
        return X12TransactionSet.x12_837x298;
      case 'X12_999_X231':
        return X12TransactionSet.x12_999x231;
    }
    throw Exception('$this is not known in enum X12TransactionSet');
  }
}

enum X12Version {
  version_4010,
  version_4030,
  version_5010,
  version_5010Hipaa,
}

extension X12VersionValueExtension on X12Version {
  String toValue() {
    switch (this) {
      case X12Version.version_4010:
        return 'VERSION_4010';
      case X12Version.version_4030:
        return 'VERSION_4030';
      case X12Version.version_5010:
        return 'VERSION_5010';
      case X12Version.version_5010Hipaa:
        return 'VERSION_5010_HIPAA';
    }
  }
}

extension X12VersionFromString on String {
  X12Version toX12Version() {
    switch (this) {
      case 'VERSION_4010':
        return X12Version.version_4010;
      case 'VERSION_4030':
        return X12Version.version_4030;
      case 'VERSION_5010':
        return X12Version.version_5010;
      case 'VERSION_5010_HIPAA':
        return X12Version.version_5010Hipaa;
    }
    throw Exception('$this is not known in enum X12Version');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

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
