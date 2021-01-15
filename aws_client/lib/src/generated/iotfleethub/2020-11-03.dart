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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2020-11-03.g.dart';

/// With Fleet Hub for AWS IoT Device Management you can build stand-alone web
/// applications for monitoring the health of your device fleets.
/// <note>
/// Fleet Hub for AWS IoT Device Management is in public preview and is subject
/// to change.
/// </note>
class IoTFleetHub {
  final _s.RestJsonProtocol _protocol;
  IoTFleetHub({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.fleethub.iot',
            signingName: 'iotfleethub',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a Fleet Hub for AWS IoT Device Management web application.
  /// <note>
  /// Fleet Hub for AWS IoT Device Management is in public preview and is
  /// subject to change.
  /// </note>
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
  /// with AWS IoT Core.
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
    @_s.required String applicationName,
    @_s.required String roleArn,
    String applicationDescription,
    String clientToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''^[ -~]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:[!-~]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'applicationDescription',
      applicationDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'applicationDescription',
      applicationDescription,
      r'''^[ -~]*$''',
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
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

  /// Deletes a Fleet Hub for AWS IoT Device Management web application.
  /// <note>
  /// Fleet Hub for AWS IoT Device Management is in public preview and is
  /// subject to change.
  /// </note>
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
    @_s.required String applicationId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    _s.validateStringLength(
      'applicationId',
      applicationId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationId',
      applicationId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
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
    return DeleteApplicationResponse.fromJson(response);
  }

  /// Gets information about a Fleet Hub for AWS IoT Device Management web
  /// application.
  /// <note>
  /// Fleet Hub for AWS IoT Device Management is in public preview and is
  /// subject to change.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [applicationId] :
  /// The unique Id of the web application.
  Future<DescribeApplicationResponse> describeApplication({
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    _s.validateStringLength(
      'applicationId',
      applicationId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationId',
      applicationId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeApplicationResponse.fromJson(response);
  }

  /// Gets a list of Fleet Hub for AWS IoT Device Management web applications
  /// for the current account.
  /// <note>
  /// Fleet Hub for AWS IoT Device Management is in public preview and is
  /// subject to change.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [nextToken] :
  /// A token used to get the next set of results.
  Future<ListApplicationsResponse> listApplications({
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+/=]+$''',
    );
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
  /// <note>
  /// Fleet Hub for AWS IoT Device Management is in public preview and is
  /// subject to change.
  /// </note>
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// <note>
  /// Fleet Hub for AWS IoT Device Management is in public preview and is
  /// subject to change.
  /// </note>
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes the specified tags (metadata) from the resource.
  /// <note>
  /// Fleet Hub for AWS IoT Device Management is in public preview and is
  /// subject to change.
  /// </note>
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates information about a Fleet Hub for a AWS IoT Device Management web
  /// application.
  /// <note>
  /// Fleet Hub for AWS IoT Device Management is in public preview and is
  /// subject to change.
  /// </note>
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
    @_s.required String applicationId,
    String applicationDescription,
    String applicationName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    _s.validateStringLength(
      'applicationId',
      applicationId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationId',
      applicationId,
      r'''^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'applicationDescription',
      applicationDescription,
      1,
      2048,
    );
    _s.validateStringPattern(
      'applicationDescription',
      applicationDescription,
      r'''^[ -~]*$''',
    );
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''^[ -~]*$''',
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
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
    return UpdateApplicationResponse.fromJson(response);
  }
}

enum ApplicationState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
}

/// A summary of information about a AWS IoT Device Management web application.
/// <note>
/// Fleet Hub for AWS IoT Device Management is in public preview and is subject
/// to change.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationSummary {
  /// The unique Id of the web application.
  @_s.JsonKey(name: 'applicationId')
  final String applicationId;

  /// The name of the web application.
  @_s.JsonKey(name: 'applicationName')
  final String applicationName;

  /// The URL of the web application.
  @_s.JsonKey(name: 'applicationUrl')
  final String applicationUrl;

  /// The date (in Unix epoch time) when the web application was created.
  @_s.JsonKey(name: 'applicationCreationDate')
  final int applicationCreationDate;

  /// An optional description of the web application.
  @_s.JsonKey(name: 'applicationDescription')
  final String applicationDescription;

  /// The date (in Unix epoch time) when the web application was last updated.
  @_s.JsonKey(name: 'applicationLastUpdateDate')
  final int applicationLastUpdateDate;

  /// The current state of the web application.
  @_s.JsonKey(name: 'applicationState')
  final ApplicationState applicationState;

  ApplicationSummary({
    @_s.required this.applicationId,
    @_s.required this.applicationName,
    @_s.required this.applicationUrl,
    this.applicationCreationDate,
    this.applicationDescription,
    this.applicationLastUpdateDate,
    this.applicationState,
  });
  factory ApplicationSummary.fromJson(Map<String, dynamic> json) =>
      _$ApplicationSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApplicationResponse {
  /// The ARN of the web application.
  @_s.JsonKey(name: 'applicationArn')
  final String applicationArn;

  /// The unique Id of the web application.
  @_s.JsonKey(name: 'applicationId')
  final String applicationId;

  CreateApplicationResponse({
    @_s.required this.applicationArn,
    @_s.required this.applicationId,
  });
  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationResponse {
  DeleteApplicationResponse();
  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeApplicationResponse {
  /// The ARN of the web application.
  @_s.JsonKey(name: 'applicationArn')
  final String applicationArn;

  /// The date (in Unix epoch time) when the application was created.
  @_s.JsonKey(name: 'applicationCreationDate')
  final int applicationCreationDate;

  /// The unique Id of the web application.
  @_s.JsonKey(name: 'applicationId')
  final String applicationId;

  /// The date (in Unix epoch time) when the application was last updated.
  @_s.JsonKey(name: 'applicationLastUpdateDate')
  final int applicationLastUpdateDate;

  /// The name of the web application.
  @_s.JsonKey(name: 'applicationName')
  final String applicationName;

  /// The current state of the web application.
  @_s.JsonKey(name: 'applicationState')
  final ApplicationState applicationState;

  /// The URL of the web application.
  @_s.JsonKey(name: 'applicationUrl')
  final String applicationUrl;

  /// The ARN of the role that the web application assumes when it interacts with
  /// AWS IoT Core.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// An optional description of the web application.
  @_s.JsonKey(name: 'applicationDescription')
  final String applicationDescription;

  /// A message indicating why the <code>DescribeApplication</code> API failed.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The Id of the single sign-on client that you use to authenticate and
  /// authorize users on the web application.
  @_s.JsonKey(name: 'ssoClientId')
  final String ssoClientId;

  /// A set of key/value pairs that you can use to manage the web application
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeApplicationResponse({
    @_s.required this.applicationArn,
    @_s.required this.applicationCreationDate,
    @_s.required this.applicationId,
    @_s.required this.applicationLastUpdateDate,
    @_s.required this.applicationName,
    @_s.required this.applicationState,
    @_s.required this.applicationUrl,
    @_s.required this.roleArn,
    this.applicationDescription,
    this.errorMessage,
    this.ssoClientId,
    this.tags,
  });
  factory DescribeApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApplicationsResponse {
  /// An array of objects that provide summaries of information about the web
  /// applications in the list.
  @_s.JsonKey(name: 'applicationSummaries')
  final List<ApplicationSummary> applicationSummaries;

  /// A token used to get the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListApplicationsResponse({
    this.applicationSummaries,
    this.nextToken,
  });
  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListApplicationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of tags assigned to the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApplicationResponse {
  UpdateApplicationResponse();
  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApplicationResponseFromJson(json);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
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
