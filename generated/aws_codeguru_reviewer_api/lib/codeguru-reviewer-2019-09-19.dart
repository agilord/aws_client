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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'codeguru-reviewer-2019-09-19.g.dart';

/// This section provides documentation for the Amazon CodeGuru Reviewer API
/// operations.
class CodeGuruReviewer {
  final _s.RestJsonProtocol _protocol;
  CodeGuruReviewer({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeguru-reviewer',
            signingName: 'codeguru-reviewer',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates an AWS CodeCommit repository with Amazon CodeGuru Reviewer.
  /// When you associate an AWS CodeCommit repository with Amazon CodeGuru
  /// Reviewer, Amazon CodeGuru Reviewer will provide recommendations for each
  /// pull request. You can view recommendations in the AWS CodeCommit
  /// repository.
  ///
  /// You can associate a GitHub repository using the Amazon CodeGuru Reviewer
  /// console.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [repository] :
  /// The repository to associate.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// If you want to add a new repository association, this parameter specifies
  /// a unique identifier for the new repository association that helps ensure
  /// idempotency.
  ///
  /// If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes that in the request. If you don't use the SDK and
  /// instead generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a ClientRequestToken yourself for new
  /// versions and include that value in the request.
  ///
  /// You typically only need to interact with this value if you implement your
  /// own retry logic and want to ensure that a given repository association is
  /// not created twice. We recommend that you generate a UUID-type value to
  /// ensure uniqueness within the specified repository association.
  ///
  /// Amazon CodeGuru Reviewer uses this value to prevent the accidental
  /// creation of duplicate repository associations if there are failures and
  /// retries.
  Future<AssociateRepositoryResponse> associateRepository({
    @_s.required Repository repository,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w-]+$''',
    );
    final $payload = <String, dynamic>{
      'Repository': repository,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associations',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateRepositoryResponse.fromJson(response);
  }

  /// Describes a repository association.
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationArn] :
  /// The Amazon Resource Name (ARN) identifying the association.
  Future<DescribeRepositoryAssociationResponse> describeRepositoryAssociation({
    @_s.required String associationArn,
  }) async {
    ArgumentError.checkNotNull(associationArn, 'associationArn');
    _s.validateStringLength(
      'associationArn',
      associationArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'associationArn',
      associationArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:[a-z]+:[\w-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/associations/${Uri.encodeComponent(associationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRepositoryAssociationResponse.fromJson(response);
  }

  /// Removes the association between Amazon CodeGuru Reviewer and a repository.
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationArn] :
  /// The Amazon Resource Name (ARN) identifying the association.
  Future<DisassociateRepositoryResponse> disassociateRepository({
    @_s.required String associationArn,
  }) async {
    ArgumentError.checkNotNull(associationArn, 'associationArn');
    _s.validateStringLength(
      'associationArn',
      associationArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'associationArn',
      associationArn,
      r'''^arn:aws[^:\s]*:codeguru-reviewer:[^:\s]+:[\d]{12}:[a-z]+:[\w-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/associations/${Uri.encodeComponent(associationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateRepositoryResponse.fromJson(response);
  }

  /// Lists repository associations. You can optionally filter on one or more of
  /// the following recommendation properties: provider types, states, names,
  /// and owners.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository association results returned by
  /// <code>ListRepositoryAssociations</code> in paginated output. When this
  /// parameter is used, <code>ListRepositoryAssociations</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListRepositoryAssociations</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListRepositoryAssociations</code>
  /// returns up to 100 results and a <code>nextToken</code> value if
  /// applicable.
  ///
  /// Parameter [names] :
  /// List of names to use as a filter.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListRepositoryAssociations</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [owners] :
  /// List of owners to use as a filter. For AWS CodeCommit, the owner is the
  /// AWS account id. For GitHub, it is the GitHub account name.
  ///
  /// Parameter [providerTypes] :
  /// List of provider types to use as a filter.
  ///
  /// Parameter [states] :
  /// List of states to use as a filter.
  Future<ListRepositoryAssociationsResponse> listRepositoryAssociations({
    int maxResults,
    List<String> names,
    String nextToken,
    List<String> owners,
    List<ProviderType> providerTypes,
    List<RepositoryAssociationState> states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (names != null) 'Name': names,
      if (nextToken != null) 'NextToken': [nextToken],
      if (owners != null) 'Owner': owners,
      if (providerTypes != null)
        'ProviderType': providerTypes.map((e) => e?.toValue() ?? '').toList(),
      if (states != null)
        'State': states.map((e) => e?.toValue() ?? '').toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRepositoryAssociationsResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateRepositoryResponse {
  /// Information about the repository association.
  @_s.JsonKey(name: 'RepositoryAssociation')
  final RepositoryAssociation repositoryAssociation;

  AssociateRepositoryResponse({
    this.repositoryAssociation,
  });
  factory AssociateRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateRepositoryResponseFromJson(json);
}

/// Information about an AWS CodeCommit repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CodeCommitRepository {
  /// The name of the AWS CodeCommit repository.
  @_s.JsonKey(name: 'Name')
  final String name;

  CodeCommitRepository({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$CodeCommitRepositoryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRepositoryAssociationResponse {
  /// Information about the repository association.
  @_s.JsonKey(name: 'RepositoryAssociation')
  final RepositoryAssociation repositoryAssociation;

  DescribeRepositoryAssociationResponse({
    this.repositoryAssociation,
  });
  factory DescribeRepositoryAssociationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRepositoryAssociationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateRepositoryResponse {
  /// Information about the disassociated repository.
  @_s.JsonKey(name: 'RepositoryAssociation')
  final RepositoryAssociation repositoryAssociation;

  DisassociateRepositoryResponse({
    this.repositoryAssociation,
  });
  factory DisassociateRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateRepositoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRepositoryAssociationsResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListRecommendations</code> request. When the results of a
  /// <code>ListRecommendations</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of repository associations that meet the criteria of the request.
  @_s.JsonKey(name: 'RepositoryAssociationSummaries')
  final List<RepositoryAssociationSummary> repositoryAssociationSummaries;

  ListRepositoryAssociationsResponse({
    this.nextToken,
    this.repositoryAssociationSummaries,
  });
  factory ListRepositoryAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListRepositoryAssociationsResponseFromJson(json);
}

enum ProviderType {
  @_s.JsonValue('CodeCommit')
  codeCommit,
  @_s.JsonValue('GitHub')
  gitHub,
}

extension on ProviderType {
  String toValue() {
    switch (this) {
      case ProviderType.codeCommit:
        return 'CodeCommit';
      case ProviderType.gitHub:
        return 'GitHub';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Repository {
  /// Information about an AWS CodeCommit repository.
  @_s.JsonKey(name: 'CodeCommit')
  final CodeCommitRepository codeCommit;

  Repository({
    this.codeCommit,
  });
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}

/// Information about a repository association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RepositoryAssociation {
  /// The Amazon Resource Name (ARN) identifying the repository association.
  @_s.JsonKey(name: 'AssociationArn')
  final String associationArn;

  /// The id of the repository association.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The time, in milliseconds since the epoch, when the repository association
  /// was created.
  @_s.JsonKey(
      name: 'CreatedTimeStamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTimeStamp;

  /// The time, in milliseconds since the epoch, when the repository association
  /// was last updated.
  @_s.JsonKey(
      name: 'LastUpdatedTimeStamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTimeStamp;

  /// The name of the repository.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the repository.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The provider type of the repository association.
  @_s.JsonKey(name: 'ProviderType')
  final ProviderType providerType;

  /// The state of the repository association.
  @_s.JsonKey(name: 'State')
  final RepositoryAssociationState state;

  /// A description of why the repository association is in the current state.
  @_s.JsonKey(name: 'StateReason')
  final String stateReason;

  RepositoryAssociation({
    this.associationArn,
    this.associationId,
    this.createdTimeStamp,
    this.lastUpdatedTimeStamp,
    this.name,
    this.owner,
    this.providerType,
    this.state,
    this.stateReason,
  });
  factory RepositoryAssociation.fromJson(Map<String, dynamic> json) =>
      _$RepositoryAssociationFromJson(json);
}

enum RepositoryAssociationState {
  @_s.JsonValue('Associated')
  associated,
  @_s.JsonValue('Associating')
  associating,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Disassociating')
  disassociating,
}

extension on RepositoryAssociationState {
  String toValue() {
    switch (this) {
      case RepositoryAssociationState.associated:
        return 'Associated';
      case RepositoryAssociationState.associating:
        return 'Associating';
      case RepositoryAssociationState.failed:
        return 'Failed';
      case RepositoryAssociationState.disassociating:
        return 'Disassociating';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a repository association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RepositoryAssociationSummary {
  /// The Amazon Resource Name (ARN) identifying the repository association.
  @_s.JsonKey(name: 'AssociationArn')
  final String associationArn;

  /// The repository association ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The time, in milliseconds since the epoch, since the repository association
  /// was last updated.
  @_s.JsonKey(
      name: 'LastUpdatedTimeStamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTimeStamp;

  /// The name of the repository association.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The owner of the repository association.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// The provider type of the repository association.
  @_s.JsonKey(name: 'ProviderType')
  final ProviderType providerType;

  /// The state of the repository association.
  /// <dl> <dt>Associated</dt> <dd>
  /// Amazon CodeGuru Reviewer is associated with the repository.
  /// </dd> <dt>Associating</dt> <dd>
  /// The association is in progress.
  /// </dd> <dt>Failed</dt> <dd>
  /// The association failed. For more information about troubleshooting (or why
  /// it failed), see [troubleshooting topic].
  /// </dd> <dt>Disassociating</dt> <dd>
  /// Amazon CodeGuru Reviewer is in the process of disassociating with the
  /// repository.
  /// </dd> </dl>
  @_s.JsonKey(name: 'State')
  final RepositoryAssociationState state;

  RepositoryAssociationSummary({
    this.associationArn,
    this.associationId,
    this.lastUpdatedTimeStamp,
    this.name,
    this.owner,
    this.providerType,
    this.state,
  });
  factory RepositoryAssociationSummary.fromJson(Map<String, dynamic> json) =>
      _$RepositoryAssociationSummaryFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
