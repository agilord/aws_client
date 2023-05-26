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

/// Amazon Kendra Intelligent Ranking uses Amazon Kendra semantic search
/// capabilities to intelligently re-rank a search service's results.
class KendraRanking {
  final _s.JsonProtocol _protocol;
  KendraRanking({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kendra-ranking',
            signingName: 'kendra-ranking',
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

  /// Creates a rescore execution plan. A rescore execution plan is an Amazon
  /// Kendra Intelligent Ranking resource used for provisioning the
  /// <code>Rescore</code> API. You set the number of capacity units that you
  /// require for Amazon Kendra Intelligent Ranking to rescore or re-rank a
  /// search service's results.
  ///
  /// For an example of using the <code>CreateRescoreExecutionPlan</code> API,
  /// including using the Python and Java SDKs, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/search-service-rerank.html">Semantically
  /// ranking a search service's results</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// A name for the rescore execution plan.
  ///
  /// Parameter [capacityUnits] :
  /// You can set additional capacity units to meet the needs of your rescore
  /// execution plan. You are given a single capacity unit by default. If you
  /// want to use the default capacity, you don't set additional capacity units.
  /// For more information on the default capacity and additional capacity
  /// units, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html">Adjusting
  /// capacity</a>.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a rescore
  /// execution plan. Multiple calls to the
  /// <code>CreateRescoreExecutionPlanRequest</code> API with the same client
  /// token will create only one rescore execution plan.
  ///
  /// Parameter [description] :
  /// A description for the rescore execution plan.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize your rescore
  /// execution plan. You can also use tags to help control access to the
  /// rescore execution plan. Tag keys and values can consist of Unicode
  /// letters, digits, white space, and any of the following symbols: _ . : / =
  /// + - @.
  Future<CreateRescoreExecutionPlanResponse> createRescoreExecutionPlan({
    required String name,
    CapacityUnitsConfiguration? capacityUnits,
    String? clientToken,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSKendraRerankingFrontendService.CreateRescoreExecutionPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (capacityUnits != null) 'CapacityUnits': capacityUnits,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRescoreExecutionPlanResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a rescore execution plan. A rescore execution plan is an Amazon
  /// Kendra Intelligent Ranking resource used for provisioning the
  /// <code>Rescore</code> API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the rescore execution plan that you want to delete.
  Future<void> deleteRescoreExecutionPlan({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSKendraRerankingFrontendService.DeleteRescoreExecutionPlan'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );
  }

  /// Gets information about a rescore execution plan. A rescore execution plan
  /// is an Amazon Kendra Intelligent Ranking resource used for provisioning the
  /// <code>Rescore</code> API.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the rescore execution plan that you want to get
  /// information on.
  Future<DescribeRescoreExecutionPlanResponse> describeRescoreExecutionPlan({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSKendraRerankingFrontendService.DescribeRescoreExecutionPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return DescribeRescoreExecutionPlanResponse.fromJson(jsonResponse.body);
  }

  /// Lists your rescore execution plans. A rescore execution plan is an Amazon
  /// Kendra Intelligent Ranking resource used for provisioning the
  /// <code>Rescore</code> API.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of rescore execution plans to return.
  ///
  /// Parameter [nextToken] :
  /// If the response is truncated, Amazon Kendra Intelligent Ranking returns a
  /// pagination token in the response. You can use this pagination token to
  /// retrieve the next set of rescore execution plans.
  Future<ListRescoreExecutionPlansResponse> listRescoreExecutionPlans({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSKendraRerankingFrontendService.ListRescoreExecutionPlans'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListRescoreExecutionPlansResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of tags associated with a specified resource. A rescore
  /// execution plan is an example of a resource that can have tags associated
  /// with it.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the rescore execution plan to get a list
  /// of tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSKendraRerankingFrontendService.ListTagsForResource'
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

  /// Rescores or re-ranks search results from a search service such as
  /// OpenSearch (self managed). You use the semantic search capabilities of
  /// Amazon Kendra Intelligent Ranking to improve the search service's results.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documents] :
  /// The list of documents for Amazon Kendra Intelligent Ranking to rescore or
  /// rank on.
  ///
  /// Parameter [rescoreExecutionPlanId] :
  /// The identifier of the rescore execution plan. A rescore execution plan is
  /// an Amazon Kendra Intelligent Ranking resource used for provisioning the
  /// <code>Rescore</code> API.
  ///
  /// Parameter [searchQuery] :
  /// The input query from the search service.
  Future<RescoreResult> rescore({
    required List<Document> documents,
    required String rescoreExecutionPlanId,
    required String searchQuery,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSKendraRerankingFrontendService.Rescore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Documents': documents,
        'RescoreExecutionPlanId': rescoreExecutionPlanId,
        'SearchQuery': searchQuery,
      },
    );

    return RescoreResult.fromJson(jsonResponse.body);
  }

  /// Adds a specified tag to a specified rescore execution plan. A rescore
  /// execution plan is an Amazon Kendra Intelligent Ranking resource used for
  /// provisioning the <code>Rescore</code> API. If the tag already exists, the
  /// existing value is replaced with the new value.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the rescore execution plan to tag.
  ///
  /// Parameter [tags] :
  /// A list of tag keys to add to a rescore execution plan. If a tag already
  /// exists, the existing value is replaced with the new value.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSKendraRerankingFrontendService.TagResource'
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

  /// Removes a tag from a rescore execution plan. A rescore execution plan is
  /// an Amazon Kendra Intelligent Ranking resource used for provisioning the
  /// <code>Rescore</code> operation.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the rescore execution plan to remove the
  /// tag.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the rescore execution plan. If a tag key
  /// does not exist on the resource, it is ignored.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSKendraRerankingFrontendService.UntagResource'
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

  /// Updates a rescore execution plan. A rescore execution plan is an Amazon
  /// Kendra Intelligent Ranking resource used for provisioning the
  /// <code>Rescore</code> API. You can update the number of capacity units you
  /// require for Amazon Kendra Intelligent Ranking to rescore or re-rank a
  /// search service's results.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the rescore execution plan that you want to update.
  ///
  /// Parameter [capacityUnits] :
  /// You can set additional capacity units to meet the needs of your rescore
  /// execution plan. You are given a single capacity unit by default. If you
  /// want to use the default capacity, you don't set additional capacity units.
  /// For more information on the default capacity and additional capacity
  /// units, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html">Adjusting
  /// capacity</a>.
  ///
  /// Parameter [description] :
  /// A new description for the rescore execution plan.
  ///
  /// Parameter [name] :
  /// A new name for the rescore execution plan.
  Future<void> updateRescoreExecutionPlan({
    required String id,
    CapacityUnitsConfiguration? capacityUnits,
    String? description,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSKendraRerankingFrontendService.UpdateRescoreExecutionPlan'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (capacityUnits != null) 'CapacityUnits': capacityUnits,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
      },
    );
  }
}

/// Sets additional capacity units configured for your rescore execution plan. A
/// rescore execution plan is an Amazon Kendra Intelligent Ranking resource used
/// for provisioning the <code>Rescore</code> API. You can add and remove
/// capacity units to fit your usage requirements.
class CapacityUnitsConfiguration {
  /// The amount of extra capacity for your rescore execution plan.
  ///
  /// A single extra capacity unit for a rescore execution plan provides 0.01
  /// rescore requests per second. You can add up to 1000 extra capacity units.
  final int rescoreCapacityUnits;

  CapacityUnitsConfiguration({
    required this.rescoreCapacityUnits,
  });

  factory CapacityUnitsConfiguration.fromJson(Map<String, dynamic> json) {
    return CapacityUnitsConfiguration(
      rescoreCapacityUnits: json['RescoreCapacityUnits'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final rescoreCapacityUnits = this.rescoreCapacityUnits;
    return {
      'RescoreCapacityUnits': rescoreCapacityUnits,
    };
  }
}

class CreateRescoreExecutionPlanResponse {
  /// The Amazon Resource Name (ARN) of the rescore execution plan.
  final String arn;

  /// The identifier of the rescore execution plan.
  final String id;

  CreateRescoreExecutionPlanResponse({
    required this.arn,
    required this.id,
  });

  factory CreateRescoreExecutionPlanResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRescoreExecutionPlanResponse(
      arn: json['Arn'] as String,
      id: json['Id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      'Arn': arn,
      'Id': id,
    };
  }
}

class DescribeRescoreExecutionPlanResponse {
  /// The Amazon Resource Name (ARN) of the rescore execution plan.
  final String? arn;

  /// The capacity units set for the rescore execution plan. A capacity of zero
  /// indicates that the rescore execution plan is using the default capacity. For
  /// more information on the default capacity and additional capacity units, see
  /// <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html">Adjusting
  /// capacity</a>.
  final CapacityUnitsConfiguration? capacityUnits;

  /// The Unix timestamp of when the rescore execution plan was created.
  final DateTime? createdAt;

  /// The description for the rescore execution plan.
  final String? description;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a message that explains why.
  final String? errorMessage;

  /// The identifier of the rescore execution plan.
  final String? id;

  /// The name for the rescore execution plan.
  final String? name;

  /// The current status of the rescore execution plan. When the value is
  /// <code>ACTIVE</code>, the rescore execution plan is ready for use. If the
  /// <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a message that explains why.
  final RescoreExecutionPlanStatus? status;

  /// The Unix timestamp of when the rescore execution plan was last updated.
  final DateTime? updatedAt;

  DescribeRescoreExecutionPlanResponse({
    this.arn,
    this.capacityUnits,
    this.createdAt,
    this.description,
    this.errorMessage,
    this.id,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory DescribeRescoreExecutionPlanResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRescoreExecutionPlanResponse(
      arn: json['Arn'] as String?,
      capacityUnits: json['CapacityUnits'] != null
          ? CapacityUnitsConfiguration.fromJson(
              json['CapacityUnits'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toRescoreExecutionPlanStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capacityUnits = this.capacityUnits;
    final createdAt = this.createdAt;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (capacityUnits != null) 'CapacityUnits': capacityUnits,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Information about a document from a search service such as OpenSearch (self
/// managed). Amazon Kendra Intelligent Ranking uses this information to rank
/// and score on.
class Document {
  /// The identifier of the document from the search service.
  final String id;

  /// The original document score or rank from the search service. Amazon Kendra
  /// Intelligent Ranking gives the document a new score or rank based on its
  /// intelligent search algorithms.
  final double originalScore;

  /// The body text of the search service's document.
  final String? body;

  /// The optional group identifier of the document from the search service.
  /// Documents with the same group identifier are grouped together and processed
  /// as one document within the service.
  final String? groupId;

  /// The title of the search service's document.
  final String? title;

  /// The body text of the search service's document represented as a list of
  /// tokens or words. You must choose to provide <code>Body</code> or
  /// <code>TokenizedBody</code>. You cannot provide both.
  final List<String>? tokenizedBody;

  /// The title of the search service's document represented as a list of tokens
  /// or words. You must choose to provide <code>Title</code> or
  /// <code>TokenizedTitle</code>. You cannot provide both.
  final List<String>? tokenizedTitle;

  Document({
    required this.id,
    required this.originalScore,
    this.body,
    this.groupId,
    this.title,
    this.tokenizedBody,
    this.tokenizedTitle,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final originalScore = this.originalScore;
    final body = this.body;
    final groupId = this.groupId;
    final title = this.title;
    final tokenizedBody = this.tokenizedBody;
    final tokenizedTitle = this.tokenizedTitle;
    return {
      'Id': id,
      'OriginalScore': originalScore,
      if (body != null) 'Body': body,
      if (groupId != null) 'GroupId': groupId,
      if (title != null) 'Title': title,
      if (tokenizedBody != null) 'TokenizedBody': tokenizedBody,
      if (tokenizedTitle != null) 'TokenizedTitle': tokenizedTitle,
    };
  }
}

class ListRescoreExecutionPlansResponse {
  /// If the response is truncated, Amazon Kendra Intelligent Ranking returns a
  /// pagination token in the response.
  final String? nextToken;

  /// An array of summary information for one or more rescore execution plans.
  final List<RescoreExecutionPlanSummary>? summaryItems;

  ListRescoreExecutionPlansResponse({
    this.nextToken,
    this.summaryItems,
  });

  factory ListRescoreExecutionPlansResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRescoreExecutionPlansResponse(
      nextToken: json['NextToken'] as String?,
      summaryItems: (json['SummaryItems'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RescoreExecutionPlanSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaryItems = this.summaryItems;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaryItems != null) 'SummaryItems': summaryItems,
    };
  }
}

/// If the action is successful, the service sends back an HTTP 200 response.
class ListTagsForResourceResponse {
  /// A list of tags associated with the rescore execution plan.
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

enum RescoreExecutionPlanStatus {
  creating,
  updating,
  active,
  deleting,
  failed,
}

extension RescoreExecutionPlanStatusValueExtension
    on RescoreExecutionPlanStatus {
  String toValue() {
    switch (this) {
      case RescoreExecutionPlanStatus.creating:
        return 'CREATING';
      case RescoreExecutionPlanStatus.updating:
        return 'UPDATING';
      case RescoreExecutionPlanStatus.active:
        return 'ACTIVE';
      case RescoreExecutionPlanStatus.deleting:
        return 'DELETING';
      case RescoreExecutionPlanStatus.failed:
        return 'FAILED';
    }
  }
}

extension RescoreExecutionPlanStatusFromString on String {
  RescoreExecutionPlanStatus toRescoreExecutionPlanStatus() {
    switch (this) {
      case 'CREATING':
        return RescoreExecutionPlanStatus.creating;
      case 'UPDATING':
        return RescoreExecutionPlanStatus.updating;
      case 'ACTIVE':
        return RescoreExecutionPlanStatus.active;
      case 'DELETING':
        return RescoreExecutionPlanStatus.deleting;
      case 'FAILED':
        return RescoreExecutionPlanStatus.failed;
    }
    throw Exception('$this is not known in enum RescoreExecutionPlanStatus');
  }
}

/// Summary information for a rescore execution plan. A rescore execution plan
/// is an Amazon Kendra Intelligent Ranking resource used for provisioning the
/// <code>Rescore</code> API.
class RescoreExecutionPlanSummary {
  /// The Unix timestamp when the rescore execution plan was created.
  final DateTime? createdAt;

  /// The identifier of the rescore execution plan.
  final String? id;

  /// The name of the rescore execution plan.
  final String? name;

  /// The current status of the rescore execution plan. When the value is
  /// <code>ACTIVE</code>, the rescore execution plan is ready for use.
  final RescoreExecutionPlanStatus? status;

  /// The Unix timestamp when the rescore execution plan was last updated.
  final DateTime? updatedAt;

  RescoreExecutionPlanSummary({
    this.createdAt,
    this.id,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory RescoreExecutionPlanSummary.fromJson(Map<String, dynamic> json) {
    return RescoreExecutionPlanSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toRescoreExecutionPlanStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class RescoreResult {
  /// The identifier associated with the scores that Amazon Kendra Intelligent
  /// Ranking gives to the results. Amazon Kendra Intelligent Ranking rescores or
  /// re-ranks the results for the search service.
  final String? rescoreId;

  /// A list of result items for documents with new relevancy scores. The results
  /// are in descending order.
  final List<RescoreResultItem>? resultItems;

  RescoreResult({
    this.rescoreId,
    this.resultItems,
  });

  factory RescoreResult.fromJson(Map<String, dynamic> json) {
    return RescoreResult(
      rescoreId: json['RescoreId'] as String?,
      resultItems: (json['ResultItems'] as List?)
          ?.whereNotNull()
          .map((e) => RescoreResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rescoreId = this.rescoreId;
    final resultItems = this.resultItems;
    return {
      if (rescoreId != null) 'RescoreId': rescoreId,
      if (resultItems != null) 'ResultItems': resultItems,
    };
  }
}

/// A result item for a document with a new relevancy score.
class RescoreResultItem {
  /// The identifier of the document from the search service.
  final String? documentId;

  /// The relevancy score or rank that Amazon Kendra Intelligent Ranking gives to
  /// the result.
  final double? score;

  RescoreResultItem({
    this.documentId,
    this.score,
  });

  factory RescoreResultItem.fromJson(Map<String, dynamic> json) {
    return RescoreResultItem(
      documentId: json['DocumentId'] as String?,
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentId = this.documentId;
    final score = this.score;
    return {
      if (documentId != null) 'DocumentId': documentId,
      if (score != null) 'Score': score,
    };
  }
}

/// A key-value pair that identifies or categorizes a rescore execution plan. A
/// rescore execution plan is an Amazon Kendra Intelligent Ranking resource used
/// for provisioning the <code>Rescore</code> API. You can also use a tag to
/// help control access to a rescore execution plan. A tag key and value can
/// consist of Unicode letters, digits, white space, and any of the following
/// symbols: _ . : / = + - @.
class Tag {
  /// The key for the tag. Keys are not case sensitive and must be unique.
  final String key;

  /// The value associated with the tag. The value can be an empty string but it
  /// can't be null.
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

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
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

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
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
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
