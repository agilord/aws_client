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

/// AWS Partner Central Benefits Service provides APIs for managing partner
/// benefits, applications, and allocations within the AWS Partner Network
/// ecosystem.
class PartnerCentralBenefits {
  final _s.JsonProtocol _protocol;
  PartnerCentralBenefits({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'partnercentral-benefits',
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

  /// Modifies an existing benefit application by applying amendments to
  /// specific fields while maintaining revision control.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [amendmentReason] :
  /// A descriptive reason explaining why the benefit application is being
  /// amended.
  ///
  /// Parameter [amendments] :
  /// A list of specific field amendments to apply to the benefit application.
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog the
  /// application belongs to.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotent processing of the
  /// amendment request.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the benefit application to be amended.
  ///
  /// Parameter [revision] :
  /// The current revision number of the benefit application to ensure
  /// optimistic concurrency control.
  Future<void> amendBenefitApplication({
    required String amendmentReason,
    required List<Amendment> amendments,
    required String catalog,
    required String clientToken,
    required String identifier,
    required String revision,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.AmendBenefitApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AmendmentReason': amendmentReason,
        'Amendments': amendments,
        'Catalog': catalog,
        'ClientToken': clientToken,
        'Identifier': identifier,
        'Revision': revision,
      },
    );
  }

  /// Links an AWS resource to an existing benefit application for tracking and
  /// management purposes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [benefitApplicationIdentifier] :
  /// The unique identifier of the benefit application to associate the resource
  /// with.
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog the
  /// application belongs to.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS resource to associate with the
  /// benefit application.
  Future<AssociateBenefitApplicationResourceOutput>
      associateBenefitApplicationResource({
    required String benefitApplicationIdentifier,
    required String catalog,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PartnerCentralBenefitsService.AssociateBenefitApplicationResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BenefitApplicationIdentifier': benefitApplicationIdentifier,
        'Catalog': catalog,
        'ResourceArn': resourceArn,
      },
    );

    return AssociateBenefitApplicationResourceOutput.fromJson(
        jsonResponse.body);
  }

  /// Cancels a benefit application that is currently in progress, preventing
  /// further processing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog the
  /// application belongs to.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotent processing of the
  /// cancellation request.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the benefit application to cancel.
  ///
  /// Parameter [reason] :
  /// A descriptive reason explaining why the benefit application is being
  /// cancelled.
  Future<void> cancelBenefitApplication({
    required String catalog,
    required String clientToken,
    required String identifier,
    String? reason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.CancelBenefitApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ClientToken': clientToken,
        'Identifier': identifier,
        if (reason != null) 'Reason': reason,
      },
    );
  }

  /// Creates a new benefit application for a partner to request access to AWS
  /// benefits and programs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [benefitIdentifier] :
  /// The unique identifier of the benefit being requested in this application.
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog to create the
  /// application in.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotent processing of the
  /// creation request.
  ///
  /// Parameter [associatedResources] :
  /// AWS resources that are associated with this benefit application.
  ///
  /// Parameter [benefitApplicationDetails] :
  /// Detailed information and requirements specific to the benefit being
  /// requested.
  ///
  /// Parameter [description] :
  /// A detailed description of the benefit application and its intended use.
  ///
  /// Parameter [fileDetails] :
  /// Supporting documents and files attached to the benefit application.
  ///
  /// Parameter [fulfillmentTypes] :
  /// The types of fulfillment requested for this benefit application (e.g.,
  /// credits, access, disbursement).
  ///
  /// Parameter [name] :
  /// A human-readable name for the benefit application.
  ///
  /// Parameter [partnerContacts] :
  /// Contact information for partner representatives responsible for this
  /// benefit application.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to categorize and organize the benefit application.
  Future<CreateBenefitApplicationOutput> createBenefitApplication({
    required String benefitIdentifier,
    required String catalog,
    required String clientToken,
    List<String>? associatedResources,
    Document? benefitApplicationDetails,
    String? description,
    List<FileInput>? fileDetails,
    List<FulfillmentType>? fulfillmentTypes,
    String? name,
    List<Contact>? partnerContacts,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.CreateBenefitApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BenefitIdentifier': benefitIdentifier,
        'Catalog': catalog,
        'ClientToken': clientToken,
        if (associatedResources != null)
          'AssociatedResources': associatedResources,
        if (benefitApplicationDetails != null)
          'BenefitApplicationDetails': benefitApplicationDetails,
        if (description != null) 'Description': description,
        if (fileDetails != null) 'FileDetails': fileDetails,
        if (fulfillmentTypes != null)
          'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
        if (name != null) 'Name': name,
        if (partnerContacts != null) 'PartnerContacts': partnerContacts,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateBenefitApplicationOutput.fromJson(jsonResponse.body);
  }

  /// Removes the association between an AWS resource and a benefit application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [benefitApplicationIdentifier] :
  /// The unique identifier of the benefit application to disassociate the
  /// resource from.
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog the
  /// application belongs to.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS resource to disassociate from
  /// the benefit application.
  Future<DisassociateBenefitApplicationResourceOutput>
      disassociateBenefitApplicationResource({
    required String benefitApplicationIdentifier,
    required String catalog,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PartnerCentralBenefitsService.DisassociateBenefitApplicationResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BenefitApplicationIdentifier': benefitApplicationIdentifier,
        'Catalog': catalog,
        'ResourceArn': resourceArn,
      },
    );

    return DisassociateBenefitApplicationResourceOutput.fromJson(
        jsonResponse.body);
  }

  /// Retrieves detailed information about a specific benefit available in the
  /// partner catalog.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog to query.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the benefit to retrieve.
  Future<GetBenefitOutput> getBenefit({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.GetBenefit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );

    return GetBenefitOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific benefit allocation that
  /// has been granted to a partner.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog to query.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the benefit allocation to retrieve.
  Future<GetBenefitAllocationOutput> getBenefitAllocation({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.GetBenefitAllocation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );

    return GetBenefitAllocationOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific benefit application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog to query.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the benefit application to retrieve.
  Future<GetBenefitApplicationOutput> getBenefitApplication({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.GetBenefitApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );

    return GetBenefitApplicationOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a paginated list of benefit allocations based on specified
  /// filter criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier to filter benefit allocations by catalog.
  ///
  /// Parameter [benefitApplicationIdentifiers] :
  /// Filter benefit allocations by specific benefit application identifiers.
  ///
  /// Parameter [benefitIdentifiers] :
  /// Filter benefit allocations by specific benefit identifiers.
  ///
  /// Parameter [fulfillmentTypes] :
  /// Filter benefit allocations by specific fulfillment types.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of benefit allocations to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to retrieve the next set of results from a previous
  /// request.
  ///
  /// Parameter [status] :
  /// Filter benefit allocations by their current status.
  Future<ListBenefitAllocationsOutput> listBenefitAllocations({
    required String catalog,
    List<String>? benefitApplicationIdentifiers,
    List<String>? benefitIdentifiers,
    List<FulfillmentType>? fulfillmentTypes,
    int? maxResults,
    String? nextToken,
    List<BenefitAllocationStatus>? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.ListBenefitAllocations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (benefitApplicationIdentifiers != null)
          'BenefitApplicationIdentifiers': benefitApplicationIdentifiers,
        if (benefitIdentifiers != null)
          'BenefitIdentifiers': benefitIdentifiers,
        if (fulfillmentTypes != null)
          'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.map((e) => e.value).toList(),
      },
    );

    return ListBenefitAllocationsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a paginated list of benefit applications based on specified
  /// filter criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier to filter benefit applications by catalog.
  ///
  /// Parameter [associatedResourceArns] :
  /// Filter benefit applications by specific AWS resource ARNs.
  ///
  /// Parameter [associatedResources] :
  /// Filter benefit applications by associated AWS resources.
  ///
  /// Parameter [benefitIdentifiers] :
  /// Filter benefit applications by specific benefit identifiers.
  ///
  /// Parameter [fulfillmentTypes] :
  /// Filter benefit applications by specific fulfillment types.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of benefit applications to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to retrieve the next set of results from a previous
  /// request.
  ///
  /// Parameter [programs] :
  /// Filter benefit applications by specific AWS partner programs.
  ///
  /// Parameter [stages] :
  /// Filter benefit applications by their current processing stage.
  ///
  /// Parameter [status] :
  /// Filter benefit applications by their current processing status.
  Future<ListBenefitApplicationsOutput> listBenefitApplications({
    required String catalog,
    List<String>? associatedResourceArns,
    List<AssociatedResource>? associatedResources,
    List<String>? benefitIdentifiers,
    List<FulfillmentType>? fulfillmentTypes,
    int? maxResults,
    String? nextToken,
    List<String>? programs,
    List<String>? stages,
    List<BenefitApplicationStatus>? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.ListBenefitApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (associatedResourceArns != null)
          'AssociatedResourceArns': associatedResourceArns,
        if (associatedResources != null)
          'AssociatedResources': associatedResources,
        if (benefitIdentifiers != null)
          'BenefitIdentifiers': benefitIdentifiers,
        if (fulfillmentTypes != null)
          'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (programs != null) 'Programs': programs,
        if (stages != null) 'Stages': stages,
        if (status != null) 'Status': status.map((e) => e.value).toList(),
      },
    );

    return ListBenefitApplicationsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves a paginated list of available benefits based on specified filter
  /// criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier to filter benefits by catalog.
  ///
  /// Parameter [fulfillmentTypes] :
  /// Filter benefits by specific fulfillment types.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of benefits to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to retrieve the next set of results from a previous
  /// request.
  ///
  /// Parameter [programs] :
  /// Filter benefits by specific AWS partner programs.
  ///
  /// Parameter [status] :
  /// Filter benefits by their current status.
  Future<ListBenefitsOutput> listBenefits({
    required String catalog,
    List<FulfillmentType>? fulfillmentTypes,
    int? maxResults,
    String? nextToken,
    List<String>? programs,
    List<BenefitStatus>? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.ListBenefits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (fulfillmentTypes != null)
          'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (programs != null) 'Programs': programs,
        if (status != null) 'Status': status.map((e) => e.value).toList(),
      },
    );

    return ListBenefitsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves all tags associated with a specific resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to list tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Recalls a submitted benefit application, returning it to draft status for
  /// further modifications.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog the
  /// application belongs to.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the benefit application to recall.
  ///
  /// Parameter [reason] :
  /// A descriptive reason explaining why the benefit application is being
  /// recalled.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotent processing of the
  /// recall request.
  Future<void> recallBenefitApplication({
    required String catalog,
    required String identifier,
    required String reason,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.RecallBenefitApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
        'Reason': reason,
        if (clientToken != null) 'ClientToken': clientToken,
      },
    );
  }

  /// Submits a benefit application for review and processing by AWS.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog the
  /// application belongs to.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the benefit application to submit.
  Future<void> submitBenefitApplication({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.SubmitBenefitApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Identifier': identifier,
      },
    );
  }

  /// Adds or updates tags for a specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to add tags to.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to add as tags to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Removes specified tags from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Updates an existing benefit application with new information while
  /// maintaining revision control.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier that specifies which benefit catalog the
  /// application belongs to.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotent processing of the
  /// update request.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the benefit application to update.
  ///
  /// Parameter [revision] :
  /// The current revision number of the benefit application to ensure
  /// optimistic concurrency control.
  ///
  /// Parameter [benefitApplicationDetails] :
  /// Updated detailed information and requirements specific to the benefit
  /// being requested.
  ///
  /// Parameter [description] :
  /// The updated detailed description of the benefit application.
  ///
  /// Parameter [fileDetails] :
  /// Updated supporting documents and files attached to the benefit
  /// application.
  ///
  /// Parameter [name] :
  /// The updated human-readable name for the benefit application.
  ///
  /// Parameter [partnerContacts] :
  /// Updated contact information for partner representatives responsible for
  /// this benefit application.
  Future<UpdateBenefitApplicationOutput> updateBenefitApplication({
    required String catalog,
    required String clientToken,
    required String identifier,
    required String revision,
    Document? benefitApplicationDetails,
    String? description,
    List<FileInput>? fileDetails,
    String? name,
    List<Contact>? partnerContacts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralBenefitsService.UpdateBenefitApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ClientToken': clientToken,
        'Identifier': identifier,
        'Revision': revision,
        if (benefitApplicationDetails != null)
          'BenefitApplicationDetails': benefitApplicationDetails,
        if (description != null) 'Description': description,
        if (fileDetails != null) 'FileDetails': fileDetails,
        if (name != null) 'Name': name,
        if (partnerContacts != null) 'PartnerContacts': partnerContacts,
      },
    );

    return UpdateBenefitApplicationOutput.fromJson(jsonResponse.body);
  }
}

