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

/// Provides managed connections between your AWS network resources and select
/// partner network resources.
class Interconnect {
  final _s.JsonProtocol _protocol;
  Interconnect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'interconnect',
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

  /// Accepts a connection proposal which was generated at a supported partner's
  /// portal.
  ///
  /// The proposal contains the Environment and bandwidth that were chosen on
  /// the partner's portal and cannot be modified.
  ///
  /// Upon accepting the proposal a connection will be made between the AWS
  /// network as accessed via the selected Attach Point and the network
  /// previously selected network on the partner's portal.
  ///
  /// Parameter [activationKey] :
  /// An Activation Key that was generated on a supported partner's portal. This
  /// key captures the desired parameters from the initial creation request.
  ///
  /// The details of this request can be described using with
  /// <a>DescribeConnectionProposal</a>.
  ///
  /// Parameter [attachPoint] :
  /// The Attach Point to which the connection should be associated.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token used for the request.
  ///
  /// Parameter [description] :
  /// A description to distinguish this <a>Connection</a>.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the resulting <a>Connection</a>.
  Future<AcceptConnectionProposalResponse> acceptConnectionProposal({
    required String activationKey,
    required AttachPoint attachPoint,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.AcceptConnectionProposal'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activationKey': activationKey,
        'attachPoint': attachPoint,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return AcceptConnectionProposalResponse.fromJson(jsonResponse.body);
  }

  /// Describes the details of a connection proposal generated at a partner's
  /// portal.
  ///
  /// Parameter [activationKey] :
  /// An Activation Key that was generated on a supported partner's portal. This
  /// key captures the desired parameters from the initial creation request.
  Future<DescribeConnectionProposalResponse> describeConnectionProposal({
    required String activationKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.DescribeConnectionProposal'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activationKey': activationKey,
      },
    );

    return DescribeConnectionProposalResponse.fromJson(jsonResponse.body);
  }

  /// Lists all Attach Points the caller has access to that are valid for the
  /// specified <a>Environment</a>.
  ///
  /// Parameter [environmentId] :
  /// The identifier of the <a>Environment</a> for which to list valid Attach
  /// Points.
  ///
  /// Parameter [maxResults] :
  /// The max number of list results in a single paginated response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token from a previous paginated response indicating you wish
  /// to get the next page.
  Future<ListAttachPointsResponse> listAttachPoints({
    required String environmentId,
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
      'X-Amz-Target': 'Interconnect.ListAttachPoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAttachPointsResponse.fromJson(jsonResponse.body);
  }

  /// List all current tags on the specified resource. Currently this supports
  /// <a>Connection</a> resources.
  ///
  /// Parameter [arn] :
  /// The resource ARN for which to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Add new tags to the specified resource.
  ///
  /// Parameter [arn] :
  /// The ARN of the resource that should receive the new tags.
  ///
  /// Parameter [tags] :
  /// A map of tags to apply to the specified resource.
  Future<void> tagResource({
    required String arn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'tags': tags,
      },
    );
  }

