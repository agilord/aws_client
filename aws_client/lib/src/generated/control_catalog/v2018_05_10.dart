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

/// Welcome to the Amazon Web Services Control Catalog API reference. This guide
/// is for developers who need detailed information about how to
/// programmatically identify and filter the common controls and related
/// metadata that are available to Amazon Web Services customers. This API
/// reference provides descriptions, syntax, and usage examples for each of the
/// actions and data types that are supported by Amazon Web Services Control
/// Catalog.
///
/// Use the following links to get started with the Amazon Web Services Control
/// Catalog API:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controlcatalog/latest/APIReference/API_Operations.html">Actions</a>:
/// An alphabetical list of all Control Catalog API operations.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controlcatalog/latest/APIReference/API_Types.html">Data
/// types</a>: An alphabetical list of all Control Catalog data types.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controlcatalog/latest/APIReference/CommonParameters.html">Common
/// parameters</a>: Parameters that all operations can use.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/controlcatalog/latest/APIReference/CommonErrors.html">Common
/// errors</a>: Client and server errors that all operations can return.
/// </li>
/// </ul>
class ControlCatalog {
  final _s.RestJsonProtocol _protocol;
  ControlCatalog({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'controlcatalog',
            signingName: 'controlcatalog',
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

  /// Returns a paginated list of common controls from the Amazon Web Services
  /// Control Catalog.
  ///
  /// You can apply an optional filter to see common controls that have a
  /// specific objective. If you don’t provide a filter, the operation returns
  /// all common controls.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [commonControlFilter] :
  /// An optional filter that narrows the results to a specific objective.
  ///
  /// This filter allows you to specify one objective ARN at a time. Passing
  /// multiple ARNs in the <code>CommonControlFilter</code> isn’t currently
  /// supported.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results on a page or for an API request call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListCommonControlsResponse> listCommonControls({
    CommonControlFilter? commonControlFilter,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (commonControlFilter != null)
        'CommonControlFilter': commonControlFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/common-controls',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCommonControlsResponse.fromJson(response);
  }

  /// Returns a paginated list of domains from the Amazon Web Services Control
  /// Catalog.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results on a page or for an API request call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListDomainsResponse> listDomains({
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsResponse.fromJson(response);
  }

  /// Returns a paginated list of objectives from the Amazon Web Services
  /// Control Catalog.
  ///
  /// You can apply an optional filter to see the objectives that belong to a
  /// specific domain. If you don’t provide a filter, the operation returns all
  /// objectives.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results on a page or for an API request call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  ///
  /// Parameter [objectiveFilter] :
  /// An optional filter that narrows the results to a specific domain.
  ///
  /// This filter allows you to specify one domain ARN at a time. Passing
  /// multiple ARNs in the <code>ObjectiveFilter</code> isn’t currently
  /// supported.
  Future<ListObjectivesResponse> listObjectives({
    int? maxResults,
    String? nextToken,
    ObjectiveFilter? objectiveFilter,
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
    };
    final $payload = <String, dynamic>{
      if (objectiveFilter != null) 'ObjectiveFilter': objectiveFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/objectives',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectivesResponse.fromJson(response);
  }
}

/// A summary of the domain that a common control or an objective belongs to.
class AssociatedDomainSummary {
  /// The Amazon Resource Name (ARN) of the related domain.
  final String? arn;

  /// The name of the related domain.
  final String? name;

  AssociatedDomainSummary({
    this.arn,
    this.name,
  });

