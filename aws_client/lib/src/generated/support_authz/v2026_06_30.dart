// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2026_06_30.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS SupportAuthZ enables you to control and authorize the actions that AWS
/// support operators can perform on your resources. You create
/// cryptographically signed support permits specifying which actions operators
/// can perform, on which resources, and under what time-window conditions.
/// Permits are signed using a customer-managed AWS KMS key (ECC_NIST_P384,
/// SIGN_VERIFY) to ensure non-repudiation.
class SupportAuthz {
  final _s.RestJsonProtocol _protocol;
  factory SupportAuthz({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'supportauthz',
    );
    return SupportAuthz._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  SupportAuthz._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates a support permit that authorizes an AWS support operator to
  /// perform specified actions on specified resources. The permit is
  /// cryptographically signed using a customer-managed AWS KMS key
  /// (ECC_NIST_P384, SIGN_VERIFY) to ensure non-repudiation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A customer-chosen name for the support permit. Must be between 1 and 256
  /// alphanumeric characters.
  ///
  /// Parameter [permit] :
  /// The permit definition specifying the actions, resources, and time-window
  /// conditions that the support operator is authorized to use.
  ///
  /// Parameter [signingKeyInfo] :
  /// The signing key information used to sign the permit. Must reference an AWS
  /// KMS key with key usage SIGN_VERIFY and key spec ECC_NIST_P384.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, the
  /// service returns the existing permit without creating a duplicate.
  ///
  /// Parameter [description] :
  /// A human-readable description of why this permit is being created. Maximum
  /// length of 1024 characters.
  ///
  /// Parameter [supportCaseDisplayId] :
  /// The display identifier of the AWS Support case associated with this
  /// permit.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the support permit on creation.
  Future<CreateSupportPermitOutput> createSupportPermit({
    required String name,
    required Permit permit,
    required SigningKeyInfo signingKeyInfo,
    String? clientToken,
    String? description,
    String? supportCaseDisplayId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'permit': permit,
      'signingKeyInfo': signingKeyInfo,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (supportCaseDisplayId != null)
        'supportCaseDisplayId': supportCaseDisplayId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/support-permits',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSupportPermitOutput.fromJson(response);
  }

  /// Deletes a support permit, revoking the authorization previously granted to
  /// the AWS support operator.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [supportPermitIdentifier] :
  /// The Amazon Resource Name (ARN) or name of the support permit to delete.
  Future<DeleteSupportPermitOutput> deleteSupportPermit({
    required String supportPermitIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/support-permits/${Uri.encodeComponent(supportPermitIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSupportPermitOutput.fromJson(response);
  }

  /// Retrieves the description of a specific support action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The name of the support action to retrieve.
  Future<GetActionOutput> getAction({
    required String action,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/actions/${Uri.encodeComponent(action)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetActionOutput.fromJson(response);
  }

  /// Retrieves the details of a support permit by its ARN or name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [supportPermitIdentifier] :
  /// The ARN or name of the support permit to retrieve.
  Future<GetSupportPermitOutput> getSupportPermit({
    required String supportPermitIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/support-permits/${Uri.encodeComponent(supportPermitIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSupportPermitOutput.fromJson(response);
  }

  /// Lists available support actions for a specified AWS service. Use
  /// pagination to ensure that the operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [service] :
  /// The name of the AWS service for which to list available support actions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid range is 1
  /// to 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListActionsOutput> listActions({
    required String service,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'service': [service],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListActionsOutput.fromJson(response);
  }

  /// Lists permit requests from AWS support operators. Use pagination to ensure
  /// that the operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid range is 1
  /// to 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [supportCaseDisplayId] :
  /// Filters the results by support case display identifier.
  Future<ListSupportPermitRequestsOutput> listSupportPermitRequests({
    int? maxResults,
    String? nextToken,
    String? supportCaseDisplayId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (supportCaseDisplayId != null)
        'supportCaseDisplayId': [supportCaseDisplayId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/support-permit-requests',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSupportPermitRequestsOutput.fromJson(response);
  }

  /// Lists all support permits in the caller's account. Use pagination to
  /// ensure that the operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid range is 1
  /// to 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [supportPermitStatuses] :
  /// Filters the results by support permit status. Valid values: ACTIVE,
  /// INACTIVE, DELETING.
  Future<ListSupportPermitsOutput> listSupportPermits({
    int? maxResults,
    String? nextToken,
    List<SupportPermitStatus>? supportPermitStatuses,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (supportPermitStatuses != null)
        'supportPermitStatuses':
            supportPermitStatuses.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/support-permits',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSupportPermitsOutput.fromJson(response);
  }

  /// Lists the tags associated with a support permit resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to list tags for.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Rejects a permit request from an AWS support operator. The operator cannot
  /// proceed with the requested action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [requestArn] :
  /// The ARN of the permit request to reject.
  Future<RejectSupportPermitRequestOutput> rejectSupportPermitRequest({
    required String requestArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/support-permit-requests/${Uri.encodeComponent(requestArn)}/reject',
      exceptionFnMap: _exceptionFns,
    );
    return RejectSupportPermitRequestOutput.fromJson(response);
  }

  /// Adds or overwrites one or more tags for a support permit resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to tag.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. Maximum of 50 tags.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from a support permit resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class CreateSupportPermitOutput {
  /// The Amazon Resource Name (ARN) of the support permit.
  final String arn;

  /// The timestamp when the permit was created.
  final DateTime createdAt;

  /// The name of the support permit.
  final String name;

  /// The permit definition.
  final Permit permit;

  /// The signing key information for the permit.
  final SigningKeyInfo signingKeyInfo;

  /// The current status of the support permit.
  final SupportPermitStatus status;

  /// The description of the support permit.
  final String? description;

  /// The display identifier of the support case associated with the permit.
  final String? supportCaseDisplayId;

  /// The tags associated with the support permit.
  final Map<String, String>? tags;

  CreateSupportPermitOutput({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.permit,
    required this.signingKeyInfo,
    required this.status,
    this.description,
    this.supportCaseDisplayId,
    this.tags,
  });

  factory CreateSupportPermitOutput.fromJson(Map<String, dynamic> json) {
    return CreateSupportPermitOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      permit: Permit.fromJson((json['permit'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      signingKeyInfo: SigningKeyInfo.fromJson(
          (json['signingKeyInfo'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: SupportPermitStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      supportCaseDisplayId: json['supportCaseDisplayId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final permit = this.permit;
    final signingKeyInfo = this.signingKeyInfo;
    final status = this.status;
    final description = this.description;
    final supportCaseDisplayId = this.supportCaseDisplayId;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'name': name,
      'permit': permit,
      'signingKeyInfo': signingKeyInfo,
      'status': status.value,
      if (description != null) 'description': description,
      if (supportCaseDisplayId != null)
        'supportCaseDisplayId': supportCaseDisplayId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteSupportPermitOutput {
  /// The ARN of the deleted support permit.
  final String arn;

  /// The timestamp when the permit was originally created.
  final DateTime createdAt;

  /// The name of the deleted support permit.
  final String name;

  /// The permit definition of the deleted permit.
  final Permit permit;

  /// The signing key information for the deleted permit.
  final SigningKeyInfo signingKeyInfo;

  /// The status of the support permit. Returns DELETING.
  final SupportPermitStatus status;

  /// The description of the deleted support permit.
  final String? description;

  /// The display identifier of the support case associated with the deleted
  /// permit.
  final String? supportCaseDisplayId;

  DeleteSupportPermitOutput({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.permit,
    required this.signingKeyInfo,
    required this.status,
    this.description,
    this.supportCaseDisplayId,
  });

  factory DeleteSupportPermitOutput.fromJson(Map<String, dynamic> json) {
    return DeleteSupportPermitOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      permit: Permit.fromJson((json['permit'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      signingKeyInfo: SigningKeyInfo.fromJson(
          (json['signingKeyInfo'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: SupportPermitStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      supportCaseDisplayId: json['supportCaseDisplayId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final permit = this.permit;
    final signingKeyInfo = this.signingKeyInfo;
    final status = this.status;
    final description = this.description;
    final supportCaseDisplayId = this.supportCaseDisplayId;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'name': name,
      'permit': permit,
      'signingKeyInfo': signingKeyInfo,
      'status': status.value,
      if (description != null) 'description': description,
      if (supportCaseDisplayId != null)
        'supportCaseDisplayId': supportCaseDisplayId,
    };
  }
}

/// @nodoc
class GetActionOutput {
  /// The name of the support action.
  final String action;

  /// A description of what the support action does.
  final String description;

  /// The AWS service associated with the support action.
  final String service;

  GetActionOutput({
    required this.action,
    required this.description,
    required this.service,
  });

  factory GetActionOutput.fromJson(Map<String, dynamic> json) {
    return GetActionOutput(
      action: (json['action'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      service: (json['service'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final description = this.description;
    final service = this.service;
    return {
      'action': action,
      'description': description,
      'service': service,
    };
  }
}

/// @nodoc
class GetSupportPermitOutput {
  /// The ARN of the support permit.
  final String arn;

  /// The timestamp when the permit was created.
  final DateTime createdAt;

  /// The name of the support permit.
  final String name;

  /// The permit definition.
  final Permit permit;

  /// The signing key information for the permit.
  final SigningKeyInfo signingKeyInfo;

  /// The current status of the support permit.
  final SupportPermitStatus status;

  /// The description of the support permit.
  final String? description;

  /// The display identifier of the support case associated with the permit.
  final String? supportCaseDisplayId;

  /// The tags associated with the support permit.
  final Map<String, String>? tags;

  GetSupportPermitOutput({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.permit,
    required this.signingKeyInfo,
    required this.status,
    this.description,
    this.supportCaseDisplayId,
    this.tags,
  });

  factory GetSupportPermitOutput.fromJson(Map<String, dynamic> json) {
    return GetSupportPermitOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      permit: Permit.fromJson((json['permit'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      signingKeyInfo: SigningKeyInfo.fromJson(
          (json['signingKeyInfo'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: SupportPermitStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      supportCaseDisplayId: json['supportCaseDisplayId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final permit = this.permit;
    final signingKeyInfo = this.signingKeyInfo;
    final status = this.status;
    final description = this.description;
    final supportCaseDisplayId = this.supportCaseDisplayId;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'name': name,
      'permit': permit,
      'signingKeyInfo': signingKeyInfo,
      'status': status.value,
      if (description != null) 'description': description,
      if (supportCaseDisplayId != null)
        'supportCaseDisplayId': supportCaseDisplayId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListActionsOutput {
  /// The list of support actions.
  final List<ActionSummary> actionSummaries;

  /// The token for the next page of results, or null if there are no more
  /// results.
  final String? nextToken;

  ListActionsOutput({
    required this.actionSummaries,
    this.nextToken,
  });

  factory ListActionsOutput.fromJson(Map<String, dynamic> json) {
    return ListActionsOutput(
      actionSummaries: ((json['actionSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionSummaries = this.actionSummaries;
    final nextToken = this.nextToken;
    return {
      'actionSummaries': actionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSupportPermitRequestsOutput {
  /// The list of permit requests.
  final List<SupportPermitRequest> supportPermitRequests;

  /// The token for the next page of results, or null if there are no more
  /// results.
  final String? nextToken;

  ListSupportPermitRequestsOutput({
    required this.supportPermitRequests,
    this.nextToken,
  });

  factory ListSupportPermitRequestsOutput.fromJson(Map<String, dynamic> json) {
    return ListSupportPermitRequestsOutput(
      supportPermitRequests: ((json['supportPermitRequests'] as List?) ??
              const [])
          .nonNulls
          .map((e) => SupportPermitRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final supportPermitRequests = this.supportPermitRequests;
    final nextToken = this.nextToken;
    return {
      'supportPermitRequests': supportPermitRequests,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSupportPermitsOutput {
  /// The list of support permits.
  final List<SupportPermitSummary> supportPermits;

  /// The token for the next page of results, or null if there are no more
  /// results.
  final String? nextToken;

  ListSupportPermitsOutput({
    required this.supportPermits,
    this.nextToken,
  });

  factory ListSupportPermitsOutput.fromJson(Map<String, dynamic> json) {
    return ListSupportPermitsOutput(
      supportPermits: ((json['supportPermits'] as List?) ?? const [])
          .nonNulls
          .map((e) => SupportPermitSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final supportPermits = this.supportPermits;
    final nextToken = this.nextToken;
    return {
      'supportPermits': supportPermits,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// The tags associated with the resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
class RejectSupportPermitRequestOutput {
  /// The ARN of the rejected permit request.
  final String requestArn;

  RejectSupportPermitRequestOutput({
    required this.requestArn,
  });

  factory RejectSupportPermitRequestOutput.fromJson(Map<String, dynamic> json) {
    return RejectSupportPermitRequestOutput(
      requestArn: (json['requestArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final requestArn = this.requestArn;
    return {
      'requestArn': requestArn,
    };
  }
}

/// @nodoc
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A summary of a support permit.
///
/// @nodoc
class SupportPermitSummary {
  /// The ARN of the support permit.
  final String arn;

  /// The timestamp when the permit was created.
  final DateTime createdAt;

  /// The name of the support permit.
  final String name;

  /// The permit definition.
  final Permit permit;

  /// The signing key information for the permit.
  final SigningKeyInfo signingKeyInfo;

  /// The current status of the support permit.
  final SupportPermitStatus status;

  /// The display identifier of the support case associated with the permit.
  final String? supportCaseDisplayId;

  SupportPermitSummary({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.permit,
    required this.signingKeyInfo,
    required this.status,
    this.supportCaseDisplayId,
  });

  factory SupportPermitSummary.fromJson(Map<String, dynamic> json) {
    return SupportPermitSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      permit: Permit.fromJson((json['permit'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      signingKeyInfo: SigningKeyInfo.fromJson(
          (json['signingKeyInfo'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: SupportPermitStatus.fromString((json['status'] as String?) ?? ''),
      supportCaseDisplayId: json['supportCaseDisplayId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final permit = this.permit;
    final signingKeyInfo = this.signingKeyInfo;
    final status = this.status;
    final supportCaseDisplayId = this.supportCaseDisplayId;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'name': name,
      'permit': permit,
      'signingKeyInfo': signingKeyInfo,
      'status': status.value,
      if (supportCaseDisplayId != null)
        'supportCaseDisplayId': supportCaseDisplayId,
    };
  }
}

/// The permit definition specifying the authorized actions, resources, and
/// time-window conditions for a support operator.
///
/// @nodoc
class Permit {
  /// The set of actions that the support operator is authorized to perform.
  final ActionSet actions;

  /// The set of resources that the support operator is authorized to act upon.
  final ResourceSet resources;

  /// The time-window conditions that constrain when the permit is valid. Maximum
  /// of 2 conditions.
  final List<Condition>? conditions;

  Permit({
    required this.actions,
    required this.resources,
    this.conditions,
  });

  factory Permit.fromJson(Map<String, dynamic> json) {
    return Permit(
      actions: ActionSet.fromJson((json['actions'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      resources: ResourceSet.fromJson(
          (json['resources'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      conditions: (json['conditions'] as List?)
          ?.nonNulls
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final resources = this.resources;
    final conditions = this.conditions;
    return {
      'actions': actions,
      'resources': resources,
      if (conditions != null) 'conditions': conditions,
    };
  }
}

/// The status of a support permit.
///
/// @nodoc
class SupportPermitStatus {
  static const active = SupportPermitStatus._('ACTIVE');
  static const inactive = SupportPermitStatus._('INACTIVE');
  static const deleting = SupportPermitStatus._('DELETING');

  final String value;

  const SupportPermitStatus._(this.value);

  static const values = [active, inactive, deleting];

  static SupportPermitStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupportPermitStatus._(value));

  @override
  bool operator ==(other) =>
      other is SupportPermitStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The signing key used to cryptographically sign a support permit.
///
/// @nodoc
class SigningKeyInfo {
  /// The ARN of the AWS KMS key used to sign the permit. The key must have key
  /// spec ECC_NIST_P384 and key usage SIGN_VERIFY.
  final String? kmsKey;

  SigningKeyInfo({
    this.kmsKey,
  });

  factory SigningKeyInfo.fromJson(Map<String, dynamic> json) {
    return SigningKeyInfo(
      kmsKey: json['kmsKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKey = this.kmsKey;
    return {
      if (kmsKey != null) 'kmsKey': kmsKey,
    };
  }
}

/// The set of actions authorized by a permit. Specify either all actions or a
/// list of specific actions.
///
/// @nodoc
class ActionSet {
  /// A list of specific support actions to authorize. Maximum of 10 actions.
  final List<String>? actions;

  /// Authorizes all available support actions.
  final Unit? allActions;

  ActionSet({
    this.actions,
    this.allActions,
  });

  factory ActionSet.fromJson(Map<String, dynamic> json) {
    return ActionSet(
      actions:
          (json['actions'] as List?)?.nonNulls.map((e) => e as String).toList(),
      allActions: json['allActions'] != null
          ? Unit.fromJson(json['allActions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final allActions = this.allActions;
    return {
      if (actions != null) 'actions': actions,
      if (allActions != null) 'allActions': allActions,
    };
  }
}

/// The set of resources authorized by a permit. Specify either all resources in
/// the Region or a list of specific resources.
///
/// @nodoc
class ResourceSet {
  /// Authorizes the support operator to act on all resources in the Region.
  final Unit? allResourcesInRegion;

  /// A list of specific resource identifiers that the support operator is
  /// authorized to act upon. Maximum of 5 resources.
  final List<String>? resources;

  ResourceSet({
    this.allResourcesInRegion,
    this.resources,
  });

  factory ResourceSet.fromJson(Map<String, dynamic> json) {
    return ResourceSet(
      allResourcesInRegion: json['allResourcesInRegion'] != null
          ? Unit.fromJson(json['allResourcesInRegion'] as Map<String, dynamic>)
          : null,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allResourcesInRegion = this.allResourcesInRegion;
    final resources = this.resources;
    return {
      if (allResourcesInRegion != null)
        'allResourcesInRegion': allResourcesInRegion,
      if (resources != null) 'resources': resources,
    };
  }
}

/// A time-window condition that constrains when a support permit is valid.
///
/// @nodoc
class Condition {
  /// The earliest time at which the permit becomes valid.
  final DateTime? allowAfter;

  /// The latest time at which the permit remains valid.
  final DateTime? allowBefore;

  Condition({
    this.allowAfter,
    this.allowBefore,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      allowAfter: timeStampFromJson(json['allowAfter']),
      allowBefore: timeStampFromJson(json['allowBefore']),
    );
  }

  Map<String, dynamic> toJson() {
    final allowAfter = this.allowAfter;
    final allowBefore = this.allowBefore;
    return {
      if (allowAfter != null) 'allowAfter': unixTimestampToJson(allowAfter),
      if (allowBefore != null) 'allowBefore': unixTimestampToJson(allowBefore),
    };
  }
}

/// A permit request from an AWS support operator.
///
/// @nodoc
class SupportPermitRequest {
  /// The timestamp when the request was created.
  final DateTime createdAt;

  /// The permit definition requested by the operator.
  final Permit permit;

  /// The ARN of the permit request.
  final String requestArn;

  /// The current status of the permit request.
  final SupportPermitRequestStatus status;

  /// The display identifier of the support case associated with the request.
  final String supportCaseDisplayId;

  /// The timestamp when the request was last updated.
  final DateTime updatedAt;

  SupportPermitRequest({
    required this.createdAt,
    required this.permit,
    required this.requestArn,
    required this.status,
    required this.supportCaseDisplayId,
    required this.updatedAt,
  });

  factory SupportPermitRequest.fromJson(Map<String, dynamic> json) {
    return SupportPermitRequest(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      permit: Permit.fromJson((json['permit'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      requestArn: (json['requestArn'] as String?) ?? '',
      status: SupportPermitRequestStatus.fromString(
          (json['status'] as String?) ?? ''),
      supportCaseDisplayId: (json['supportCaseDisplayId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final permit = this.permit;
    final requestArn = this.requestArn;
    final status = this.status;
    final supportCaseDisplayId = this.supportCaseDisplayId;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'permit': permit,
      'requestArn': requestArn,
      'status': status.value,
      'supportCaseDisplayId': supportCaseDisplayId,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The status of a support permit request.
///
/// @nodoc
class SupportPermitRequestStatus {
  static const pending = SupportPermitRequestStatus._('PENDING');
  static const accepted = SupportPermitRequestStatus._('ACCEPTED');
  static const rejected = SupportPermitRequestStatus._('REJECTED');
  static const cancelled = SupportPermitRequestStatus._('CANCELLED');

  final String value;

  const SupportPermitRequestStatus._(this.value);

  static const values = [pending, accepted, rejected, cancelled];

  static SupportPermitRequestStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupportPermitRequestStatus._(value));

  @override
  bool operator ==(other) =>
      other is SupportPermitRequestStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of a support action.
///
/// @nodoc
class ActionSummary {
  /// The name of the support action.
  final String action;

  /// A description of what the support action does.
  final String description;

  /// The AWS service associated with the support action.
  final String service;

  ActionSummary({
    required this.action,
    required this.description,
    required this.service,
  });

  factory ActionSummary.fromJson(Map<String, dynamic> json) {
    return ActionSummary(
      action: (json['action'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      service: (json['service'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final description = this.description;
    final service = this.service;
    return {
      'action': action,
      'description': description,
      'service': service,
    };
  }
}

/// @nodoc
class Unit {
  Unit();

  factory Unit.fromJson(Map<String, dynamic> _) {
    return Unit();
  }

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
