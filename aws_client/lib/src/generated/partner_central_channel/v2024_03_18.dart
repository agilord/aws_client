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

/// AWS Partner Central Channel service for managing partner relationships,
/// handshakes, and program management accounts.
class PartnerCentralChannel {
  final _s.JsonProtocol _protocol;
  PartnerCentralChannel({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'partnercentral-channel',
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

  /// Lists tags associated with a specific resource.
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
      'X-Amz-Target': 'PartnerCentralChannel.ListTagsForResource'
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

  /// Adds or updates tags for a specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to tag.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.TagResource'
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

  /// Removes tags from a specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.UntagResource'
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

  /// Creates a new channel handshake request to establish a partnership with
  /// another AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [associatedResourceIdentifier] :
  /// The identifier of the resource associated with this handshake.
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the handshake request.
  ///
  /// Parameter [handshakeType] :
  /// The type of handshake to create (e.g., start service period, revoke
  /// service period).
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [payload] :
  /// The payload containing specific details for the handshake type.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with the channel handshake.
  Future<CreateChannelHandshakeResponse> createChannelHandshake({
    required String associatedResourceIdentifier,
    required String catalog,
    required HandshakeType handshakeType,
    String? clientToken,
    ChannelHandshakePayload? payload,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.CreateChannelHandshake'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'associatedResourceIdentifier': associatedResourceIdentifier,
        'catalog': catalog,
        'handshakeType': handshakeType.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (payload != null) 'payload': payload,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateChannelHandshakeResponse.fromJson(jsonResponse.body);
  }

  /// Lists channel handshakes based on specified criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier to filter handshakes.
  ///
  /// Parameter [handshakeType] :
  /// Filter results by handshake type.
  ///
  /// Parameter [participantType] :
  /// Filter by participant type (sender or receiver).
  ///
  /// Parameter [associatedResourceIdentifiers] :
  /// Filter by associated resource identifiers.
  ///
  /// Parameter [handshakeTypeFilters] :
  /// Type-specific filters for handshakes.
  ///
  /// Parameter [handshakeTypeSort] :
  /// Type-specific sorting options for handshakes.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for retrieving the next page of results.
  ///
  /// Parameter [statuses] :
  /// Filter results by handshake status.
  Future<ListChannelHandshakesResponse> listChannelHandshakes({
    required String catalog,
    required HandshakeType handshakeType,
    required ParticipantType participantType,
    List<String>? associatedResourceIdentifiers,
    ListChannelHandshakesTypeFilters? handshakeTypeFilters,
    ListChannelHandshakesTypeSort? handshakeTypeSort,
    int? maxResults,
    String? nextToken,
    List<HandshakeStatus>? statuses,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.ListChannelHandshakes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'handshakeType': handshakeType.value,
        'participantType': participantType.value,
        if (associatedResourceIdentifiers != null)
          'associatedResourceIdentifiers': associatedResourceIdentifiers,
        if (handshakeTypeFilters != null)
          'handshakeTypeFilters': handshakeTypeFilters,
        if (handshakeTypeSort != null) 'handshakeTypeSort': handshakeTypeSort,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (statuses != null) 'statuses': statuses.map((e) => e.value).toList(),
      },
    );

    return ListChannelHandshakesResponse.fromJson(jsonResponse.body);
  }

  /// Accepts a pending channel handshake request from another AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the handshake request.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the channel handshake to accept.
  Future<AcceptChannelHandshakeResponse> acceptChannelHandshake({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.AcceptChannelHandshake'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'identifier': identifier,
      },
    );

    return AcceptChannelHandshakeResponse.fromJson(jsonResponse.body);
  }

  /// Cancels a pending channel handshake request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the handshake request.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the channel handshake to cancel.
  Future<CancelChannelHandshakeResponse> cancelChannelHandshake({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.CancelChannelHandshake'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'identifier': identifier,
      },
    );

    return CancelChannelHandshakeResponse.fromJson(jsonResponse.body);
  }

  /// Rejects a pending channel handshake request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the handshake request.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the channel handshake to reject.
  Future<RejectChannelHandshakeResponse> rejectChannelHandshake({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.RejectChannelHandshake'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'identifier': identifier,
      },
    );

