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

/// Welcome to the Control Catalog API reference. This guide is for developers
/// who need detailed information about how to programmatically identify and
/// filter the common controls and related metadata that are available to Amazon
/// Web Services customers. This API reference provides descriptions, syntax,
/// and usage examples for each of the actions and data types that are supported
/// by Control Catalog.
///
/// Use the following links to get started with the Control Catalog API:
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

  /// Returns a paginated list of control mappings from the Control Catalog.
  /// Control mappings show relationships between controls and other entities,
  /// such as common controls or compliance frameworks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// An optional filter that narrows the results to specific control mappings
  /// based on control ARNs, common control ARNs, or mapping types.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results on a page or for an API request call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListControlMappingsResponse> listControlMappings({
    ControlMappingFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (filter != null) 'Filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-control-mappings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListControlMappingsResponse.fromJson(response);
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
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [commonControlFilter] :
  /// An optional filter that narrows the results to a specific objective.
  ///
  /// This filter allows you to specify one objective ARN at a time. Passing
  /// multiple ARNs in the <code>CommonControlFilter</code> isn’t supported.
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

  /// Returns details about a specific control, most notably a list of Amazon
  /// Web Services Regions where this control is supported. Input a value for
  /// the <i>ControlArn</i> parameter, in ARN form. <code>GetControl</code>
  /// accepts <i>controltower</i> or <i>controlcatalog</i> control ARNs as
  /// input. Returns a <i>controlcatalog</i> ARN format.
  ///
  /// In the API response, controls that have the value <code>GLOBAL</code> in
  /// the <code>Scope</code> field do not show the
  /// <code>DeployableRegions</code> field, because it does not apply. Controls
  /// that have the value <code>REGIONAL</code> in the <code>Scope</code> field
  /// return a value for the <code>DeployableRegions</code> field, as shown in
  /// the example.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [controlArn] :
  /// The Amazon Resource Name (ARN) of the control. It has one of the following
  /// formats:
  ///
  /// <i>Global format</i>
  ///
  /// <code>arn:{PARTITION}:controlcatalog:::control/{CONTROL_CATALOG_OPAQUE_ID}</code>
  ///
  /// <i>Or Regional format</i>
  ///
  /// <code>arn:{PARTITION}:controltower:{REGION}::control/{CONTROL_TOWER_OPAQUE_ID}</code>
  ///
  /// Here is a more general pattern that covers Amazon Web Services Control
  /// Tower and Control Catalog ARNs:
  ///
  /// <code>^arn:(aws(?:[-a-z]*)?):(controlcatalog|controltower):[a-zA-Z0-9-]*::control/[0-9a-zA-Z_\\-]+$</code>
  Future<GetControlResponse> getControl({
    required String controlArn,
  }) async {
    final $payload = <String, dynamic>{
      'ControlArn': controlArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-control',
      exceptionFnMap: _exceptionFns,
    );
    return GetControlResponse.fromJson(response);
  }

  /// Returns a paginated list of all available controls in the Control Catalog
  /// library. Allows you to discover available controls. The list of controls
  /// is given as structures of type <i>controlSummary</i>. The ARN is returned
  /// in the global <i>controlcatalog</i> format, as shown in the examples.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// An optional filter that narrows the results to controls with specific
  /// implementation types or identifiers. If you don't provide a filter, the
  /// operation returns all available controls.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results on a page or for an API request call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListControlsResponse> listControls({
    ControlFilter? filter,
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
      if (filter != null) 'Filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-controls',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListControlsResponse.fromJson(response);
  }

  /// Returns a paginated list of domains from the Control Catalog.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a paginated list of objectives from the Control Catalog.
  ///
  /// You can apply an optional filter to see the objectives that belong to a
  /// specific domain. If you don’t provide a filter, the operation returns all
  /// objectives.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// multiple ARNs in the <code>ObjectiveFilter</code> isn’t supported.
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

class ListControlMappingsResponse {
  /// The list of control mappings that the ListControlMappings API returns.
  final List<ControlMapping> controlMappings;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListControlMappingsResponse({
    required this.controlMappings,
    this.nextToken,
  });