  factory AssociatedDomainSummary.fromJson(Map<String, dynamic> json) {
    return AssociatedDomainSummary(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

/// A summary of the objective that a common control supports.
class AssociatedObjectiveSummary {
  /// The Amazon Resource Name (ARN) of the related objective.
  final String? arn;

  /// The name of the related objective.
  final String? name;

  AssociatedObjectiveSummary({
    this.arn,
    this.name,
  });

  factory AssociatedObjectiveSummary.fromJson(Map<String, dynamic> json) {
    return AssociatedObjectiveSummary(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

/// An optional filter that narrows the results to a specific objective.
class CommonControlFilter {
  /// The objective that's used as filter criteria.
  ///
  /// You can use this parameter to specify one objective ARN at a time. Passing
  /// multiple ARNs in the <code>CommonControlFilter</code> isn’t currently
  /// supported.
  final List<ObjectiveResourceFilter>? objectives;

  CommonControlFilter({
    this.objectives,
  });

  Map<String, dynamic> toJson() {
    final objectives = this.objectives;
    return {
      if (objectives != null) 'Objectives': objectives,
    };
  }
}

/// A summary of metadata for a common control.
class CommonControlSummary {
  /// The Amazon Resource Name (ARN) that identifies the common control.
  final String arn;

  /// The time when the common control was created.
  final DateTime createTime;

  /// The description of the common control.
  final String description;

  /// The domain that the common control belongs to.
  final AssociatedDomainSummary domain;

  /// The time when the common control was most recently updated.
  final DateTime lastUpdateTime;

  /// The name of the common control.
  final String name;

  /// The objective that the common control belongs to.
  final AssociatedObjectiveSummary objective;

  CommonControlSummary({
    required this.arn,
    required this.createTime,
    required this.description,
    required this.domain,
    required this.lastUpdateTime,
    required this.name,
    required this.objective,
  });

  factory CommonControlSummary.fromJson(Map<String, dynamic> json) {
    return CommonControlSummary(
      arn: json['Arn'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      domain: AssociatedDomainSummary.fromJson(
          json['Domain'] as Map<String, dynamic>),
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['LastUpdateTime'] as Object),
      name: json['Name'] as String,
      objective: AssociatedObjectiveSummary.fromJson(
          json['Objective'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final description = this.description;
    final domain = this.domain;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final objective = this.objective;
    return {
      'Arn': arn,
      'CreateTime': unixTimestampToJson(createTime),
      'Description': description,
      'Domain': domain,
      'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'Name': name,
      'Objective': objective,
    };
  }
}

/// The domain resource that's being used as a filter.
class DomainResourceFilter {
  /// The Amazon Resource Name (ARN) of the domain.
  final String? arn;

  DomainResourceFilter({
    this.arn,
  });

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// A summary of metadata for a domain.
class DomainSummary {
  /// The Amazon Resource Name (ARN) that identifies the domain.
  final String arn;

  /// The time when the domain was created.
  final DateTime createTime;

  /// The description of the domain.
  final String description;

  /// The time when the domain was most recently updated.
  final DateTime lastUpdateTime;

  /// The name of the domain.
  final String name;

  DomainSummary({
    required this.arn,
    required this.createTime,
    required this.description,
    required this.lastUpdateTime,
    required this.name,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      arn: json['Arn'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['LastUpdateTime'] as Object),
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final description = this.description;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    return {
      'Arn': arn,
      'CreateTime': unixTimestampToJson(createTime),
      'Description': description,
      'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'Name': name,
    };
  }
}

class ListCommonControlsResponse {
  /// The list of common controls that the <code>ListCommonControls</code> API
  /// returns.
  final List<CommonControlSummary> commonControls;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListCommonControlsResponse({
    required this.commonControls,
    this.nextToken,
  });

  factory ListCommonControlsResponse.fromJson(Map<String, dynamic> json) {
    return ListCommonControlsResponse(
      commonControls: (json['CommonControls'] as List)
          .whereNotNull()
          .map((e) => CommonControlSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commonControls = this.commonControls;
    final nextToken = this.nextToken;
    return {
      'CommonControls': commonControls,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDomainsResponse {
  /// The list of domains that the <code>ListDomains</code> API returns.
  final List<DomainSummary> domains;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListDomainsResponse({
    required this.domains,
    this.nextToken,
  });

  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainsResponse(
      domains: (json['Domains'] as List)
          .whereNotNull()
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domains = this.domains;
    final nextToken = this.nextToken;
    return {
      'Domains': domains,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListObjectivesResponse {
  /// The list of objectives that the <code>ListObjectives</code> API returns.
  final List<ObjectiveSummary> objectives;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListObjectivesResponse({
    required this.objectives,
    this.nextToken,
  });

  factory ListObjectivesResponse.fromJson(Map<String, dynamic> json) {
    return ListObjectivesResponse(
      objectives: (json['Objectives'] as List)
          .whereNotNull()
          .map((e) => ObjectiveSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectives = this.objectives;
    final nextToken = this.nextToken;
    return {
      'Objectives': objectives,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An optional filter that narrows the list of objectives to a specific domain.
class ObjectiveFilter {
  /// The domain that's used as filter criteria.
  ///
  /// You can use this parameter to specify one domain ARN at a time. Passing
  /// multiple ARNs in the <code>ObjectiveFilter</code> isn’t currently supported.
  final List<DomainResourceFilter>? domains;

  ObjectiveFilter({
    this.domains,
  });

  Map<String, dynamic> toJson() {
    final domains = this.domains;
    return {
      if (domains != null) 'Domains': domains,
    };
  }
}

/// The objective resource that's being used as a filter.
class ObjectiveResourceFilter {
  /// The Amazon Resource Name (ARN) of the objective.
  final String? arn;

  ObjectiveResourceFilter({
    this.arn,
  });

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// A summary of metadata for an objective.
class ObjectiveSummary {
  /// The Amazon Resource Name (ARN) that identifies the objective.
  final String arn;

  /// The time when the objective was created.
  final DateTime createTime;

  /// The description of the objective.
  final String description;

  /// The domain that the objective belongs to.
  final AssociatedDomainSummary domain;

  /// The time when the objective was most recently updated.
  final DateTime lastUpdateTime;

  /// The name of the objective.
  final String name;

  ObjectiveSummary({
    required this.arn,
    required this.createTime,
    required this.description,
    required this.domain,
    required this.lastUpdateTime,
    required this.name,
  });

  factory ObjectiveSummary.fromJson(Map<String, dynamic> json) {
    return ObjectiveSummary(
      arn: json['Arn'] as String,
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      description: json['Description'] as String,
      domain: AssociatedDomainSummary.fromJson(
          json['Domain'] as Map<String, dynamic>),
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['LastUpdateTime'] as Object),
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final description = this.description;
    final domain = this.domain;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    return {
      'Arn': arn,
      'CreateTime': unixTimestampToJson(createTime),
      'Description': description,
      'Domain': domain,
      'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'Name': name,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