class AmendBenefitApplicationOutput {
  AmendBenefitApplicationOutput();

  factory AmendBenefitApplicationOutput.fromJson(Map<String, dynamic> _) {
    return AmendBenefitApplicationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateBenefitApplicationResourceOutput {
  /// The Amazon Resource Name (ARN) of the benefit application after the resource
  /// association.
  final String? arn;

  /// The unique identifier of the benefit application after the resource
  /// association.
  final String? id;

  /// The updated revision number of the benefit application after the resource
  /// association.
  final String? revision;

  AssociateBenefitApplicationResourceOutput({
    this.arn,
    this.id,
    this.revision,
  });

  factory AssociateBenefitApplicationResourceOutput.fromJson(
      Map<String, dynamic> json) {
    return AssociateBenefitApplicationResourceOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      revision: json['Revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final revision = this.revision;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (revision != null) 'Revision': revision,
    };
  }
}

class CancelBenefitApplicationOutput {
  CancelBenefitApplicationOutput();

  factory CancelBenefitApplicationOutput.fromJson(Map<String, dynamic> _) {
    return CancelBenefitApplicationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateBenefitApplicationOutput {
  /// The Amazon Resource Name (ARN) of the newly created benefit application.
  final String? arn;

  /// The unique identifier assigned to the newly created benefit application.
  final String? id;

  /// The initial revision number of the newly created benefit application.
  final String? revision;

  CreateBenefitApplicationOutput({
    this.arn,
    this.id,
    this.revision,
  });

  factory CreateBenefitApplicationOutput.fromJson(Map<String, dynamic> json) {
    return CreateBenefitApplicationOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      revision: json['Revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final revision = this.revision;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (revision != null) 'Revision': revision,
    };
  }
}

class DisassociateBenefitApplicationResourceOutput {
  /// The Amazon Resource Name (ARN) of the benefit application after the resource
  /// disassociation.
  final String? arn;

  /// The unique identifier of the benefit application after the resource
  /// disassociation.
  final String? id;

  /// The updated revision number of the benefit application after the resource
  /// disassociation.
  final String? revision;

  DisassociateBenefitApplicationResourceOutput({
    this.arn,
    this.id,
    this.revision,
  });

  factory DisassociateBenefitApplicationResourceOutput.fromJson(
      Map<String, dynamic> json) {
    return DisassociateBenefitApplicationResourceOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      revision: json['Revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final revision = this.revision;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (revision != null) 'Revision': revision,
    };
  }
}

class GetBenefitOutput {
  /// The Amazon Resource Name (ARN) of the benefit.
  final String? arn;

  /// The schema definition that describes the required fields for requesting this
  /// benefit.
  final Document? benefitRequestSchema;

  /// The catalog identifier that the benefit belongs to.
  final String? catalog;

  /// A detailed description of the benefit and its purpose.
  final String? description;

  /// The available fulfillment types for this benefit (e.g., credits, access,
  /// disbursement).
  final List<FulfillmentType>? fulfillmentTypes;

  /// The unique identifier of the benefit.
  final String? id;

  /// The human-readable name of the benefit.
  final String? name;

  /// The AWS partner programs that this benefit is associated with.
  final List<String>? programs;

  /// The current status of the benefit (e.g., active, inactive, deprecated).
  final BenefitStatus? status;

  GetBenefitOutput({
    this.arn,
    this.benefitRequestSchema,
    this.catalog,
    this.description,
    this.fulfillmentTypes,
    this.id,
    this.name,
    this.programs,
    this.status,
  });

  factory GetBenefitOutput.fromJson(Map<String, dynamic> json) {
    return GetBenefitOutput(
      arn: json['Arn'] as String?,
      benefitRequestSchema: json['BenefitRequestSchema'] != null
          ? Document.fromJson(
              json['BenefitRequestSchema'] as Map<String, dynamic>)
          : null,
      catalog: json['Catalog'] as String?,
      description: json['Description'] as String?,
      fulfillmentTypes: (json['FulfillmentTypes'] as List?)
          ?.nonNulls
          .map((e) => FulfillmentType.fromString((e as String)))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      programs: (json['Programs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.let(BenefitStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final benefitRequestSchema = this.benefitRequestSchema;
    final catalog = this.catalog;
    final description = this.description;
    final fulfillmentTypes = this.fulfillmentTypes;
    final id = this.id;
    final name = this.name;
    final programs = this.programs;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (benefitRequestSchema != null)
        'BenefitRequestSchema': benefitRequestSchema,
      if (catalog != null) 'Catalog': catalog,
      if (description != null) 'Description': description,
      if (fulfillmentTypes != null)
        'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (programs != null) 'Programs': programs,
      if (status != null) 'Status': status.value,
    };
  }
}

class GetBenefitAllocationOutput {
  /// A list of benefit identifiers that this allocation can be applied to.
  final List<String>? applicableBenefitIds;

  /// The Amazon Resource Name (ARN) of the benefit allocation.
  final String? arn;

  /// The identifier of the benefit application that resulted in this allocation.
  final String? benefitApplicationId;

  /// The identifier of the benefit that this allocation is based on.
  final String? benefitId;

  /// The catalog identifier that the benefit allocation belongs to.
  final String? catalog;

  /// The timestamp when the benefit allocation was created.
  final DateTime? createdAt;

  /// A detailed description of the benefit allocation.
  final String? description;

  /// The timestamp when the benefit allocation expires and is no longer usable.
  final DateTime? expiresAt;

  /// Detailed information about how the benefit allocation is fulfilled.
  final FulfillmentDetails? fulfillmentDetail;

  /// The fulfillment type used for this benefit allocation.
  final FulfillmentType? fulfillmentType;

  /// The unique identifier of the benefit allocation.
  final String? id;

  /// The human-readable name of the benefit allocation.
  final String? name;

  /// The timestamp when the benefit allocation becomes active and usable.
  final DateTime? startsAt;

  /// The current status of the benefit allocation (e.g., active, expired,
  /// consumed).
  final BenefitAllocationStatus? status;

  /// Additional information explaining the current status of the benefit
  /// allocation.
  final String? statusReason;

  /// The timestamp when the benefit allocation was last updated.
  final DateTime? updatedAt;

  GetBenefitAllocationOutput({
    this.applicableBenefitIds,
    this.arn,
    this.benefitApplicationId,
    this.benefitId,
    this.catalog,
    this.createdAt,
    this.description,
    this.expiresAt,
    this.fulfillmentDetail,
    this.fulfillmentType,
    this.id,
    this.name,
    this.startsAt,
    this.status,
    this.statusReason,
    this.updatedAt,
  });

  factory GetBenefitAllocationOutput.fromJson(Map<String, dynamic> json) {
    return GetBenefitAllocationOutput(
      applicableBenefitIds: (json['ApplicableBenefitIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      arn: json['Arn'] as String?,
      benefitApplicationId: json['BenefitApplicationId'] as String?,
      benefitId: json['BenefitId'] as String?,
      catalog: json['Catalog'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
      fulfillmentDetail: json['FulfillmentDetail'] != null
          ? FulfillmentDetails.fromJson(
              json['FulfillmentDetail'] as Map<String, dynamic>)
          : null,
      fulfillmentType:
          (json['FulfillmentType'] as String?)?.let(FulfillmentType.fromString),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      startsAt: timeStampFromJson(json['StartsAt']),
      status:
          (json['Status'] as String?)?.let(BenefitAllocationStatus.fromString),
      statusReason: json['StatusReason'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicableBenefitIds = this.applicableBenefitIds;
    final arn = this.arn;
    final benefitApplicationId = this.benefitApplicationId;
    final benefitId = this.benefitId;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final description = this.description;
    final expiresAt = this.expiresAt;
    final fulfillmentDetail = this.fulfillmentDetail;
    final fulfillmentType = this.fulfillmentType;
    final id = this.id;
    final name = this.name;
    final startsAt = this.startsAt;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      if (applicableBenefitIds != null)
        'ApplicableBenefitIds': applicableBenefitIds,
      if (arn != null) 'Arn': arn,
      if (benefitApplicationId != null)
        'BenefitApplicationId': benefitApplicationId,
      if (benefitId != null) 'BenefitId': benefitId,
      if (catalog != null) 'Catalog': catalog,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (expiresAt != null) 'ExpiresAt': iso8601ToJson(expiresAt),
      if (fulfillmentDetail != null) 'FulfillmentDetail': fulfillmentDetail,
      if (fulfillmentType != null) 'FulfillmentType': fulfillmentType.value,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (startsAt != null) 'StartsAt': iso8601ToJson(startsAt),
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetBenefitApplicationOutput {
  /// The Amazon Resource Name (ARN) of the benefit application.
  final String? arn;

  /// AWS resources that are associated with this benefit application.
  final List<String>? associatedResources;

  /// Detailed information and requirements specific to the benefit being
  /// requested.
  final Document? benefitApplicationDetails;

  /// The identifier of the benefit being requested in this application.
  final String? benefitId;

  /// The catalog identifier that the benefit application belongs to.
  final String? catalog;

  /// The timestamp when the benefit application was created.
  final DateTime? createdAt;

  /// A detailed description of the benefit application.
  final String? description;

  /// Supporting documents and files attached to the benefit application.
  final List<FileDetail>? fileDetails;

  /// The fulfillment types requested for this benefit application.
  final List<FulfillmentType>? fulfillmentTypes;

  /// The unique identifier of the benefit application.
  final String? id;

  /// The human-readable name of the benefit application.
  final String? name;

  /// Contact information for partner representatives responsible for this benefit
  /// application.
  final List<Contact>? partnerContacts;

  /// The AWS partner programs associated with this benefit application.
  final List<String>? programs;

  /// The current revision number of the benefit application.
  final String? revision;

  /// The current stage in the benefit application processing workflow.
  final String? stage;

  /// The current processing status of the benefit application.
  final BenefitApplicationStatus? status;

  /// Additional information explaining the current status of the benefit
  /// application.
  final String? statusReason;

  /// A standardized code representing the reason for the current status.
  final String? statusReasonCode;

  /// The list of standardized codes representing the reason for the current
  /// status.
  final List<String>? statusReasonCodes;

  /// The timestamp when the benefit application was last updated.
  final DateTime? updatedAt;

  GetBenefitApplicationOutput({
    this.arn,
    this.associatedResources,
    this.benefitApplicationDetails,
    this.benefitId,
    this.catalog,
    this.createdAt,
    this.description,
    this.fileDetails,
    this.fulfillmentTypes,
    this.id,
    this.name,
    this.partnerContacts,
    this.programs,
    this.revision,
    this.stage,
    this.status,
    this.statusReason,
    this.statusReasonCode,
    this.statusReasonCodes,
    this.updatedAt,
  });

  factory GetBenefitApplicationOutput.fromJson(Map<String, dynamic> json) {
    return GetBenefitApplicationOutput(
      arn: json['Arn'] as String?,
      associatedResources: (json['AssociatedResources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      benefitApplicationDetails: json['BenefitApplicationDetails'] != null
          ? Document.fromJson(
              json['BenefitApplicationDetails'] as Map<String, dynamic>)
          : null,
      benefitId: json['BenefitId'] as String?,
      catalog: json['Catalog'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      fileDetails: (json['FileDetails'] as List?)
          ?.nonNulls
          .map((e) => FileDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfillmentTypes: (json['FulfillmentTypes'] as List?)
          ?.nonNulls
          .map((e) => FulfillmentType.fromString((e as String)))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      partnerContacts: (json['PartnerContacts'] as List?)
          ?.nonNulls
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      programs: (json['Programs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      revision: json['Revision'] as String?,
      stage: json['Stage'] as String?,
      status:
          (json['Status'] as String?)?.let(BenefitApplicationStatus.fromString),
      statusReason: json['StatusReason'] as String?,
      statusReasonCode: json['StatusReasonCode'] as String?,
      statusReasonCodes: (json['StatusReasonCodes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedResources = this.associatedResources;
    final benefitApplicationDetails = this.benefitApplicationDetails;
    final benefitId = this.benefitId;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final description = this.description;
    final fileDetails = this.fileDetails;
    final fulfillmentTypes = this.fulfillmentTypes;
    final id = this.id;
    final name = this.name;
    final partnerContacts = this.partnerContacts;
    final programs = this.programs;
    final revision = this.revision;
    final stage = this.stage;
    final status = this.status;
    final statusReason = this.statusReason;
    final statusReasonCode = this.statusReasonCode;
    final statusReasonCodes = this.statusReasonCodes;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (associatedResources != null)
        'AssociatedResources': associatedResources,
      if (benefitApplicationDetails != null)
        'BenefitApplicationDetails': benefitApplicationDetails,
      if (benefitId != null) 'BenefitId': benefitId,
      if (catalog != null) 'Catalog': catalog,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (fileDetails != null) 'FileDetails': fileDetails,
      if (fulfillmentTypes != null)
        'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (partnerContacts != null) 'PartnerContacts': partnerContacts,
      if (programs != null) 'Programs': programs,
      if (revision != null) 'Revision': revision,
      if (stage != null) 'Stage': stage,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
      if (statusReasonCode != null) 'StatusReasonCode': statusReasonCode,
      if (statusReasonCodes != null) 'StatusReasonCodes': statusReasonCodes,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class ListBenefitAllocationsOutput {
  /// A list of benefit allocation summaries matching the specified criteria.
  final List<BenefitAllocationSummary>? benefitAllocationSummaries;

  /// A pagination token to retrieve the next set of results, if more results are
  /// available.
  final String? nextToken;

  ListBenefitAllocationsOutput({
    this.benefitAllocationSummaries,
    this.nextToken,
  });

  factory ListBenefitAllocationsOutput.fromJson(Map<String, dynamic> json) {
    return ListBenefitAllocationsOutput(
      benefitAllocationSummaries: (json['BenefitAllocationSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              BenefitAllocationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final benefitAllocationSummaries = this.benefitAllocationSummaries;
    final nextToken = this.nextToken;
    return {
      if (benefitAllocationSummaries != null)
        'BenefitAllocationSummaries': benefitAllocationSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBenefitApplicationsOutput {
  /// A list of benefit application summaries matching the specified criteria.
  final List<BenefitApplicationSummary>? benefitApplicationSummaries;

  /// A pagination token to retrieve the next set of results, if more results are
  /// available.
  final String? nextToken;

  ListBenefitApplicationsOutput({
    this.benefitApplicationSummaries,
    this.nextToken,
  });

  factory ListBenefitApplicationsOutput.fromJson(Map<String, dynamic> json) {
    return ListBenefitApplicationsOutput(
      benefitApplicationSummaries:
          (json['BenefitApplicationSummaries'] as List?)
              ?.nonNulls
              .map((e) =>
                  BenefitApplicationSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final benefitApplicationSummaries = this.benefitApplicationSummaries;
    final nextToken = this.nextToken;
    return {
      if (benefitApplicationSummaries != null)
        'BenefitApplicationSummaries': benefitApplicationSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBenefitsOutput {
  /// A list of benefit summaries matching the specified criteria.
  final List<BenefitSummary>? benefitSummaries;

  /// A pagination token to retrieve the next set of results, if more results are
  /// available.
  final String? nextToken;

  ListBenefitsOutput({
    this.benefitSummaries,
    this.nextToken,
  });

  factory ListBenefitsOutput.fromJson(Map<String, dynamic> json) {
    return ListBenefitsOutput(
      benefitSummaries: (json['BenefitSummaries'] as List?)
          ?.nonNulls
          .map((e) => BenefitSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final benefitSummaries = this.benefitSummaries;
    final nextToken = this.nextToken;
    return {
      if (benefitSummaries != null) 'BenefitSummaries': benefitSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of key-value pairs representing the tags associated with the
  /// resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class RecallBenefitApplicationOutput {
  RecallBenefitApplicationOutput();

  factory RecallBenefitApplicationOutput.fromJson(Map<String, dynamic> _) {
    return RecallBenefitApplicationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SubmitBenefitApplicationOutput {
  SubmitBenefitApplicationOutput();

  factory SubmitBenefitApplicationOutput.fromJson(Map<String, dynamic> _) {
    return SubmitBenefitApplicationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateBenefitApplicationOutput {
  /// The Amazon Resource Name (ARN) of the updated benefit application.
  final String? arn;

  /// The unique identifier of the updated benefit application.
  final String? id;

  /// The new revision number of the benefit application after the update.
  final String? revision;

  UpdateBenefitApplicationOutput({
    this.arn,
    this.id,
    this.revision,
  });

  factory UpdateBenefitApplicationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateBenefitApplicationOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      revision: json['Revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final revision = this.revision;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (revision != null) 'Revision': revision,
    };
  }
}

/// Represents input information for uploading a file to a benefit application.
class FileInput {
  /// The URI or location where the file should be stored or has been uploaded.
  final String fileURI;

  /// The business purpose or use case that this file supports in the benefit
  /// application.
  final String? businessUseCase;

  FileInput({
    required this.fileURI,
    this.businessUseCase,
  });

  Map<String, dynamic> toJson() {
    final fileURI = this.fileURI;
    final businessUseCase = this.businessUseCase;
    return {
      'FileURI': fileURI,
      if (businessUseCase != null) 'BusinessUseCase': businessUseCase,
    };
  }
}

/// Represents contact information for a partner representative.
class Contact {
  /// The business title or role of the contact person within the organization.
  final String? businessTitle;

  /// The email address of the contact person.
  final String? email;

  /// The first name of the contact person.
  final String? firstName;

  /// The last name of the contact person.
  final String? lastName;

  /// The phone number of the contact person.
  final String? phone;

  Contact({
    this.businessTitle,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      businessTitle: json['BusinessTitle'] as String?,
      email: json['Email'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      phone: json['Phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final businessTitle = this.businessTitle;
    final email = this.email;
    final firstName = this.firstName;
    final lastName = this.lastName;
    final phone = this.phone;
    return {
      if (businessTitle != null) 'BusinessTitle': businessTitle,
      if (email != null) 'Email': email,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (phone != null) 'Phone': phone,
    };
  }
}

/// Represents a key-value pair used for categorizing and organizing AWS
/// resources.
class Tag {
  /// The tag key, which acts as a category or label for the tag.
  final String key;

  /// The tag value, which provides additional information or context for the tag
  /// key.
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

/// A summary view of a benefit containing key information for list operations.
class BenefitSummary {
  /// The Amazon Resource Name (ARN) of the benefit.
  final String? arn;

  /// The catalog identifier that the benefit belongs to.
  final String? catalog;

  /// A brief description of the benefit and its purpose.
  final String? description;

  /// The available fulfillment types for this benefit.
  final List<FulfillmentType>? fulfillmentTypes;

  /// The unique identifier of the benefit.
  final String? id;

  /// The human-readable name of the benefit.
  final String? name;

  /// The AWS partner programs that this benefit is associated with.
  final List<String>? programs;

  /// The current status of the benefit.
  final BenefitStatus? status;

  BenefitSummary({
    this.arn,
    this.catalog,
    this.description,
    this.fulfillmentTypes,
    this.id,
    this.name,
    this.programs,
    this.status,
  });

  factory BenefitSummary.fromJson(Map<String, dynamic> json) {
    return BenefitSummary(
      arn: json['Arn'] as String?,
      catalog: json['Catalog'] as String?,
      description: json['Description'] as String?,
      fulfillmentTypes: (json['FulfillmentTypes'] as List?)
          ?.nonNulls
          .map((e) => FulfillmentType.fromString((e as String)))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      programs: (json['Programs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.let(BenefitStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final description = this.description;
    final fulfillmentTypes = this.fulfillmentTypes;
    final id = this.id;
    final name = this.name;
    final programs = this.programs;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (catalog != null) 'Catalog': catalog,
      if (description != null) 'Description': description,
      if (fulfillmentTypes != null)
        'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (programs != null) 'Programs': programs,
      if (status != null) 'Status': status.value,
    };
  }
}

class BenefitStatus {
  static const active = BenefitStatus._('ACTIVE');
  static const inactive = BenefitStatus._('INACTIVE');

  final String value;

  const BenefitStatus._(this.value);

  static const values = [active, inactive];

  static BenefitStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BenefitStatus._(value));

  @override
  bool operator ==(other) => other is BenefitStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class FulfillmentType {
  static const credits = FulfillmentType._('CREDITS');
  static const cash = FulfillmentType._('CASH');
  static const access = FulfillmentType._('ACCESS');

  final String value;

  const FulfillmentType._(this.value);

  static const values = [credits, cash, access];

  static FulfillmentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FulfillmentType._(value));

  @override
  bool operator ==(other) => other is FulfillmentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary view of a benefit application containing key information for list
/// operations.
class BenefitApplicationSummary {
  /// The Amazon Resource Name (ARN) of the benefit application.
  final String? arn;

  /// AWS resources that are associated with this benefit application.
  final List<String>? associatedResources;

  /// Additional attributes and metadata associated with the benefit application.
  final Map<String, String>? benefitApplicationDetails;

  /// The identifier of the benefit being requested in this application.
  final String? benefitId;

  /// The catalog identifier that the benefit application belongs to.
  final String? catalog;

  /// The timestamp when the benefit application was created.
  final DateTime? createdAt;

  /// The fulfillment types requested for this benefit application.
  final List<FulfillmentType>? fulfillmentTypes;

  /// The unique identifier of the benefit application.
  final String? id;

  /// The human-readable name of the benefit application.
  final String? name;

  /// The AWS partner programs associated with this benefit application.
  final List<String>? programs;

  /// The current stage in the benefit application processing workflow..
  final String? stage;

  /// The current processing status of the benefit application.
  final BenefitApplicationStatus? status;

  /// The timestamp when the benefit application was last updated.
  final DateTime? updatedAt;

  BenefitApplicationSummary({
    this.arn,
    this.associatedResources,
    this.benefitApplicationDetails,
    this.benefitId,
    this.catalog,
    this.createdAt,
    this.fulfillmentTypes,
    this.id,
    this.name,
    this.programs,
    this.stage,
    this.status,
    this.updatedAt,
  });

  factory BenefitApplicationSummary.fromJson(Map<String, dynamic> json) {
    return BenefitApplicationSummary(
      arn: json['Arn'] as String?,
      associatedResources: (json['AssociatedResources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      benefitApplicationDetails:
          (json['BenefitApplicationDetails'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      benefitId: json['BenefitId'] as String?,
      catalog: json['Catalog'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      fulfillmentTypes: (json['FulfillmentTypes'] as List?)
          ?.nonNulls
          .map((e) => FulfillmentType.fromString((e as String)))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      programs: (json['Programs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stage: json['Stage'] as String?,
      status:
          (json['Status'] as String?)?.let(BenefitApplicationStatus.fromString),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedResources = this.associatedResources;
    final benefitApplicationDetails = this.benefitApplicationDetails;
    final benefitId = this.benefitId;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final fulfillmentTypes = this.fulfillmentTypes;
    final id = this.id;
    final name = this.name;
    final programs = this.programs;
    final stage = this.stage;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (associatedResources != null)
        'AssociatedResources': associatedResources,
      if (benefitApplicationDetails != null)
        'BenefitApplicationDetails': benefitApplicationDetails,
      if (benefitId != null) 'BenefitId': benefitId,
      if (catalog != null) 'Catalog': catalog,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (fulfillmentTypes != null)
        'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (programs != null) 'Programs': programs,
      if (stage != null) 'Stage': stage,
      if (status != null) 'Status': status.value,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class BenefitApplicationStatus {
  static const pendingSubmission =
      BenefitApplicationStatus._('PENDING_SUBMISSION');
  static const inReview = BenefitApplicationStatus._('IN_REVIEW');
  static const actionRequired = BenefitApplicationStatus._('ACTION_REQUIRED');
  static const approved = BenefitApplicationStatus._('APPROVED');
  static const rejected = BenefitApplicationStatus._('REJECTED');
  static const canceled = BenefitApplicationStatus._('CANCELED');

  final String value;

  const BenefitApplicationStatus._(this.value);

  static const values = [
    pendingSubmission,
    inReview,
    actionRequired,
    approved,
    rejected,
    canceled
  ];

  static BenefitApplicationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BenefitApplicationStatus._(value));

  @override
  bool operator ==(other) =>
      other is BenefitApplicationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an AWS resource that is associated with a benefit application for
/// tracking and management.
class AssociatedResource {
  /// The Amazon Resource Name (ARN) that uniquely identifies the AWS resource.
  final String? resourceArn;

  /// The unique identifier of the AWS resource within its service.
  final String? resourceIdentifier;

  /// The type of AWS resource (e.g., EC2 instance, S3 bucket, Lambda function).
  final ResourceType? resourceType;

  AssociatedResource({
    this.resourceArn,
    this.resourceIdentifier,
    this.resourceType,
  });

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final resourceIdentifier = this.resourceIdentifier;
    final resourceType = this.resourceType;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
      if (resourceType != null) 'ResourceType': resourceType.value,
    };
  }
}

class ResourceType {
  static const opportunity = ResourceType._('OPPORTUNITY');
  static const benefitAllocation = ResourceType._('BENEFIT_ALLOCATION');

  final String value;

  const ResourceType._(this.value);

  static const values = [opportunity, benefitAllocation];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary view of a benefit allocation containing key information for list
/// operations.
class BenefitAllocationSummary {
  /// The identifiers of the benefits applicable for this allocation.
  final List<String>? applicableBenefitIds;

  /// The Amazon Resource Name (ARN) of the benefit allocation.
  final String? arn;

  /// The identifier of the benefit application that resulted in this allocation.
  final String? benefitApplicationId;

  /// The identifier of the benefit that this allocation is based on.
  final String? benefitId;

  /// The catalog identifier that the benefit allocation belongs to.
  final String? catalog;

  /// The timestamp when the benefit allocation was created.
  final DateTime? createdAt;

  /// The timestamp when the benefit allocation expires.
  final DateTime? expiresAt;

  /// The fulfillment types used for this benefit allocation.
  final List<FulfillmentType>? fulfillmentTypes;

  /// The unique identifier of the benefit allocation.
  final String? id;

  /// The human-readable name of the benefit allocation.
  final String? name;

  /// The current status of the benefit allocation.
  final BenefitAllocationStatus? status;

  /// Additional information explaining the current status of the benefit
  /// allocation.
  final String? statusReason;

  BenefitAllocationSummary({
    this.applicableBenefitIds,
    this.arn,
    this.benefitApplicationId,
    this.benefitId,
    this.catalog,
    this.createdAt,
    this.expiresAt,
    this.fulfillmentTypes,
    this.id,
    this.name,
    this.status,
    this.statusReason,
  });

  factory BenefitAllocationSummary.fromJson(Map<String, dynamic> json) {
    return BenefitAllocationSummary(
      applicableBenefitIds: (json['ApplicableBenefitIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      arn: json['Arn'] as String?,
      benefitApplicationId: json['BenefitApplicationId'] as String?,
      benefitId: json['BenefitId'] as String?,
      catalog: json['Catalog'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      expiresAt: timeStampFromJson(json['ExpiresAt']),
      fulfillmentTypes: (json['FulfillmentTypes'] as List?)
          ?.nonNulls
          .map((e) => FulfillmentType.fromString((e as String)))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status:
          (json['Status'] as String?)?.let(BenefitAllocationStatus.fromString),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicableBenefitIds = this.applicableBenefitIds;
    final arn = this.arn;
    final benefitApplicationId = this.benefitApplicationId;
    final benefitId = this.benefitId;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final fulfillmentTypes = this.fulfillmentTypes;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (applicableBenefitIds != null)
        'ApplicableBenefitIds': applicableBenefitIds,
      if (arn != null) 'Arn': arn,
      if (benefitApplicationId != null)
        'BenefitApplicationId': benefitApplicationId,
      if (benefitId != null) 'BenefitId': benefitId,
      if (catalog != null) 'Catalog': catalog,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (expiresAt != null) 'ExpiresAt': iso8601ToJson(expiresAt),
      if (fulfillmentTypes != null)
        'FulfillmentTypes': fulfillmentTypes.map((e) => e.value).toList(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

class BenefitAllocationStatus {
  static const active = BenefitAllocationStatus._('ACTIVE');
  static const inactive = BenefitAllocationStatus._('INACTIVE');
  static const fulfilled = BenefitAllocationStatus._('FULFILLED');

  final String value;

  const BenefitAllocationStatus._(this.value);

  static const values = [active, inactive, fulfilled];

  static BenefitAllocationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BenefitAllocationStatus._(value));

  @override
  bool operator ==(other) =>
      other is BenefitAllocationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents detailed information about a file attached to a benefit
/// application.
class FileDetail {
  /// The URI or location where the file is stored.
  final String fileURI;

  /// The business purpose or use case that this file supports in the benefit
  /// application.
  final String? businessUseCase;

  /// The timestamp when the file was uploaded.
  final DateTime? createdAt;

  /// The identifier of the user who uploaded the file.
  final String? createdBy;

  /// The original name of the uploaded file.
  final String? fileName;

  /// The current processing status of the file (e.g., uploaded, processing,
  /// approved, rejected).
  final String? fileStatus;

  /// The reason for that particulat file status.
  final String? fileStatusReason;

  /// The type or category of the file (e.g., document, image, spreadsheet).
  final FileType? fileType;

  FileDetail({
    required this.fileURI,
    this.businessUseCase,
    this.createdAt,
    this.createdBy,
    this.fileName,
    this.fileStatus,
    this.fileStatusReason,
    this.fileType,
  });

  factory FileDetail.fromJson(Map<String, dynamic> json) {
    return FileDetail(
      fileURI: (json['FileURI'] as String?) ?? '',
      businessUseCase: json['BusinessUseCase'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      createdBy: json['CreatedBy'] as String?,
      fileName: json['FileName'] as String?,
      fileStatus: json['FileStatus'] as String?,
      fileStatusReason: json['FileStatusReason'] as String?,
      fileType: (json['FileType'] as String?)?.let(FileType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final fileURI = this.fileURI;
    final businessUseCase = this.businessUseCase;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final fileName = this.fileName;
    final fileStatus = this.fileStatus;
    final fileStatusReason = this.fileStatusReason;
    final fileType = this.fileType;
    return {
      'FileURI': fileURI,
      if (businessUseCase != null) 'BusinessUseCase': businessUseCase,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (fileName != null) 'FileName': fileName,
      if (fileStatus != null) 'FileStatus': fileStatus,
      if (fileStatusReason != null) 'FileStatusReason': fileStatusReason,
      if (fileType != null) 'FileType': fileType.value,
    };
  }
}

class FileType {
  static const applicationMsword = FileType._('application/msword');
  static const applicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument =
      FileType._(
          'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
  static const applicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet =
      FileType._(
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  static const applicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation =
      FileType._(
          'application/vnd.openxmlformats-officedocument.presentationml.presentation');
  static const applicationPdf = FileType._('application/pdf');
  static const imagePng = FileType._('image/png');
  static const imageJpeg = FileType._('image/jpeg');
  static const imageSvgXml = FileType._('image/svg+xml');
  static const textCsv = FileType._('text/csv');

  final String value;

  const FileType._(this.value);

  static const values = [
    applicationMsword,
    applicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument,
    applicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet,
    applicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation,
    applicationPdf,
    imagePng,
    imageJpeg,
    imageSvgXml,
    textCsv
  ];

  static FileType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FileType._(value));

  @override
  bool operator ==(other) => other is FileType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains comprehensive information about how a benefit allocation is
/// fulfilled across different fulfillment types.
class FulfillmentDetails {
  /// Details about access-based fulfillment, if applicable to this benefit
  /// allocation.
  final AccessDetails? accessDetails;

  /// Details about consumable-based fulfillment, if applicable to this benefit
  /// allocation.
  final ConsumableDetails? consumableDetails;

  /// Details about credit-based fulfillment, if applicable to this benefit
  /// allocation.
  final CreditDetails? creditDetails;

  /// Details about disbursement-based fulfillment, if applicable to this benefit
  /// allocation.
  final DisbursementDetails? disbursementDetails;

  FulfillmentDetails({
    this.accessDetails,
    this.consumableDetails,
    this.creditDetails,
    this.disbursementDetails,
  });

  factory FulfillmentDetails.fromJson(Map<String, dynamic> json) {
    return FulfillmentDetails(
      accessDetails: json['AccessDetails'] != null
          ? AccessDetails.fromJson(
              json['AccessDetails'] as Map<String, dynamic>)
          : null,
      consumableDetails: json['ConsumableDetails'] != null
          ? ConsumableDetails.fromJson(
              json['ConsumableDetails'] as Map<String, dynamic>)
          : null,
      creditDetails: json['CreditDetails'] != null
          ? CreditDetails.fromJson(
              json['CreditDetails'] as Map<String, dynamic>)
          : null,
      disbursementDetails: json['DisbursementDetails'] != null
          ? DisbursementDetails.fromJson(
              json['DisbursementDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDetails = this.accessDetails;
    final consumableDetails = this.consumableDetails;
    final creditDetails = this.creditDetails;
    final disbursementDetails = this.disbursementDetails;
    return {
      if (accessDetails != null) 'AccessDetails': accessDetails,
      if (consumableDetails != null) 'ConsumableDetails': consumableDetails,
      if (creditDetails != null) 'CreditDetails': creditDetails,
      if (disbursementDetails != null)
        'DisbursementDetails': disbursementDetails,
    };
  }
}

/// Contains information about disbursement-based benefit fulfillment, such as
/// direct payments or reimbursements.
class DisbursementDetails {
  /// The total amount that has been disbursed for this benefit allocation.
  final MonetaryValue? disbursedAmount;

  /// Detailed information about how the disbursement was issued and processed.
  final IssuanceDetail? issuanceDetails;

  DisbursementDetails({
    this.disbursedAmount,
    this.issuanceDetails,
  });

  factory DisbursementDetails.fromJson(Map<String, dynamic> json) {
    return DisbursementDetails(
      disbursedAmount: json['DisbursedAmount'] != null
          ? MonetaryValue.fromJson(
              json['DisbursedAmount'] as Map<String, dynamic>)
          : null,
      issuanceDetails: json['IssuanceDetails'] != null
          ? IssuanceDetail.fromJson(
              json['IssuanceDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final disbursedAmount = this.disbursedAmount;
    final issuanceDetails = this.issuanceDetails;
    return {
      if (disbursedAmount != null) 'DisbursedAmount': disbursedAmount,
      if (issuanceDetails != null) 'IssuanceDetails': issuanceDetails,
    };
  }
}

/// Contains information about consumable benefit fulfillment, such as usage
/// quotas or service limits.
class ConsumableDetails {
  /// The total amount of the consumable benefit that has been allocated.
  final MonetaryValue? allocatedAmount;

  /// Detailed information about how the consumable benefit was issued and
  /// distributed.
  final IssuanceDetail? issuanceDetails;

  /// The remaining amount of the consumable benefit that is still available for
  /// use.
  final MonetaryValue? remainingAmount;

  /// The amount of the consumable benefit that has already been used.
  final MonetaryValue? utilizedAmount;

  ConsumableDetails({
    this.allocatedAmount,
    this.issuanceDetails,
    this.remainingAmount,
    this.utilizedAmount,
  });

  factory ConsumableDetails.fromJson(Map<String, dynamic> json) {
    return ConsumableDetails(
      allocatedAmount: json['AllocatedAmount'] != null
          ? MonetaryValue.fromJson(
              json['AllocatedAmount'] as Map<String, dynamic>)
          : null,
      issuanceDetails: json['IssuanceDetails'] != null
          ? IssuanceDetail.fromJson(
              json['IssuanceDetails'] as Map<String, dynamic>)
          : null,
      remainingAmount: json['RemainingAmount'] != null
          ? MonetaryValue.fromJson(
              json['RemainingAmount'] as Map<String, dynamic>)
          : null,
      utilizedAmount: json['UtilizedAmount'] != null
          ? MonetaryValue.fromJson(
              json['UtilizedAmount'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedAmount = this.allocatedAmount;
    final issuanceDetails = this.issuanceDetails;
    final remainingAmount = this.remainingAmount;
    final utilizedAmount = this.utilizedAmount;
    return {
      if (allocatedAmount != null) 'AllocatedAmount': allocatedAmount,
      if (issuanceDetails != null) 'IssuanceDetails': issuanceDetails,
      if (remainingAmount != null) 'RemainingAmount': remainingAmount,
      if (utilizedAmount != null) 'UtilizedAmount': utilizedAmount,
    };
  }
}

/// Contains information about credit-based benefit fulfillment, including AWS
/// promotional credits.
class CreditDetails {
  /// The total amount of credits that have been allocated for this benefit.
  final MonetaryValue allocatedAmount;

  /// A list of credit codes that have been generated for this benefit allocation.
  final List<CreditCode> codes;

  /// The amount of credits that have actually been issued and are available for
  /// use.
  final MonetaryValue issuedAmount;

  CreditDetails({
    required this.allocatedAmount,
    required this.codes,
    required this.issuedAmount,
  });

  factory CreditDetails.fromJson(Map<String, dynamic> json) {
    return CreditDetails(
      allocatedAmount: MonetaryValue.fromJson(
          (json['AllocatedAmount'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      codes: ((json['Codes'] as List?) ?? const [])
          .nonNulls
          .map((e) => CreditCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      issuedAmount: MonetaryValue.fromJson(
          (json['IssuedAmount'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedAmount = this.allocatedAmount;
    final codes = this.codes;
    final issuedAmount = this.issuedAmount;
    return {
      'AllocatedAmount': allocatedAmount,
      'Codes': codes,
      'IssuedAmount': issuedAmount,
    };
  }
}

/// Contains information about access-based benefit fulfillment, such as service
/// permissions or feature access.
class AccessDetails {
  /// A description of the access privileges or permissions granted by this
  /// benefit.
  final String? description;

  AccessDetails({
    this.description,
  });

  factory AccessDetails.fromJson(Map<String, dynamic> json) {
    return AccessDetails(
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    return {
      if (description != null) 'Description': description,
    };
  }
}

/// Represents a monetary amount with its associated currency.
class MonetaryValue {
  /// The numeric amount of the monetary value.
  final String amount;

  /// The ISO 4217 currency code (e.g., USD, EUR) for the monetary amount.
  final CurrencyCode currencyCode;

  MonetaryValue({
    required this.amount,
    required this.currencyCode,
  });

  factory MonetaryValue.fromJson(Map<String, dynamic> json) {
    return MonetaryValue(
      amount: (json['Amount'] as String?) ?? '',
      currencyCode:
          CurrencyCode.fromString((json['CurrencyCode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final currencyCode = this.currencyCode;
    return {
      'Amount': amount,
      'CurrencyCode': currencyCode.value,
    };
  }
}

/// Represents an AWS credit code that can be applied to an AWS account for
/// billing purposes.
class CreditCode {
  /// The AWS account ID that the credit code is associated with or can be applied
  /// to.
  final String awsAccountId;

  /// The actual credit code string that can be redeemed in the AWS billing
  /// console.
  final String awsCreditCode;

  /// The timestamp when the credit code expires and can no longer be redeemed.
  final DateTime expiresAt;

  /// The timestamp when the credit code was issued.
  final DateTime issuedAt;

  /// The current status of the credit code (e.g., active, redeemed, expired).
  final BenefitAllocationStatus status;

  /// The monetary value of the credit code.
  final MonetaryValue value;

  CreditCode({
    required this.awsAccountId,
    required this.awsCreditCode,
    required this.expiresAt,
    required this.issuedAt,
    required this.status,
    required this.value,
  });

  factory CreditCode.fromJson(Map<String, dynamic> json) {
    return CreditCode(
      awsAccountId: (json['AwsAccountId'] as String?) ?? '',
      awsCreditCode: (json['AwsCreditCode'] as String?) ?? '',
      expiresAt: nonNullableTimeStampFromJson(json['ExpiresAt'] ?? 0),
      issuedAt: nonNullableTimeStampFromJson(json['IssuedAt'] ?? 0),
      status:
          BenefitAllocationStatus.fromString((json['Status'] as String?) ?? ''),
      value: MonetaryValue.fromJson((json['Value'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final awsCreditCode = this.awsCreditCode;
    final expiresAt = this.expiresAt;
    final issuedAt = this.issuedAt;
    final status = this.status;
    final value = this.value;
    return {
      'AwsAccountId': awsAccountId,
      'AwsCreditCode': awsCreditCode,
      'ExpiresAt': iso8601ToJson(expiresAt),
      'IssuedAt': iso8601ToJson(issuedAt),
      'Status': status.value,
      'Value': value,
    };
  }
}

class CurrencyCode {
  static const aed = CurrencyCode._('AED');
  static const amd = CurrencyCode._('AMD');
  static const ars = CurrencyCode._('ARS');
  static const aud = CurrencyCode._('AUD');
  static const awg = CurrencyCode._('AWG');
  static const azn = CurrencyCode._('AZN');
  static const bbd = CurrencyCode._('BBD');
  static const bdt = CurrencyCode._('BDT');
  static const bgn = CurrencyCode._('BGN');
  static const bmd = CurrencyCode._('BMD');
  static const bnd = CurrencyCode._('BND');
  static const bob = CurrencyCode._('BOB');
  static const brl = CurrencyCode._('BRL');
  static const bsd = CurrencyCode._('BSD');
  static const byr = CurrencyCode._('BYR');
  static const bzd = CurrencyCode._('BZD');
  static const cad = CurrencyCode._('CAD');
  static const chf = CurrencyCode._('CHF');
  static const clp = CurrencyCode._('CLP');
  static const cny = CurrencyCode._('CNY');
  static const cop = CurrencyCode._('COP');
  static const crc = CurrencyCode._('CRC');
  static const czk = CurrencyCode._('CZK');
  static const dkk = CurrencyCode._('DKK');
  static const dop = CurrencyCode._('DOP');
  static const eek = CurrencyCode._('EEK');
  static const egp = CurrencyCode._('EGP');
  static const eur = CurrencyCode._('EUR');
  static const gbp = CurrencyCode._('GBP');
  static const gel = CurrencyCode._('GEL');
  static const ghs = CurrencyCode._('GHS');
  static const gtq = CurrencyCode._('GTQ');
  static const gyd = CurrencyCode._('GYD');
  static const hkd = CurrencyCode._('HKD');
  static const hnl = CurrencyCode._('HNL');
  static const hrk = CurrencyCode._('HRK');
  static const htg = CurrencyCode._('HTG');
  static const huf = CurrencyCode._('HUF');
  static const idr = CurrencyCode._('IDR');
  static const ils = CurrencyCode._('ILS');
  static const inr = CurrencyCode._('INR');
  static const isk = CurrencyCode._('ISK');
  static const jmd = CurrencyCode._('JMD');
  static const jpy = CurrencyCode._('JPY');
  static const kes = CurrencyCode._('KES');
  static const khr = CurrencyCode._('KHR');
  static const krw = CurrencyCode._('KRW');
  static const kyd = CurrencyCode._('KYD');
  static const kzt = CurrencyCode._('KZT');
  static const lbp = CurrencyCode._('LBP');
  static const lkr = CurrencyCode._('LKR');
  static const ltl = CurrencyCode._('LTL');
  static const lvl = CurrencyCode._('LVL');
  static const mad = CurrencyCode._('MAD');
  static const mnt = CurrencyCode._('MNT');
  static const mop = CurrencyCode._('MOP');
  static const mur = CurrencyCode._('MUR');
  static const mvr = CurrencyCode._('MVR');
  static const mxn = CurrencyCode._('MXN');
  static const myr = CurrencyCode._('MYR');
  static const nad = CurrencyCode._('NAD');
  static const ngn = CurrencyCode._('NGN');
  static const nio = CurrencyCode._('NIO');
  static const nok = CurrencyCode._('NOK');
  static const nzd = CurrencyCode._('NZD');
  static const pab = CurrencyCode._('PAB');
  static const pen = CurrencyCode._('PEN');
  static const php = CurrencyCode._('PHP');
  static const pkr = CurrencyCode._('PKR');
  static const pln = CurrencyCode._('PLN');
  static const pyg = CurrencyCode._('PYG');
  static const qar = CurrencyCode._('QAR');
  static const ron = CurrencyCode._('RON');
  static const rub = CurrencyCode._('RUB');
  static const sar = CurrencyCode._('SAR');
  static const sek = CurrencyCode._('SEK');
  static const sgd = CurrencyCode._('SGD');
  static const sit = CurrencyCode._('SIT');
  static const skk = CurrencyCode._('SKK');
  static const thb = CurrencyCode._('THB');
  static const tnd = CurrencyCode._('TND');
  static const $try = CurrencyCode._('TRY');
  static const ttd = CurrencyCode._('TTD');
  static const twd = CurrencyCode._('TWD');
  static const tzs = CurrencyCode._('TZS');
  static const uah = CurrencyCode._('UAH');
  static const usd = CurrencyCode._('USD');
  static const uyu = CurrencyCode._('UYU');
  static const uzs = CurrencyCode._('UZS');
  static const vnd = CurrencyCode._('VND');
  static const xaf = CurrencyCode._('XAF');
  static const xcd = CurrencyCode._('XCD');
  static const xof = CurrencyCode._('XOF');
  static const xpf = CurrencyCode._('XPF');
  static const zar = CurrencyCode._('ZAR');

  final String value;

  const CurrencyCode._(this.value);

  static const values = [
    aed,
    amd,
    ars,
    aud,
    awg,
    azn,
    bbd,
    bdt,
    bgn,
    bmd,
    bnd,
    bob,
    brl,
    bsd,
    byr,
    bzd,
    cad,
    chf,
    clp,
    cny,
    cop,
    crc,
    czk,
    dkk,
    dop,
    eek,
    egp,
    eur,
    gbp,
    gel,
    ghs,
    gtq,
    gyd,
    hkd,
    hnl,
    hrk,
    htg,
    huf,
    idr,
    ils,
    inr,
    isk,
    jmd,
    jpy,
    kes,
    khr,
    krw,
    kyd,
    kzt,
    lbp,
    lkr,
    ltl,
    lvl,
    mad,
    mnt,
    mop,
    mur,
    mvr,
    mxn,
    myr,
    nad,
    ngn,
    nio,
    nok,
    nzd,
    pab,
    pen,
    php,
    pkr,
    pln,
    pyg,
    qar,
    ron,
    rub,
    sar,
    sek,
    sgd,
    sit,
    skk,
    thb,
    tnd,
    $try,
    ttd,
    twd,
    tzs,
    uah,
    usd,
    uyu,
    uzs,
    vnd,
    xaf,
    xcd,
    xof,
    xpf,
    zar
  ];

  static CurrencyCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CurrencyCode._(value));

  @override
  bool operator ==(other) => other is CurrencyCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents detailed information about a specific issuance of benefit value.
class IssuanceDetail {
  /// The monetary amount or value that was issued in this specific issuance.
  final MonetaryValue? issuanceAmount;

  /// The unique identifier for this specific issuance.
  final String? issuanceId;

  /// The timestamp when this specific issuance was processed.
  final DateTime? issuedAt;

  IssuanceDetail({
    this.issuanceAmount,
    this.issuanceId,
    this.issuedAt,
  });

  factory IssuanceDetail.fromJson(Map<String, dynamic> json) {
    return IssuanceDetail(
      issuanceAmount: json['IssuanceAmount'] != null
          ? MonetaryValue.fromJson(
              json['IssuanceAmount'] as Map<String, dynamic>)
          : null,
      issuanceId: json['IssuanceId'] as String?,
      issuedAt: timeStampFromJson(json['IssuedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final issuanceAmount = this.issuanceAmount;
    final issuanceId = this.issuanceId;
    final issuedAt = this.issuedAt;
    return {
      if (issuanceAmount != null) 'IssuanceAmount': issuanceAmount,
      if (issuanceId != null) 'IssuanceId': issuanceId,
      if (issuedAt != null) 'IssuedAt': iso8601ToJson(issuedAt),
    };
  }
}

/// Represents a specific change to be made to a benefit application field.
class Amendment {
  /// The JSON path or field identifier specifying which field in the benefit
  /// application to modify.
  final String fieldPath;

  /// The new value to set for the specified field in the benefit application.
  final String newValue;

  Amendment({
    required this.fieldPath,
    required this.newValue,
  });

  Map<String, dynamic> toJson() {
    final fieldPath = this.fieldPath;
    final newValue = this.newValue;
    return {
      'FieldPath': fieldPath,
      'NewValue': newValue,
    };
  }
}

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
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
