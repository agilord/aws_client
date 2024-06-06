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

/// The AWS Migration Hub home region APIs are available specifically for
/// working with your Migration Hub home region. You can use these APIs to
/// determine a home region, as well as to create and work with controls that
/// describe the home region.
///
/// <ul>
/// <li>
/// You must make API calls for write actions (create, notify, associate,
/// disassociate, import, or put) while in your home region, or a
/// <code>HomeRegionNotSetException</code> error is returned.
/// </li>
/// <li>
/// API calls for read actions (list, describe, stop, and delete) are permitted
/// outside of your home region.
/// </li>
/// <li>
/// If you call a write API outside the home region, an
/// <code>InvalidInputException</code> is returned.
/// </li>
/// <li>
/// You can call <code>GetHomeRegion</code> action to obtain the account's
/// Migration Hub home region.
/// </li>
/// </ul>
/// For specific API usage, see the sections that follow in this AWS Migration
/// Hub Home Region API reference.
class MigrationHubConfig {
  final _s.JsonProtocol _protocol;
  MigrationHubConfig({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'migrationhub-config',
            signingName: 'mgh',
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

  /// This API sets up the home region for the calling account only.
  ///
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [DryRunOperation].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [homeRegion] :
  /// The name of the home region of the calling account.
  ///
  /// Parameter [target] :
  /// The account for which this command sets up a home region control. The
  /// <code>Target</code> is always of type <code>ACCOUNT</code>.
  ///
  /// Parameter [dryRun] :
  /// Optional Boolean flag to indicate whether any effect should take place. It
  /// tests whether the caller has permission to make the call.
  Future<CreateHomeRegionControlResult> createHomeRegionControl({
    required String homeRegion,
    required Target target,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSMigrationHubMultiAccountService.CreateHomeRegionControl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HomeRegion': homeRegion,
        'Target': target,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );

    return CreateHomeRegionControlResult.fromJson(jsonResponse.body);
  }

  /// This operation deletes the home region configuration for the calling
  /// account. The operation does not delete discovery or migration tracking
  /// data in the home region.
  ///
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [controlId] :
  /// A unique identifier that's generated for each home region control. It's
  /// always a string that begins with "hrc-" followed by 12 lowercase letters
  /// and numbers.
  Future<void> deleteHomeRegionControl({
    required String controlId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSMigrationHubMultiAccountService.DeleteHomeRegionControl'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ControlId': controlId,
      },
    );
  }

  /// This API permits filtering on the <code>ControlId</code> and
  /// <code>HomeRegion</code> fields.
  ///
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [controlId] :
  /// The <code>ControlID</code> is a unique identifier string of your
  /// <code>HomeRegionControl</code> object.
  ///
  /// Parameter [homeRegion] :
  /// The name of the home region you'd like to view.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of filtering results to display per page.
  ///
  /// Parameter [nextToken] :
  /// If a <code>NextToken</code> was returned by a previous call, more results
  /// are available. To retrieve the next page of results, make the call again
  /// using the returned token in <code>NextToken</code>.
  ///
  /// Parameter [target] :
  /// The target parameter specifies the identifier to which the home region is
  /// applied, which is always of type <code>ACCOUNT</code>. It applies the home
  /// region to the current <code>ACCOUNT</code>.
  Future<DescribeHomeRegionControlsResult> describeHomeRegionControls({
    String? controlId,
    String? homeRegion,
    int? maxResults,
    String? nextToken,
    Target? target,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSMigrationHubMultiAccountService.DescribeHomeRegionControls'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (controlId != null) 'ControlId': controlId,
        if (homeRegion != null) 'HomeRegion': homeRegion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (target != null) 'Target': target,
      },
    );

    return DescribeHomeRegionControlsResult.fromJson(jsonResponse.body);
  }

  /// Returns the calling account’s home region, if configured. This API is used
  /// by other AWS services to determine the regional endpoint for calling AWS
  /// Application Discovery Service and Migration Hub. You must call
  /// <code>GetHomeRegion</code> at least once before you call any other AWS
  /// Application Discovery Service and AWS Migration Hub APIs, to obtain the
  /// account's Migration Hub home region.
  ///
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidInputException].
  Future<GetHomeRegionResult> getHomeRegion() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHubMultiAccountService.GetHomeRegion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetHomeRegionResult.fromJson(jsonResponse.body);
  }
}

class CreateHomeRegionControlResult {
  /// This object is the <code>HomeRegionControl</code> object that's returned by
  /// a successful call to <code>CreateHomeRegionControl</code>.
  final HomeRegionControl? homeRegionControl;

  CreateHomeRegionControlResult({
    this.homeRegionControl,
  });

