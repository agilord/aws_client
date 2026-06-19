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

/// AWS Partner Central Account service provides APIs for managing partner
/// accounts, connections, and profiles within the AWS Partner Network. This
/// service enables partners to create and manage their partner profiles,
/// establish connections with other partners, and maintain their account
/// information.
class PartnerCentralAccount {
  final _s.JsonProtocol _protocol;
  PartnerCentralAccount({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'partnercentral-account',
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

  /// Retrieves the current status and details of a verification process for a
  /// partner account. This operation allows partners to check the progress and
  /// results of business or registrant verification processes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [verificationType] :
  /// The type of verification to retrieve information for. Valid values include
  /// business verification for company registration details and registrant
  /// verification for individual identity confirmation.
  Future<GetVerificationResponse> getVerification({
    required VerificationType verificationType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.GetVerification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VerificationType': verificationType.value,
      },
    );

    return GetVerificationResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags associated with a specific AWS Partner Central Account
  /// resource.
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
      'X-Amz-Target': 'PartnerCentralAccount.ListTagsForResource'
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

  /// Sends an email verification code to the specified email address for
  /// account verification purposes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [email] :
  /// The email address to send the verification code to.
  Future<void> sendEmailVerificationCode({
    required String catalog,
    required String email,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.SendEmailVerificationCode'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Email': email,
      },
    );
  }

  /// Initiates a new verification process for a partner account. This operation
  /// begins the verification workflow for either business registration or
  /// individual registrant identity verification as required by AWS Partner
  /// Central.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. This prevents duplicate verification processes
  /// from being started accidentally.
  ///
  /// Parameter [verificationDetails] :
  /// The specific details required for the verification process, including
  /// business information for business verification or personal information for
  /// registrant verification.
  Future<StartVerificationResponse> startVerification({
    String? clientToken,
    VerificationDetails? verificationDetails,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.StartVerification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (verificationDetails != null)
          'VerificationDetails': verificationDetails,
      },
    );

    return StartVerificationResponse.fromJson(jsonResponse.body);
  }

  /// Adds or updates tags for a specified AWS Partner Central Account resource.
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
  /// A list of tags to add or update for the specified resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.TagResource'
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

  /// Removes specified tags from an AWS Partner Central Account resource.
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
  /// A list of tag keys to remove from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.UntagResource'
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