    return RejectChannelHandshakeResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new program management account for managing partner
  /// relationships.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID to associate with the program management account.
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the program management account.
  ///
  /// Parameter [displayName] :
  /// A human-readable name for the program management account.
  ///
  /// Parameter [program] :
  /// The program type for the management account.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with the program management account.
  Future<CreateProgramManagementAccountResponse>
      createProgramManagementAccount({
    required String accountId,
    required String catalog,
    required String displayName,
    required Program program,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.CreateProgramManagementAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'accountId': accountId,
        'catalog': catalog,
        'displayName': displayName,
        'program': program.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateProgramManagementAccountResponse.fromJson(jsonResponse.body);
  }

  /// Updates the properties of a program management account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the program management account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the program management account to update.
  ///
  /// Parameter [displayName] :
  /// The new display name for the program management account.
  ///
  /// Parameter [revision] :
  /// The current revision number of the program management account.
  Future<UpdateProgramManagementAccountResponse>
      updateProgramManagementAccount({
    required String catalog,
    required String identifier,
    String? displayName,
    String? revision,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.UpdateProgramManagementAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'identifier': identifier,
        if (displayName != null) 'displayName': displayName,
        if (revision != null) 'revision': revision,
      },
    );

    return UpdateProgramManagementAccountResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a program management account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the program management account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the program management account to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  Future<void> deleteProgramManagementAccount({
    required String catalog,
    required String identifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.DeleteProgramManagementAccount'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'identifier': identifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Lists program management accounts based on specified criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier to filter accounts.
  ///
  /// Parameter [accountIds] :
  /// Filter by AWS account IDs.
  ///
  /// Parameter [displayNames] :
  /// Filter by display names.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for retrieving the next page of results.
  ///
  /// Parameter [programs] :
  /// Filter by program types.
  ///
  /// Parameter [sort] :
  /// Sorting options for the results.
  ///
  /// Parameter [statuses] :
  /// Filter by program management account statuses.
  Future<ListProgramManagementAccountsResponse> listProgramManagementAccounts({
    required String catalog,
    List<String>? accountIds,
    List<String>? displayNames,
    int? maxResults,
    String? nextToken,
    List<Program>? programs,
    ListProgramManagementAccountsSortBase? sort,
    List<ProgramManagementAccountStatus>? statuses,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.ListProgramManagementAccounts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        if (accountIds != null) 'accountIds': accountIds,
        if (displayNames != null) 'displayNames': displayNames,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (programs != null) 'programs': programs.map((e) => e.value).toList(),
        if (sort != null) 'sort': sort,
        if (statuses != null) 'statuses': statuses.map((e) => e.value).toList(),
      },
    );

    return ListProgramManagementAccountsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new partner relationship between accounts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [associatedAccountId] :
  /// The AWS account ID to associate in this relationship.
  ///
  /// Parameter [associationType] :
  /// The type of association for the relationship (e.g., reseller,
  /// distributor).
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the relationship.
  ///
  /// Parameter [displayName] :
  /// A human-readable name for the relationship.
  ///
  /// Parameter [programManagementAccountIdentifier] :
  /// The identifier of the program management account for this relationship.
  ///
  /// Parameter [sector] :
  /// The business sector for the relationship.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [requestedSupportPlan] :
  /// The support plan requested for this relationship.
  ///
  /// Parameter [resaleAccountModel] :
  /// The resale account model for the relationship.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with the relationship.
  Future<CreateRelationshipResponse> createRelationship({
    required String associatedAccountId,
    required AssociationType associationType,
    required String catalog,
    required String displayName,
    required String programManagementAccountIdentifier,
    required Sector sector,
    String? clientToken,
    SupportPlan? requestedSupportPlan,
    ResaleAccountModel? resaleAccountModel,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.CreateRelationship'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'associatedAccountId': associatedAccountId,
        'associationType': associationType.value,
        'catalog': catalog,
        'displayName': displayName,
        'programManagementAccountIdentifier':
            programManagementAccountIdentifier,
        'sector': sector.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (requestedSupportPlan != null)
          'requestedSupportPlan': requestedSupportPlan,
        if (resaleAccountModel != null)
          'resaleAccountModel': resaleAccountModel.value,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRelationshipResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details of a specific partner relationship.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the relationship.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the relationship to retrieve.
  ///
  /// Parameter [programManagementAccountIdentifier] :
  /// The identifier of the program management account associated with the
  /// relationship.
  Future<GetRelationshipResponse> getRelationship({
    required String catalog,
    required String identifier,
    required String programManagementAccountIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.GetRelationship'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'identifier': identifier,
        'programManagementAccountIdentifier':
            programManagementAccountIdentifier,
      },
    );

    return GetRelationshipResponse.fromJson(jsonResponse.body);
  }

  /// Updates the properties of a partner relationship.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the relationship.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the relationship to update.
  ///
  /// Parameter [programManagementAccountIdentifier] :
  /// The identifier of the program management account associated with the
  /// relationship.
  ///
  /// Parameter [displayName] :
  /// The new display name for the relationship.
  ///
  /// Parameter [requestedSupportPlan] :
  /// The updated support plan for the relationship.
  ///
  /// Parameter [revision] :
  /// The current revision number of the relationship.
  Future<UpdateRelationshipResponse> updateRelationship({
    required String catalog,
    required String identifier,
    required String programManagementAccountIdentifier,
    String? displayName,
    SupportPlan? requestedSupportPlan,
    String? revision,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.UpdateRelationship'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'identifier': identifier,
        'programManagementAccountIdentifier':
            programManagementAccountIdentifier,
        if (displayName != null) 'displayName': displayName,
        if (requestedSupportPlan != null)
          'requestedSupportPlan': requestedSupportPlan,
        if (revision != null) 'revision': revision,
      },
    );

    return UpdateRelationshipResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a partner relationship.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the relationship.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the relationship to delete.
  ///
  /// Parameter [programManagementAccountIdentifier] :
  /// The identifier of the program management account associated with the
  /// relationship.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  Future<void> deleteRelationship({
    required String catalog,
    required String identifier,
    required String programManagementAccountIdentifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.DeleteRelationship'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        'identifier': identifier,
        'programManagementAccountIdentifier':
            programManagementAccountIdentifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Lists partner relationships based on specified criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier to filter relationships.
  ///
  /// Parameter [associatedAccountIds] :
  /// Filter by associated AWS account IDs.
  ///
  /// Parameter [associationTypes] :
  /// Filter by association types.
  ///
  /// Parameter [displayNames] :
  /// Filter by display names.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for retrieving the next page of results.
  ///
  /// Parameter [programManagementAccountIdentifiers] :
  /// Filter by program management account identifiers.
  ///
  /// Parameter [sort] :
  /// Sorting options for the results.
  Future<ListRelationshipsResponse> listRelationships({
    required String catalog,
    List<String>? associatedAccountIds,
    List<AssociationType>? associationTypes,
    List<String>? displayNames,
    int? maxResults,
    String? nextToken,
    List<String>? programManagementAccountIdentifiers,
    ListRelationshipsSortBase? sort,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralChannel.ListRelationships'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalog': catalog,
        if (associatedAccountIds != null)
          'associatedAccountIds': associatedAccountIds,
        if (associationTypes != null)
          'associationTypes': associationTypes.map((e) => e.value).toList(),
        if (displayNames != null) 'displayNames': displayNames,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (programManagementAccountIdentifiers != null)
          'programManagementAccountIdentifiers':
              programManagementAccountIdentifiers,
        if (sort != null) 'sort': sort,
      },
    );

    return ListRelationshipsResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Key-value pairs associated with the resource.
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

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateChannelHandshakeResponse {
  /// Details of the created channel handshake.
  final CreateChannelHandshakeDetail? channelHandshakeDetail;

  CreateChannelHandshakeResponse({
    this.channelHandshakeDetail,
  });

  factory CreateChannelHandshakeResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelHandshakeResponse(
      channelHandshakeDetail: json['channelHandshakeDetail'] != null
          ? CreateChannelHandshakeDetail.fromJson(
              json['channelHandshakeDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelHandshakeDetail = this.channelHandshakeDetail;
    return {
      if (channelHandshakeDetail != null)
        'channelHandshakeDetail': channelHandshakeDetail,
    };
  }
}

/// @nodoc
class ListChannelHandshakesResponse {
  /// List of channel handshakes matching the criteria.
  final List<ChannelHandshakeSummary>? items;

  /// Token for retrieving the next page of results, if available.
  final String? nextToken;

  ListChannelHandshakesResponse({
    this.items,
    this.nextToken,
  });

  factory ListChannelHandshakesResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelHandshakesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              ChannelHandshakeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class AcceptChannelHandshakeResponse {
  /// Details of the accepted channel handshake.
  final AcceptChannelHandshakeDetail? channelHandshakeDetail;

  AcceptChannelHandshakeResponse({
    this.channelHandshakeDetail,
  });

  factory AcceptChannelHandshakeResponse.fromJson(Map<String, dynamic> json) {
    return AcceptChannelHandshakeResponse(
      channelHandshakeDetail: json['channelHandshakeDetail'] != null
          ? AcceptChannelHandshakeDetail.fromJson(
              json['channelHandshakeDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelHandshakeDetail = this.channelHandshakeDetail;
    return {
      if (channelHandshakeDetail != null)
        'channelHandshakeDetail': channelHandshakeDetail,
    };
  }
}

/// @nodoc
class CancelChannelHandshakeResponse {
  /// Details of the canceled channel handshake.
  final CancelChannelHandshakeDetail? channelHandshakeDetail;

  CancelChannelHandshakeResponse({
    this.channelHandshakeDetail,
  });

  factory CancelChannelHandshakeResponse.fromJson(Map<String, dynamic> json) {
    return CancelChannelHandshakeResponse(
      channelHandshakeDetail: json['channelHandshakeDetail'] != null
          ? CancelChannelHandshakeDetail.fromJson(
              json['channelHandshakeDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelHandshakeDetail = this.channelHandshakeDetail;
    return {
      if (channelHandshakeDetail != null)
        'channelHandshakeDetail': channelHandshakeDetail,
    };
  }
}

/// @nodoc
class RejectChannelHandshakeResponse {
  /// Details of the rejected channel handshake.
  final RejectChannelHandshakeDetail? channelHandshakeDetail;

  RejectChannelHandshakeResponse({
    this.channelHandshakeDetail,
  });

  factory RejectChannelHandshakeResponse.fromJson(Map<String, dynamic> json) {
    return RejectChannelHandshakeResponse(
      channelHandshakeDetail: json['channelHandshakeDetail'] != null
          ? RejectChannelHandshakeDetail.fromJson(
              json['channelHandshakeDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelHandshakeDetail = this.channelHandshakeDetail;
    return {
      if (channelHandshakeDetail != null)
        'channelHandshakeDetail': channelHandshakeDetail,
    };
  }
}

/// @nodoc
class CreateProgramManagementAccountResponse {
  /// Details of the created program management account.
  final CreateProgramManagementAccountDetail? programManagementAccountDetail;

  CreateProgramManagementAccountResponse({
    this.programManagementAccountDetail,
  });

  factory CreateProgramManagementAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateProgramManagementAccountResponse(
      programManagementAccountDetail: json['programManagementAccountDetail'] !=
              null
          ? CreateProgramManagementAccountDetail.fromJson(
              json['programManagementAccountDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final programManagementAccountDetail = this.programManagementAccountDetail;
    return {
      if (programManagementAccountDetail != null)
        'programManagementAccountDetail': programManagementAccountDetail,
    };
  }
}

/// @nodoc
class UpdateProgramManagementAccountResponse {
  /// Details of the updated program management account.
  final UpdateProgramManagementAccountDetail? programManagementAccountDetail;

  UpdateProgramManagementAccountResponse({
    this.programManagementAccountDetail,
  });

  factory UpdateProgramManagementAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateProgramManagementAccountResponse(
      programManagementAccountDetail: json['programManagementAccountDetail'] !=
              null
          ? UpdateProgramManagementAccountDetail.fromJson(
              json['programManagementAccountDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final programManagementAccountDetail = this.programManagementAccountDetail;
    return {
      if (programManagementAccountDetail != null)
        'programManagementAccountDetail': programManagementAccountDetail,
    };
  }
}

/// @nodoc
class DeleteProgramManagementAccountResponse {
  DeleteProgramManagementAccountResponse();

  factory DeleteProgramManagementAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteProgramManagementAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListProgramManagementAccountsResponse {
  /// List of program management accounts matching the criteria.
  final List<ProgramManagementAccountSummary>? items;

  /// Token for retrieving the next page of results, if available.
  final String? nextToken;

  ListProgramManagementAccountsResponse({
    this.items,
    this.nextToken,
  });

  factory ListProgramManagementAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProgramManagementAccountsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ProgramManagementAccountSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateRelationshipResponse {
  /// Details of the created relationship.
  final CreateRelationshipDetail? relationshipDetail;

  CreateRelationshipResponse({
    this.relationshipDetail,
  });

  factory CreateRelationshipResponse.fromJson(Map<String, dynamic> json) {
    return CreateRelationshipResponse(
      relationshipDetail: json['relationshipDetail'] != null
          ? CreateRelationshipDetail.fromJson(
              json['relationshipDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final relationshipDetail = this.relationshipDetail;
    return {
      if (relationshipDetail != null) 'relationshipDetail': relationshipDetail,
    };
  }
}

/// @nodoc
class GetRelationshipResponse {
  /// Details of the requested relationship.
  final RelationshipDetail? relationshipDetail;

  GetRelationshipResponse({
    this.relationshipDetail,
  });

  factory GetRelationshipResponse.fromJson(Map<String, dynamic> json) {
    return GetRelationshipResponse(
      relationshipDetail: json['relationshipDetail'] != null
          ? RelationshipDetail.fromJson(
              json['relationshipDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final relationshipDetail = this.relationshipDetail;
    return {
      if (relationshipDetail != null) 'relationshipDetail': relationshipDetail,
    };
  }
}

/// @nodoc
class UpdateRelationshipResponse {
  /// Details of the updated relationship.
  final UpdateRelationshipDetail? relationshipDetail;

  UpdateRelationshipResponse({
    this.relationshipDetail,
  });

  factory UpdateRelationshipResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRelationshipResponse(
      relationshipDetail: json['relationshipDetail'] != null
          ? UpdateRelationshipDetail.fromJson(
              json['relationshipDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final relationshipDetail = this.relationshipDetail;
    return {
      if (relationshipDetail != null) 'relationshipDetail': relationshipDetail,
    };
  }
}

/// @nodoc
class DeleteRelationshipResponse {
  DeleteRelationshipResponse();

  factory DeleteRelationshipResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRelationshipResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListRelationshipsResponse {
  /// List of relationships matching the criteria.
  final List<RelationshipSummary>? items;

  /// Token for retrieving the next page of results, if available.
  final String? nextToken;

  ListRelationshipsResponse({
    this.items,
    this.nextToken,
  });

  factory ListRelationshipsResponse.fromJson(Map<String, dynamic> json) {
    return ListRelationshipsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => RelationshipSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Summary information about a partner relationship.
///
/// @nodoc
class RelationshipSummary {
  /// The Amazon Resource Name (ARN) of the relationship.
  final String? arn;

  /// The AWS account ID associated in this relationship.
  final String? associatedAccountId;

  /// The type of association for the relationship.
  final AssociationType? associationType;

  /// The catalog identifier associated with the relationship.
  final String? catalog;

  /// The timestamp when the relationship was created.
  final DateTime? createdAt;

  /// The display name of the relationship.
  final String? displayName;

  /// The unique identifier of the relationship.
  final String? id;

  /// The identifier of the program management account.
  final String? programManagementAccountId;

  /// The current revision number of the relationship.
  final String? revision;

  /// The business sector for the relationship.
  final Sector? sector;

  /// The start date of the relationship.
  final DateTime? startDate;

  /// The timestamp when the relationship was last updated.
  final DateTime? updatedAt;

  RelationshipSummary({
    this.arn,
    this.associatedAccountId,
    this.associationType,
    this.catalog,
    this.createdAt,
    this.displayName,
    this.id,
    this.programManagementAccountId,
    this.revision,
    this.sector,
    this.startDate,
    this.updatedAt,
  });

  factory RelationshipSummary.fromJson(Map<String, dynamic> json) {
    return RelationshipSummary(
      arn: json['arn'] as String?,
      associatedAccountId: json['associatedAccountId'] as String?,
      associationType:
          (json['associationType'] as String?)?.let(AssociationType.fromString),
      catalog: json['catalog'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      id: json['id'] as String?,
      programManagementAccountId: json['programManagementAccountId'] as String?,
      revision: json['revision'] as String?,
      sector: (json['sector'] as String?)?.let(Sector.fromString),
      startDate: timeStampFromJson(json['startDate']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedAccountId = this.associatedAccountId;
    final associationType = this.associationType;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final id = this.id;
    final programManagementAccountId = this.programManagementAccountId;
    final revision = this.revision;
    final sector = this.sector;
    final startDate = this.startDate;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (associatedAccountId != null)
        'associatedAccountId': associatedAccountId,
      if (associationType != null) 'associationType': associationType.value,
      if (catalog != null) 'catalog': catalog,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (id != null) 'id': id,
      if (programManagementAccountId != null)
        'programManagementAccountId': programManagementAccountId,
      if (revision != null) 'revision': revision,
      if (sector != null) 'sector': sector.value,
      if (startDate != null) 'startDate': iso8601ToJson(startDate),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class AssociationType {
  static const downstreamSeller = AssociationType._('DOWNSTREAM_SELLER');
  static const endCustomer = AssociationType._('END_CUSTOMER');
  static const internal = AssociationType._('INTERNAL');

  final String value;

  const AssociationType._(this.value);

  static const values = [downstreamSeller, endCustomer, internal];

  static AssociationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssociationType._(value));

  @override
  bool operator ==(other) => other is AssociationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Sector {
  static const commercial = Sector._('COMMERCIAL');
  static const government = Sector._('GOVERNMENT');
  static const governmentException = Sector._('GOVERNMENT_EXCEPTION');

  final String value;

  const Sector._(this.value);

  static const values = [commercial, government, governmentException];

  static Sector fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Sector._(value));

  @override
  bool operator ==(other) => other is Sector && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Base sorting configuration for relationships.
///
/// @nodoc
class ListRelationshipsSortBase {
  /// The field to sort by.
  final ListRelationshipsSortName sortBy;

  /// The sort order (ascending or descending).
  final SortOrder sortOrder;

  ListRelationshipsSortBase({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'sortBy': sortBy.value,
      'sortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class SortOrder {
  static const ascending = SortOrder._('Ascending');
  static const descending = SortOrder._('Descending');

  final String value;

  const SortOrder._(this.value);

  static const values = [ascending, descending];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ListRelationshipsSortName {
  static const updatedAt = ListRelationshipsSortName._('UpdatedAt');

  final String value;

  const ListRelationshipsSortName._(this.value);

  static const values = [updatedAt];

  static ListRelationshipsSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListRelationshipsSortName._(value));

  @override
  bool operator ==(other) =>
      other is ListRelationshipsSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about an updated relationship.
///
/// @nodoc
class UpdateRelationshipDetail {
  /// The Amazon Resource Name (ARN) of the updated relationship.
  final String? arn;

  /// The updated display name of the relationship.
  final String? displayName;

  /// The unique identifier of the updated relationship.
  final String? id;

  /// The new revision number of the relationship.
  final String? revision;

  UpdateRelationshipDetail({
    this.arn,
    this.displayName,
    this.id,
    this.revision,
  });

  factory UpdateRelationshipDetail.fromJson(Map<String, dynamic> json) {
    return UpdateRelationshipDetail(
      arn: json['arn'] as String?,
      displayName: json['displayName'] as String?,
      id: json['id'] as String?,
      revision: json['revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final displayName = this.displayName;
    final id = this.id;
    final revision = this.revision;
    return {
      if (arn != null) 'arn': arn,
      if (displayName != null) 'displayName': displayName,
      if (id != null) 'id': id,
      if (revision != null) 'revision': revision,
    };
  }
}

/// Configuration for different types of support plans.
///
/// @nodoc
class SupportPlan {
  /// Configuration for partner-led support plans.
  final PartnerLedSupport? partnerLedSupport;

  /// Configuration for resold enterprise support plans.
  final ResoldEnterprise? resoldEnterprise;

  /// Configuration for resold unified operations support plans.
  final ResoldUnifiedOperations? resoldUnifiedOperations;

  SupportPlan({
    this.partnerLedSupport,
    this.resoldEnterprise,
    this.resoldUnifiedOperations,
  });

  Map<String, dynamic> toJson() {
    final partnerLedSupport = this.partnerLedSupport;
    final resoldEnterprise = this.resoldEnterprise;
    final resoldUnifiedOperations = this.resoldUnifiedOperations;
    return {
      if (partnerLedSupport != null) 'partnerLedSupport': partnerLedSupport,
      if (resoldEnterprise != null) 'resoldEnterprise': resoldEnterprise,
      if (resoldUnifiedOperations != null)
        'resoldUnifiedOperations': resoldUnifiedOperations,
    };
  }
}

/// Configuration for resold enterprise support plans.
///
/// @nodoc
class ResoldEnterprise {
  /// The coverage level for resold enterprise support.
  final Coverage coverage;

  /// The location of the Technical Account Manager (TAM).
  final String tamLocation;

  /// The AWS account ID to charge for the support plan.
  final String? chargeAccountId;

  ResoldEnterprise({
    required this.coverage,
    required this.tamLocation,
    this.chargeAccountId,
  });

  Map<String, dynamic> toJson() {
    final coverage = this.coverage;
    final tamLocation = this.tamLocation;
    final chargeAccountId = this.chargeAccountId;
    return {
      'coverage': coverage.value,
      'tamLocation': tamLocation,
      if (chargeAccountId != null) 'chargeAccountId': chargeAccountId,
    };
  }
}

/// Configuration for partner-led support plans.
///
/// @nodoc
class PartnerLedSupport {
  /// The coverage level for partner-led support.
  final Coverage coverage;

  /// The location of the Technical Account Manager (TAM).
  final String tamLocation;

  /// The provider of the partner-led support.
  final Provider? provider;

  PartnerLedSupport({
    required this.coverage,
    required this.tamLocation,
    this.provider,
  });

  Map<String, dynamic> toJson() {
    final coverage = this.coverage;
    final tamLocation = this.tamLocation;
    final provider = this.provider;
    return {
      'coverage': coverage.value,
      'tamLocation': tamLocation,
      if (provider != null) 'provider': provider.value,
    };
  }
}

/// Configuration for resold unified operations support plans.
///
/// @nodoc
class ResoldUnifiedOperations {
  /// The coverage level for resold unified operations support.
  final Coverage coverage;

  /// The location of the Technical Account Manager (TAM).
  final String tamLocation;

  /// The AWS account ID to charge for the support plan.
  final String? chargeAccountId;

  ResoldUnifiedOperations({
    required this.coverage,
    required this.tamLocation,
    this.chargeAccountId,
  });

  Map<String, dynamic> toJson() {
    final coverage = this.coverage;
    final tamLocation = this.tamLocation;
    final chargeAccountId = this.chargeAccountId;
    return {
      'coverage': coverage.value,
      'tamLocation': tamLocation,
      if (chargeAccountId != null) 'chargeAccountId': chargeAccountId,
    };
  }
}

/// @nodoc
class Coverage {
  static const entireOrganization = Coverage._('ENTIRE_ORGANIZATION');
  static const managementAccountOnly = Coverage._('MANAGEMENT_ACCOUNT_ONLY');

  final String value;

  const Coverage._(this.value);

  static const values = [entireOrganization, managementAccountOnly];

  static Coverage fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Coverage._(value));

  @override
  bool operator ==(other) => other is Coverage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Provider {
  static const distributor = Provider._('DISTRIBUTOR');
  static const distributionSeller = Provider._('DISTRIBUTION_SELLER');

  final String value;

  const Provider._(this.value);

  static const values = [distributor, distributionSeller];

  static Provider fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Provider._(value));

  @override
  bool operator ==(other) => other is Provider && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about a partner relationship.
///
/// @nodoc
class RelationshipDetail {
  /// The Amazon Resource Name (ARN) of the relationship.
  final String? arn;

  /// The AWS account ID associated in this relationship.
  final String? associatedAccountId;

  /// The type of association for the relationship.
  final AssociationType? associationType;

  /// The catalog identifier associated with the relationship.
  final String? catalog;

  /// The timestamp when the relationship was created.
  final DateTime? createdAt;

  /// The display name of the relationship.
  final String? displayName;

  /// The unique identifier of the relationship.
  final String? id;

  /// The identifier of the program management account.
  final String? programManagementAccountId;

  /// The resale account model for the relationship.
  final ResaleAccountModel? resaleAccountModel;

  /// The current revision number of the relationship.
  final String? revision;

  /// The business sector for the relationship.
  final Sector? sector;

  /// The start date of the relationship.
  final DateTime? startDate;

  /// The timestamp when the relationship was last updated.
  final DateTime? updatedAt;

  RelationshipDetail({
    this.arn,
    this.associatedAccountId,
    this.associationType,
    this.catalog,
    this.createdAt,
    this.displayName,
    this.id,
    this.programManagementAccountId,
    this.resaleAccountModel,
    this.revision,
    this.sector,
    this.startDate,
    this.updatedAt,
  });

  factory RelationshipDetail.fromJson(Map<String, dynamic> json) {
    return RelationshipDetail(
      arn: json['arn'] as String?,
      associatedAccountId: json['associatedAccountId'] as String?,
      associationType:
          (json['associationType'] as String?)?.let(AssociationType.fromString),
      catalog: json['catalog'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      id: json['id'] as String?,
      programManagementAccountId: json['programManagementAccountId'] as String?,
      resaleAccountModel: (json['resaleAccountModel'] as String?)
          ?.let(ResaleAccountModel.fromString),
      revision: json['revision'] as String?,
      sector: (json['sector'] as String?)?.let(Sector.fromString),
      startDate: timeStampFromJson(json['startDate']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedAccountId = this.associatedAccountId;
    final associationType = this.associationType;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final id = this.id;
    final programManagementAccountId = this.programManagementAccountId;
    final resaleAccountModel = this.resaleAccountModel;
    final revision = this.revision;
    final sector = this.sector;
    final startDate = this.startDate;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (associatedAccountId != null)
        'associatedAccountId': associatedAccountId,
      if (associationType != null) 'associationType': associationType.value,
      if (catalog != null) 'catalog': catalog,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (id != null) 'id': id,
      if (programManagementAccountId != null)
        'programManagementAccountId': programManagementAccountId,
      if (resaleAccountModel != null)
        'resaleAccountModel': resaleAccountModel.value,
      if (revision != null) 'revision': revision,
      if (sector != null) 'sector': sector.value,
      if (startDate != null) 'startDate': iso8601ToJson(startDate),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class ResaleAccountModel {
  static const distributor = ResaleAccountModel._('DISTRIBUTOR');
  static const endCustomer = ResaleAccountModel._('END_CUSTOMER');
  static const solutionProvider = ResaleAccountModel._('SOLUTION_PROVIDER');

  final String value;

  const ResaleAccountModel._(this.value);

  static const values = [distributor, endCustomer, solutionProvider];

  static ResaleAccountModel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResaleAccountModel._(value));

  @override
  bool operator ==(other) =>
      other is ResaleAccountModel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a newly created relationship.
///
/// @nodoc
class CreateRelationshipDetail {
  /// The Amazon Resource Name (ARN) of the created relationship.
  final String? arn;

  /// The unique identifier of the created relationship.
  final String? id;

  CreateRelationshipDetail({
    this.arn,
    this.id,
  });

  factory CreateRelationshipDetail.fromJson(Map<String, dynamic> json) {
    return CreateRelationshipDetail(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
  }
}

/// A key-value pair that can be associated with a resource.
///
/// @nodoc
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Summary information about a program management account.
///
/// @nodoc
class ProgramManagementAccountSummary {
  /// The AWS account ID associated with the program management account.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the program management account.
  final String? arn;

  /// The catalog identifier associated with the account.
  final String? catalog;

  /// The timestamp when the account was created.
  final DateTime? createdAt;

  /// The display name of the program management account.
  final String? displayName;

  /// The unique identifier of the program management account.
  final String? id;

  /// The program type for the management account.
  final Program? program;

  /// The current revision number of the program management account.
  final String? revision;

  /// The start date of the program management account.
  final DateTime? startDate;

  /// The current status of the program management account.
  final ProgramManagementAccountStatus? status;

  /// The timestamp when the account was last updated.
  final DateTime? updatedAt;

  ProgramManagementAccountSummary({
    this.accountId,
    this.arn,
    this.catalog,
    this.createdAt,
    this.displayName,
    this.id,
    this.program,
    this.revision,
    this.startDate,
    this.status,
    this.updatedAt,
  });

  factory ProgramManagementAccountSummary.fromJson(Map<String, dynamic> json) {
    return ProgramManagementAccountSummary(
      accountId: json['accountId'] as String?,
      arn: json['arn'] as String?,
      catalog: json['catalog'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      id: json['id'] as String?,
      program: (json['program'] as String?)?.let(Program.fromString),
      revision: json['revision'] as String?,
      startDate: timeStampFromJson(json['startDate']),
      status: (json['status'] as String?)
          ?.let(ProgramManagementAccountStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final id = this.id;
    final program = this.program;
    final revision = this.revision;
    final startDate = this.startDate;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'accountId': accountId,
      if (arn != null) 'arn': arn,
      if (catalog != null) 'catalog': catalog,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (id != null) 'id': id,
      if (program != null) 'program': program.value,
      if (revision != null) 'revision': revision,
      if (startDate != null) 'startDate': iso8601ToJson(startDate),
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class Program {
  static const solutionProvider = Program._('SOLUTION_PROVIDER');
  static const distribution = Program._('DISTRIBUTION');
  static const distributionSeller = Program._('DISTRIBUTION_SELLER');

  final String value;

  const Program._(this.value);

  static const values = [solutionProvider, distribution, distributionSeller];

  static Program fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Program._(value));

  @override
  bool operator ==(other) => other is Program && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ProgramManagementAccountStatus {
  static const pending = ProgramManagementAccountStatus._('PENDING');
  static const active = ProgramManagementAccountStatus._('ACTIVE');
  static const inactive = ProgramManagementAccountStatus._('INACTIVE');

  final String value;

  const ProgramManagementAccountStatus._(this.value);

  static const values = [pending, active, inactive];

  static ProgramManagementAccountStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProgramManagementAccountStatus._(value));

  @override
  bool operator ==(other) =>
      other is ProgramManagementAccountStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Base sorting configuration for program management accounts.
///
/// @nodoc
class ListProgramManagementAccountsSortBase {
  /// The field to sort by.
  final ListProgramManagementAccountsSortName sortBy;

  /// The sort order (ascending or descending).
  final SortOrder sortOrder;

  ListProgramManagementAccountsSortBase({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'sortBy': sortBy.value,
      'sortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class ListProgramManagementAccountsSortName {
  static const updatedAt = ListProgramManagementAccountsSortName._('UpdatedAt');

  final String value;

  const ListProgramManagementAccountsSortName._(this.value);

  static const values = [updatedAt];

  static ListProgramManagementAccountsSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListProgramManagementAccountsSortName._(value));

  @override
  bool operator ==(other) =>
      other is ListProgramManagementAccountsSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about an updated program management account.
///
/// @nodoc
class UpdateProgramManagementAccountDetail {
  /// The Amazon Resource Name (ARN) of the updated program management account.
  final String? arn;

  /// The updated display name of the program management account.
  final String? displayName;

  /// The unique identifier of the updated program management account.
  final String? id;

  /// The new revision number of the program management account.
  final String? revision;

  UpdateProgramManagementAccountDetail({
    this.arn,
    this.displayName,
    this.id,
    this.revision,
  });

  factory UpdateProgramManagementAccountDetail.fromJson(
      Map<String, dynamic> json) {
    return UpdateProgramManagementAccountDetail(
      arn: json['arn'] as String?,
      displayName: json['displayName'] as String?,
      id: json['id'] as String?,
      revision: json['revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final displayName = this.displayName;
    final id = this.id;
    final revision = this.revision;
    return {
      if (arn != null) 'arn': arn,
      if (displayName != null) 'displayName': displayName,
      if (id != null) 'id': id,
      if (revision != null) 'revision': revision,
    };
  }
}

/// Contains details about a newly created program management account.
///
/// @nodoc
class CreateProgramManagementAccountDetail {
  /// The Amazon Resource Name (ARN) of the created program management account.
  final String? arn;

  /// The unique identifier of the created program management account.
  final String? id;

  CreateProgramManagementAccountDetail({
    this.arn,
    this.id,
  });

  factory CreateProgramManagementAccountDetail.fromJson(
      Map<String, dynamic> json) {
    return CreateProgramManagementAccountDetail(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
  }
}

/// Contains details about a rejected channel handshake.
///
/// @nodoc
class RejectChannelHandshakeDetail {
  /// The Amazon Resource Name (ARN) of the rejected handshake.
  final String? arn;

  /// The unique identifier of the rejected handshake.
  final String? id;

  /// The current status of the rejected handshake.
  final HandshakeStatus? status;

  RejectChannelHandshakeDetail({
    this.arn,
    this.id,
    this.status,
  });

  factory RejectChannelHandshakeDetail.fromJson(Map<String, dynamic> json) {
    return RejectChannelHandshakeDetail(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.let(HandshakeStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class HandshakeStatus {
  static const pending = HandshakeStatus._('PENDING');
  static const accepted = HandshakeStatus._('ACCEPTED');
  static const rejected = HandshakeStatus._('REJECTED');
  static const canceled = HandshakeStatus._('CANCELED');
  static const expired = HandshakeStatus._('EXPIRED');

  final String value;

  const HandshakeStatus._(this.value);

  static const values = [pending, accepted, rejected, canceled, expired];

  static HandshakeStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HandshakeStatus._(value));

  @override
  bool operator ==(other) => other is HandshakeStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a canceled channel handshake.
///
/// @nodoc
class CancelChannelHandshakeDetail {
  /// The Amazon Resource Name (ARN) of the canceled handshake.
  final String? arn;

  /// The unique identifier of the canceled handshake.
  final String? id;

  /// The current status of the canceled handshake.
  final HandshakeStatus? status;

  CancelChannelHandshakeDetail({
    this.arn,
    this.id,
    this.status,
  });

  factory CancelChannelHandshakeDetail.fromJson(Map<String, dynamic> json) {
    return CancelChannelHandshakeDetail(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.let(HandshakeStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

/// Contains details about an accepted channel handshake.
///
/// @nodoc
class AcceptChannelHandshakeDetail {
  /// The Amazon Resource Name (ARN) of the accepted handshake.
  final String? arn;

  /// The unique identifier of the accepted handshake.
  final String? id;

  /// The current status of the accepted handshake.
  final HandshakeStatus? status;

  AcceptChannelHandshakeDetail({
    this.arn,
    this.id,
    this.status,
  });

  factory AcceptChannelHandshakeDetail.fromJson(Map<String, dynamic> json) {
    return AcceptChannelHandshakeDetail(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.let(HandshakeStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

/// Summary information about a channel handshake.
///
/// @nodoc
class ChannelHandshakeSummary {
  /// The Amazon Resource Name (ARN) of the handshake.
  final String? arn;

  /// The identifier of the resource associated with the handshake.
  final String? associatedResourceId;

  /// The catalog identifier associated with the handshake.
  final String? catalog;

  /// The timestamp when the handshake was created.
  final DateTime? createdAt;

  /// Detailed information about the handshake.
  final HandshakeDetail? detail;

  /// The type of the handshake.
  final HandshakeType? handshakeType;

  /// The unique identifier of the handshake.
  final String? id;

  /// The AWS account ID of the handshake owner.
  final String? ownerAccountId;

  /// The AWS account ID of the handshake receiver.
  final String? receiverAccountId;

  /// The AWS account ID of the handshake sender.
  final String? senderAccountId;

  /// The display name of the handshake sender.
  final String? senderDisplayName;

  /// The current status of the handshake.
  final HandshakeStatus? status;

  /// The timestamp when the handshake was last updated.
  final DateTime? updatedAt;

  ChannelHandshakeSummary({
    this.arn,
    this.associatedResourceId,
    this.catalog,
    this.createdAt,
    this.detail,
    this.handshakeType,
    this.id,
    this.ownerAccountId,
    this.receiverAccountId,
    this.senderAccountId,
    this.senderDisplayName,
    this.status,
    this.updatedAt,
  });

  factory ChannelHandshakeSummary.fromJson(Map<String, dynamic> json) {
    return ChannelHandshakeSummary(
      arn: json['arn'] as String?,
      associatedResourceId: json['associatedResourceId'] as String?,
      catalog: json['catalog'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      detail: json['detail'] != null
          ? HandshakeDetail.fromJson(json['detail'] as Map<String, dynamic>)
          : null,
      handshakeType:
          (json['handshakeType'] as String?)?.let(HandshakeType.fromString),
      id: json['id'] as String?,
      ownerAccountId: json['ownerAccountId'] as String?,
      receiverAccountId: json['receiverAccountId'] as String?,
      senderAccountId: json['senderAccountId'] as String?,
      senderDisplayName: json['senderDisplayName'] as String?,
      status: (json['status'] as String?)?.let(HandshakeStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedResourceId = this.associatedResourceId;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final detail = this.detail;
    final handshakeType = this.handshakeType;
    final id = this.id;
    final ownerAccountId = this.ownerAccountId;
    final receiverAccountId = this.receiverAccountId;
    final senderAccountId = this.senderAccountId;
    final senderDisplayName = this.senderDisplayName;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (associatedResourceId != null)
        'associatedResourceId': associatedResourceId,
      if (catalog != null) 'catalog': catalog,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (detail != null) 'detail': detail,
      if (handshakeType != null) 'handshakeType': handshakeType.value,
      if (id != null) 'id': id,
      if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
      if (receiverAccountId != null) 'receiverAccountId': receiverAccountId,
      if (senderAccountId != null) 'senderAccountId': senderAccountId,
      if (senderDisplayName != null) 'senderDisplayName': senderDisplayName,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class HandshakeType {
  static const startServicePeriod = HandshakeType._('START_SERVICE_PERIOD');
  static const revokeServicePeriod = HandshakeType._('REVOKE_SERVICE_PERIOD');
  static const programManagementAccount =
      HandshakeType._('PROGRAM_MANAGEMENT_ACCOUNT');

  final String value;

  const HandshakeType._(this.value);

  static const values = [
    startServicePeriod,
    revokeServicePeriod,
    programManagementAccount
  ];

  static HandshakeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HandshakeType._(value));

  @override
  bool operator ==(other) => other is HandshakeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about different types of handshakes.
///
/// @nodoc
class HandshakeDetail {
  /// Details for a program management account handshake.
  final ProgramManagementAccountHandshakeDetail?
      programManagementAccountHandshakeDetail;

  /// Details for a revoke service period handshake.
  final RevokeServicePeriodHandshakeDetail? revokeServicePeriodHandshakeDetail;

  /// Details for a start service period handshake.
  final StartServicePeriodHandshakeDetail? startServicePeriodHandshakeDetail;

  HandshakeDetail({
    this.programManagementAccountHandshakeDetail,
    this.revokeServicePeriodHandshakeDetail,
    this.startServicePeriodHandshakeDetail,
  });

  factory HandshakeDetail.fromJson(Map<String, dynamic> json) {
    return HandshakeDetail(
      programManagementAccountHandshakeDetail:
          json['programManagementAccountHandshakeDetail'] != null
              ? ProgramManagementAccountHandshakeDetail.fromJson(
                  json['programManagementAccountHandshakeDetail']
                      as Map<String, dynamic>)
              : null,
      revokeServicePeriodHandshakeDetail:
          json['revokeServicePeriodHandshakeDetail'] != null
              ? RevokeServicePeriodHandshakeDetail.fromJson(
                  json['revokeServicePeriodHandshakeDetail']
                      as Map<String, dynamic>)
              : null,
      startServicePeriodHandshakeDetail:
          json['startServicePeriodHandshakeDetail'] != null
              ? StartServicePeriodHandshakeDetail.fromJson(
                  json['startServicePeriodHandshakeDetail']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final programManagementAccountHandshakeDetail =
        this.programManagementAccountHandshakeDetail;
    final revokeServicePeriodHandshakeDetail =
        this.revokeServicePeriodHandshakeDetail;
    final startServicePeriodHandshakeDetail =
        this.startServicePeriodHandshakeDetail;
    return {
      if (programManagementAccountHandshakeDetail != null)
        'programManagementAccountHandshakeDetail':
            programManagementAccountHandshakeDetail,
      if (revokeServicePeriodHandshakeDetail != null)
        'revokeServicePeriodHandshakeDetail':
            revokeServicePeriodHandshakeDetail,
      if (startServicePeriodHandshakeDetail != null)
        'startServicePeriodHandshakeDetail': startServicePeriodHandshakeDetail,
    };
  }
}

/// Details specific to start service period handshakes.
///
/// @nodoc
class StartServicePeriodHandshakeDetail {
  /// The end date of the service period.
  final DateTime? endDate;

  /// The minimum number of days notice required for changes.
  final String? minimumNoticeDays;

  /// A note providing additional information about the service period.
  final String? note;

  /// The type of service period being started.
  final ServicePeriodType? servicePeriodType;

  /// The start date of the service period.
  final DateTime? startDate;

  StartServicePeriodHandshakeDetail({
    this.endDate,
    this.minimumNoticeDays,
    this.note,
    this.servicePeriodType,
    this.startDate,
  });

  factory StartServicePeriodHandshakeDetail.fromJson(
      Map<String, dynamic> json) {
    return StartServicePeriodHandshakeDetail(
      endDate: timeStampFromJson(json['endDate']),
      minimumNoticeDays: json['minimumNoticeDays'] as String?,
      note: json['note'] as String?,
      servicePeriodType: (json['servicePeriodType'] as String?)
          ?.let(ServicePeriodType.fromString),
      startDate: timeStampFromJson(json['startDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final endDate = this.endDate;
    final minimumNoticeDays = this.minimumNoticeDays;
    final note = this.note;
    final servicePeriodType = this.servicePeriodType;
    final startDate = this.startDate;
    return {
      if (endDate != null) 'endDate': iso8601ToJson(endDate),
      if (minimumNoticeDays != null) 'minimumNoticeDays': minimumNoticeDays,
      if (note != null) 'note': note,
      if (servicePeriodType != null)
        'servicePeriodType': servicePeriodType.value,
      if (startDate != null) 'startDate': iso8601ToJson(startDate),
    };
  }
}

/// Details specific to revoke service period handshakes.
///
/// @nodoc
class RevokeServicePeriodHandshakeDetail {
  /// The end date of the service period being revoked.
  final DateTime? endDate;

  /// The minimum number of days notice required for revocation.
  final String? minimumNoticeDays;

  /// A note explaining the reason for revoking the service period.
  final String? note;

  /// The type of service period being revoked.
  final ServicePeriodType? servicePeriodType;

  /// The start date of the service period being revoked.
  final DateTime? startDate;

  RevokeServicePeriodHandshakeDetail({
    this.endDate,
    this.minimumNoticeDays,
    this.note,
    this.servicePeriodType,
    this.startDate,
  });

  factory RevokeServicePeriodHandshakeDetail.fromJson(
      Map<String, dynamic> json) {
    return RevokeServicePeriodHandshakeDetail(
      endDate: timeStampFromJson(json['endDate']),
      minimumNoticeDays: json['minimumNoticeDays'] as String?,
      note: json['note'] as String?,
      servicePeriodType: (json['servicePeriodType'] as String?)
          ?.let(ServicePeriodType.fromString),
      startDate: timeStampFromJson(json['startDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final endDate = this.endDate;
    final minimumNoticeDays = this.minimumNoticeDays;
    final note = this.note;
    final servicePeriodType = this.servicePeriodType;
    final startDate = this.startDate;
    return {
      if (endDate != null) 'endDate': iso8601ToJson(endDate),
      if (minimumNoticeDays != null) 'minimumNoticeDays': minimumNoticeDays,
      if (note != null) 'note': note,
      if (servicePeriodType != null)
        'servicePeriodType': servicePeriodType.value,
      if (startDate != null) 'startDate': iso8601ToJson(startDate),
    };
  }
}

/// Details specific to program management account handshakes.
///
/// @nodoc
class ProgramManagementAccountHandshakeDetail {
  /// The program associated with the handshake.
  final Program? program;

  ProgramManagementAccountHandshakeDetail({
    this.program,
  });

  factory ProgramManagementAccountHandshakeDetail.fromJson(
      Map<String, dynamic> json) {
    return ProgramManagementAccountHandshakeDetail(
      program: (json['program'] as String?)?.let(Program.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final program = this.program;
    return {
      if (program != null) 'program': program.value,
    };
  }
}

/// @nodoc
class ServicePeriodType {
  static const minimumNoticePeriod =
      ServicePeriodType._('MINIMUM_NOTICE_PERIOD');
  static const fixedCommitmentPeriod =
      ServicePeriodType._('FIXED_COMMITMENT_PERIOD');

  final String value;

  const ServicePeriodType._(this.value);

  static const values = [minimumNoticePeriod, fixedCommitmentPeriod];

  static ServicePeriodType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServicePeriodType._(value));

  @override
  bool operator ==(other) => other is ServicePeriodType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ParticipantType {
  static const sender = ParticipantType._('SENDER');
  static const receiver = ParticipantType._('RECEIVER');

  final String value;

  const ParticipantType._(this.value);

  static const values = [sender, receiver];

  static ParticipantType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantType._(value));

  @override
  bool operator ==(other) => other is ParticipantType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Type-specific filters for listing channel handshakes.
///
/// @nodoc
class ListChannelHandshakesTypeFilters {
  /// Filters specific to program management account handshakes.
  final ProgramManagementAccountTypeFilters?
      programManagementAccountTypeFilters;

  /// Filters specific to revoke service period handshakes.
  final RevokeServicePeriodTypeFilters? revokeServicePeriodTypeFilters;

  /// Filters specific to start service period handshakes.
  final StartServicePeriodTypeFilters? startServicePeriodTypeFilters;

  ListChannelHandshakesTypeFilters({
    this.programManagementAccountTypeFilters,
    this.revokeServicePeriodTypeFilters,
    this.startServicePeriodTypeFilters,
  });

  Map<String, dynamic> toJson() {
    final programManagementAccountTypeFilters =
        this.programManagementAccountTypeFilters;
    final revokeServicePeriodTypeFilters = this.revokeServicePeriodTypeFilters;
    final startServicePeriodTypeFilters = this.startServicePeriodTypeFilters;
    return {
      if (programManagementAccountTypeFilters != null)
        'programManagementAccountTypeFilters':
            programManagementAccountTypeFilters,
      if (revokeServicePeriodTypeFilters != null)
        'revokeServicePeriodTypeFilters': revokeServicePeriodTypeFilters,
      if (startServicePeriodTypeFilters != null)
        'startServicePeriodTypeFilters': startServicePeriodTypeFilters,
    };
  }
}

/// Type-specific sorting options for listing channel handshakes.
///
/// @nodoc
class ListChannelHandshakesTypeSort {
  /// Sorting options specific to program management account handshakes.
  final ProgramManagementAccountTypeSort? programManagementAccountTypeSort;

  /// Sorting options specific to revoke service period handshakes.
  final RevokeServicePeriodTypeSort? revokeServicePeriodTypeSort;

  /// Sorting options specific to start service period handshakes.
  final StartServicePeriodTypeSort? startServicePeriodTypeSort;

  ListChannelHandshakesTypeSort({
    this.programManagementAccountTypeSort,
    this.revokeServicePeriodTypeSort,
    this.startServicePeriodTypeSort,
  });

  Map<String, dynamic> toJson() {
    final programManagementAccountTypeSort =
        this.programManagementAccountTypeSort;
    final revokeServicePeriodTypeSort = this.revokeServicePeriodTypeSort;
    final startServicePeriodTypeSort = this.startServicePeriodTypeSort;
    return {
      if (programManagementAccountTypeSort != null)
        'programManagementAccountTypeSort': programManagementAccountTypeSort,
      if (revokeServicePeriodTypeSort != null)
        'revokeServicePeriodTypeSort': revokeServicePeriodTypeSort,
      if (startServicePeriodTypeSort != null)
        'startServicePeriodTypeSort': startServicePeriodTypeSort,
    };
  }
}

/// Sorting options specific to start service period handshakes.
///
/// @nodoc
class StartServicePeriodTypeSort {
  /// The field to sort by.
  final StartServicePeriodTypeSortName sortBy;

  /// The sort order (ascending or descending).
  final SortOrder sortOrder;

  StartServicePeriodTypeSort({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'sortBy': sortBy.value,
      'sortOrder': sortOrder.value,
    };
  }
}

/// Sorting options specific to revoke service period handshakes.
///
/// @nodoc
class RevokeServicePeriodTypeSort {
  /// The field to sort by.
  final RevokeServicePeriodTypeSortName sortBy;

  /// The sort order (ascending or descending).
  final SortOrder sortOrder;

  RevokeServicePeriodTypeSort({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'sortBy': sortBy.value,
      'sortOrder': sortOrder.value,
    };
  }
}

/// Type-specific sorting options for program management accounts.
///
/// @nodoc
class ProgramManagementAccountTypeSort {
  /// The field to sort by.
  final ProgramManagementAccountTypeSortName sortBy;

  /// The sort order (ascending or descending).
  final SortOrder sortOrder;

  ProgramManagementAccountTypeSort({
    required this.sortBy,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      'sortBy': sortBy.value,
      'sortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class ProgramManagementAccountTypeSortName {
  static const updatedAt = ProgramManagementAccountTypeSortName._('UpdatedAt');

  final String value;

  const ProgramManagementAccountTypeSortName._(this.value);

  static const values = [updatedAt];

  static ProgramManagementAccountTypeSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProgramManagementAccountTypeSortName._(value));

  @override
  bool operator ==(other) =>
      other is ProgramManagementAccountTypeSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RevokeServicePeriodTypeSortName {
  static const updatedAt = RevokeServicePeriodTypeSortName._('UpdatedAt');

  final String value;

  const RevokeServicePeriodTypeSortName._(this.value);

  static const values = [updatedAt];

  static RevokeServicePeriodTypeSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RevokeServicePeriodTypeSortName._(value));

  @override
  bool operator ==(other) =>
      other is RevokeServicePeriodTypeSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StartServicePeriodTypeSortName {
  static const updatedAt = StartServicePeriodTypeSortName._('UpdatedAt');

  final String value;

  const StartServicePeriodTypeSortName._(this.value);

  static const values = [updatedAt];

  static StartServicePeriodTypeSortName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StartServicePeriodTypeSortName._(value));

  @override
  bool operator ==(other) =>
      other is StartServicePeriodTypeSortName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters specific to start service period handshakes.
///
/// @nodoc
class StartServicePeriodTypeFilters {
  /// Filter by service period types.
  final List<ServicePeriodType>? servicePeriodTypes;

  StartServicePeriodTypeFilters({
    this.servicePeriodTypes,
  });

  Map<String, dynamic> toJson() {
    final servicePeriodTypes = this.servicePeriodTypes;
    return {
      if (servicePeriodTypes != null)
        'servicePeriodTypes': servicePeriodTypes.map((e) => e.value).toList(),
    };
  }
}

/// Filters specific to revoke service period handshakes.
///
/// @nodoc
class RevokeServicePeriodTypeFilters {
  /// Filter by service period types.
  final List<ServicePeriodType>? servicePeriodTypes;

  RevokeServicePeriodTypeFilters({
    this.servicePeriodTypes,
  });

  Map<String, dynamic> toJson() {
    final servicePeriodTypes = this.servicePeriodTypes;
    return {
      if (servicePeriodTypes != null)
        'servicePeriodTypes': servicePeriodTypes.map((e) => e.value).toList(),
    };
  }
}

/// Type-specific filters for program management accounts.
///
/// @nodoc
class ProgramManagementAccountTypeFilters {
  /// Filter by program types.
  final List<Program>? programs;

  ProgramManagementAccountTypeFilters({
    this.programs,
  });

  Map<String, dynamic> toJson() {
    final programs = this.programs;
    return {
      if (programs != null) 'programs': programs.map((e) => e.value).toList(),
    };
  }
}

/// Contains details about a newly created channel handshake.
///
/// @nodoc
class CreateChannelHandshakeDetail {
  /// The Amazon Resource Name (ARN) of the created handshake.
  final String? arn;

  /// The unique identifier of the created handshake.
  final String? id;

  CreateChannelHandshakeDetail({
    this.arn,
    this.id,
  });

  factory CreateChannelHandshakeDetail.fromJson(Map<String, dynamic> json) {
    return CreateChannelHandshakeDetail(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
  }
}

/// Contains the payload data for different types of channel handshakes.
///
/// @nodoc
class ChannelHandshakePayload {
  /// Payload for revoking a service period handshake.
  final RevokeServicePeriodPayload? revokeServicePeriodPayload;

  /// Payload for starting a service period handshake.
  final StartServicePeriodPayload? startServicePeriodPayload;

  ChannelHandshakePayload({
    this.revokeServicePeriodPayload,
    this.startServicePeriodPayload,
  });

  Map<String, dynamic> toJson() {
    final revokeServicePeriodPayload = this.revokeServicePeriodPayload;
    final startServicePeriodPayload = this.startServicePeriodPayload;
    return {
      if (revokeServicePeriodPayload != null)
        'revokeServicePeriodPayload': revokeServicePeriodPayload,
      if (startServicePeriodPayload != null)
        'startServicePeriodPayload': startServicePeriodPayload,
    };
  }
}

/// Payload for start service period handshake requests.
///
/// @nodoc
class StartServicePeriodPayload {
  /// The identifier of the program management account.
  final String programManagementAccountIdentifier;

  /// The type of service period being started.
  final ServicePeriodType servicePeriodType;

  /// The end date of the service period.
  final DateTime? endDate;

  /// The minimum number of days notice required for changes.
  final String? minimumNoticeDays;

  /// A note providing additional information about the service period.
  final String? note;

  StartServicePeriodPayload({
    required this.programManagementAccountIdentifier,
    required this.servicePeriodType,
    this.endDate,
    this.minimumNoticeDays,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final programManagementAccountIdentifier =
        this.programManagementAccountIdentifier;
    final servicePeriodType = this.servicePeriodType;
    final endDate = this.endDate;
    final minimumNoticeDays = this.minimumNoticeDays;
    final note = this.note;
    return {
      'programManagementAccountIdentifier': programManagementAccountIdentifier,
      'servicePeriodType': servicePeriodType.value,
      if (endDate != null) 'endDate': iso8601ToJson(endDate),
      if (minimumNoticeDays != null) 'minimumNoticeDays': minimumNoticeDays,
      if (note != null) 'note': note,
    };
  }
}

/// Payload for revoke service period handshake requests.
///
/// @nodoc
class RevokeServicePeriodPayload {
  /// The identifier of the program management account.
  final String programManagementAccountIdentifier;

  /// A note explaining the reason for revoking the service period.
  final String? note;

  RevokeServicePeriodPayload({
    required this.programManagementAccountIdentifier,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final programManagementAccountIdentifier =
        this.programManagementAccountIdentifier;
    final note = this.note;
    return {
      'programManagementAccountIdentifier': programManagementAccountIdentifier,
      if (note != null) 'note': note,
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