  factory ListControlMappingsResponse.fromJson(Map<String, dynamic> json) {
    return ListControlMappingsResponse(
      controlMappings: ((json['ControlMappings'] as List?) ?? const [])
          .nonNulls
          .map((e) => ControlMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlMappings = this.controlMappings;
    final nextToken = this.nextToken;
    return {
      'ControlMappings': controlMappings,
      if (nextToken != null) 'NextToken': nextToken,
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
      commonControls: ((json['CommonControls'] as List?) ?? const [])
          .nonNulls
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

class GetControlResponse {
  /// The Amazon Resource Name (ARN) of the control.
  final String arn;

  /// A term that identifies the control's functional behavior. One of
  /// <code>Preventive</code>, <code>Detective</code>, <code>Proactive</code>
  final ControlBehavior behavior;

  /// A description of what the control does.
  final String description;

  /// The display name of the control.
  final String name;
  final RegionConfiguration regionConfiguration;

  /// A list of alternative identifiers for the control. These are human-readable
  /// designators, such as <code>SH.S3.1</code>. Several aliases can refer to the
  /// same control across different Amazon Web Services services or compliance
  /// frameworks.
  final List<String>? aliases;

  /// A timestamp that notes the time when the control was released (start of its
  /// life) as a governance capability in Amazon Web Services.
  final DateTime? createTime;

  /// A list of providers whose resources are governed by this control. For
  /// example, a value of <code>AWS</code> indicates that the control governs
  /// Amazon Web Services resources.
  final List<String>? governedProviders;

  /// A list of resource types that are governed by this control. This information
  /// helps you understand which controls can govern certain types of resources,
  /// and conversely, which resources are affected when the control is
  /// implemented. For Amazon Web Services controls, the resources are represented
  /// as CloudFormation resource types. For non-Amazon Web Services controls, the
  /// resources are represented in a provider-specific format. If
  /// <code>GovernedResources</code> cannot be represented by available resource
  /// types, it’s returned as an empty list.
  final List<String>? governedResources;

  /// Returns information about the control, as an
  /// <code>ImplementationDetails</code> object that shows the underlying
  /// implementation type for a control.
  final ImplementationDetails? implementation;

  /// A summary that indicates whether the control requires parameters, accepts
  /// optional parameters, or does not support parameters. Use this field to
  /// determine whether you need to supply parameter values when you enable the
  /// control.
  final ParameterRequirementSummary? parameterRequirementSummary;

  /// Returns an array of <code>ControlParameter</code> objects that specify the
  /// parameters a control supports. An empty list is returned for controls that
  /// don’t support parameters.
  final List<ControlParameter>? parameters;

  /// An enumerated type, with the following possible values:
  final ControlSeverity? severity;

  GetControlResponse({
    required this.arn,
    required this.behavior,
    required this.description,
    required this.name,
    required this.regionConfiguration,
    this.aliases,
    this.createTime,
    this.governedProviders,
    this.governedResources,
    this.implementation,
    this.parameterRequirementSummary,
    this.parameters,
    this.severity,
  });

  factory GetControlResponse.fromJson(Map<String, dynamic> json) {
    return GetControlResponse(
      arn: (json['Arn'] as String?) ?? '',
      behavior: ControlBehavior.fromString((json['Behavior'] as String?) ?? ''),
      description: (json['Description'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      regionConfiguration: RegionConfiguration.fromJson(
          (json['RegionConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      aliases:
          (json['Aliases'] as List?)?.nonNulls.map((e) => e as String).toList(),
      createTime: timeStampFromJson(json['CreateTime']),
      governedProviders: (json['GovernedProviders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      governedResources: (json['GovernedResources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      implementation: json['Implementation'] != null
          ? ImplementationDetails.fromJson(
              json['Implementation'] as Map<String, dynamic>)
          : null,
      parameterRequirementSummary:
          (json['ParameterRequirementSummary'] as String?)
              ?.let(ParameterRequirementSummary.fromString),
      parameters: (json['Parameters'] as List?)
          ?.nonNulls
          .map((e) => ControlParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity: (json['Severity'] as String?)?.let(ControlSeverity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final behavior = this.behavior;
    final description = this.description;
    final name = this.name;
    final regionConfiguration = this.regionConfiguration;
    final aliases = this.aliases;
    final createTime = this.createTime;
    final governedProviders = this.governedProviders;
    final governedResources = this.governedResources;
    final implementation = this.implementation;
    final parameterRequirementSummary = this.parameterRequirementSummary;
    final parameters = this.parameters;
    final severity = this.severity;
    return {
      'Arn': arn,
      'Behavior': behavior.value,
      'Description': description,
      'Name': name,
      'RegionConfiguration': regionConfiguration,
      if (aliases != null) 'Aliases': aliases,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (governedProviders != null) 'GovernedProviders': governedProviders,
      if (governedResources != null) 'GovernedResources': governedResources,
      if (implementation != null) 'Implementation': implementation,
      if (parameterRequirementSummary != null)
        'ParameterRequirementSummary': parameterRequirementSummary.value,
      if (parameters != null) 'Parameters': parameters,
      if (severity != null) 'Severity': severity.value,
    };
  }
}

class ListControlsResponse {
  /// Returns a list of controls, given as structures of type
  /// <i>controlSummary</i>.
  final List<ControlSummary> controls;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListControlsResponse({
    required this.controls,
    this.nextToken,
  });

  factory ListControlsResponse.fromJson(Map<String, dynamic> json) {
    return ListControlsResponse(
      controls: ((json['Controls'] as List?) ?? const [])
          .nonNulls
          .map((e) => ControlSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controls = this.controls;
    final nextToken = this.nextToken;
    return {
      'Controls': controls,
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
      domains: ((json['Domains'] as List?) ?? const [])
          .nonNulls
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
      objectives: ((json['Objectives'] as List?) ?? const [])
          .nonNulls
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
      arn: (json['Arn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      domain: AssociatedDomainSummary.fromJson(
          (json['Domain'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastUpdateTime: nonNullableTimeStampFromJson(json['LastUpdateTime'] ?? 0),
      name: (json['Name'] as String?) ?? '',
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

/// An optional filter that narrows the list of objectives to a specific domain.
class ObjectiveFilter {
  /// The domain that's used as filter criteria.
  ///
  /// You can use this parameter to specify one domain ARN at a time. Passing
  /// multiple ARNs in the <code>ObjectiveFilter</code> isn’t supported.
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
      arn: (json['Arn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      lastUpdateTime: nonNullableTimeStampFromJson(json['LastUpdateTime'] ?? 0),
      name: (json['Name'] as String?) ?? '',
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

/// Overview of information about a control.
class ControlSummary {
  /// The Amazon Resource Name (ARN) of the control.
  final String arn;

  /// A description of the control, as it may appear in the console. Describes the
  /// functionality of the control.
  final String description;

  /// The display name of the control.
  final String name;

  /// A list of alternative identifiers for the control. These are human-readable
  /// designators, such as <code>SH.S3.1</code>. Several aliases can refer to the
  /// same control across different Amazon Web Services services or compliance
  /// frameworks.
  final List<String>? aliases;

  /// An enumerated type, with the following possible values:
  final ControlBehavior? behavior;

  /// A timestamp that notes the time when the control was released (start of its
  /// life) as a governance capability in Amazon Web Services.
  final DateTime? createTime;

  /// A list of providers whose resources are governed by this control. For
  /// example, a value of <code>AWS</code> indicates that the control governs
  /// Amazon Web Services resources.
  final List<String>? governedProviders;

  /// A list of resource types that are governed by this control. This information
  /// helps you understand which controls can govern certain types of resources,
  /// and conversely, which resources are affected when the control is
  /// implemented. For Amazon Web Services controls, the resources are represented
  /// as CloudFormation resource types. For non-Amazon Web Services controls, the
  /// resources are represented in a provider-specific format. If
  /// <code>GovernedResources</code> cannot be represented by available resource
  /// types, it’s returned as an empty list.
  final List<String>? governedResources;

  /// An object of type <code>ImplementationSummary</code> that describes how the
  /// control is implemented.
  final ImplementationSummary? implementation;

  /// A summary that indicates whether the control requires parameters, accepts
  /// optional parameters, or does not support parameters. Use this field to
  /// determine whether you need to supply parameter values when you enable the
  /// control.
  final ParameterRequirementSummary? parameterRequirementSummary;

  /// An enumerated type, with the following possible values:
  final ControlSeverity? severity;

  ControlSummary({
    required this.arn,
    required this.description,
    required this.name,
    this.aliases,
    this.behavior,
    this.createTime,
    this.governedProviders,
    this.governedResources,
    this.implementation,
    this.parameterRequirementSummary,
    this.severity,
  });

  factory ControlSummary.fromJson(Map<String, dynamic> json) {
    return ControlSummary(
      arn: (json['Arn'] as String?) ?? '',
      description: (json['Description'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      aliases:
          (json['Aliases'] as List?)?.nonNulls.map((e) => e as String).toList(),
      behavior: (json['Behavior'] as String?)?.let(ControlBehavior.fromString),
      createTime: timeStampFromJson(json['CreateTime']),
      governedProviders: (json['GovernedProviders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      governedResources: (json['GovernedResources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      implementation: json['Implementation'] != null
          ? ImplementationSummary.fromJson(
              json['Implementation'] as Map<String, dynamic>)
          : null,
      parameterRequirementSummary:
          (json['ParameterRequirementSummary'] as String?)
              ?.let(ParameterRequirementSummary.fromString),
      severity: (json['Severity'] as String?)?.let(ControlSeverity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final name = this.name;
    final aliases = this.aliases;
    final behavior = this.behavior;
    final createTime = this.createTime;
    final governedProviders = this.governedProviders;
    final governedResources = this.governedResources;
    final implementation = this.implementation;
    final parameterRequirementSummary = this.parameterRequirementSummary;
    final severity = this.severity;
    return {
      'Arn': arn,
      'Description': description,
      'Name': name,
      if (aliases != null) 'Aliases': aliases,
      if (behavior != null) 'Behavior': behavior.value,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (governedProviders != null) 'GovernedProviders': governedProviders,
      if (governedResources != null) 'GovernedResources': governedResources,
      if (implementation != null) 'Implementation': implementation,
      if (parameterRequirementSummary != null)
        'ParameterRequirementSummary': parameterRequirementSummary.value,
      if (severity != null) 'Severity': severity.value,
    };
  }
}

class ControlBehavior {
  static const preventive = ControlBehavior._('PREVENTIVE');
  static const proactive = ControlBehavior._('PROACTIVE');
  static const detective = ControlBehavior._('DETECTIVE');

  final String value;

  const ControlBehavior._(this.value);

  static const values = [preventive, proactive, detective];

  static ControlBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ControlBehavior._(value));

  @override
  bool operator ==(other) => other is ControlBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ControlSeverity {
  static const low = ControlSeverity._('LOW');
  static const medium = ControlSeverity._('MEDIUM');
  static const high = ControlSeverity._('HIGH');
  static const critical = ControlSeverity._('CRITICAL');

  final String value;

  const ControlSeverity._(this.value);

  static const values = [low, medium, high, critical];

  static ControlSeverity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ControlSeverity._(value));

  @override
  bool operator ==(other) => other is ControlSeverity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ParameterRequirementSummary {
  static const required = ParameterRequirementSummary._('REQUIRED');
  static const optional = ParameterRequirementSummary._('OPTIONAL');
  static const none = ParameterRequirementSummary._('NONE');

  final String value;

  const ParameterRequirementSummary._(this.value);

  static const values = [required, optional, none];

  static ParameterRequirementSummary fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParameterRequirementSummary._(value));

  @override
  bool operator ==(other) =>
      other is ParameterRequirementSummary && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of how the control is implemented, including the Amazon Web
/// Services service that enforces the control and its service-specific
/// identifier. For example, the value of this field could indicate that the
/// control is implemented as an Amazon Web Services Config Rule or an Amazon
/// Web Services Security Hub control.
class ImplementationSummary {
  /// A string that represents the Amazon Web Services service that implements
  /// this control. For example, a value of <code>AWS::Config::ConfigRule</code>
  /// indicates that the control is implemented by Amazon Web Services Config, and
  /// <code>AWS::SecurityHub::SecurityControl</code> indicates implementation by
  /// Amazon Web Services Security Hub.
  final String type;

  /// The identifier originally assigned by the Amazon Web Services service that
  /// implements the control. For example,
  /// <code>CODEPIPELINE_DEPLOYMENT_COUNT_CHECK</code>.
  final String? identifier;

  ImplementationSummary({
    required this.type,
    this.identifier,
  });

  factory ImplementationSummary.fromJson(Map<String, dynamic> json) {
    return ImplementationSummary(
      type: (json['Type'] as String?) ?? '',
      identifier: json['Identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final identifier = this.identifier;
    return {
      'Type': type,
      if (identifier != null) 'Identifier': identifier,
    };
  }
}

/// A structure that defines filtering criteria for the ListControls operation.
/// You can use this filter to narrow down the list of controls based on their
/// implementation details.
class ControlFilter {
  /// A filter that narrows the results to controls that govern a specific
  /// provider's resources.
  final List<String>? governedProviders;

  /// A filter that narrows the results to controls with specific implementation
  /// types or identifiers. This field allows you to find controls that are
  /// implemented by specific Amazon Web Services services or with specific
  /// service identifiers.
  final ImplementationFilter? implementations;

  ControlFilter({
    this.governedProviders,
    this.implementations,
  });

  Map<String, dynamic> toJson() {
    final governedProviders = this.governedProviders;
    final implementations = this.implementations;
    return {
      if (governedProviders != null) 'GovernedProviders': governedProviders,
      if (implementations != null) 'Implementations': implementations,
    };
  }
}

/// A structure that defines filtering criteria for control implementations. You
/// can use this filter to find controls that are implemented by specific Amazon
/// Web Services services or with specific service identifiers.
class ImplementationFilter {
  /// A list of service-specific identifiers that can serve as filters. For
  /// example, you can filter for controls with specific Amazon Web Services
  /// Config Rule IDs or Security Hub Control IDs.
  final List<String>? identifiers;

  /// A list of implementation types that can serve as filters. For example, you
  /// can filter for controls implemented as Amazon Web Services Config Rules by
  /// specifying AWS::Config::ConfigRule as a type.
  final List<String>? types;

  ImplementationFilter({
    this.identifiers,
    this.types,
  });

  Map<String, dynamic> toJson() {
    final identifiers = this.identifiers;
    final types = this.types;
    return {
      if (identifiers != null) 'Identifiers': identifiers,
      if (types != null) 'Types': types,
    };
  }
}

/// Returns information about the control, including the scope of the control,
/// if enabled, and the Regions in which the control is available for
/// deployment. For more information about scope, see <a
/// href="https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/global-services.html">Global
/// services</a>.
///
/// If you are applying controls through an Amazon Web Services Control Tower
/// landing zone environment, remember that the values returned in the
/// <code>RegionConfiguration</code> API operation are not related to the
/// governed Regions in your landing zone. For example, if you are governing
/// Regions <code>A</code>,<code>B</code>,and <code>C</code> while the control
/// is available in Regions <code>A</code>, <code>B</code>, C<code>,</code> and
/// <code>D</code>, you'd see a response with <code>DeployableRegions</code> of
/// <code>A</code>, <code>B</code>, <code>C</code>, and <code>D</code> for a
/// control with <code>REGIONAL</code> scope, even though you may not intend to
/// deploy the control in Region <code>D</code>, because you do not govern it
/// through your landing zone.
class RegionConfiguration {
  /// The coverage of the control, if deployed. Scope is an enumerated type, with
  /// value <code>Regional</code>, or <code>Global</code>. A control with Global
  /// scope is effective in all Amazon Web Services Regions, regardless of the
  /// Region from which it is enabled, or to which it is deployed. A control
  /// implemented by an SCP is usually Global in scope. A control with Regional
  /// scope has operations that are restricted specifically to the Region from
  /// which it is enabled and to which it is deployed. Controls implemented by
  /// Config rules and CloudFormation hooks usually are Regional in scope.
  /// Security Hub controls usually are Regional in scope.
  final ControlScope scope;

  /// Regions in which the control is available to be deployed.
  final List<String>? deployableRegions;

  RegionConfiguration({
    required this.scope,
    this.deployableRegions,
  });

  factory RegionConfiguration.fromJson(Map<String, dynamic> json) {
    return RegionConfiguration(
      scope: ControlScope.fromString((json['Scope'] as String?) ?? ''),
      deployableRegions: (json['DeployableRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scope = this.scope;
    final deployableRegions = this.deployableRegions;
    return {
      'Scope': scope.value,
      if (deployableRegions != null) 'DeployableRegions': deployableRegions,
    };
  }
}

/// An object that describes the implementation type for a control.
///
/// Our <code>ImplementationDetails</code> <code>Type</code> format has three
/// required segments:
///
/// <ul>
/// <li>
/// <code>SERVICE-PROVIDER::SERVICE-NAME::RESOURCE-NAME</code>
/// </li>
/// </ul>
/// For example, <code>AWS::Config::ConfigRule</code> <b>or</b>
/// <code>AWS::SecurityHub::SecurityControl</code> resources have the format
/// with three required segments.
///
/// Our <code>ImplementationDetails</code> <code>Type</code> format has an
/// optional fourth segment, which is present for applicable implementation
/// types. The format is as follows:
///
/// <ul>
/// <li>
/// <code>SERVICE-PROVIDER::SERVICE-NAME::RESOURCE-NAME::RESOURCE-TYPE-DESCRIPTION</code>
/// </li>
/// </ul>
/// For example, <code>AWS::Organizations::Policy::SERVICE_CONTROL_POLICY</code>
/// <b>or</b> <code>AWS::CloudFormation::Type::HOOK</code> have the format with
/// four segments.
///
/// Although the format is similar, the values for the <code>Type</code> field
/// do not match any Amazon Web Services CloudFormation values.
class ImplementationDetails {
  /// A string that describes a control's implementation type.
  final String type;

  /// A service-specific identifier for the control, assigned by the service that
  /// implemented the control. For example, this identifier could be an Amazon Web
  /// Services Config Rule ID or a Security Hub Control ID.
  final String? identifier;

  ImplementationDetails({
    required this.type,
    this.identifier,
  });

  factory ImplementationDetails.fromJson(Map<String, dynamic> json) {
    return ImplementationDetails(
      type: (json['Type'] as String?) ?? '',
      identifier: json['Identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final identifier = this.identifier;
    return {
      'Type': type,
      if (identifier != null) 'Identifier': identifier,
    };
  }
}

/// Five types of control parameters are supported.
///
/// <ul>
/// <li>
/// <b>AllowedRegions</b>: List of Amazon Web Services Regions exempted from the
/// control. Each string is expected to be an Amazon Web Services Region code.
/// This parameter is mandatory for the <b>OU Region deny</b> control,
/// <b>CT.MULTISERVICE.PV.1</b>.
///
/// Example: <code>["us-east-1","us-west-2"]</code>
/// </li>
/// <li>
/// <b>ExemptedActions</b>: List of Amazon Web Services IAM actions exempted
/// from the control. Each string is expected to be an IAM action.
///
/// Example:
/// <code>["logs:DescribeLogGroups","logs:StartQuery","logs:GetQueryResults"]</code>
/// </li>
/// <li>
/// <b>ExemptedPrincipalArns</b>: List of Amazon Web Services IAM principal ARNs
/// exempted from the control. Each string is expected to be an IAM principal
/// that follows the format <code>arn:partition:service::account:resource</code>
///
/// Example:
/// <code>["arn:aws:iam::*:role/ReadOnly","arn:aws:sts::*:assumed-role/ReadOnly/*"]</code>
/// </li>
/// <li>
/// <b>ExemptedResourceArns</b>: List of resource ARNs exempted from the
/// control. Each string is expected to be a resource ARN.
///
/// Example: <code>["arn:aws:s3:::my-bucket-name"]</code>
/// </li>
/// <li>
/// <b>ExemptAssumeRoot</b>: A parameter that lets you choose whether to exempt
/// requests made with <code>AssumeRoot</code> from this control, for this OU.
/// For member accounts, the <code>AssumeRoot</code> property is included in
/// requests initiated by IAM centralized root access. This parameter applies
/// only to the <code>AWS-GR_RESTRICT_ROOT_USER</code> control. If you add the
/// parameter when enabling the control, the <code>AssumeRoot</code> exemption
/// is allowed. If you omit the parameter, the <code>AssumeRoot</code> exception
/// is not permitted. The parameter does not accept <code>False</code> as a
/// value.
///
/// <i>Example: Enabling the control and allowing <code>AssumeRoot</code> </i>
///
/// <code>{ "controlIdentifier":
/// "arn:aws:controlcatalog:::control/5kvme4m5d2b4d7if2fs5yg2ui", "parameters":
/// [ { "key": "ExemptAssumeRoot", "value": true } ], "targetIdentifier":
/// "arn:aws:organizations::8633900XXXXX:ou/o-6jmn81636m/ou-qsah-jtiihcla"
/// }</code>
/// </li>
/// </ul>
class ControlParameter {
  /// The parameter name. This name is the parameter <code>key</code> when you
  /// call <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/API_EnableControl.html">
  /// <code>EnableControl</code> </a> or <a
  /// href="https://docs.aws.amazon.com/controltower/latest/APIReference/API_UpdateEnabledControl.html">
  /// <code>UpdateEnabledControl</code> </a>.
  final String name;

  /// Indicates whether the parameter is required or optional when you enable the
  /// control.
  final ControlParameterRequirement? requirement;

  ControlParameter({
    required this.name,
    this.requirement,
  });

  factory ControlParameter.fromJson(Map<String, dynamic> json) {
    return ControlParameter(
      name: (json['Name'] as String?) ?? '',
      requirement: (json['Requirement'] as String?)
          ?.let(ControlParameterRequirement.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final requirement = this.requirement;
    return {
      'Name': name,
      if (requirement != null) 'Requirement': requirement.value,
    };
  }
}

class ControlParameterRequirement {
  static const required = ControlParameterRequirement._('REQUIRED');
  static const optional = ControlParameterRequirement._('OPTIONAL');

  final String value;

  const ControlParameterRequirement._(this.value);

  static const values = [required, optional];

  static ControlParameterRequirement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ControlParameterRequirement._(value));

  @override
  bool operator ==(other) =>
      other is ControlParameterRequirement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ControlScope {
  static const global = ControlScope._('GLOBAL');
  static const regional = ControlScope._('REGIONAL');

  final String value;

  const ControlScope._(this.value);

  static const values = [global, regional];

  static ControlScope fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ControlScope._(value));

  @override
  bool operator ==(other) => other is ControlScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      arn: (json['Arn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      domain: AssociatedDomainSummary.fromJson(
          (json['Domain'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastUpdateTime: nonNullableTimeStampFromJson(json['LastUpdateTime'] ?? 0),
      name: (json['Name'] as String?) ?? '',
      objective: AssociatedObjectiveSummary.fromJson(
          (json['Objective'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
  /// multiple ARNs in the <code>CommonControlFilter</code> isn’t supported.
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

/// A structure that contains information about a control mapping, including the
/// control ARN, mapping type, and mapping details.
class ControlMapping {
  /// The Amazon Resource Name (ARN) that identifies the control in the mapping.
  final String controlArn;

  /// The details of the mapping relationship, for example, containing framework,
  /// common control, or related control information.
  final Mapping mapping;

  /// The type of mapping relationship between the control and other entities.
  final MappingType mappingType;

  ControlMapping({
    required this.controlArn,
    required this.mapping,
    required this.mappingType,
  });

  factory ControlMapping.fromJson(Map<String, dynamic> json) {
    return ControlMapping(
      controlArn: (json['ControlArn'] as String?) ?? '',
      mapping: Mapping.fromJson((json['Mapping'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      mappingType:
          MappingType.fromString((json['MappingType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final controlArn = this.controlArn;
    final mapping = this.mapping;
    final mappingType = this.mappingType;
    return {
      'ControlArn': controlArn,
      'Mapping': mapping,
      'MappingType': mappingType.value,
    };
  }
}

class MappingType {
  static const framework = MappingType._('FRAMEWORK');
  static const commonControl = MappingType._('COMMON_CONTROL');
  static const relatedControl = MappingType._('RELATED_CONTROL');

  final String value;

  const MappingType._(this.value);

  static const values = [framework, commonControl, relatedControl];

  static MappingType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MappingType._(value));

  @override
  bool operator ==(other) => other is MappingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains the details of a mapping relationship, which can
/// be either to a framework or to a common control.
class Mapping {
  /// The common control mapping details when the mapping type relates to a common
  /// control.
  final CommonControlMappingDetails? commonControl;

  /// The framework mapping details when the mapping type relates to a compliance
  /// framework.
  final FrameworkMappingDetails? framework;

  /// Returns information about controls that are related to the specified
  /// control.
  final RelatedControlMappingDetails? relatedControl;

  Mapping({
    this.commonControl,
    this.framework,
    this.relatedControl,
  });

  factory Mapping.fromJson(Map<String, dynamic> json) {
    return Mapping(
      commonControl: json['CommonControl'] != null
          ? CommonControlMappingDetails.fromJson(
              json['CommonControl'] as Map<String, dynamic>)
          : null,
      framework: json['Framework'] != null
          ? FrameworkMappingDetails.fromJson(
              json['Framework'] as Map<String, dynamic>)
          : null,
      relatedControl: json['RelatedControl'] != null
          ? RelatedControlMappingDetails.fromJson(
              json['RelatedControl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final commonControl = this.commonControl;
    final framework = this.framework;
    final relatedControl = this.relatedControl;
    return {
      if (commonControl != null) 'CommonControl': commonControl,
      if (framework != null) 'Framework': framework,
      if (relatedControl != null) 'RelatedControl': relatedControl,
    };
  }
}

/// A structure that contains details about a framework mapping, including the
/// framework name and specific item within the framework that the control maps
/// to.
class FrameworkMappingDetails {
  /// The specific item or requirement within the framework that the control maps
  /// to.
  final String item;

  /// The name of the compliance framework that the control maps to.
  final String name;

  FrameworkMappingDetails({
    required this.item,
    required this.name,
  });

  factory FrameworkMappingDetails.fromJson(Map<String, dynamic> json) {
    return FrameworkMappingDetails(
      item: (json['Item'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final name = this.name;
    return {
      'Item': item,
      'Name': name,
    };
  }
}

/// A structure that contains details about a common control mapping. In
/// particular, it returns the Amazon Resource Name (ARN) of the common control.
class CommonControlMappingDetails {
  /// The Amazon Resource Name (ARN) that identifies the common control in the
  /// mapping.
  final String commonControlArn;

  CommonControlMappingDetails({
    required this.commonControlArn,
  });

  factory CommonControlMappingDetails.fromJson(Map<String, dynamic> json) {
    return CommonControlMappingDetails(
      commonControlArn: (json['CommonControlArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final commonControlArn = this.commonControlArn;
    return {
      'CommonControlArn': commonControlArn,
    };
  }
}

/// A structure that describes a control's relationship status with other
/// controls.
class RelatedControlMappingDetails {
  /// Returns an enumerated value that represents the relationship between two or
  /// more controls.
  final ControlRelationType relationType;

  /// The unique identifier of a control.
  final String? controlArn;

  RelatedControlMappingDetails({
    required this.relationType,
    this.controlArn,
  });

  factory RelatedControlMappingDetails.fromJson(Map<String, dynamic> json) {
    return RelatedControlMappingDetails(
      relationType: ControlRelationType.fromString(
          (json['RelationType'] as String?) ?? ''),
      controlArn: json['ControlArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relationType = this.relationType;
    final controlArn = this.controlArn;
    return {
      'RelationType': relationType.value,
      if (controlArn != null) 'ControlArn': controlArn,
    };
  }
}

class ControlRelationType {
  static const complementary = ControlRelationType._('COMPLEMENTARY');
  static const alternative = ControlRelationType._('ALTERNATIVE');
  static const mutuallyExclusive = ControlRelationType._('MUTUALLY_EXCLUSIVE');

  final String value;

  const ControlRelationType._(this.value);

  static const values = [complementary, alternative, mutuallyExclusive];

  static ControlRelationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ControlRelationType._(value));

  @override
  bool operator ==(other) =>
      other is ControlRelationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that defines filtering criteria for the ListControlMappings
/// operation. You can use this filter to narrow down the list of control
/// mappings based on control ARNs, common control ARNs, or mapping types.
class ControlMappingFilter {
  /// A list of common control ARNs to filter the mappings. When specified, only
  /// mappings associated with these common controls are returned.
  final List<String>? commonControlArns;

  /// A list of control ARNs to filter the mappings. When specified, only mappings
  /// associated with these controls are returned.
  final List<String>? controlArns;

  /// A list of mapping types to filter the mappings. When specified, only
  /// mappings of these types are returned.
  final List<MappingType>? mappingTypes;

  ControlMappingFilter({
    this.commonControlArns,
    this.controlArns,
    this.mappingTypes,
  });

  Map<String, dynamic> toJson() {
    final commonControlArns = this.commonControlArns;
    final controlArns = this.controlArns;
    final mappingTypes = this.mappingTypes;
    return {
      if (commonControlArns != null) 'CommonControlArns': commonControlArns,
      if (controlArns != null) 'ControlArns': controlArns,
      if (mappingTypes != null)
        'MappingTypes': mappingTypes.map((e) => e.value).toList(),
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

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