  /// Creates a new connection invitation to establish a partnership with
  /// another organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier where the connection invitation will be created.
  ///
  /// Parameter [connectionType] :
  /// The type of connection being requested (e.g., reseller, distributor,
  /// technology partner).
  ///
  /// Parameter [email] :
  /// The email address of the person to send the connection invitation to.
  ///
  /// Parameter [message] :
  /// A custom message to include with the connection invitation.
  ///
  /// Parameter [name] :
  /// The name of the person sending the connection invitation.
  ///
  /// Parameter [receiverIdentifier] :
  /// The identifier of the organization or partner to invite for connection.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<CreateConnectionInvitationResponse> createConnectionInvitation({
    required String catalog,
    required ConnectionType connectionType,
    required String email,
    required String message,
    required String name,
    required String receiverIdentifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.CreateConnectionInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ConnectionType': connectionType.value,
        'Email': email,
        'Message': message,
        'Name': name,
        'ReceiverIdentifier': receiverIdentifier,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateConnectionInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific connection invitation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier where the connection invitation exists.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the connection invitation to retrieve.
  Future<GetConnectionInvitationResponse> getConnectionInvitation({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.GetConnectionInvitation'
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

    return GetConnectionInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Lists connection invitations for the partner account, with optional
  /// filtering by status, type, and other criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [connectionType] :
  /// Filter results by connection type (e.g., reseller, distributor, technology
  /// partner).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of connection invitations to return in a single
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results in paginated responses.
  ///
  /// Parameter [otherParticipantIdentifiers] :
  /// Filter results by specific participant identifiers.
  ///
  /// Parameter [participantType] :
  /// Filter results by participant type (inviter or invitee).
  ///
  /// Parameter [status] :
  /// Filter results by invitation status (pending, accepted, rejected,
  /// canceled, expired).
  Future<ListConnectionInvitationsResponse> listConnectionInvitations({
    required String catalog,
    ConnectionType? connectionType,
    int? maxResults,
    String? nextToken,
    List<String>? otherParticipantIdentifiers,
    ParticipantType? participantType,
    InvitationStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.ListConnectionInvitations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (connectionType != null) 'ConnectionType': connectionType.value,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (otherParticipantIdentifiers != null)
          'OtherParticipantIdentifiers': otherParticipantIdentifiers,
        if (participantType != null) 'ParticipantType': participantType.value,
        if (status != null) 'Status': status.value,
      },
    );

    return ListConnectionInvitationsResponse.fromJson(jsonResponse.body);
  }

  /// Accepts a connection invitation from another partner, establishing a
  /// formal partnership connection between the two parties.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier where the connection invitation exists.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the connection invitation to accept.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<AcceptConnectionInvitationResponse> acceptConnectionInvitation({
    required String catalog,
    required String identifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.AcceptConnectionInvitation'
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return AcceptConnectionInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Cancels a pending connection invitation before it has been accepted or
  /// rejected.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier where the connection invitation exists.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the connection invitation to cancel.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<CancelConnectionInvitationResponse> cancelConnectionInvitation({
    required String catalog,
    required String identifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.CancelConnectionInvitation'
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CancelConnectionInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Rejects a connection invitation from another partner, declining the
  /// partnership request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier where the connection invitation exists.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the connection invitation to reject.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [reason] :
  /// The reason for rejecting the connection invitation.
  Future<RejectConnectionInvitationResponse> rejectConnectionInvitation({
    required String catalog,
    required String identifier,
    String? clientToken,
    String? reason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.RejectConnectionInvitation'
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (reason != null) 'Reason': reason,
      },
    );

    return RejectConnectionInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the connection preferences for a partner account, including
  /// access settings and exclusions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  Future<GetConnectionPreferencesResponse> getConnectionPreferences({
    required String catalog,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.GetConnectionPreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
      },
    );

    return GetConnectionPreferencesResponse.fromJson(jsonResponse.body);
  }

  /// Updates the connection preferences for a partner account, modifying access
  /// settings and exclusions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessType] :
  /// The access type setting for connections (e.g., open, restricted,
  /// invitation-only).
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [revision] :
  /// The revision number of the connection preferences for optimistic locking.
  ///
  /// Parameter [excludedParticipantIdentifiers] :
  /// The updated list of participant identifiers to exclude from connections.
  Future<UpdateConnectionPreferencesResponse> updateConnectionPreferences({
    required AccessType accessType,
    required String catalog,
    required int revision,
    List<String>? excludedParticipantIdentifiers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.UpdateConnectionPreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessType': accessType.value,
        'Catalog': catalog,
        'Revision': revision,
        if (excludedParticipantIdentifiers != null)
          'ExcludedParticipantIdentifiers': excludedParticipantIdentifiers,
      },
    );

    return UpdateConnectionPreferencesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific connection between
  /// partners.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier where the connection exists.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the connection to retrieve.
  Future<GetConnectionResponse> getConnection({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.GetConnection'
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

    return GetConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Lists active connections for the partner account, with optional filtering
  /// by connection type and participant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [connectionType] :
  /// Filter results by connection type (e.g., reseller, distributor, technology
  /// partner).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of connections to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results in paginated responses.
  ///
  /// Parameter [otherParticipantIdentifiers] :
  /// Filter results by specific participant identifiers.
  Future<ListConnectionsResponse> listConnections({
    required String catalog,
    String? connectionType,
    int? maxResults,
    String? nextToken,
    List<String>? otherParticipantIdentifiers,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.ListConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (connectionType != null) 'ConnectionType': connectionType,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (otherParticipantIdentifiers != null)
          'OtherParticipantIdentifiers': otherParticipantIdentifiers,
      },
    );

    return ListConnectionsResponse.fromJson(jsonResponse.body);
  }

  /// Cancels an existing connection between partners, terminating the
  /// partnership relationship.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier where the connection exists.
  ///
  /// Parameter [connectionType] :
  /// The type of connection to cancel (e.g., reseller, distributor, technology
  /// partner).
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the connection to cancel.
  ///
  /// Parameter [reason] :
  /// The reason for canceling the connection, providing context for the
  /// termination.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<CancelConnectionResponse> cancelConnection({
    required String catalog,
    required ConnectionType connectionType,
    required String identifier,
    required String reason,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.CancelConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'ConnectionType': connectionType.value,
        'Identifier': identifier,
        'Reason': reason,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CancelConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new partner account in the AWS Partner Network with the
  /// specified details and configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allianceLeadContact] :
  /// The primary contact person for alliance and partnership matters.
  ///
  /// Parameter [catalog] :
  /// The catalog identifier where the partner account will be created.
  ///
  /// Parameter [emailVerificationCode] :
  /// The verification code sent to the alliance lead contact's email to confirm
  /// account creation.
  ///
  /// Parameter [legalName] :
  /// The legal name of the organization becoming a partner.
  ///
  /// Parameter [primarySolutionType] :
  /// The primary type of solution or service the partner provides (e.g.,
  /// consulting, software, managed services).
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the partner account for organization and
  /// billing purposes.
  Future<CreatePartnerResponse> createPartner({
    required AllianceLeadContact allianceLeadContact,
    required String catalog,
    required String emailVerificationCode,
    required String legalName,
    required PrimarySolutionType primarySolutionType,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.CreatePartner'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AllianceLeadContact': allianceLeadContact,
        'Catalog': catalog,
        'EmailVerificationCode': emailVerificationCode,
        'LegalName': legalName,
        'PrimarySolutionType': primarySolutionType.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePartnerResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific partner account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account to retrieve.
  Future<GetPartnerResponse> getPartner({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.GetPartner'
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

    return GetPartnerResponse.fromJson(jsonResponse.body);
  }

  /// Lists partner accounts in the catalog, providing a summary view of all
  /// partners.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier to list partners from.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results in paginated responses.
  Future<ListPartnersResponse> listPartners({
    required String catalog,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.ListPartners'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPartnersResponse.fromJson(jsonResponse.body);
  }

  /// Associates an email domain with AWS training and certification for the
  /// partner account, enabling automatic verification of employee
  /// certifications.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [email] :
  /// The email address used to verify domain ownership for AWS training and
  /// certification association.
  ///
  /// Parameter [emailVerificationCode] :
  /// The verification code sent to the email address to confirm domain
  /// ownership.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<void> associateAwsTrainingCertificationEmailDomain({
    required String catalog,
    required String email,
    required String emailVerificationCode,
    required String identifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PartnerCentralAccount.AssociateAwsTrainingCertificationEmailDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'Email': email,
        'EmailVerificationCode': emailVerificationCode,
        'Identifier': identifier,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Cancels an in-progress profile update task, stopping any pending changes
  /// to the partner profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the profile update task to cancel.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<CancelProfileUpdateTaskResponse> cancelProfileUpdateTask({
    required String catalog,
    required String identifier,
    required String taskId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.CancelProfileUpdateTask'
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
        'TaskId': taskId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CancelProfileUpdateTaskResponse.fromJson(jsonResponse.body);
  }

  /// Removes the association between an email domain and AWS training and
  /// certification for the partner account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [domainName] :
  /// The domain name to disassociate from AWS training and certification.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<void> disassociateAwsTrainingCertificationEmailDomain({
    required String catalog,
    required String domainName,
    required String identifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PartnerCentralAccount.DisassociateAwsTrainingCertificationEmailDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Catalog': catalog,
        'DomainName': domainName,
        'Identifier': identifier,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Retrieves the alliance lead contact information for a partner account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  Future<GetAllianceLeadContactResponse> getAllianceLeadContact({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.GetAllianceLeadContact'
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

    return GetAllianceLeadContactResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a specific profile update task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  Future<GetProfileUpdateTaskResponse> getProfileUpdateTask({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.GetProfileUpdateTask'
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

    return GetProfileUpdateTaskResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the visibility settings for a partner profile, determining who
  /// can see the profile information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  Future<GetProfileVisibilityResponse> getProfileVisibility({
    required String catalog,
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.GetProfileVisibility'
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

    return GetProfileVisibilityResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the alliance lead contact information for a partner
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allianceLeadContact] :
  /// The alliance lead contact information to set for the partner account.
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  ///
  /// Parameter [emailVerificationCode] :
  /// The verification code sent to the alliance lead contact's email to confirm
  /// the update.
  Future<PutAllianceLeadContactResponse> putAllianceLeadContact({
    required AllianceLeadContact allianceLeadContact,
    required String catalog,
    required String identifier,
    String? emailVerificationCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.PutAllianceLeadContact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AllianceLeadContact': allianceLeadContact,
        'Catalog': catalog,
        'Identifier': identifier,
        if (emailVerificationCode != null)
          'EmailVerificationCode': emailVerificationCode,
      },
    );

    return PutAllianceLeadContactResponse.fromJson(jsonResponse.body);
  }

  /// Sets the visibility level for a partner profile, controlling who can view
  /// the profile information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  ///
  /// Parameter [visibility] :
  /// The visibility setting to apply to the partner profile.
  Future<PutProfileVisibilityResponse> putProfileVisibility({
    required String catalog,
    required String identifier,
    required ProfileVisibility visibility,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.PutProfileVisibility'
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
        'Visibility': visibility.value,
      },
    );

    return PutProfileVisibilityResponse.fromJson(jsonResponse.body);
  }

  /// Initiates a profile update task to modify partner profile information
  /// asynchronously.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog identifier for the partner account.
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the partner account.
  ///
  /// Parameter [taskDetails] :
  /// The details of the profile updates to be performed.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<StartProfileUpdateTaskResponse> startProfileUpdateTask({
    required String catalog,
    required String identifier,
    required TaskDetails taskDetails,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PartnerCentralAccount.StartProfileUpdateTask'
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
        'TaskDetails': taskDetails,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return StartProfileUpdateTaskResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class GetVerificationResponse {
  /// The timestamp when the verification process was initiated.
  final DateTime startedAt;

  /// Detailed response information specific to the type of verification
  /// performed, including any verification-specific data or results.
  final VerificationResponseDetails verificationResponseDetails;

  /// The current status of the verification process. Possible values include
  /// pending, in-progress, completed, failed, or expired.
  final VerificationStatus verificationStatus;

  /// The type of verification that was requested and processed.
  final VerificationType verificationType;

  /// The timestamp when the verification process was completed. This field is
  /// null if the verification is still in progress.
  final DateTime? completedAt;

  /// Additional information explaining the current verification status,
  /// particularly useful when the status indicates a failure or requires
  /// additional action.
  final String? verificationStatusReason;

  GetVerificationResponse({
    required this.startedAt,
    required this.verificationResponseDetails,
    required this.verificationStatus,
    required this.verificationType,
    this.completedAt,
    this.verificationStatusReason,
  });

  factory GetVerificationResponse.fromJson(Map<String, dynamic> json) {
    return GetVerificationResponse(
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] ?? 0),
      verificationResponseDetails: VerificationResponseDetails.fromJson(
          (json['VerificationResponseDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      verificationStatus: VerificationStatus.fromString(
          (json['VerificationStatus'] as String?) ?? ''),
      verificationType: VerificationType.fromString(
          (json['VerificationType'] as String?) ?? ''),
      completedAt: timeStampFromJson(json['CompletedAt']),
      verificationStatusReason: json['VerificationStatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final startedAt = this.startedAt;
    final verificationResponseDetails = this.verificationResponseDetails;
    final verificationStatus = this.verificationStatus;
    final verificationType = this.verificationType;
    final completedAt = this.completedAt;
    final verificationStatusReason = this.verificationStatusReason;
    return {
      'StartedAt': iso8601ToJson(startedAt),
      'VerificationResponseDetails': verificationResponseDetails,
      'VerificationStatus': verificationStatus.value,
      'VerificationType': verificationType.value,
      if (completedAt != null) 'CompletedAt': iso8601ToJson(completedAt),
      if (verificationStatusReason != null)
        'VerificationStatusReason': verificationStatusReason,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The Amazon Resource Name (ARN) of the resource that the tags are associated
  /// with.
  final String resourceArn;

  /// A list of tags associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    required this.resourceArn,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class SendEmailVerificationCodeResponse {
  SendEmailVerificationCodeResponse();

  factory SendEmailVerificationCodeResponse.fromJson(Map<String, dynamic> _) {
    return SendEmailVerificationCodeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StartVerificationResponse {
  /// The timestamp when the verification process was successfully initiated.
  final DateTime startedAt;

  /// Initial response details specific to the type of verification started, which
  /// may include next steps or additional requirements.
  final VerificationResponseDetails verificationResponseDetails;

  /// The initial status of the verification process after it has been started.
  /// Typically this will be pending or in-progress.
  final VerificationStatus verificationStatus;

  /// The type of verification that was started based on the provided verification
  /// details.
  final VerificationType verificationType;

  /// The timestamp when the verification process was completed. This field is
  /// typically null for newly started verifications unless they complete
  /// immediately.
  final DateTime? completedAt;

  /// Additional information about the initial verification status, including any
  /// immediate feedback about the submitted verification details.
  final String? verificationStatusReason;

  StartVerificationResponse({
    required this.startedAt,
    required this.verificationResponseDetails,
    required this.verificationStatus,
    required this.verificationType,
    this.completedAt,
    this.verificationStatusReason,
  });

  factory StartVerificationResponse.fromJson(Map<String, dynamic> json) {
    return StartVerificationResponse(
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] ?? 0),
      verificationResponseDetails: VerificationResponseDetails.fromJson(
          (json['VerificationResponseDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      verificationStatus: VerificationStatus.fromString(
          (json['VerificationStatus'] as String?) ?? ''),
      verificationType: VerificationType.fromString(
          (json['VerificationType'] as String?) ?? ''),
      completedAt: timeStampFromJson(json['CompletedAt']),
      verificationStatusReason: json['VerificationStatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final startedAt = this.startedAt;
    final verificationResponseDetails = this.verificationResponseDetails;
    final verificationStatus = this.verificationStatus;
    final verificationType = this.verificationType;
    final completedAt = this.completedAt;
    final verificationStatusReason = this.verificationStatusReason;
    return {
      'StartedAt': iso8601ToJson(startedAt),
      'VerificationResponseDetails': verificationResponseDetails,
      'VerificationStatus': verificationStatus.value,
      'VerificationType': verificationType.value,
      if (completedAt != null) 'CompletedAt': iso8601ToJson(completedAt),
      if (verificationStatusReason != null)
        'VerificationStatusReason': verificationStatusReason,
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
class CreateConnectionInvitationResponse {
  /// The Amazon Resource Name (ARN) of the created connection invitation.
  final String arn;

  /// The catalog identifier where the connection invitation was created.
  final String catalog;

  /// The type of connection being requested in the invitation.
  final ConnectionType connectionType;

  /// The timestamp when the connection invitation was created.
  final DateTime createdAt;

  /// The unique identifier of the created connection invitation.
  final String id;

  /// The custom message included with the connection invitation.
  final String invitationMessage;

  /// The email address of the person who sent the connection invitation.
  final String inviterEmail;

  /// The name of the person who sent the connection invitation.
  final String inviterName;

  /// The identifier of the organization or partner being invited.
  final String otherParticipantIdentifier;

  /// The type of participant (inviter or invitee) in the connection invitation.
  final ParticipantType participantType;

  /// The current status of the connection invitation (pending, accepted,
  /// rejected, etc.).
  final InvitationStatus status;

  /// The timestamp when the connection invitation was last updated.
  final DateTime updatedAt;

  /// The identifier of the connection associated with this invitation.
  final String? connectionId;

  /// The timestamp when the connection invitation will expire if not responded
  /// to.
  final DateTime? expiresAt;

  CreateConnectionInvitationResponse({
    required this.arn,
    required this.catalog,
    required this.connectionType,
    required this.createdAt,
    required this.id,
    required this.invitationMessage,
    required this.inviterEmail,
    required this.inviterName,
    required this.otherParticipantIdentifier,
    required this.participantType,
    required this.status,
    required this.updatedAt,
    this.connectionId,
    this.expiresAt,
  });

  factory CreateConnectionInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateConnectionInvitationResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionType:
          ConnectionType.fromString((json['ConnectionType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      invitationMessage: (json['InvitationMessage'] as String?) ?? '',
      inviterEmail: (json['InviterEmail'] as String?) ?? '',
      inviterName: (json['InviterName'] as String?) ?? '',
      otherParticipantIdentifier:
          (json['OtherParticipantIdentifier'] as String?) ?? '',
      participantType: ParticipantType.fromString(
          (json['ParticipantType'] as String?) ?? ''),
      status: InvitationStatus.fromString((json['Status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      connectionId: json['ConnectionId'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionType = this.connectionType;
    final createdAt = this.createdAt;
    final id = this.id;
    final invitationMessage = this.invitationMessage;
    final inviterEmail = this.inviterEmail;
    final inviterName = this.inviterName;
    final otherParticipantIdentifier = this.otherParticipantIdentifier;
    final participantType = this.participantType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final connectionId = this.connectionId;
    final expiresAt = this.expiresAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionType': connectionType.value,
      'CreatedAt': iso8601ToJson(createdAt),
      'Id': id,
      'InvitationMessage': invitationMessage,
      'InviterEmail': inviterEmail,
      'InviterName': inviterName,
      'OtherParticipantIdentifier': otherParticipantIdentifier,
      'ParticipantType': participantType.value,
      'Status': status.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (connectionId != null) 'ConnectionId': connectionId,
      if (expiresAt != null) 'ExpiresAt': iso8601ToJson(expiresAt),
    };
  }
}

/// @nodoc
class GetConnectionInvitationResponse {
  /// The Amazon Resource Name (ARN) of the connection invitation.
  final String arn;

  /// The catalog identifier where the connection invitation exists.
  final String catalog;

  /// The type of connection being requested in the invitation.
  final ConnectionType connectionType;

  /// The timestamp when the connection invitation was created.
  final DateTime createdAt;

  /// The unique identifier of the connection invitation.
  final String id;

  /// The custom message included with the connection invitation.
  final String invitationMessage;

  /// The email address of the person who sent the connection invitation.
  final String inviterEmail;

  /// The name of the person who sent the connection invitation.
  final String inviterName;

  /// The identifier of the other participant in the connection invitation.
  final String otherParticipantIdentifier;

  /// The type of participant (inviter or invitee) in the connection invitation.
  final ParticipantType participantType;

  /// The current status of the connection invitation.
  final InvitationStatus status;

  /// The timestamp when the connection invitation was last updated.
  final DateTime updatedAt;

  /// The identifier of the connection associated with this invitation.
  final String? connectionId;

  /// The timestamp when the connection invitation will expire.
  final DateTime? expiresAt;

  GetConnectionInvitationResponse({
    required this.arn,
    required this.catalog,
    required this.connectionType,
    required this.createdAt,
    required this.id,
    required this.invitationMessage,
    required this.inviterEmail,
    required this.inviterName,
    required this.otherParticipantIdentifier,
    required this.participantType,
    required this.status,
    required this.updatedAt,
    this.connectionId,
    this.expiresAt,
  });

  factory GetConnectionInvitationResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionInvitationResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionType:
          ConnectionType.fromString((json['ConnectionType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      invitationMessage: (json['InvitationMessage'] as String?) ?? '',
      inviterEmail: (json['InviterEmail'] as String?) ?? '',
      inviterName: (json['InviterName'] as String?) ?? '',
      otherParticipantIdentifier:
          (json['OtherParticipantIdentifier'] as String?) ?? '',
      participantType: ParticipantType.fromString(
          (json['ParticipantType'] as String?) ?? ''),
      status: InvitationStatus.fromString((json['Status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      connectionId: json['ConnectionId'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionType = this.connectionType;
    final createdAt = this.createdAt;
    final id = this.id;
    final invitationMessage = this.invitationMessage;
    final inviterEmail = this.inviterEmail;
    final inviterName = this.inviterName;
    final otherParticipantIdentifier = this.otherParticipantIdentifier;
    final participantType = this.participantType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final connectionId = this.connectionId;
    final expiresAt = this.expiresAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionType': connectionType.value,
      'CreatedAt': iso8601ToJson(createdAt),
      'Id': id,
      'InvitationMessage': invitationMessage,
      'InviterEmail': inviterEmail,
      'InviterName': inviterName,
      'OtherParticipantIdentifier': otherParticipantIdentifier,
      'ParticipantType': participantType.value,
      'Status': status.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (connectionId != null) 'ConnectionId': connectionId,
      if (expiresAt != null) 'ExpiresAt': iso8601ToJson(expiresAt),
    };
  }
}

/// @nodoc
class ListConnectionInvitationsResponse {
  /// A list of connection invitation summaries matching the specified criteria.
  final List<ConnectionInvitationSummary> connectionInvitationSummaries;

  /// The token for retrieving the next page of results if more results are
  /// available.
  final String? nextToken;

  ListConnectionInvitationsResponse({
    required this.connectionInvitationSummaries,
    this.nextToken,
  });

  factory ListConnectionInvitationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConnectionInvitationsResponse(
      connectionInvitationSummaries: ((json['ConnectionInvitationSummaries']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              ConnectionInvitationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionInvitationSummaries = this.connectionInvitationSummaries;
    final nextToken = this.nextToken;
    return {
      'ConnectionInvitationSummaries': connectionInvitationSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class AcceptConnectionInvitationResponse {
  /// The details of the accepted connection between the two partners.
  final Connection connection;

  AcceptConnectionInvitationResponse({
    required this.connection,
  });

  factory AcceptConnectionInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return AcceptConnectionInvitationResponse(
      connection: Connection.fromJson(
          (json['Connection'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'Connection': connection,
    };
  }
}

/// @nodoc
class CancelConnectionInvitationResponse {
  /// The Amazon Resource Name (ARN) of the canceled connection invitation.
  final String arn;

  /// The catalog identifier where the connection invitation was canceled.
  final String catalog;

  /// The type of connection that was being invited for.
  final ConnectionType connectionType;

  /// The timestamp when the connection invitation was originally created.
  final DateTime createdAt;

  /// The unique identifier of the canceled connection invitation.
  final String id;

  /// The message that was included with the original connection invitation.
  final String invitationMessage;

  /// The email address of the person who sent the connection invitation.
  final String inviterEmail;

  /// The name of the person who sent the connection invitation.
  final String inviterName;

  /// The identifier of the other participant who was invited to connect.
  final String otherParticipantIdentifier;

  /// The type of participant (inviter or invitee) in the connection invitation.
  final ParticipantType participantType;

  /// The current status of the connection invitation (canceled).
  final InvitationStatus status;

  /// The timestamp when the connection invitation was last updated (canceled).
  final DateTime updatedAt;

  /// The identifier of the connection associated with the canceled invitation.
  final String? connectionId;

  /// The timestamp when the connection invitation would have expired if not
  /// canceled.
  final DateTime? expiresAt;

  CancelConnectionInvitationResponse({
    required this.arn,
    required this.catalog,
    required this.connectionType,
    required this.createdAt,
    required this.id,
    required this.invitationMessage,
    required this.inviterEmail,
    required this.inviterName,
    required this.otherParticipantIdentifier,
    required this.participantType,
    required this.status,
    required this.updatedAt,
    this.connectionId,
    this.expiresAt,
  });

  factory CancelConnectionInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return CancelConnectionInvitationResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionType:
          ConnectionType.fromString((json['ConnectionType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      invitationMessage: (json['InvitationMessage'] as String?) ?? '',
      inviterEmail: (json['InviterEmail'] as String?) ?? '',
      inviterName: (json['InviterName'] as String?) ?? '',
      otherParticipantIdentifier:
          (json['OtherParticipantIdentifier'] as String?) ?? '',
      participantType: ParticipantType.fromString(
          (json['ParticipantType'] as String?) ?? ''),
      status: InvitationStatus.fromString((json['Status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      connectionId: json['ConnectionId'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionType = this.connectionType;
    final createdAt = this.createdAt;
    final id = this.id;
    final invitationMessage = this.invitationMessage;
    final inviterEmail = this.inviterEmail;
    final inviterName = this.inviterName;
    final otherParticipantIdentifier = this.otherParticipantIdentifier;
    final participantType = this.participantType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final connectionId = this.connectionId;
    final expiresAt = this.expiresAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionType': connectionType.value,
      'CreatedAt': iso8601ToJson(createdAt),
      'Id': id,
      'InvitationMessage': invitationMessage,
      'InviterEmail': inviterEmail,
      'InviterName': inviterName,
      'OtherParticipantIdentifier': otherParticipantIdentifier,
      'ParticipantType': participantType.value,
      'Status': status.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (connectionId != null) 'ConnectionId': connectionId,
      if (expiresAt != null) 'ExpiresAt': iso8601ToJson(expiresAt),
    };
  }
}

/// @nodoc
class RejectConnectionInvitationResponse {
  /// The Amazon Resource Name (ARN) of the rejected connection invitation.
  final String arn;

  /// The catalog identifier where the connection invitation was rejected.
  final String catalog;

  /// The type of connection that was being invited for.
  final ConnectionType connectionType;

  /// The timestamp when the connection invitation was originally created.
  final DateTime createdAt;

  /// The unique identifier of the rejected connection invitation.
  final String id;

  /// The message that was included with the original connection invitation.
  final String invitationMessage;

  /// The email address of the person who sent the connection invitation.
  final String inviterEmail;

  /// The name of the person who sent the connection invitation.
  final String inviterName;

  /// The identifier of the other participant who sent the invitation.
  final String otherParticipantIdentifier;

  /// The type of participant (inviter or invitee) in the connection invitation.
  final ParticipantType participantType;

  /// The current status of the connection invitation (rejected).
  final InvitationStatus status;

  /// The timestamp when the connection invitation was last updated (rejected).
  final DateTime updatedAt;

  /// The identifier of the connection associated with the rejected invitation.
  final String? connectionId;

  /// The timestamp when the connection invitation would have expired.
  final DateTime? expiresAt;

  RejectConnectionInvitationResponse({
    required this.arn,
    required this.catalog,
    required this.connectionType,
    required this.createdAt,
    required this.id,
    required this.invitationMessage,
    required this.inviterEmail,
    required this.inviterName,
    required this.otherParticipantIdentifier,
    required this.participantType,
    required this.status,
    required this.updatedAt,
    this.connectionId,
    this.expiresAt,
  });

  factory RejectConnectionInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return RejectConnectionInvitationResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionType:
          ConnectionType.fromString((json['ConnectionType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      invitationMessage: (json['InvitationMessage'] as String?) ?? '',
      inviterEmail: (json['InviterEmail'] as String?) ?? '',
      inviterName: (json['InviterName'] as String?) ?? '',
      otherParticipantIdentifier:
          (json['OtherParticipantIdentifier'] as String?) ?? '',
      participantType: ParticipantType.fromString(
          (json['ParticipantType'] as String?) ?? ''),
      status: InvitationStatus.fromString((json['Status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      connectionId: json['ConnectionId'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionType = this.connectionType;
    final createdAt = this.createdAt;
    final id = this.id;
    final invitationMessage = this.invitationMessage;
    final inviterEmail = this.inviterEmail;
    final inviterName = this.inviterName;
    final otherParticipantIdentifier = this.otherParticipantIdentifier;
    final participantType = this.participantType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final connectionId = this.connectionId;
    final expiresAt = this.expiresAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionType': connectionType.value,
      'CreatedAt': iso8601ToJson(createdAt),
      'Id': id,
      'InvitationMessage': invitationMessage,
      'InviterEmail': inviterEmail,
      'InviterName': inviterName,
      'OtherParticipantIdentifier': otherParticipantIdentifier,
      'ParticipantType': participantType.value,
      'Status': status.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (connectionId != null) 'ConnectionId': connectionId,
      if (expiresAt != null) 'ExpiresAt': iso8601ToJson(expiresAt),
    };
  }
}

/// @nodoc
class GetConnectionPreferencesResponse {
  /// The access type setting for connections (e.g., open, restricted,
  /// invitation-only).
  final AccessType accessType;

  /// The Amazon Resource Name (ARN) of the connection preferences.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The revision number of the connection preferences for optimistic locking.
  final int revision;

  /// The timestamp when the connection preferences were last updated.
  final DateTime updatedAt;

  /// A list of participant IDs that are excluded from connection requests or
  /// interactions.
  final List<String>? excludedParticipantIds;

  GetConnectionPreferencesResponse({
    required this.accessType,
    required this.arn,
    required this.catalog,
    required this.revision,
    required this.updatedAt,
    this.excludedParticipantIds,
  });

  factory GetConnectionPreferencesResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionPreferencesResponse(
      accessType: AccessType.fromString((json['AccessType'] as String?) ?? ''),
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      revision: (json['Revision'] as int?) ?? 0,
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      excludedParticipantIds: (json['ExcludedParticipantIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessType = this.accessType;
    final arn = this.arn;
    final catalog = this.catalog;
    final revision = this.revision;
    final updatedAt = this.updatedAt;
    final excludedParticipantIds = this.excludedParticipantIds;
    return {
      'AccessType': accessType.value,
      'Arn': arn,
      'Catalog': catalog,
      'Revision': revision,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (excludedParticipantIds != null)
        'ExcludedParticipantIds': excludedParticipantIds,
    };
  }
}

/// @nodoc
class UpdateConnectionPreferencesResponse {
  /// The updated access type setting for connections.
  final AccessType accessType;

  /// The Amazon Resource Name (ARN) of the updated connection preferences.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The updated revision number of the connection preferences.
  final int revision;

  /// The timestamp when the connection preferences were last updated.
  final DateTime updatedAt;

  /// A list of participant IDs that are excluded from connection requests or
  /// interactions.
  final List<String>? excludedParticipantIds;

  UpdateConnectionPreferencesResponse({
    required this.accessType,
    required this.arn,
    required this.catalog,
    required this.revision,
    required this.updatedAt,
    this.excludedParticipantIds,
  });

  factory UpdateConnectionPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateConnectionPreferencesResponse(
      accessType: AccessType.fromString((json['AccessType'] as String?) ?? ''),
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      revision: (json['Revision'] as int?) ?? 0,
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      excludedParticipantIds: (json['ExcludedParticipantIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessType = this.accessType;
    final arn = this.arn;
    final catalog = this.catalog;
    final revision = this.revision;
    final updatedAt = this.updatedAt;
    final excludedParticipantIds = this.excludedParticipantIds;
    return {
      'AccessType': accessType.value,
      'Arn': arn,
      'Catalog': catalog,
      'Revision': revision,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (excludedParticipantIds != null)
        'ExcludedParticipantIds': excludedParticipantIds,
    };
  }
}

/// @nodoc
class GetConnectionResponse {
  /// The Amazon Resource Name (ARN) of the connection.
  final String arn;

  /// The catalog identifier where the connection exists.
  final String catalog;

  /// The list of connection types active between the partners.
  final Map<ConnectionType, ConnectionTypeDetail> connectionTypes;

  /// The unique identifier of the connection.
  final String id;

  /// The AWS account ID of the other participant in the connection.
  final String otherParticipantAccountId;

  /// The timestamp when the connection was last updated.
  final DateTime updatedAt;

  GetConnectionResponse({
    required this.arn,
    required this.catalog,
    required this.connectionTypes,
    required this.id,
    required this.otherParticipantAccountId,
    required this.updatedAt,
  });

  factory GetConnectionResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionTypes: ((json['ConnectionTypes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(ConnectionType.fromString(k),
              ConnectionTypeDetail.fromJson(e as Map<String, dynamic>))),
      id: (json['Id'] as String?) ?? '',
      otherParticipantAccountId:
          (json['OtherParticipantAccountId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionTypes = this.connectionTypes;
    final id = this.id;
    final otherParticipantAccountId = this.otherParticipantAccountId;
    final updatedAt = this.updatedAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionTypes': connectionTypes.map((k, e) => MapEntry(k.value, e)),
      'Id': id,
      'OtherParticipantAccountId': otherParticipantAccountId,
      'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class ListConnectionsResponse {
  /// A list of connection summaries matching the specified criteria.
  final List<ConnectionSummary> connectionSummaries;

  /// The token for retrieving the next page of results if more results are
  /// available.
  final String? nextToken;

  ListConnectionsResponse({
    required this.connectionSummaries,
    this.nextToken,
  });

  factory ListConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectionsResponse(
      connectionSummaries: ((json['ConnectionSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ConnectionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionSummaries = this.connectionSummaries;
    final nextToken = this.nextToken;
    return {
      'ConnectionSummaries': connectionSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CancelConnectionResponse {
  /// The Amazon Resource Name (ARN) of the canceled connection.
  final String arn;

  /// The catalog identifier where the connection was canceled.
  final String catalog;

  /// The list of connection types that were active before cancellation.
  final Map<ConnectionType, ConnectionTypeDetail> connectionTypes;

  /// The unique identifier of the canceled connection.
  final String id;

  /// The AWS account ID of the other participant in the canceled connection.
  final String otherParticipantAccountId;

  /// The timestamp when the connection was last updated (canceled).
  final DateTime updatedAt;

  CancelConnectionResponse({
    required this.arn,
    required this.catalog,
    required this.connectionTypes,
    required this.id,
    required this.otherParticipantAccountId,
    required this.updatedAt,
  });

  factory CancelConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CancelConnectionResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionTypes: ((json['ConnectionTypes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(ConnectionType.fromString(k),
              ConnectionTypeDetail.fromJson(e as Map<String, dynamic>))),
      id: (json['Id'] as String?) ?? '',
      otherParticipantAccountId:
          (json['OtherParticipantAccountId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionTypes = this.connectionTypes;
    final id = this.id;
    final otherParticipantAccountId = this.otherParticipantAccountId;
    final updatedAt = this.updatedAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionTypes': connectionTypes.map((k, e) => MapEntry(k.value, e)),
      'Id': id,
      'OtherParticipantAccountId': otherParticipantAccountId,
      'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class CreatePartnerResponse {
  /// The alliance lead contact information for the partner account.
  final AllianceLeadContact allianceLeadContact;

  /// The Amazon Resource Name (ARN) of the created partner account.
  final String arn;

  /// The catalog identifier where the partner account was created.
  final String catalog;

  /// The timestamp when the partner account was created.
  final DateTime createdAt;

  /// The unique identifier of the created partner account.
  final String id;

  /// The legal name of the partner organization.
  final String legalName;

  /// The partner profile information including display name, description, and
  /// other public details.
  final PartnerProfile profile;

  /// The list of verified email domains associated with AWS training and
  /// certification credentials for the partner organization.
  final List<PartnerDomain>? awsTrainingCertificationEmailDomains;

  CreatePartnerResponse({
    required this.allianceLeadContact,
    required this.arn,
    required this.catalog,
    required this.createdAt,
    required this.id,
    required this.legalName,
    required this.profile,
    this.awsTrainingCertificationEmailDomains,
  });

  factory CreatePartnerResponse.fromJson(Map<String, dynamic> json) {
    return CreatePartnerResponse(
      allianceLeadContact: AllianceLeadContact.fromJson(
          (json['AllianceLeadContact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      legalName: (json['LegalName'] as String?) ?? '',
      profile: PartnerProfile.fromJson(
          (json['Profile'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      awsTrainingCertificationEmailDomains:
          (json['AwsTrainingCertificationEmailDomains'] as List?)
              ?.nonNulls
              .map((e) => PartnerDomain.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allianceLeadContact = this.allianceLeadContact;
    final arn = this.arn;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final id = this.id;
    final legalName = this.legalName;
    final profile = this.profile;
    final awsTrainingCertificationEmailDomains =
        this.awsTrainingCertificationEmailDomains;
    return {
      'AllianceLeadContact': allianceLeadContact,
      'Arn': arn,
      'Catalog': catalog,
      'CreatedAt': iso8601ToJson(createdAt),
      'Id': id,
      'LegalName': legalName,
      'Profile': profile,
      if (awsTrainingCertificationEmailDomains != null)
        'AwsTrainingCertificationEmailDomains':
            awsTrainingCertificationEmailDomains,
    };
  }
}

/// @nodoc
class GetPartnerResponse {
  /// The Amazon Resource Name (ARN) of the partner account.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The timestamp when the partner account was created.
  final DateTime createdAt;

  /// The unique identifier of the partner account.
  final String id;

  /// The legal name of the partner organization.
  final String legalName;

  /// The partner profile information including display name, description, and
  /// other public details.
  final PartnerProfile profile;

  /// The list of verified email domains associated with AWS training and
  /// certification credentials for the partner organization.
  final List<PartnerDomain>? awsTrainingCertificationEmailDomains;

  GetPartnerResponse({
    required this.arn,
    required this.catalog,
    required this.createdAt,
    required this.id,
    required this.legalName,
    required this.profile,
    this.awsTrainingCertificationEmailDomains,
  });

  factory GetPartnerResponse.fromJson(Map<String, dynamic> json) {
    return GetPartnerResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      legalName: (json['LegalName'] as String?) ?? '',
      profile: PartnerProfile.fromJson(
          (json['Profile'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      awsTrainingCertificationEmailDomains:
          (json['AwsTrainingCertificationEmailDomains'] as List?)
              ?.nonNulls
              .map((e) => PartnerDomain.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final id = this.id;
    final legalName = this.legalName;
    final profile = this.profile;
    final awsTrainingCertificationEmailDomains =
        this.awsTrainingCertificationEmailDomains;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'CreatedAt': iso8601ToJson(createdAt),
      'Id': id,
      'LegalName': legalName,
      'Profile': profile,
      if (awsTrainingCertificationEmailDomains != null)
        'AwsTrainingCertificationEmailDomains':
            awsTrainingCertificationEmailDomains,
    };
  }
}

/// @nodoc
class ListPartnersResponse {
  /// A list of partner summaries including basic information about each partner
  /// account.
  final List<PartnerSummary> partnerSummaryList;

  /// The token for retrieving the next page of results if more results are
  /// available.
  final String? nextToken;

  ListPartnersResponse({
    required this.partnerSummaryList,
    this.nextToken,
  });

  factory ListPartnersResponse.fromJson(Map<String, dynamic> json) {
    return ListPartnersResponse(
      partnerSummaryList: ((json['PartnerSummaryList'] as List?) ?? const [])
          .nonNulls
          .map((e) => PartnerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final partnerSummaryList = this.partnerSummaryList;
    final nextToken = this.nextToken;
    return {
      'PartnerSummaryList': partnerSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class AssociateAwsTrainingCertificationEmailDomainResponse {
  AssociateAwsTrainingCertificationEmailDomainResponse();

  factory AssociateAwsTrainingCertificationEmailDomainResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateAwsTrainingCertificationEmailDomainResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CancelProfileUpdateTaskResponse {
  /// The Amazon Resource Name (ARN) of the canceled profile update task.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The unique identifier of the partner account.
  final String id;

  /// The timestamp when the profile update task was started.
  final DateTime startedAt;

  /// The current status of the profile update task (canceled).
  final ProfileTaskStatus status;

  /// The details of the profile update task that was canceled.
  final TaskDetails taskDetails;

  /// The unique identifier of the canceled profile update task.
  final String taskId;

  /// The timestamp when the profile update task was ended (canceled).
  final DateTime? endedAt;

  /// A list of error details if any errors occurred during the profile update
  /// task.
  final List<ErrorDetail>? errorDetailList;

  CancelProfileUpdateTaskResponse({
    required this.arn,
    required this.catalog,
    required this.id,
    required this.startedAt,
    required this.status,
    required this.taskDetails,
    required this.taskId,
    this.endedAt,
    this.errorDetailList,
  });

  factory CancelProfileUpdateTaskResponse.fromJson(Map<String, dynamic> json) {
    return CancelProfileUpdateTaskResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] ?? 0),
      status: ProfileTaskStatus.fromString((json['Status'] as String?) ?? ''),
      taskDetails: TaskDetails.fromJson(
          (json['TaskDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      taskId: (json['TaskId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['EndedAt']),
      errorDetailList: (json['ErrorDetailList'] as List?)
          ?.nonNulls
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final id = this.id;
    final startedAt = this.startedAt;
    final status = this.status;
    final taskDetails = this.taskDetails;
    final taskId = this.taskId;
    final endedAt = this.endedAt;
    final errorDetailList = this.errorDetailList;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'Id': id,
      'StartedAt': iso8601ToJson(startedAt),
      'Status': status.value,
      'TaskDetails': taskDetails,
      'TaskId': taskId,
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (errorDetailList != null) 'ErrorDetailList': errorDetailList,
    };
  }
}

/// @nodoc
class DisassociateAwsTrainingCertificationEmailDomainResponse {
  DisassociateAwsTrainingCertificationEmailDomainResponse();

  factory DisassociateAwsTrainingCertificationEmailDomainResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateAwsTrainingCertificationEmailDomainResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetAllianceLeadContactResponse {
  /// The alliance lead contact information including name, email, and business
  /// title.
  final AllianceLeadContact allianceLeadContact;

  /// The Amazon Resource Name (ARN) of the partner account.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The unique identifier of the partner account.
  final String id;

  GetAllianceLeadContactResponse({
    required this.allianceLeadContact,
    required this.arn,
    required this.catalog,
    required this.id,
  });

  factory GetAllianceLeadContactResponse.fromJson(Map<String, dynamic> json) {
    return GetAllianceLeadContactResponse(
      allianceLeadContact: AllianceLeadContact.fromJson(
          (json['AllianceLeadContact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final allianceLeadContact = this.allianceLeadContact;
    final arn = this.arn;
    final catalog = this.catalog;
    final id = this.id;
    return {
      'AllianceLeadContact': allianceLeadContact,
      'Arn': arn,
      'Catalog': catalog,
      'Id': id,
    };
  }
}

/// @nodoc
class GetProfileUpdateTaskResponse {
  /// The Amazon Resource Name (ARN) of the profile update task.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The unique identifier of the partner account.
  final String id;

  /// The timestamp when the profile update task was started.
  final DateTime startedAt;

  /// The current status of the profile update task (in progress, completed,
  /// failed, etc.).
  final ProfileTaskStatus status;

  /// The details of the profile update task including what changes are being
  /// made.
  final TaskDetails taskDetails;

  /// The unique identifier of the profile update task.
  final String taskId;

  /// The timestamp when the profile update task was completed or failed.
  final DateTime? endedAt;

  /// A list of error details if any errors occurred during the profile update
  /// task.
  final List<ErrorDetail>? errorDetailList;

  GetProfileUpdateTaskResponse({
    required this.arn,
    required this.catalog,
    required this.id,
    required this.startedAt,
    required this.status,
    required this.taskDetails,
    required this.taskId,
    this.endedAt,
    this.errorDetailList,
  });

  factory GetProfileUpdateTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileUpdateTaskResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] ?? 0),
      status: ProfileTaskStatus.fromString((json['Status'] as String?) ?? ''),
      taskDetails: TaskDetails.fromJson(
          (json['TaskDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      taskId: (json['TaskId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['EndedAt']),
      errorDetailList: (json['ErrorDetailList'] as List?)
          ?.nonNulls
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final id = this.id;
    final startedAt = this.startedAt;
    final status = this.status;
    final taskDetails = this.taskDetails;
    final taskId = this.taskId;
    final endedAt = this.endedAt;
    final errorDetailList = this.errorDetailList;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'Id': id,
      'StartedAt': iso8601ToJson(startedAt),
      'Status': status.value,
      'TaskDetails': taskDetails,
      'TaskId': taskId,
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (errorDetailList != null) 'ErrorDetailList': errorDetailList,
    };
  }
}

/// @nodoc
class GetProfileVisibilityResponse {
  /// The Amazon Resource Name (ARN) of the partner account.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The unique identifier of the partner account.
  final String id;

  /// The unique identifier of the partner profile.
  final String profileId;

  /// The visibility setting for the partner profile (public, private, restricted,
  /// etc.).
  final ProfileVisibility visibility;

  GetProfileVisibilityResponse({
    required this.arn,
    required this.catalog,
    required this.id,
    required this.profileId,
    required this.visibility,
  });

  factory GetProfileVisibilityResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileVisibilityResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      profileId: (json['ProfileId'] as String?) ?? '',
      visibility:
          ProfileVisibility.fromString((json['Visibility'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final id = this.id;
    final profileId = this.profileId;
    final visibility = this.visibility;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'Id': id,
      'ProfileId': profileId,
      'Visibility': visibility.value,
    };
  }
}

/// @nodoc
class PutAllianceLeadContactResponse {
  /// The updated alliance lead contact information.
  final AllianceLeadContact allianceLeadContact;

  /// The Amazon Resource Name (ARN) of the partner account.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The unique identifier of the partner account.
  final String id;

  PutAllianceLeadContactResponse({
    required this.allianceLeadContact,
    required this.arn,
    required this.catalog,
    required this.id,
  });

  factory PutAllianceLeadContactResponse.fromJson(Map<String, dynamic> json) {
    return PutAllianceLeadContactResponse(
      allianceLeadContact: AllianceLeadContact.fromJson(
          (json['AllianceLeadContact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final allianceLeadContact = this.allianceLeadContact;
    final arn = this.arn;
    final catalog = this.catalog;
    final id = this.id;
    return {
      'AllianceLeadContact': allianceLeadContact,
      'Arn': arn,
      'Catalog': catalog,
      'Id': id,
    };
  }
}

/// @nodoc
class PutProfileVisibilityResponse {
  /// The Amazon Resource Name (ARN) of the partner account.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The unique identifier of the partner account.
  final String id;

  /// The unique identifier of the partner profile.
  final String profileId;

  /// The updated visibility setting for the partner profile.
  final ProfileVisibility visibility;

  PutProfileVisibilityResponse({
    required this.arn,
    required this.catalog,
    required this.id,
    required this.profileId,
    required this.visibility,
  });

  factory PutProfileVisibilityResponse.fromJson(Map<String, dynamic> json) {
    return PutProfileVisibilityResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      profileId: (json['ProfileId'] as String?) ?? '',
      visibility:
          ProfileVisibility.fromString((json['Visibility'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final id = this.id;
    final profileId = this.profileId;
    final visibility = this.visibility;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'Id': id,
      'ProfileId': profileId,
      'Visibility': visibility.value,
    };
  }
}

/// @nodoc
class StartProfileUpdateTaskResponse {
  /// The Amazon Resource Name (ARN) of the started profile update task.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The unique identifier of the partner account.
  final String id;

  /// The timestamp when the profile update task was started.
  final DateTime startedAt;

  /// The current status of the profile update task (in progress).
  final ProfileTaskStatus status;

  /// The details of the profile update task that was started.
  final TaskDetails taskDetails;

  /// The unique identifier of the started profile update task.
  final String taskId;

  /// The timestamp when the profile update task ended (null for in-progress
  /// tasks).
  final DateTime? endedAt;

  /// A list of error details if any errors occurred during the profile update
  /// task.
  final List<ErrorDetail>? errorDetailList;

  StartProfileUpdateTaskResponse({
    required this.arn,
    required this.catalog,
    required this.id,
    required this.startedAt,
    required this.status,
    required this.taskDetails,
    required this.taskId,
    this.endedAt,
    this.errorDetailList,
  });

  factory StartProfileUpdateTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartProfileUpdateTaskResponse(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] ?? 0),
      status: ProfileTaskStatus.fromString((json['Status'] as String?) ?? ''),
      taskDetails: TaskDetails.fromJson(
          (json['TaskDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      taskId: (json['TaskId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['EndedAt']),
      errorDetailList: (json['ErrorDetailList'] as List?)
          ?.nonNulls
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final id = this.id;
    final startedAt = this.startedAt;
    final status = this.status;
    final taskDetails = this.taskDetails;
    final taskId = this.taskId;
    final endedAt = this.endedAt;
    final errorDetailList = this.errorDetailList;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'Id': id,
      'StartedAt': iso8601ToJson(startedAt),
      'Status': status.value,
      'TaskDetails': taskDetails,
      'TaskId': taskId,
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (errorDetailList != null) 'ErrorDetailList': errorDetailList,
    };
  }
}

/// Contains detailed information about a profile update task including the
/// changes to be made.
///
/// @nodoc
class TaskDetails {
  /// The updated description for the partner profile.
  final String description;

  /// The updated display name for the partner profile.
  final String displayName;

  /// The updated industry segments for the partner profile.
  final List<IndustrySegment> industrySegments;

  /// The updated logo URL for the partner profile.
  final String logoUrl;

  /// The updated primary solution type for the partner profile.
  final PrimarySolutionType primarySolutionType;

  /// The updated translation source locale for the partner profile.
  final String translationSourceLocale;

  /// The updated website URL for the partner profile.
  final String websiteUrl;

  /// The updated localized content for the partner profile.
  final List<LocalizedContent>? localizedContents;

  TaskDetails({
    required this.description,
    required this.displayName,
    required this.industrySegments,
    required this.logoUrl,
    required this.primarySolutionType,
    required this.translationSourceLocale,
    required this.websiteUrl,
    this.localizedContents,
  });

  factory TaskDetails.fromJson(Map<String, dynamic> json) {
    return TaskDetails(
      description: (json['Description'] as String?) ?? '',
      displayName: (json['DisplayName'] as String?) ?? '',
      industrySegments: ((json['IndustrySegments'] as List?) ?? const [])
          .nonNulls
          .map((e) => IndustrySegment.fromString((e as String)))
          .toList(),
      logoUrl: (json['LogoUrl'] as String?) ?? '',
      primarySolutionType: PrimarySolutionType.fromString(
          (json['PrimarySolutionType'] as String?) ?? ''),
      translationSourceLocale:
          (json['TranslationSourceLocale'] as String?) ?? '',
      websiteUrl: (json['WebsiteUrl'] as String?) ?? '',
      localizedContents: (json['LocalizedContents'] as List?)
          ?.nonNulls
          .map((e) => LocalizedContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final industrySegments = this.industrySegments;
    final logoUrl = this.logoUrl;
    final primarySolutionType = this.primarySolutionType;
    final translationSourceLocale = this.translationSourceLocale;
    final websiteUrl = this.websiteUrl;
    final localizedContents = this.localizedContents;
    return {
      'Description': description,
      'DisplayName': displayName,
      'IndustrySegments': industrySegments.map((e) => e.value).toList(),
      'LogoUrl': logoUrl,
      'PrimarySolutionType': primarySolutionType.value,
      'TranslationSourceLocale': translationSourceLocale,
      'WebsiteUrl': websiteUrl,
      if (localizedContents != null) 'LocalizedContents': localizedContents,
    };
  }
}

/// @nodoc
class ProfileTaskStatus {
  static const inProgress = ProfileTaskStatus._('IN_PROGRESS');
  static const canceled = ProfileTaskStatus._('CANCELED');
  static const succeeded = ProfileTaskStatus._('SUCCEEDED');
  static const failed = ProfileTaskStatus._('FAILED');

  final String value;

  const ProfileTaskStatus._(this.value);

  static const values = [inProgress, canceled, succeeded, failed];

  static ProfileTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProfileTaskStatus._(value));

  @override
  bool operator ==(other) => other is ProfileTaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about an error that occurred during an
/// operation.
///
/// @nodoc
class ErrorDetail {
  /// The locale or language code for the error message.
  final String locale;

  /// A human-readable description of the error.
  final String message;

  /// A machine-readable code or reason for the error.
  final ProfileValidationErrorReason reason;

  ErrorDetail({
    required this.locale,
    required this.message,
    required this.reason,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      locale: (json['Locale'] as String?) ?? '',
      message: (json['Message'] as String?) ?? '',
      reason: ProfileValidationErrorReason.fromString(
          (json['Reason'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final locale = this.locale;
    final message = this.message;
    final reason = this.reason;
    return {
      'Locale': locale,
      'Message': message,
      'Reason': reason.value,
    };
  }
}

/// @nodoc
class ProfileValidationErrorReason {
  static const invalidContent =
      ProfileValidationErrorReason._('INVALID_CONTENT');
  static const duplicateProfile =
      ProfileValidationErrorReason._('DUPLICATE_PROFILE');
  static const invalidLogo = ProfileValidationErrorReason._('INVALID_LOGO');
  static const invalidLogoUrl =
      ProfileValidationErrorReason._('INVALID_LOGO_URL');
  static const invalidLogoFile =
      ProfileValidationErrorReason._('INVALID_LOGO_FILE');
  static const invalidLogoSize =
      ProfileValidationErrorReason._('INVALID_LOGO_SIZE');
  static const invalidWebsiteUrl =
      ProfileValidationErrorReason._('INVALID_WEBSITE_URL');

  final String value;

  const ProfileValidationErrorReason._(this.value);

  static const values = [
    invalidContent,
    duplicateProfile,
    invalidLogo,
    invalidLogoUrl,
    invalidLogoFile,
    invalidLogoSize,
    invalidWebsiteUrl
  ];

  static ProfileValidationErrorReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProfileValidationErrorReason._(value));

  @override
  bool operator ==(other) =>
      other is ProfileValidationErrorReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PrimarySolutionType {
  static const softwareProducts = PrimarySolutionType._('SOFTWARE_PRODUCTS');
  static const consultingServices =
      PrimarySolutionType._('CONSULTING_SERVICES');
  static const professionalServices =
      PrimarySolutionType._('PROFESSIONAL_SERVICES');
  static const managedServices = PrimarySolutionType._('MANAGED_SERVICES');
  static const hardwareProducts = PrimarySolutionType._('HARDWARE_PRODUCTS');
  static const communicationServices =
      PrimarySolutionType._('COMMUNICATION_SERVICES');
  static const valueAddedResaleAwsServices =
      PrimarySolutionType._('VALUE_ADDED_RESALE_AWS_SERVICES');
  static const trainingServices = PrimarySolutionType._('TRAINING_SERVICES');

  final String value;

  const PrimarySolutionType._(this.value);

  static const values = [
    softwareProducts,
    consultingServices,
    professionalServices,
    managedServices,
    hardwareProducts,
    communicationServices,
    valueAddedResaleAwsServices,
    trainingServices
  ];

  static PrimarySolutionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrimarySolutionType._(value));

  @override
  bool operator ==(other) =>
      other is PrimarySolutionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains localized content for a partner profile in a specific language or
/// locale.
///
/// @nodoc
class LocalizedContent {
  /// The localized description of the partner's business and services.
  final String description;

  /// The localized display name for the partner.
  final String displayName;

  /// The locale or language code for the localized content.
  final String locale;

  /// The URL to the partner's logo image for this locale.
  final String logoUrl;

  /// The localized website URL for the partner.
  final String websiteUrl;

  LocalizedContent({
    required this.description,
    required this.displayName,
    required this.locale,
    required this.logoUrl,
    required this.websiteUrl,
  });

  factory LocalizedContent.fromJson(Map<String, dynamic> json) {
    return LocalizedContent(
      description: (json['Description'] as String?) ?? '',
      displayName: (json['DisplayName'] as String?) ?? '',
      locale: (json['Locale'] as String?) ?? '',
      logoUrl: (json['LogoUrl'] as String?) ?? '',
      websiteUrl: (json['WebsiteUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final locale = this.locale;
    final logoUrl = this.logoUrl;
    final websiteUrl = this.websiteUrl;
    return {
      'Description': description,
      'DisplayName': displayName,
      'Locale': locale,
      'LogoUrl': logoUrl,
      'WebsiteUrl': websiteUrl,
    };
  }
}

/// @nodoc
class IndustrySegment {
  static const agricultureMining = IndustrySegment._('AGRICULTURE_MINING');
  static const biotechnology = IndustrySegment._('BIOTECHNOLOGY');
  static const businessConsumerServices =
      IndustrySegment._('BUSINESS_CONSUMER_SERVICES');
  static const businessServ = IndustrySegment._('BUSINESS_SERV');
  static const communications = IndustrySegment._('COMMUNICATIONS');
  static const computerHardware = IndustrySegment._('COMPUTER_HARDWARE');
  static const computersElectronics =
      IndustrySegment._('COMPUTERS_ELECTRONICS');
  static const computerSoftware = IndustrySegment._('COMPUTER_SOFTWARE');
  static const consumerGoods = IndustrySegment._('CONSUMER_GOODS');
  static const consumerRelated = IndustrySegment._('CONSUMER_RELATED');
  static const education = IndustrySegment._('EDUCATION');
  static const energyUtilities = IndustrySegment._('ENERGY_UTILITIES');
  static const financialServices = IndustrySegment._('FINANCIAL_SERVICES');
  static const gaming = IndustrySegment._('GAMING');
  static const government = IndustrySegment._('GOVERNMENT');
  static const governmentEducationPublicServices =
      IndustrySegment._('GOVERNMENT_EDUCATION_PUBLIC_SERVICES');
  static const healthcare = IndustrySegment._('HEALTHCARE');
  static const healthcarePharmaceuticalsBiotech =
      IndustrySegment._('HEALTHCARE_PHARMACEUTICALS_BIOTECH');
  static const industrialEnergy = IndustrySegment._('INDUSTRIAL_ENERGY');
  static const internetSpecific = IndustrySegment._('INTERNET_SPECIFIC');
  static const lifeSciences = IndustrySegment._('LIFE_SCIENCES');
  static const manufacturing = IndustrySegment._('MANUFACTURING');
  static const mediaEntertainmentLeisure =
      IndustrySegment._('MEDIA_ENTERTAINMENT_LEISURE');
  static const mediaEntertainment = IndustrySegment._('MEDIA_ENTERTAINMENT');
  static const medicalHealth = IndustrySegment._('MEDICAL_HEALTH');
  static const nonProfitOrganization =
      IndustrySegment._('NON_PROFIT_ORGANIZATION');
  static const other = IndustrySegment._('OTHER');
  static const professionalServices =
      IndustrySegment._('PROFESSIONAL_SERVICES');
  static const realEstateConstruction =
      IndustrySegment._('REAL_ESTATE_CONSTRUCTION');
  static const retail = IndustrySegment._('RETAIL');
  static const retailWholesaleDistribution =
      IndustrySegment._('RETAIL_WHOLESALE_DISTRIBUTION');
  static const semiconductorElectr = IndustrySegment._('SEMICONDUCTOR_ELECTR');
  static const softwareInternet = IndustrySegment._('SOFTWARE_INTERNET');
  static const telecommunications = IndustrySegment._('TELECOMMUNICATIONS');
  static const transportationLogistics =
      IndustrySegment._('TRANSPORTATION_LOGISTICS');
  static const travelHospitality = IndustrySegment._('TRAVEL_HOSPITALITY');
  static const wholesaleDistribution =
      IndustrySegment._('WHOLESALE_DISTRIBUTION');

  final String value;

  const IndustrySegment._(this.value);

  static const values = [
    agricultureMining,
    biotechnology,
    businessConsumerServices,
    businessServ,
    communications,
    computerHardware,
    computersElectronics,
    computerSoftware,
    consumerGoods,
    consumerRelated,
    education,
    energyUtilities,
    financialServices,
    gaming,
    government,
    governmentEducationPublicServices,
    healthcare,
    healthcarePharmaceuticalsBiotech,
    industrialEnergy,
    internetSpecific,
    lifeSciences,
    manufacturing,
    mediaEntertainmentLeisure,
    mediaEntertainment,
    medicalHealth,
    nonProfitOrganization,
    other,
    professionalServices,
    realEstateConstruction,
    retail,
    retailWholesaleDistribution,
    semiconductorElectr,
    softwareInternet,
    telecommunications,
    transportationLogistics,
    travelHospitality,
    wholesaleDistribution
  ];

  static IndustrySegment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IndustrySegment._(value));

  @override
  bool operator ==(other) => other is IndustrySegment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ProfileVisibility {
  static const private = ProfileVisibility._('PRIVATE');
  static const public = ProfileVisibility._('PUBLIC');

  final String value;

  const ProfileVisibility._(this.value);

  static const values = [private, public];

  static ProfileVisibility fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProfileVisibility._(value));

  @override
  bool operator ==(other) => other is ProfileVisibility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains contact information for the primary alliance lead responsible for
/// partnership activities.
///
/// @nodoc
class AllianceLeadContact {
  /// The business title or role of the alliance lead contact person.
  final String businessTitle;

  /// The email address of the alliance lead contact person.
  final String email;

  /// The first name of the alliance lead contact person.
  final String firstName;

  /// The last name of the alliance lead contact person.
  final String lastName;

  AllianceLeadContact({
    required this.businessTitle,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory AllianceLeadContact.fromJson(Map<String, dynamic> json) {
    return AllianceLeadContact(
      businessTitle: (json['BusinessTitle'] as String?) ?? '',
      email: (json['Email'] as String?) ?? '',
      firstName: (json['FirstName'] as String?) ?? '',
      lastName: (json['LastName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final businessTitle = this.businessTitle;
    final email = this.email;
    final firstName = this.firstName;
    final lastName = this.lastName;
    return {
      'BusinessTitle': businessTitle,
      'Email': email,
      'FirstName': firstName,
      'LastName': lastName,
    };
  }
}

/// A summary view of a partner account containing basic information for listing
/// purposes.
///
/// @nodoc
class PartnerSummary {
  /// The Amazon Resource Name (ARN) of the partner account.
  final String arn;

  /// The catalog identifier for the partner account.
  final String catalog;

  /// The timestamp when the partner account was created.
  final DateTime createdAt;

  /// The unique identifier of the partner account.
  final String id;

  /// The legal name of the partner organization.
  final String legalName;

  PartnerSummary({
    required this.arn,
    required this.catalog,
    required this.createdAt,
    required this.id,
    required this.legalName,
  });

  factory PartnerSummary.fromJson(Map<String, dynamic> json) {
    return PartnerSummary(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      legalName: (json['LegalName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final id = this.id;
    final legalName = this.legalName;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'CreatedAt': iso8601ToJson(createdAt),
      'Id': id,
      'LegalName': legalName,
    };
  }
}

/// Contains comprehensive profile information for a partner including
/// public-facing details.
///
/// @nodoc
class PartnerProfile {
  /// A description of the partner's business, services, and capabilities.
  final String description;

  /// The public display name for the partner organization.
  final String displayName;

  /// The industry segments or verticals that the partner serves.
  final List<IndustrySegment> industrySegments;

  /// The URL to the partner's logo image.
  final String logoUrl;

  /// The primary type of solution or service the partner provides.
  final PrimarySolutionType primarySolutionType;

  /// The source locale used for automatic translation of profile content.
  final String translationSourceLocale;

  /// The partner's primary website URL.
  final String websiteUrl;

  /// A list of localized content versions for different languages and regions.
  final List<LocalizedContent>? localizedContents;

  /// The unique identifier of the partner profile.
  final String? profileId;

  PartnerProfile({
    required this.description,
    required this.displayName,
    required this.industrySegments,
    required this.logoUrl,
    required this.primarySolutionType,
    required this.translationSourceLocale,
    required this.websiteUrl,
    this.localizedContents,
    this.profileId,
  });

  factory PartnerProfile.fromJson(Map<String, dynamic> json) {
    return PartnerProfile(
      description: (json['Description'] as String?) ?? '',
      displayName: (json['DisplayName'] as String?) ?? '',
      industrySegments: ((json['IndustrySegments'] as List?) ?? const [])
          .nonNulls
          .map((e) => IndustrySegment.fromString((e as String)))
          .toList(),
      logoUrl: (json['LogoUrl'] as String?) ?? '',
      primarySolutionType: PrimarySolutionType.fromString(
          (json['PrimarySolutionType'] as String?) ?? ''),
      translationSourceLocale:
          (json['TranslationSourceLocale'] as String?) ?? '',
      websiteUrl: (json['WebsiteUrl'] as String?) ?? '',
      localizedContents: (json['LocalizedContents'] as List?)
          ?.nonNulls
          .map((e) => LocalizedContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileId: json['ProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final industrySegments = this.industrySegments;
    final logoUrl = this.logoUrl;
    final primarySolutionType = this.primarySolutionType;
    final translationSourceLocale = this.translationSourceLocale;
    final websiteUrl = this.websiteUrl;
    final localizedContents = this.localizedContents;
    final profileId = this.profileId;
    return {
      'Description': description,
      'DisplayName': displayName,
      'IndustrySegments': industrySegments.map((e) => e.value).toList(),
      'LogoUrl': logoUrl,
      'PrimarySolutionType': primarySolutionType.value,
      'TranslationSourceLocale': translationSourceLocale,
      'WebsiteUrl': websiteUrl,
      if (localizedContents != null) 'LocalizedContents': localizedContents,
      if (profileId != null) 'ProfileId': profileId,
    };
  }
}

/// Represents a verified domain associated with a partner account.
///
/// @nodoc
class PartnerDomain {
  /// The domain name that has been verified for the partner account.
  final String domainName;

  /// The timestamp when the domain was registered and verified for the partner
  /// account.
  final DateTime registeredAt;

  PartnerDomain({
    required this.domainName,
    required this.registeredAt,
  });

  factory PartnerDomain.fromJson(Map<String, dynamic> json) {
    return PartnerDomain(
      domainName: (json['DomainName'] as String?) ?? '',
      registeredAt: nonNullableTimeStampFromJson(json['RegisteredAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final registeredAt = this.registeredAt;
    return {
      'DomainName': domainName,
      'RegisteredAt': iso8601ToJson(registeredAt),
    };
  }
}

/// A key-value pair used to associate metadata with AWS Partner Central Account
/// resources.
///
/// @nodoc
class Tag {
  /// The key name of the tag. Tag keys are case-sensitive.
  final String key;

  /// The value associated with the tag key. Tag values are case-sensitive.
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

/// @nodoc
class ConnectionType {
  static const opportunityCollaboration =
      ConnectionType._('OPPORTUNITY_COLLABORATION');
  static const subsidiary = ConnectionType._('SUBSIDIARY');

  final String value;

  const ConnectionType._(this.value);

  static const values = [opportunityCollaboration, subsidiary];

  static ConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionType._(value));

  @override
  bool operator ==(other) => other is ConnectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about a specific connection type within a connection.
///
/// @nodoc
class ConnectionTypeDetail {
  /// The timestamp when this connection type was created.
  final DateTime createdAt;

  /// The email address of the person who initiated this connection type.
  final String inviterEmail;

  /// The name of the person who initiated this connection type.
  final String inviterName;

  /// Information about the other participant in this connection type.
  final Participant otherParticipant;

  /// The current status of this connection type.
  final ConnectionTypeStatus status;

  /// The timestamp when this connection type was cancelled, if applicable.
  final DateTime? canceledAt;

  /// The AWS account ID of the participant who cancelled this connection type.
  final String? canceledBy;

  ConnectionTypeDetail({
    required this.createdAt,
    required this.inviterEmail,
    required this.inviterName,
    required this.otherParticipant,
    required this.status,
    this.canceledAt,
    this.canceledBy,
  });

  factory ConnectionTypeDetail.fromJson(Map<String, dynamic> json) {
    return ConnectionTypeDetail(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      inviterEmail: (json['InviterEmail'] as String?) ?? '',
      inviterName: (json['InviterName'] as String?) ?? '',
      otherParticipant: Participant.fromJson(
          (json['OtherParticipant'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status:
          ConnectionTypeStatus.fromString((json['Status'] as String?) ?? ''),
      canceledAt: timeStampFromJson(json['CanceledAt']),
      canceledBy: json['CanceledBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final inviterEmail = this.inviterEmail;
    final inviterName = this.inviterName;
    final otherParticipant = this.otherParticipant;
    final status = this.status;
    final canceledAt = this.canceledAt;
    final canceledBy = this.canceledBy;
    return {
      'CreatedAt': iso8601ToJson(createdAt),
      'InviterEmail': inviterEmail,
      'InviterName': inviterName,
      'OtherParticipant': otherParticipant,
      'Status': status.value,
      if (canceledAt != null) 'CanceledAt': iso8601ToJson(canceledAt),
      if (canceledBy != null) 'CanceledBy': canceledBy,
    };
  }
}

/// @nodoc
class ConnectionTypeStatus {
  static const active = ConnectionTypeStatus._('ACTIVE');
  static const canceled = ConnectionTypeStatus._('CANCELED');

  final String value;

  const ConnectionTypeStatus._(this.value);

  static const values = [active, canceled];

  static ConnectionTypeStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionTypeStatus._(value));

  @override
  bool operator ==(other) =>
      other is ConnectionTypeStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a participant in a partner connection, containing their profile
/// and account information.
///
/// @nodoc
class Participant {
  /// The AWS account information for the participant.
  final AccountSummary? account;

  /// The partner profile information for the participant.
  final PartnerProfileSummary? partnerProfile;

  /// The seller profile information for the participant.
  final SellerProfileSummary? sellerProfile;

  Participant({
    this.account,
    this.partnerProfile,
    this.sellerProfile,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      account: json['Account'] != null
          ? AccountSummary.fromJson(json['Account'] as Map<String, dynamic>)
          : null,
      partnerProfile: json['PartnerProfile'] != null
          ? PartnerProfileSummary.fromJson(
              json['PartnerProfile'] as Map<String, dynamic>)
          : null,
      sellerProfile: json['SellerProfile'] != null
          ? SellerProfileSummary.fromJson(
              json['SellerProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final partnerProfile = this.partnerProfile;
    final sellerProfile = this.sellerProfile;
    return {
      if (account != null) 'Account': account,
      if (partnerProfile != null) 'PartnerProfile': partnerProfile,
      if (sellerProfile != null) 'SellerProfile': sellerProfile,
    };
  }
}

/// A summary view of a partner profile containing basic identifying
/// information.
///
/// @nodoc
class PartnerProfileSummary {
  /// The unique identifier of the partner profile.
  final String id;

  /// The display name of the partner.
  final String name;

  PartnerProfileSummary({
    required this.id,
    required this.name,
  });

  factory PartnerProfileSummary.fromJson(Map<String, dynamic> json) {
    return PartnerProfileSummary(
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      'Id': id,
      'Name': name,
    };
  }
}

/// A summary view of a seller profile containing basic identifying information.
///
/// @nodoc
class SellerProfileSummary {
  /// The unique identifier of the seller profile.
  final String id;

  /// The display name of the seller.
  final String name;

  SellerProfileSummary({
    required this.id,
    required this.name,
  });

  factory SellerProfileSummary.fromJson(Map<String, dynamic> json) {
    return SellerProfileSummary(
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      'Id': id,
      'Name': name,
    };
  }
}

/// Summary information about an AWS account.
///
/// @nodoc
class AccountSummary {
  /// The name associated with the AWS account.
  final String name;

  AccountSummary({
    required this.name,
  });

  factory AccountSummary.fromJson(Map<String, dynamic> json) {
    return AccountSummary(
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// A summary view of an active connection between partners containing key
/// information.
///
/// @nodoc
class ConnectionSummary {
  /// The Amazon Resource Name (ARN) of the connection.
  final String arn;

  /// The catalog identifier where the connection exists.
  final String catalog;

  /// A map of connection types and their summary information for this connection.
  final Map<ConnectionType, ConnectionTypeSummary> connectionTypes;

  /// The unique identifier of the connection.
  final String id;

  /// The AWS account ID of the other participant in the connection.
  final String otherParticipantAccountId;

  /// The timestamp when the connection was last updated.
  final DateTime updatedAt;

  ConnectionSummary({
    required this.arn,
    required this.catalog,
    required this.connectionTypes,
    required this.id,
    required this.otherParticipantAccountId,
    required this.updatedAt,
  });

  factory ConnectionSummary.fromJson(Map<String, dynamic> json) {
    return ConnectionSummary(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionTypes: ((json['ConnectionTypes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(ConnectionType.fromString(k),
              ConnectionTypeSummary.fromJson(e as Map<String, dynamic>))),
      id: (json['Id'] as String?) ?? '',
      otherParticipantAccountId:
          (json['OtherParticipantAccountId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionTypes = this.connectionTypes;
    final id = this.id;
    final otherParticipantAccountId = this.otherParticipantAccountId;
    final updatedAt = this.updatedAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionTypes': connectionTypes.map((k, e) => MapEntry(k.value, e)),
      'Id': id,
      'OtherParticipantAccountId': otherParticipantAccountId,
      'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Summary information about a specific connection type between partners.
///
/// @nodoc
class ConnectionTypeSummary {
  /// Information about the other participant in this connection type.
  final Participant otherParticipant;

  /// The current status of this connection type (active, canceled, etc.).
  final ConnectionTypeStatus status;

  ConnectionTypeSummary({
    required this.otherParticipant,
    required this.status,
  });

  factory ConnectionTypeSummary.fromJson(Map<String, dynamic> json) {
    return ConnectionTypeSummary(
      otherParticipant: Participant.fromJson(
          (json['OtherParticipant'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status:
          ConnectionTypeStatus.fromString((json['Status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final otherParticipant = this.otherParticipant;
    final status = this.status;
    return {
      'OtherParticipant': otherParticipant,
      'Status': status.value,
    };
  }
}

/// @nodoc
class AccessType {
  static const allowAll = AccessType._('ALLOW_ALL');
  static const denyAll = AccessType._('DENY_ALL');
  static const allowByDefaultDenySome =
      AccessType._('ALLOW_BY_DEFAULT_DENY_SOME');

  final String value;

  const AccessType._(this.value);

  static const values = [allowAll, denyAll, allowByDefaultDenySome];

  static AccessType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AccessType._(value));

  @override
  bool operator ==(other) => other is AccessType && other.value == value;

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

/// @nodoc
class InvitationStatus {
  static const pending = InvitationStatus._('PENDING');
  static const accepted = InvitationStatus._('ACCEPTED');
  static const rejected = InvitationStatus._('REJECTED');
  static const canceled = InvitationStatus._('CANCELED');
  static const expired = InvitationStatus._('EXPIRED');

  final String value;

  const InvitationStatus._(this.value);

  static const values = [pending, accepted, rejected, canceled, expired];

  static InvitationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InvitationStatus._(value));

  @override
  bool operator ==(other) => other is InvitationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Base structure containing common connection properties.
///
/// @nodoc
class Connection {
  /// The AWS Resource Name (ARN) of the connection.
  final String arn;

  /// The catalog identifier that the connection belongs to.
  final String catalog;

  /// The type of connection.
  final Map<ConnectionType, ConnectionTypeDetail> connectionTypes;

  /// The unique identifier of the connection.
  final String id;

  /// The AWS account ID of the other participant in the connection.
  final String otherParticipantAccountId;

  /// The timestamp when the connection was last updated.
  final DateTime updatedAt;

  Connection({
    required this.arn,
    required this.catalog,
    required this.connectionTypes,
    required this.id,
    required this.otherParticipantAccountId,
    required this.updatedAt,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionTypes: ((json['ConnectionTypes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(ConnectionType.fromString(k),
              ConnectionTypeDetail.fromJson(e as Map<String, dynamic>))),
      id: (json['Id'] as String?) ?? '',
      otherParticipantAccountId:
          (json['OtherParticipantAccountId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionTypes = this.connectionTypes;
    final id = this.id;
    final otherParticipantAccountId = this.otherParticipantAccountId;
    final updatedAt = this.updatedAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionTypes': connectionTypes.map((k, e) => MapEntry(k.value, e)),
      'Id': id,
      'OtherParticipantAccountId': otherParticipantAccountId,
      'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// A summary view of a connection invitation containing key information without
/// full details.
///
/// @nodoc
class ConnectionInvitationSummary {
  /// The Amazon Resource Name (ARN) of the connection invitation.
  final String arn;

  /// The catalog identifier where the connection invitation exists.
  final String catalog;

  /// The type of connection being requested in the invitation.
  final ConnectionType connectionType;

  /// The timestamp when the connection invitation was created.
  final DateTime createdAt;

  /// The unique identifier of the connection invitation.
  final String id;

  /// The identifier of the other participant in the connection invitation.
  final String otherParticipantIdentifier;

  /// The type of participant (inviter or invitee) in the connection invitation.
  final ParticipantType participantType;

  /// The current status of the connection invitation.
  final InvitationStatus status;

  /// The timestamp when the connection invitation was last updated.
  final DateTime updatedAt;

  /// The identifier of the connection associated with this invitation.
  final String? connectionId;

  /// The timestamp when the connection invitation will expire.
  final DateTime? expiresAt;

  ConnectionInvitationSummary({
    required this.arn,
    required this.catalog,
    required this.connectionType,
    required this.createdAt,
    required this.id,
    required this.otherParticipantIdentifier,
    required this.participantType,
    required this.status,
    required this.updatedAt,
    this.connectionId,
    this.expiresAt,
  });

  factory ConnectionInvitationSummary.fromJson(Map<String, dynamic> json) {
    return ConnectionInvitationSummary(
      arn: (json['Arn'] as String?) ?? '',
      catalog: (json['Catalog'] as String?) ?? '',
      connectionType:
          ConnectionType.fromString((json['ConnectionType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      otherParticipantIdentifier:
          (json['OtherParticipantIdentifier'] as String?) ?? '',
      participantType: ParticipantType.fromString(
          (json['ParticipantType'] as String?) ?? ''),
      status: InvitationStatus.fromString((json['Status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      connectionId: json['ConnectionId'] as String?,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final catalog = this.catalog;
    final connectionType = this.connectionType;
    final createdAt = this.createdAt;
    final id = this.id;
    final otherParticipantIdentifier = this.otherParticipantIdentifier;
    final participantType = this.participantType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final connectionId = this.connectionId;
    final expiresAt = this.expiresAt;
    return {
      'Arn': arn,
      'Catalog': catalog,
      'ConnectionType': connectionType.value,
      'CreatedAt': iso8601ToJson(createdAt),
      'Id': id,
      'OtherParticipantIdentifier': otherParticipantIdentifier,
      'ParticipantType': participantType.value,
      'Status': status.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (connectionId != null) 'ConnectionId': connectionId,
      if (expiresAt != null) 'ExpiresAt': iso8601ToJson(expiresAt),
    };
  }
}

/// @nodoc
class VerificationType {
  static const businessVerification =
      VerificationType._('BUSINESS_VERIFICATION');
  static const registrantVerification =
      VerificationType._('REGISTRANT_VERIFICATION');

  final String value;

  const VerificationType._(this.value);

  static const values = [businessVerification, registrantVerification];

  static VerificationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VerificationType._(value));

  @override
  bool operator ==(other) => other is VerificationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class VerificationStatus {
  static const pendingCustomerAction =
      VerificationStatus._('PENDING_CUSTOMER_ACTION');
  static const inProgress = VerificationStatus._('IN_PROGRESS');
  static const failed = VerificationStatus._('FAILED');
  static const succeeded = VerificationStatus._('SUCCEEDED');
  static const rejected = VerificationStatus._('REJECTED');

  final String value;

  const VerificationStatus._(this.value);

  static const values = [
    pendingCustomerAction,
    inProgress,
    failed,
    succeeded,
    rejected
  ];

  static VerificationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VerificationStatus._(value));

  @override
  bool operator ==(other) =>
      other is VerificationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A union structure containing the response details specific to different
/// types of verification processes, providing type-specific information and
/// results.
///
/// @nodoc
class VerificationResponseDetails {
  /// The response details from a business verification process, including
  /// verification results and any additional business information discovered.
  final BusinessVerificationResponse? businessVerificationResponse;

  /// The response details from a registrant verification process, including
  /// verification results and any additional steps required for identity
  /// confirmation.
  final RegistrantVerificationResponse? registrantVerificationResponse;

  VerificationResponseDetails({
    this.businessVerificationResponse,
    this.registrantVerificationResponse,
  });

  factory VerificationResponseDetails.fromJson(Map<String, dynamic> json) {
    return VerificationResponseDetails(
      businessVerificationResponse: json['BusinessVerificationResponse'] != null
          ? BusinessVerificationResponse.fromJson(
              json['BusinessVerificationResponse'] as Map<String, dynamic>)
          : null,
      registrantVerificationResponse: json['RegistrantVerificationResponse'] !=
              null
          ? RegistrantVerificationResponse.fromJson(
              json['RegistrantVerificationResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final businessVerificationResponse = this.businessVerificationResponse;
    final registrantVerificationResponse = this.registrantVerificationResponse;
    return {
      if (businessVerificationResponse != null)
        'BusinessVerificationResponse': businessVerificationResponse,
      if (registrantVerificationResponse != null)
        'RegistrantVerificationResponse': registrantVerificationResponse,
    };
  }
}

/// Contains the response information and results from a business verification
/// process, including any verification-specific data returned by the
/// verification service.
///
/// @nodoc
class BusinessVerificationResponse {
  /// The business verification details that were processed and verified,
  /// potentially including additional information discovered during the
  /// verification process.
  final BusinessVerificationDetails businessVerificationDetails;

  /// A secure URL where the registrant can complete additional verification
  /// steps, such as document upload or identity confirmation through a
  /// third-party verification service.
  final String? completionUrl;

  /// The timestamp when the completion URL expires and is no longer valid for
  /// accessing the verification workflow.
  final DateTime? completionUrlExpiresAt;

  BusinessVerificationResponse({
    required this.businessVerificationDetails,
    this.completionUrl,
    this.completionUrlExpiresAt,
  });

  factory BusinessVerificationResponse.fromJson(Map<String, dynamic> json) {
    return BusinessVerificationResponse(
      businessVerificationDetails: BusinessVerificationDetails.fromJson(
          (json['BusinessVerificationDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      completionUrl: json['CompletionUrl'] as String?,
      completionUrlExpiresAt: timeStampFromJson(json['CompletionUrlExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final businessVerificationDetails = this.businessVerificationDetails;
    final completionUrl = this.completionUrl;
    final completionUrlExpiresAt = this.completionUrlExpiresAt;
    return {
      'BusinessVerificationDetails': businessVerificationDetails,
      if (completionUrl != null) 'CompletionUrl': completionUrl,
      if (completionUrlExpiresAt != null)
        'CompletionUrlExpiresAt': iso8601ToJson(completionUrlExpiresAt),
    };
  }
}

/// Contains the response information from a registrant verification process,
/// including any verification-specific data and next steps for the individual
/// verification workflow.
///
/// @nodoc
class RegistrantVerificationResponse {
  /// A secure URL where the registrant can complete additional verification
  /// steps, such as document upload or identity confirmation through a
  /// third-party verification service.
  final String completionUrl;

  /// The timestamp when the completion URL expires and is no longer valid for
  /// accessing the verification workflow.
  final DateTime completionUrlExpiresAt;

  RegistrantVerificationResponse({
    required this.completionUrl,
    required this.completionUrlExpiresAt,
  });

  factory RegistrantVerificationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrantVerificationResponse(
      completionUrl: (json['CompletionUrl'] as String?) ?? '',
      completionUrlExpiresAt:
          nonNullableTimeStampFromJson(json['CompletionUrlExpiresAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final completionUrl = this.completionUrl;
    final completionUrlExpiresAt = this.completionUrlExpiresAt;
    return {
      'CompletionUrl': completionUrl,
      'CompletionUrlExpiresAt': iso8601ToJson(completionUrlExpiresAt),
    };
  }
}

/// Contains the business information required for verifying a company's legal
/// status and registration details within AWS Partner Central.
///
/// @nodoc
class BusinessVerificationDetails {
  /// The ISO 3166-1 alpha-2 country code where the business is legally registered
  /// and operates.
  final String countryCode;

  /// The official legal name of the business as registered with the appropriate
  /// government authorities.
  final String legalName;

  /// The unique business registration identifier assigned by the government or
  /// regulatory authority, such as a company registration number or tax
  /// identification number.
  final String registrationId;

  /// The specific legal jurisdiction or state where the business was incorporated
  /// or registered, providing additional location context beyond the country
  /// code.
  final String? jurisdictionOfIncorporation;

  BusinessVerificationDetails({
    required this.countryCode,
    required this.legalName,
    required this.registrationId,
    this.jurisdictionOfIncorporation,
  });

  factory BusinessVerificationDetails.fromJson(Map<String, dynamic> json) {
    return BusinessVerificationDetails(
      countryCode: (json['CountryCode'] as String?) ?? '',
      legalName: (json['LegalName'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      jurisdictionOfIncorporation:
          json['JurisdictionOfIncorporation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final countryCode = this.countryCode;
    final legalName = this.legalName;
    final registrationId = this.registrationId;
    final jurisdictionOfIncorporation = this.jurisdictionOfIncorporation;
    return {
      'CountryCode': countryCode,
      'LegalName': legalName,
      'RegistrationId': registrationId,
      if (jurisdictionOfIncorporation != null)
        'JurisdictionOfIncorporation': jurisdictionOfIncorporation,
    };
  }
}

/// A union structure containing the specific details required for different
/// types of verification processes supported by AWS Partner Central.
///
/// @nodoc
class VerificationDetails {
  /// The business verification details to be used when starting a business
  /// verification process.
  final BusinessVerificationDetails? businessVerificationDetails;

  /// The registrant verification details to be used when starting an individual
  /// identity verification process.
  final RegistrantVerificationDetails? registrantVerificationDetails;

  VerificationDetails({
    this.businessVerificationDetails,
    this.registrantVerificationDetails,
  });

  Map<String, dynamic> toJson() {
    final businessVerificationDetails = this.businessVerificationDetails;
    final registrantVerificationDetails = this.registrantVerificationDetails;
    return {
      if (businessVerificationDetails != null)
        'BusinessVerificationDetails': businessVerificationDetails,
      if (registrantVerificationDetails != null)
        'RegistrantVerificationDetails': registrantVerificationDetails,
    };
  }
}

/// Contains the personal information required for verifying an individual's
/// identity as part of the partner registration process in AWS Partner Central.
///
/// @nodoc
class RegistrantVerificationDetails {
  RegistrantVerificationDetails();

  Map<String, dynamic> toJson() {
    return {};
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
