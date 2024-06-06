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

/// With Fleet Hub for IoT Device Management you can build stand-alone web
/// applications for monitoring the health of your device fleets.
class IoTFleetHub {
  final _s.RestJsonProtocol _protocol;
  IoTFleetHub({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.fleethub.iot',
            signingName: 'iotfleethub',
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

  /// Creates a Fleet Hub for IoT Device Management web application.
  ///
  /// When creating a Fleet Hub application, you must create an organization
  /// instance of IAM Identity Center if you don't already have one. The Fleet
  /// Hub application you create must also be in the same Amazon Web Services
  /// Region of the organization instance of IAM Identity Center. For more
  /// information see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/get-set-up-for-idc.html">Enabling
  /// IAM Identity Center</a> and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/organization-instances-identity-center.html">Organization
  /// instances of IAM Identity Center</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [applicationName] :
  /// The name of the web application.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role that the web application assumes when it interacts
  /// with Amazon Web Services IoT Core.
  /// <note>
  /// The name of the role must be in the form
  /// <code>AWSIotFleetHub_<i>random_string</i> </code>.
  /// </note>
  ///
  /// Parameter [applicationDescription] :
  /// An optional description of the web application.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that you can use to manage the web application
  /// resource.
  Future<CreateApplicationResponse> createApplication({
    required String applicationName,
    required String roleArn,
    String? applicationDescription,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'applicationName': applicationName,
      'roleArn': roleArn,
      if (applicationDescription != null)
        'applicationDescription': applicationDescription,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Deletes a Fleet Hub for IoT Device Management web application.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [applicationId] :
  /// The unique Id of the web application.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deleteApplication({
    required String applicationId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about a Fleet Hub for IoT Device Management web
  /// application.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [applicationId] :
  /// The unique Id of the web application.
  Future<DescribeApplicationResponse> describeApplication({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeApplicationResponse.fromJson(response);
  }

  /// Gets a list of Fleet Hub for IoT Device Management web applications for
  /// the current account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [nextToken] :
  /// A token used to get the next set of results.
  Future<ListApplicationsResponse> listApplications({
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Adds to or modifies the tags of the specified resource. Tags are metadata
  /// which can be used to manage a resource.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// The new or modified tags for the resource.
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

  /// Removes the specified tags (metadata) from the resource.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys of the tags to be removed from the resource.
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

  /// Updates information about a Fleet Hub for IoT Device Management web
  /// application.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [applicationId] :
  /// The unique Id of the web application.
  ///
  /// Parameter [applicationDescription] :
  /// An optional description of the web application.
  ///
  /// Parameter [applicationName] :
  /// The name of the web application.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> updateApplication({
    required String applicationId,
    String? applicationDescription,
    String? applicationName,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      if (applicationDescription != null)
        'applicationDescription': applicationDescription,
      if (applicationName != null) 'applicationName': applicationName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum ApplicationState {
  creating,
  deleting,
  active,
  createFailed,
  deleteFailed,
}

extension ApplicationStateValueExtension on ApplicationState {
  String toValue() {
    switch (this) {
      case ApplicationState.creating:
        return 'CREATING';
      case ApplicationState.deleting:
        return 'DELETING';
      case ApplicationState.active:
        return 'ACTIVE';
      case ApplicationState.createFailed:
        return 'CREATE_FAILED';
      case ApplicationState.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension ApplicationStateFromString on String {
  ApplicationState toApplicationState() {
    switch (this) {
      case 'CREATING':
        return ApplicationState.creating;
      case 'DELETING':
        return ApplicationState.deleting;
      case 'ACTIVE':
        return ApplicationState.active;
      case 'CREATE_FAILED':
        return ApplicationState.createFailed;
      case 'DELETE_FAILED':
        return ApplicationState.deleteFailed;
    }
    throw Exception('$this is not known in enum ApplicationState');
  }
}

/// A summary of information about a Fleet Hub for IoT Device Management web
/// application.
class ApplicationSummary {
  /// The unique Id of the web application.
  final String applicationId;

  /// The name of the web application.
  final String applicationName;

  /// The URL of the web application.
  final String applicationUrl;

  /// The date (in Unix epoch time) when the web application was created.
  final int? applicationCreationDate;

  /// An optional description of the web application.
  final String? applicationDescription;

  /// The date (in Unix epoch time) when the web application was last updated.
  final int? applicationLastUpdateDate;

  /// The current state of the web application.
  final ApplicationState? applicationState;

  ApplicationSummary({
    required this.applicationId,
    required this.applicationName,
    required this.applicationUrl,
    this.applicationCreationDate,
    this.applicationDescription,
    this.applicationLastUpdateDate,
    this.applicationState,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      applicationId: json['applicationId'] as String,
      applicationName: json['applicationName'] as String,
      applicationUrl: json['applicationUrl'] as String,
      applicationCreationDate: json['applicationCreationDate'] as int?,
      applicationDescription: json['applicationDescription'] as String?,
      applicationLastUpdateDate: json['applicationLastUpdateDate'] as int?,
      applicationState:
          (json['applicationState'] as String?)?.toApplicationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final applicationName = this.applicationName;
    final applicationUrl = this.applicationUrl;
    final applicationCreationDate = this.applicationCreationDate;
    final applicationDescription = this.applicationDescription;
    final applicationLastUpdateDate = this.applicationLastUpdateDate;
    final applicationState = this.applicationState;
    return {
      'applicationId': applicationId,
      'applicationName': applicationName,
      'applicationUrl': applicationUrl,
      if (applicationCreationDate != null)
        'applicationCreationDate': applicationCreationDate,
      if (applicationDescription != null)
        'applicationDescription': applicationDescription,
      if (applicationLastUpdateDate != null)
        'applicationLastUpdateDate': applicationLastUpdateDate,
      if (applicationState != null)
        'applicationState': applicationState.toValue(),
    };
  }
}

class CreateApplicationResponse {
  /// The ARN of the web application.
  final String applicationArn;

  /// The unique Id of the web application.
  final String applicationId;

  CreateApplicationResponse({
    required this.applicationArn,
    required this.applicationId,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationArn: json['applicationArn'] as String,
      applicationId: json['applicationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationId = this.applicationId;
    return {
      'applicationArn': applicationArn,
      'applicationId': applicationId,
    };
  }
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeApplicationResponse {
  /// The ARN of the web application.
  final String applicationArn;

  /// The date (in Unix epoch time) when the application was created.
  final int applicationCreationDate;

  /// The unique Id of the web application.
  final String applicationId;

  /// The date (in Unix epoch time) when the application was last updated.
  final int applicationLastUpdateDate;

  /// The name of the web application.
  final String applicationName;

  /// The current state of the web application.
  final ApplicationState applicationState;

  /// The URL of the web application.
  final String applicationUrl;

  /// The ARN of the role that the web application assumes when it interacts with
  /// Amazon Web Services IoT Core.
  final String roleArn;

  /// An optional description of the web application.
  final String? applicationDescription;

  /// A message that explains any failures included in the
  /// <code>applicationState</code> response field. This message explains failures
  /// in the <code>CreateApplication</code> and <code>DeleteApplication</code>
  /// actions.
  final String? errorMessage;

  /// The Id of the single sign-on client that you use to authenticate and
  /// authorize users on the web application.
  final String? ssoClientId;

  /// A set of key/value pairs that you can use to manage the web application
  /// resource.
  final Map<String, String>? tags;

  DescribeApplicationResponse({
    required this.applicationArn,
    required this.applicationCreationDate,
    required this.applicationId,
    required this.applicationLastUpdateDate,
    required this.applicationName,
    required this.applicationState,
    required this.applicationUrl,
    required this.roleArn,
    this.applicationDescription,
    this.errorMessage,
    this.ssoClientId,
    this.tags,
  });

  factory DescribeApplicationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeApplicationResponse(
      applicationArn: json['applicationArn'] as String,
      applicationCreationDate: json['applicationCreationDate'] as int,
      applicationId: json['applicationId'] as String,
      applicationLastUpdateDate: json['applicationLastUpdateDate'] as int,
      applicationName: json['applicationName'] as String,
      applicationState:
          (json['applicationState'] as String).toApplicationState(),
      applicationUrl: json['applicationUrl'] as String,
      roleArn: json['roleArn'] as String,
      applicationDescription: json['applicationDescription'] as String?,
      errorMessage: json['errorMessage'] as String?,
      ssoClientId: json['ssoClientId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationCreationDate = this.applicationCreationDate;
    final applicationId = this.applicationId;
    final applicationLastUpdateDate = this.applicationLastUpdateDate;
    final applicationName = this.applicationName;
    final applicationState = this.applicationState;
    final applicationUrl = this.applicationUrl;
    final roleArn = this.roleArn;
    final applicationDescription = this.applicationDescription;
    final errorMessage = this.errorMessage;
    final ssoClientId = this.ssoClientId;
    final tags = this.tags;
    return {
      'applicationArn': applicationArn,
      'applicationCreationDate': applicationCreationDate,
      'applicationId': applicationId,
      'applicationLastUpdateDate': applicationLastUpdateDate,
      'applicationName': applicationName,
      'applicationState': applicationState.toValue(),
      'applicationUrl': applicationUrl,
      'roleArn': roleArn,
      if (applicationDescription != null)
        'applicationDescription': applicationDescription,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (ssoClientId != null) 'ssoClientId': ssoClientId,
      if (tags != null) 'tags': tags,
    };
  }
}

class ListApplicationsResponse {
  /// An array of objects that provide summaries of information about the web
  /// applications in the list.
  final List<ApplicationSummary>? applicationSummaries;

  /// A token used to get the next set of results.
  final String? nextToken;

  ListApplicationsResponse({
    this.applicationSummaries,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applicationSummaries: (json['applicationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationSummaries = this.applicationSummaries;
    final nextToken = this.nextToken;
    return {
      if (applicationSummaries != null)
        'applicationSummaries': applicationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags assigned to the resource.
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

class UpdateApplicationResponse {
  UpdateApplicationResponse();

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