  /// Removes tags from the specified resource.
  ///
  /// Parameter [arn] :
  /// The ARN of the resource from which the specified tags should be removed.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys that should be removed from the resource.
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Initiates the process to create a Connection across the specified
  /// Environment.
  ///
  /// The Environment dictates the specified partner and location to which the
  /// other end of the connection should attach. You can see a list of the
  /// available Environments by calling <a>ListEnvironments</a>
  ///
  /// The Attach Point specifies where within the AWS Network your connection
  /// will logically connect.
  ///
  /// After a successful call to this method, the resulting <a>Connection</a>
  /// will return an Activation Key which will need to be brought to the
  /// specific partner's portal to confirm the <a>Connection</a> on both sides.
  /// (See <a>Environment$activationPageUrl</a> for a direct link to the partner
  /// portal).
  ///
  /// Parameter [attachPoint] :
  /// The Attach Point to which the connection should be associated."
  ///
  /// Parameter [bandwidth] :
  /// The desired bandwidth of the requested <a>Connection</a>
  ///
  /// Parameter [environmentId] :
  /// The identifier of the <a>Environment</a> across which this
  /// <a>Connection</a> should be created.
  ///
  /// The available <a>Environment</a> objects can be determined using
  /// <a>ListEnvironments</a>.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token used for the request.
  ///
  /// Parameter [description] :
  /// A description to distinguish this <a>Connection</a>.
  ///
  /// Parameter [remoteAccount] :
  /// Account and/or principal identifying information that can be verified by
  /// the partner of this specific Environment.
  ///
  /// Parameter [tags] :
  /// The tag to associate with the resulting <a>Connection</a>.
  Future<CreateConnectionResponse> createConnection({
    required AttachPoint attachPoint,
    required String bandwidth,
    required String environmentId,
    String? clientToken,
    String? description,
    RemoteAccountIdentifier? remoteAccount,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.CreateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'attachPoint': attachPoint,
        'bandwidth': bandwidth,
        'environmentId': environmentId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
        if (remoteAccount != null) 'remoteAccount': remoteAccount,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Describes the current state of a Connection resource as specified by the
  /// identifier.
  ///
  /// Parameter [identifier] :
  /// The identifier of the requested <a>Connection</a>
  Future<GetConnectionResponse> getConnection({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.GetConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );

    return GetConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Modifies an existing connection. Currently we support modifications to the
  /// connection's description and/or bandwidth.
  ///
  /// Parameter [identifier] :
  /// The identifier of the <a>Connection</a> that should be updated.
  ///
  /// Parameter [bandwidth] :
  /// Request a new bandwidth size on the given <a>Connection</a>.
  ///
  /// Note that changes to the size may be subject to additional policy, and
  /// does require the remote partner provider to acknowledge and permit this
  /// new bandwidth size.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token used for the request.
  ///
  /// Parameter [description] :
  /// An updated description to apply to the <a>Connection</a>
  Future<UpdateConnectionResponse> updateConnection({
    required String identifier,
    String? bandwidth,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.UpdateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
        if (bandwidth != null) 'bandwidth': bandwidth,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return UpdateConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing Connection with the supplied identifier.
  ///
  /// This operation will also inform the remote partner of your intention to
  /// delete your connection. Note, the partner may still require you to delete
  /// to fully clean up resources, but the network connectivity provided by the
  /// <a>Connection</a> will cease to exist.
  ///
  /// Parameter [identifier] :
  /// The identifier of the <a>Connection</a> to be deleted.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token used for the request.
  Future<DeleteConnectionResponse> deleteConnection({
    required String identifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.DeleteConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Lists all connection objects to which the caller has access.
  ///
  /// Allows for optional filtering by the following properties:
  ///
  /// <ul>
  /// <li>
  /// <code>state</code>
  /// </li>
  /// <li>
  /// <code>environmentId</code>
  /// </li>
  /// <li>
  /// <code>provider</code>
  /// </li>
  /// <li>
  /// <code>attach point</code>
  /// </li>
  /// </ul>
  /// Only <a>Connection</a> objects matching all filters will be returned.
  ///
  /// Parameter [attachPoint] :
  /// Filter results to only include <a>Connection</a> objects attached to the
  /// given <a>AttachPoint</a>.
  ///
  /// Parameter [environmentId] :
  /// Filter the results to only include <a>Connection</a> objects on the given
  /// <a>Environment</a>.
  ///
  /// Parameter [maxResults] :
  /// The max number of list results in a single paginated response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token from a previous paginated response indicating you wish
  /// to get the next page of results.
  ///
  /// Parameter [provider] :
  /// Filter the results to only include <a>Connection</a> objects to the given
  /// <a>Provider</a>.
  ///
  /// Parameter [state] :
  /// Filter the results to only include <a>Connection</a> objects in the given
  /// <a>Connection$state</a>.
  Future<ListConnectionsResponse> listConnections({
    AttachPoint? attachPoint,
    String? environmentId,
    int? maxResults,
    String? nextToken,
    Provider? provider,
    ConnectionState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.ListConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (attachPoint != null) 'attachPoint': attachPoint,
        if (environmentId != null) 'environmentId': environmentId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (provider != null) 'provider': provider,
        if (state != null) 'state': state.value,
      },
    );

    return ListConnectionsResponse.fromJson(jsonResponse.body);
  }

  /// Describes a specific <a>Environment</a>
  ///
  /// Parameter [id] :
  /// The identifier of the specific <a>Environment</a> to describe.
  Future<GetEnvironmentResponse> getEnvironment({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.GetEnvironment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );

    return GetEnvironmentResponse.fromJson(jsonResponse.body);
  }

  /// Lists all of the environments that can produce connections that will land
  /// in the called AWS region.
  ///
  /// Parameter [location] :
  /// Filter results to only include <a>Environment</a> objects that connect to
  /// a given location distiguisher.
  ///
  /// Parameter [maxResults] :
  /// The max number of list results in a single paginated response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token from a previous paginated response indicating you wish
  /// to get the next page of results.
  ///
  /// Parameter [provider] :
  /// Filter results to only include <a>Environment</a> objects that connect to
  /// the <a>Provider</a>.
  Future<ListEnvironmentsResponse> listEnvironments({
    String? location,
    int? maxResults,
    String? nextToken,
    Provider? provider,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Interconnect.ListEnvironments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (location != null) 'location': location,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (provider != null) 'provider': provider,
      },
    );

    return ListEnvironmentsResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class AcceptConnectionProposalResponse {
  /// The created <a>Connection</a> object.
  final Connection? connection;

  AcceptConnectionProposalResponse({
    this.connection,
  });

  factory AcceptConnectionProposalResponse.fromJson(Map<String, dynamic> json) {
    return AcceptConnectionProposalResponse(
      connection: json['connection'] != null
          ? Connection.fromJson(json['connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'connection': connection,
    };
  }
}

/// @nodoc
class DescribeConnectionProposalResponse {
  /// The bandwidth of the proposed <a>Connection</a>.
  final String bandwidth;

  /// The identifier of the <a>Environment</a> upon which the <a>Connection</a>
  /// would be placed if this proposal were accepted.
  final String environmentId;

  /// The partner specific location distinguisher of the specific
  /// <a>Environment</a> of the proposal.
  final String location;

  /// The partner provider of the specific <a>Environment</a> of the proposal.
  final Provider provider;

  DescribeConnectionProposalResponse({
    required this.bandwidth,
    required this.environmentId,
    required this.location,
    required this.provider,
  });

  factory DescribeConnectionProposalResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConnectionProposalResponse(
      bandwidth: (json['bandwidth'] as String?) ?? '',
      environmentId: (json['environmentId'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      provider: Provider.fromJson((json['provider'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidth = this.bandwidth;
    final environmentId = this.environmentId;
    final location = this.location;
    final provider = this.provider;
    return {
      'bandwidth': bandwidth,
      'environmentId': environmentId,
      'location': location,
      'provider': provider,
    };
  }
}

/// @nodoc
class ListAttachPointsResponse {
  /// The valid <a>AttachPoint</a>
  final List<AttachPointDescriptor> attachPoints;

  /// A pagination token indicating that there are more results that can be
  /// fetched.
  final String? nextToken;

  ListAttachPointsResponse({
    required this.attachPoints,
    this.nextToken,
  });

  factory ListAttachPointsResponse.fromJson(Map<String, dynamic> json) {
    return ListAttachPointsResponse(
      attachPoints: ((json['attachPoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => AttachPointDescriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachPoints = this.attachPoints;
    final nextToken = this.nextToken;
    return {
      'attachPoints': attachPoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags on the specified ARN.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
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
class CreateConnectionResponse {
  /// The resulting <a>Connection</a>.
  final Connection? connection;

  CreateConnectionResponse({
    this.connection,
  });

  factory CreateConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectionResponse(
      connection: json['connection'] != null
          ? Connection.fromJson(json['connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'connection': connection,
    };
  }
}

/// @nodoc
class GetConnectionResponse {
  /// The existing <a>Connection</a> resource.
  final Connection? connection;

  GetConnectionResponse({
    this.connection,
  });

  factory GetConnectionResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionResponse(
      connection: json['connection'] != null
          ? Connection.fromJson(json['connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'connection': connection,
    };
  }
}

/// @nodoc
class UpdateConnectionResponse {
  /// The resulting updated <a>Connection</a>
  final Connection? connection;

  UpdateConnectionResponse({
    this.connection,
  });

  factory UpdateConnectionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectionResponse(
      connection: json['connection'] != null
          ? Connection.fromJson(json['connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'connection': connection,
    };
  }
}

/// @nodoc
class DeleteConnectionResponse {
  /// The <a>Connection</a> object that has been marked for deletion.
  final Connection connection;

  DeleteConnectionResponse({
    required this.connection,
  });

  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConnectionResponse(
      connection: Connection.fromJson(
          (json['connection'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// @nodoc
class ListConnectionsResponse {
  /// The resulting list of <a>Connection</a> objects.
  final List<ConnectionSummary>? connections;

  /// A pagination token for use in subsequent calls to fetch the next page of
  /// results.
  final String? nextToken;

  ListConnectionsResponse({
    this.connections,
    this.nextToken,
  });

  factory ListConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectionsResponse(
      connections: (json['connections'] as List?)
          ?.nonNulls
          .map((e) => ConnectionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final nextToken = this.nextToken;
    return {
      if (connections != null) 'connections': connections,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetEnvironmentResponse {
  /// The requested <a>Environment</a> structure.
  final Environment environment;

  GetEnvironmentResponse({
    required this.environment,
  });

  factory GetEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentResponse(
      environment: Environment.fromJson(
          (json['environment'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      'environment': environment,
    };
  }
}

/// @nodoc
class ListEnvironmentsResponse {
  /// The list of matching <a>Environment</a> objects.
  final List<Environment> environments;

  /// A pagination token for use in subsequent calls to fetch the next page of
  /// results.
  final String? nextToken;

  ListEnvironmentsResponse({
    required this.environments,
    this.nextToken,
  });

  factory ListEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsResponse(
      environments: ((json['environments'] as List?) ?? const [])
          .nonNulls
          .map((e) => Environment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      'environments': environments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Defines the logical topology that an AWS Interconnect Connection is created
/// upon.
///
/// Specifically, an Environment defines the partner The remote Cloud Service
/// Provider of this resource. or The remote Last Mile Provider of this
/// resource. and the region or location specification to which an AWS
/// Interconnect Connection can be made.
///
/// @nodoc
class Environment {
  /// The sets of bandwidths that are available and supported on this environment.
  final Bandwidths bandwidths;

  /// The identifier of this <a>Environment</a>
  final String environmentId;

  /// The provider specific location on the remote side of this <a>Connection</a>.
  final String location;

  /// The provider on the remote side of this <a>Connection</a>.
  final Provider provider;

  /// The state of the <a>Environment</a>. Possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>available</code>: The environment is available and new
  /// <a>Connection</a> objects can be requested.
  /// </li>
  /// <li>
  /// <code>limited</code>: The environment is available, but overall capacity is
  /// limited. The set of available bandwidths
  /// </li>
  /// <li>
  /// <code>unavailable</code>: The environment is currently unavailable.
  /// </li>
  /// </ul>
  final EnvironmentState state;

  /// The specific product type of <a>Connection</a> objects provided by this
  /// <a>Environment</a>.
  final String type;

  /// An HTTPS URL on the remote partner portal where the Activation Key should be
  /// brought to complete the creation process.
  final String? activationPageUrl;

  /// The type of identifying information that should be supplied to the
  /// <code>remoteAccount</code> parameter of a <a>CreateConnection</a> call for
  /// this specific Environment.
  final RemoteAccountIdentifierType? remoteIdentifierType;

  Environment({
    required this.bandwidths,
    required this.environmentId,
    required this.location,
    required this.provider,
    required this.state,
    required this.type,
    this.activationPageUrl,
    this.remoteIdentifierType,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      bandwidths: Bandwidths.fromJson(
          (json['bandwidths'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      environmentId: (json['environmentId'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      provider: Provider.fromJson((json['provider'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      state: EnvironmentState.fromString((json['state'] as String?) ?? ''),
      type: (json['type'] as String?) ?? '',
      activationPageUrl: json['activationPageUrl'] as String?,
      remoteIdentifierType: (json['remoteIdentifierType'] as String?)
          ?.let(RemoteAccountIdentifierType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidths = this.bandwidths;
    final environmentId = this.environmentId;
    final location = this.location;
    final provider = this.provider;
    final state = this.state;
    final type = this.type;
    final activationPageUrl = this.activationPageUrl;
    final remoteIdentifierType = this.remoteIdentifierType;
    return {
      'bandwidths': bandwidths,
      'environmentId': environmentId,
      'location': location,
      'provider': provider,
      'state': state.value,
      'type': type,
      if (activationPageUrl != null) 'activationPageUrl': activationPageUrl,
      if (remoteIdentifierType != null)
        'remoteIdentifierType': remoteIdentifierType.value,
    };
  }
}

/// Describes the respective AWS Interconnect Partner organization.
///
/// @nodoc
class Provider {
  /// The provider's name. Specifically, connections to/from this Cloud Service
  /// Provider will be considered Multicloud connections.
  final String? cloudServiceProvider;

  /// The provider's name. Specifically, connections to/from this Last Mile
  /// Provider will be considered LastMile connections.
  final String? lastMileProvider;

  Provider({
    this.cloudServiceProvider,
    this.lastMileProvider,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      cloudServiceProvider: json['cloudServiceProvider'] as String?,
      lastMileProvider: json['lastMileProvider'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudServiceProvider = this.cloudServiceProvider;
    final lastMileProvider = this.lastMileProvider;
    return {
      if (cloudServiceProvider != null)
        'cloudServiceProvider': cloudServiceProvider,
      if (lastMileProvider != null) 'lastMileProvider': lastMileProvider,
    };
  }
}

/// @nodoc
class EnvironmentState {
  static const available = EnvironmentState._('available');
  static const limited = EnvironmentState._('limited');
  static const unavailable = EnvironmentState._('unavailable');

  final String value;

  const EnvironmentState._(this.value);

  static const values = [available, limited, unavailable];

  static EnvironmentState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EnvironmentState._(value));

  @override
  bool operator ==(other) => other is EnvironmentState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the details about the available and supported bandwidths.
///
/// @nodoc
class Bandwidths {
  /// The list of currently available bandwidths.
  final List<String>? available;

  /// The list of all bandwidths that this environment plans to support
  final List<String>? supported;

  Bandwidths({
    this.available,
    this.supported,
  });

  factory Bandwidths.fromJson(Map<String, dynamic> json) {
    return Bandwidths(
      available: (json['available'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      supported: (json['supported'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final available = this.available;
    final supported = this.supported;
    return {
      if (available != null) 'available': available,
      if (supported != null) 'supported': supported,
    };
  }
}

/// @nodoc
class RemoteAccountIdentifierType {
  static const account = RemoteAccountIdentifierType._('account');
  static const email = RemoteAccountIdentifierType._('email');

  final String value;

  const RemoteAccountIdentifierType._(this.value);

  static const values = [account, email];

  static RemoteAccountIdentifierType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RemoteAccountIdentifierType._(value));

  @override
  bool operator ==(other) =>
      other is RemoteAccountIdentifierType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summarized view of a Connection object.
///
/// @nodoc
class ConnectionSummary {
  /// The ARN of the <a>Connection</a>
  final String arn;

  /// The Attach Point to which the connection should be associated.
  final AttachPoint attachPoint;

  /// The bandwidth of the <a>Connection</a>
  final String bandwidth;

  /// A descriptive name of the <a>Connection</a>
  final String description;

  /// The <a>Environment</a> that this <a>Connection</a> is created on.
  final String environmentId;

  /// The identifier of the requested <a>Connection</a>
  final String id;

  /// The provider specific location at the remote end of this <a>Connection</a>
  final String location;

  /// The provider on the remote end of this <a>Connection</a>
  final Provider provider;

  /// An identifier used by both AWS and the remote partner to identify the
  /// specific connection.
  final String sharedId;

  /// <ul>
  /// <li>
  /// <code>requested</code>: The initial state of a connection. The state will
  /// remain here until the Connection is accepted on the Partner portal.
  /// </li>
  /// <li>
  /// <code>pending</code>: The connection has been accepted and is being
  /// provisioned between AWS and the Partner.
  /// </li>
  /// <li>
  /// <code>available</code>: The connection has been fully provisioned between
  /// AWS and the Partner.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The connection is being deleted.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The connection has been deleted.
  /// </li>
  /// <li>
  /// <code>failed</code>: The connection has failed to be created.
  /// </li>
  /// <li>
  /// <code>updating</code>: The connection is being updated.
  /// </li>
  /// </ul>
  final ConnectionState state;

  /// The product variant supplied by this resource.
  final String type;

  /// The billing tier this connection is currently assigned.
  final int? billingTier;

  ConnectionSummary({
    required this.arn,
    required this.attachPoint,
    required this.bandwidth,
    required this.description,
    required this.environmentId,
    required this.id,
    required this.location,
    required this.provider,
    required this.sharedId,
    required this.state,
    required this.type,
    this.billingTier,
  });

  factory ConnectionSummary.fromJson(Map<String, dynamic> json) {
    return ConnectionSummary(
      arn: (json['arn'] as String?) ?? '',
      attachPoint: AttachPoint.fromJson(
          (json['attachPoint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      bandwidth: (json['bandwidth'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      environmentId: (json['environmentId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      provider: Provider.fromJson((json['provider'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      sharedId: (json['sharedId'] as String?) ?? '',
      state: ConnectionState.fromString((json['state'] as String?) ?? ''),
      type: (json['type'] as String?) ?? '',
      billingTier: json['billingTier'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attachPoint = this.attachPoint;
    final bandwidth = this.bandwidth;
    final description = this.description;
    final environmentId = this.environmentId;
    final id = this.id;
    final location = this.location;
    final provider = this.provider;
    final sharedId = this.sharedId;
    final state = this.state;
    final type = this.type;
    final billingTier = this.billingTier;
    return {
      'arn': arn,
      'attachPoint': attachPoint,
      'bandwidth': bandwidth,
      'description': description,
      'environmentId': environmentId,
      'id': id,
      'location': location,
      'provider': provider,
      'sharedId': sharedId,
      'state': state.value,
      'type': type,
      if (billingTier != null) 'billingTier': billingTier,
    };
  }
}

/// Identifies an attach point to use with a Connection.
///
/// @nodoc
class AttachPoint {
  /// Identifies an attach point by full ARN.
  final String? arn;

  /// Identifies an DirectConnect Gateway attach point by DirectConnectGatewayID.
  final String? directConnectGateway;

  AttachPoint({
    this.arn,
    this.directConnectGateway,
  });

  factory AttachPoint.fromJson(Map<String, dynamic> json) {
    return AttachPoint(
      arn: json['arn'] as String?,
      directConnectGateway: json['directConnectGateway'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final directConnectGateway = this.directConnectGateway;
    return {
      if (arn != null) 'arn': arn,
      if (directConnectGateway != null)
        'directConnectGateway': directConnectGateway,
    };
  }
}

/// @nodoc
class ConnectionState {
  static const available = ConnectionState._('available');
  static const requested = ConnectionState._('requested');
  static const pending = ConnectionState._('pending');
  static const down = ConnectionState._('down');
  static const deleting = ConnectionState._('deleting');
  static const deleted = ConnectionState._('deleted');
  static const failed = ConnectionState._('failed');
  static const updating = ConnectionState._('updating');

  final String value;

  const ConnectionState._(this.value);

  static const values = [
    available,
    requested,
    pending,
    down,
    deleting,
    deleted,
    failed,
    updating
  ];

  static ConnectionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionState._(value));

  @override
  bool operator ==(other) => other is ConnectionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The object describing the provided connectivity from the AWS region to the
/// partner location.
///
/// @nodoc
class Connection {
  /// The Activation Key associated to this connection.
  final String activationKey;

  /// An ARN of a <a>Connection</a> object.
  final String arn;

  /// The Attach Point to which the connection should be associated."
  final AttachPoint attachPoint;

  /// The specific selected bandwidth of this connection.
  final String bandwidth;

  /// A descriptive name for the connection.
  final String description;

  /// The specific <a>Environment</a> this connection is placed upon.
  final String environmentId;

  /// The short identifier of the connection object.
  final String id;

  /// The provider specific location on the remote side of this <a>Connection</a>
  final String location;

  /// The account that owns this <a>Connection</a>
  final String ownerAccount;

  /// The provider on the remote side of this <a>Connection</a>.
  final Provider provider;

  /// An identifier used by both AWS and the remote partner to identify the
  /// specific connection.
  final String sharedId;

  /// <ul>
  /// <li>
  /// <code>requested</code>: The initial state of a connection. The state will
  /// remain here until the Connection is accepted on the Partner portal.
  /// </li>
  /// <li>
  /// <code>pending</code>: The connection has been accepted and is being
  /// provisioned between AWS and the Partner.
  /// </li>
  /// <li>
  /// <code>available</code>: The connection has been fully provisioned between
  /// AWS and the Partner.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The connection is being deleted.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The connection has been deleted.
  /// </li>
  /// <li>
  /// <code>failed</code>: The connection has failed to be created.
  /// </li>
  /// <li>
  /// <code>updating</code>: The connection is being updated.
  /// </li>
  /// </ul>
  final ConnectionState state;

  /// The specific product type of this <a>Connection</a>.
  final String type;

  /// The billing tier this connection is currently assigned.
  final int? billingTier;

  /// The tags on the <a>Connection</a>
  final Map<String, String>? tags;

  Connection({
    required this.activationKey,
    required this.arn,
    required this.attachPoint,
    required this.bandwidth,
    required this.description,
    required this.environmentId,
    required this.id,
    required this.location,
    required this.ownerAccount,
    required this.provider,
    required this.sharedId,
    required this.state,
    required this.type,
    this.billingTier,
    this.tags,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      activationKey: (json['activationKey'] as String?) ?? '',
      arn: (json['arn'] as String?) ?? '',
      attachPoint: AttachPoint.fromJson(
          (json['attachPoint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      bandwidth: (json['bandwidth'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      environmentId: (json['environmentId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      ownerAccount: (json['ownerAccount'] as String?) ?? '',
      provider: Provider.fromJson((json['provider'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      sharedId: (json['sharedId'] as String?) ?? '',
      state: ConnectionState.fromString((json['state'] as String?) ?? ''),
      type: (json['type'] as String?) ?? '',
      billingTier: json['billingTier'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final activationKey = this.activationKey;
    final arn = this.arn;
    final attachPoint = this.attachPoint;
    final bandwidth = this.bandwidth;
    final description = this.description;
    final environmentId = this.environmentId;
    final id = this.id;
    final location = this.location;
    final ownerAccount = this.ownerAccount;
    final provider = this.provider;
    final sharedId = this.sharedId;
    final state = this.state;
    final type = this.type;
    final billingTier = this.billingTier;
    final tags = this.tags;
    return {
      'activationKey': activationKey,
      'arn': arn,
      'attachPoint': attachPoint,
      'bandwidth': bandwidth,
      'description': description,
      'environmentId': environmentId,
      'id': id,
      'location': location,
      'ownerAccount': ownerAccount,
      'provider': provider,
      'sharedId': sharedId,
      'state': state.value,
      'type': type,
      if (billingTier != null) 'billingTier': billingTier,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The types of identifiers that may be needed for remote account
/// specification.
///
/// @nodoc
class RemoteAccountIdentifier {
  /// A generic bit of identifying information. Can be used in place of any of the
  /// more specific types.
  final String? identifier;

  RemoteAccountIdentifier({
    this.identifier,
  });

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      if (identifier != null) 'identifier': identifier,
    };
  }
}

/// Describes a possible Attach Point for a Connection.
///
/// @nodoc
class AttachPointDescriptor {
  /// The identifier for the specific type of the AttachPoint.
  final String identifier;

  /// The descriptive name of the identifier attach point.
  final String name;

  /// The type of this AttachPoint, which will dictate the syntax of the
  /// identifier.
  ///
  /// Current types include:
  ///
  /// <ul>
  /// <li>
  /// ARN
  /// </li>
  /// <li>
  /// DirectConnect Gateway
  /// </li>
  /// </ul>
  final AttachPointType type;

  AttachPointDescriptor({
    required this.identifier,
    required this.name,
    required this.type,
  });

  factory AttachPointDescriptor.fromJson(Map<String, dynamic> json) {
    return AttachPointDescriptor(
      identifier: (json['identifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      type: AttachPointType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final name = this.name;
    final type = this.type;
    return {
      'identifier': identifier,
      'name': name,
      'type': type.value,
    };
  }
}

/// @nodoc
class AttachPointType {
  static const directConnectGateway = AttachPointType._('DirectConnectGateway');

  final String value;

  const AttachPointType._(this.value);

  static const values = [directConnectGateway];

  static AttachPointType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttachPointType._(value));

  @override
  bool operator ==(other) => other is AttachPointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