  factory CreateHomeRegionControlResult.fromJson(Map<String, dynamic> json) {
    return CreateHomeRegionControlResult(
      homeRegionControl: json['HomeRegionControl'] != null
          ? HomeRegionControl.fromJson(
              json['HomeRegionControl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final homeRegionControl = this.homeRegionControl;
    return {
      if (homeRegionControl != null) 'HomeRegionControl': homeRegionControl,
    };
  }
}

class DeleteHomeRegionControlResult {
  DeleteHomeRegionControlResult();

  factory DeleteHomeRegionControlResult.fromJson(Map<String, dynamic> _) {
    return DeleteHomeRegionControlResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeHomeRegionControlsResult {
  /// An array that contains your <code>HomeRegionControl</code> objects.
  final List<HomeRegionControl>? homeRegionControls;

  /// If a <code>NextToken</code> was returned by a previous call, more results
  /// are available. To retrieve the next page of results, make the call again
  /// using the returned token in <code>NextToken</code>.
  final String? nextToken;

  DescribeHomeRegionControlsResult({
    this.homeRegionControls,
    this.nextToken,
  });

  factory DescribeHomeRegionControlsResult.fromJson(Map<String, dynamic> json) {
    return DescribeHomeRegionControlsResult(
      homeRegionControls: (json['HomeRegionControls'] as List?)
          ?.whereNotNull()
          .map((e) => HomeRegionControl.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final homeRegionControls = this.homeRegionControls;
    final nextToken = this.nextToken;
    return {
      if (homeRegionControls != null) 'HomeRegionControls': homeRegionControls,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetHomeRegionResult {
  /// The name of the home region of the calling account.
  final String? homeRegion;

  GetHomeRegionResult({
    this.homeRegion,
  });

  factory GetHomeRegionResult.fromJson(Map<String, dynamic> json) {
    return GetHomeRegionResult(
      homeRegion: json['HomeRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final homeRegion = this.homeRegion;
    return {
      if (homeRegion != null) 'HomeRegion': homeRegion,
    };
  }
}

/// A home region control is an object that specifies the home region for an
/// account, with some additional information. It contains a target (always of
/// type <code>ACCOUNT</code>), an ID, and a time at which the home region was
/// set.
class HomeRegionControl {
  /// A unique identifier that's generated for each home region control. It's
  /// always a string that begins with "hrc-" followed by 12 lowercase letters and
  /// numbers.
  final String? controlId;

  /// The AWS Region that's been set as home region. For example, "us-west-2" or
  /// "eu-central-1" are valid home regions.
  final String? homeRegion;

  /// A timestamp representing the time when the customer called
  /// <code>CreateHomeregionControl</code> and set the home region for the
  /// account.
  final DateTime? requestedTime;

  /// The target parameter specifies the identifier to which the home region is
  /// applied, which is always an <code>ACCOUNT</code>. It applies the home region
  /// to the current <code>ACCOUNT</code>.
  final Target? target;

  HomeRegionControl({
    this.controlId,
    this.homeRegion,
    this.requestedTime,
    this.target,
  });

  factory HomeRegionControl.fromJson(Map<String, dynamic> json) {
    return HomeRegionControl(
      controlId: json['ControlId'] as String?,
      homeRegion: json['HomeRegion'] as String?,
      requestedTime: timeStampFromJson(json['RequestedTime']),
      target: json['Target'] != null
          ? Target.fromJson(json['Target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final controlId = this.controlId;
    final homeRegion = this.homeRegion;
    final requestedTime = this.requestedTime;
    final target = this.target;
    return {
      if (controlId != null) 'ControlId': controlId,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (requestedTime != null)
        'RequestedTime': unixTimestampToJson(requestedTime),
      if (target != null) 'Target': target,
    };
  }
}

/// The target parameter specifies the identifier to which the home region is
/// applied, which is always an <code>ACCOUNT</code>. It applies the home region
/// to the current <code>ACCOUNT</code>.
class Target {
  /// The target type is always an <code>ACCOUNT</code>.
  final TargetType type;

  /// The <code>TargetID</code> is a 12-character identifier of the
  /// <code>ACCOUNT</code> for which the control was created. (This must be the
  /// current account.)
  final String? id;

  Target({
    required this.type,
    this.id,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      type: (json['Type'] as String).toTargetType(),
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final id = this.id;
    return {
      'Type': type.toValue(),
      if (id != null) 'Id': id,
    };
  }
}

enum TargetType {
  account,
}

extension TargetTypeValueExtension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.account:
        return 'ACCOUNT';
    }
  }
}

extension TargetTypeFromString on String {
  TargetType toTargetType() {
    switch (this) {
      case 'ACCOUNT':
        return TargetType.account;
    }
    throw Exception('$this is not known in enum TargetType');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class DryRunOperation extends _s.GenericAwsException {
  DryRunOperation({String? type, String? message})
      : super(type: type, code: 'DryRunOperation', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'DryRunOperation': (type, message) =>
      DryRunOperation(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
