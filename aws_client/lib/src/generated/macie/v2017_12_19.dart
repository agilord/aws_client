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

/// Amazon Macie Classic has been discontinued and is no longer available.
class Macie {
  final _s.JsonProtocol _protocol;
  Macie({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'macie',
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

  /// (Discontinued) Associates a specified Amazon Web Services account with
  /// Amazon Macie Classic as a member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  ///
  /// Parameter [memberAccountId] :
  /// (Discontinued) The ID of the Amazon Web Services account that you want to
  /// associate with Amazon Macie Classic as a member account.
  Future<void> associateMemberAccount({
    required String memberAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.AssociateMemberAccount'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'memberAccountId': memberAccountId,
      },
    );
  }

  /// (Discontinued) Associates specified S3 resources with Amazon Macie Classic
  /// for monitoring and data classification. If <code>memberAccountId</code>
  /// isn't specified, the action associates specified S3 resources with Macie
  /// Classic for the current Macie Classic administrator account. If
  /// <code>memberAccountId</code> is specified, the action associates specified
  /// S3 resources with Macie Classic for the specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3Resources] :
  /// (Discontinued) The S3 resources that you want to associate with Amazon
  /// Macie Classic for monitoring and data classification.
  ///
  /// Parameter [memberAccountId] :
  /// (Discontinued) The ID of the Amazon Macie Classic member account whose
  /// resources you want to associate with Macie Classic.
  Future<AssociateS3ResourcesResult> associateS3Resources({
    required List<S3ResourceClassification> s3Resources,
    String? memberAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.AssociateS3Resources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        's3Resources': s3Resources,
        if (memberAccountId != null) 'memberAccountId': memberAccountId,
      },
    );

    return AssociateS3ResourcesResult.fromJson(jsonResponse.body);
  }

  /// (Discontinued) Removes the specified member account from Amazon Macie
  /// Classic.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalException].
  ///
  /// Parameter [memberAccountId] :
  /// (Discontinued) The ID of the member account that you want to remove from
  /// Amazon Macie Classic.
  Future<void> disassociateMemberAccount({
    required String memberAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.DisassociateMemberAccount'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'memberAccountId': memberAccountId,
      },
    );
  }

  /// (Discontinued) Removes specified S3 resources from being monitored by
  /// Amazon Macie Classic. If <code>memberAccountId</code> isn't specified, the
  /// action removes specified S3 resources from Macie Classic for the current
  /// Macie Classic administrator account. If <code>memberAccountId</code> is
  /// specified, the action removes specified S3 resources from Macie Classic
  /// for the specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  ///
  /// Parameter [associatedS3Resources] :
  /// (Discontinued) The S3 resources (buckets or prefixes) that you want to
  /// remove from being monitored and classified by Amazon Macie Classic.
  ///
  /// Parameter [memberAccountId] :
  /// (Discontinued) The ID of the Amazon Macie Classic member account whose
  /// resources you want to remove from being monitored by Macie Classic.
  Future<DisassociateS3ResourcesResult> disassociateS3Resources({
    required List<S3Resource> associatedS3Resources,
    String? memberAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.DisassociateS3Resources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'associatedS3Resources': associatedS3Resources,
        if (memberAccountId != null) 'memberAccountId': memberAccountId,
      },
    );

    return DisassociateS3ResourcesResult.fromJson(jsonResponse.body);
  }

  /// (Discontinued) Lists all Amazon Macie Classic member accounts for the
  /// current Macie Classic administrator account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [maxResults] :
  /// (Discontinued) Use this parameter to indicate the maximum number of items
  /// that you want in the response. The default value is 250.
  ///
  /// Parameter [nextToken] :
  /// (Discontinued) Use this parameter when paginating results. Set the value
  /// of this parameter to null on your first call to the
  /// <code>ListMemberAccounts</code> action. Subsequent calls to the action
  /// fill <code>nextToken</code> in the request with the value of
  /// <code>nextToken</code> from the previous response to continue listing
  /// data.
  Future<ListMemberAccountsResult> listMemberAccounts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.ListMemberAccounts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListMemberAccountsResult.fromJson(jsonResponse.body);
  }

  /// (Discontinued) Lists all the S3 resources associated with Amazon Macie
  /// Classic. If <code>memberAccountId</code> isn't specified, the action lists
  /// the S3 resources associated with Macie Classic for the current Macie
  /// Classic administrator account. If <code>memberAccountId</code> is
  /// specified, the action lists the S3 resources associated with Macie Classic
  /// for the specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// (Discontinued) Use this parameter to indicate the maximum number of items
  /// that you want in the response. The default value is 250.
  ///
  /// Parameter [memberAccountId] :
  /// (Discontinued) The Amazon Macie Classic member account ID whose associated
  /// S3 resources you want to list.
  ///
  /// Parameter [nextToken] :
  /// (Discontinued) Use this parameter when paginating results. Set its value
  /// to null on your first call to the <code>ListS3Resources</code> action.
  /// Subsequent calls to the action fill <code>nextToken</code> in the request
  /// with the value of <code>nextToken</code> from the previous response to
  /// continue listing data.
  Future<ListS3ResourcesResult> listS3Resources({
    int? maxResults,
    String? memberAccountId,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.ListS3Resources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (memberAccountId != null) 'memberAccountId': memberAccountId,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListS3ResourcesResult.fromJson(jsonResponse.body);
  }

  /// (Discontinued) Updates the classification types for the specified S3
  /// resources. If <code>memberAccountId</code> isn't specified, the action
  /// updates the classification types of the S3 resources associated with
  /// Amazon Macie Classic for the current Macie Classic administrator account.
  /// If <code>memberAccountId</code> is specified, the action updates the
  /// classification types of the S3 resources associated with Macie Classic for
  /// the specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3ResourcesUpdate] :
  /// (Discontinued) The S3 resources whose classification types you want to
  /// update.
  ///
  /// Parameter [memberAccountId] :
  /// (Discontinued) The Amazon Web Services account ID of the Amazon Macie
  /// Classic member account whose S3 resources' classification types you want
  /// to update.
  Future<UpdateS3ResourcesResult> updateS3Resources({
    required List<S3ResourceClassificationUpdate> s3ResourcesUpdate,
    String? memberAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.UpdateS3Resources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        's3ResourcesUpdate': s3ResourcesUpdate,
        if (memberAccountId != null) 'memberAccountId': memberAccountId,
      },
    );

    return UpdateS3ResourcesResult.fromJson(jsonResponse.body);
  }
}

class AssociateS3ResourcesResult {
  /// (Discontinued) S3 resources that couldn't be associated with Amazon Macie
  /// Classic. An error code and an error message are provided for each failed
  /// item.
  final List<FailedS3Resource>? failedS3Resources;

  AssociateS3ResourcesResult({
    this.failedS3Resources,
  });

  factory AssociateS3ResourcesResult.fromJson(Map<String, dynamic> json) {
    return AssociateS3ResourcesResult(
      failedS3Resources: (json['failedS3Resources'] as List?)
          ?.whereNotNull()
          .map((e) => FailedS3Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedS3Resources = this.failedS3Resources;
    return {
      if (failedS3Resources != null) 'failedS3Resources': failedS3Resources,
    };
  }
}

/// (Discontinued) The classification type that Amazon Macie Classic applies to
/// the associated S3 resources.
class ClassificationType {
  /// (Discontinued) A continuous classification of the objects that are added to
  /// a specified S3 bucket. Amazon Macie Classic begins performing continuous
  /// classification after a bucket is successfully associated with Macie Classic.
  final S3ContinuousClassificationType continuous;

  /// (Discontinued) A one-time classification of all of the existing objects in a
  /// specified S3 bucket.
  final S3OneTimeClassificationType oneTime;

  ClassificationType({
    required this.continuous,
    required this.oneTime,
  });

  factory ClassificationType.fromJson(Map<String, dynamic> json) {
    return ClassificationType(
      continuous:
          (json['continuous'] as String).toS3ContinuousClassificationType(),
      oneTime: (json['oneTime'] as String).toS3OneTimeClassificationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final continuous = this.continuous;
    final oneTime = this.oneTime;
    return {
      'continuous': continuous.toValue(),
      'oneTime': oneTime.toValue(),
    };
  }
}

/// (Discontinued) The classification type that Amazon Macie Classic applies to
/// the associated S3 resources. At least one of the classification types
/// (<code>oneTime</code> or <code>continuous</code>) must be specified.
class ClassificationTypeUpdate {
  /// (Discontinued) A continuous classification of the objects that are added to
  /// a specified S3 bucket. Amazon Macie Classic begins performing continuous
  /// classification after a bucket is successfully associated with Macie Classic.
  final S3ContinuousClassificationType? continuous;

  /// (Discontinued) A one-time classification of all of the existing objects in a
  /// specified S3 bucket.
  final S3OneTimeClassificationType? oneTime;

  ClassificationTypeUpdate({
    this.continuous,
    this.oneTime,
  });

  Map<String, dynamic> toJson() {
    final continuous = this.continuous;
    final oneTime = this.oneTime;
    return {
      if (continuous != null) 'continuous': continuous.toValue(),
      if (oneTime != null) 'oneTime': oneTime.toValue(),
    };
  }
}

class DisassociateS3ResourcesResult {
  /// (Discontinued) S3 resources that couldn't be removed from being monitored
  /// and classified by Amazon Macie Classic. An error code and an error message
  /// are provided for each failed item.
  final List<FailedS3Resource>? failedS3Resources;

  DisassociateS3ResourcesResult({
    this.failedS3Resources,
  });

  factory DisassociateS3ResourcesResult.fromJson(Map<String, dynamic> json) {
    return DisassociateS3ResourcesResult(
      failedS3Resources: (json['failedS3Resources'] as List?)
          ?.whereNotNull()
          .map((e) => FailedS3Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedS3Resources = this.failedS3Resources;
    return {
      if (failedS3Resources != null) 'failedS3Resources': failedS3Resources,
    };
  }
}

/// (Discontinued) Includes details about the failed S3 resources.
class FailedS3Resource {
  /// (Discontinued) The status code of a failed item.
  final String? errorCode;

  /// (Discontinued) The error message of a failed item.
  final String? errorMessage;

  /// (Discontinued) The failed S3 resources.
  final S3Resource? failedItem;

  FailedS3Resource({
    this.errorCode,
    this.errorMessage,
    this.failedItem,
  });

  factory FailedS3Resource.fromJson(Map<String, dynamic> json) {
    return FailedS3Resource(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      failedItem: json['failedItem'] != null
          ? S3Resource.fromJson(json['failedItem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final failedItem = this.failedItem;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (failedItem != null) 'failedItem': failedItem,
    };
  }
}

class ListMemberAccountsResult {
  /// (Discontinued) A list of the Amazon Macie Classic member accounts returned
  /// by the action. The current Macie Classic administrator account is also
  /// included in this list.
  final List<MemberAccount>? memberAccounts;

  /// (Discontinued) When a response is generated, if there is more data to be
  /// listed, this parameter is present in the response and contains the value to
  /// use for the <code>nextToken</code> parameter in a subsequent pagination
  /// request. If there is no more data to be listed, this parameter is set to
  /// null.
  final String? nextToken;

  ListMemberAccountsResult({
    this.memberAccounts,
    this.nextToken,
  });

  factory ListMemberAccountsResult.fromJson(Map<String, dynamic> json) {
    return ListMemberAccountsResult(
      memberAccounts: (json['memberAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => MemberAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memberAccounts = this.memberAccounts;
    final nextToken = this.nextToken;
    return {
      if (memberAccounts != null) 'memberAccounts': memberAccounts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListS3ResourcesResult {
  /// (Discontinued) When a response is generated, if there is more data to be
  /// listed, this parameter is present in the response and contains the value to
  /// use for the <code>nextToken</code> parameter in a subsequent pagination
  /// request. If there is no more data to be listed, this parameter is set to
  /// null.
  final String? nextToken;

  /// (Discontinued) A list of the associated S3 resources returned by the action.
  final List<S3ResourceClassification>? s3Resources;

  ListS3ResourcesResult({
    this.nextToken,
    this.s3Resources,
  });

  factory ListS3ResourcesResult.fromJson(Map<String, dynamic> json) {
    return ListS3ResourcesResult(
      nextToken: json['nextToken'] as String?,
      s3Resources: (json['s3Resources'] as List?)
          ?.whereNotNull()
          .map((e) =>
              S3ResourceClassification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final s3Resources = this.s3Resources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (s3Resources != null) 's3Resources': s3Resources,
    };
  }
}

/// (Discontinued) Contains information about the Amazon Macie Classic member
/// account.
class MemberAccount {
  /// (Discontinued) The Amazon Web Services account ID of the Amazon Macie
  /// Classic member account.
  final String? accountId;

  MemberAccount({
    this.accountId,
  });

  factory MemberAccount.fromJson(Map<String, dynamic> json) {
    return MemberAccount(
      accountId: json['accountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      if (accountId != null) 'accountId': accountId,
    };
  }
}

enum S3ContinuousClassificationType {
  full,
}

extension S3ContinuousClassificationTypeValueExtension
    on S3ContinuousClassificationType {
  String toValue() {
    switch (this) {
      case S3ContinuousClassificationType.full:
        return 'FULL';
    }
  }
}

extension S3ContinuousClassificationTypeFromString on String {
  S3ContinuousClassificationType toS3ContinuousClassificationType() {
    switch (this) {
      case 'FULL':
        return S3ContinuousClassificationType.full;
    }
    throw Exception(
        '$this is not known in enum S3ContinuousClassificationType');
  }
}

enum S3OneTimeClassificationType {
  full,
  none,
}

extension S3OneTimeClassificationTypeValueExtension
    on S3OneTimeClassificationType {
  String toValue() {
    switch (this) {
      case S3OneTimeClassificationType.full:
        return 'FULL';
      case S3OneTimeClassificationType.none:
        return 'NONE';
    }
  }
}

extension S3OneTimeClassificationTypeFromString on String {
  S3OneTimeClassificationType toS3OneTimeClassificationType() {
    switch (this) {
      case 'FULL':
        return S3OneTimeClassificationType.full;
      case 'NONE':
        return S3OneTimeClassificationType.none;
    }
    throw Exception('$this is not known in enum S3OneTimeClassificationType');
  }
}

/// (Discontinued) Contains information about the S3 resource. This data type is
/// used as a request parameter in the <code>DisassociateS3Resources</code>
/// action and can be used as a response parameter in the
/// <code>AssociateS3Resources</code> and <code>UpdateS3Resources</code>
/// actions.
class S3Resource {
  /// (Discontinued) The name of the S3 bucket.
  final String bucketName;

  /// (Discontinued) The prefix of the S3 bucket.
  final String? prefix;

  S3Resource({
    required this.bucketName,
    this.prefix,
  });

  factory S3Resource.fromJson(Map<String, dynamic> json) {
    return S3Resource(
      bucketName: json['bucketName'] as String,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final prefix = this.prefix;
    return {
      'bucketName': bucketName,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// (Discontinued) The S3 resources that you want to associate with Amazon Macie
/// Classic for monitoring and data classification. This data type is used as a
/// request parameter in the <code>AssociateS3Resources</code> action and a
/// response parameter in the <code>ListS3Resources</code> action.
class S3ResourceClassification {
  /// (Discontinued) The name of the S3 bucket that you want to associate with
  /// Amazon Macie Classic.
  final String bucketName;

  /// (Discontinued) The classification type that you want to specify for the
  /// resource associated with Amazon Macie Classic.
  final ClassificationType classificationType;

  /// (Discontinued) The prefix of the S3 bucket that you want to associate with
  /// Amazon Macie Classic.
  final String? prefix;

  S3ResourceClassification({
    required this.bucketName,
    required this.classificationType,
    this.prefix,
  });

  factory S3ResourceClassification.fromJson(Map<String, dynamic> json) {
    return S3ResourceClassification(
      bucketName: json['bucketName'] as String,
      classificationType: ClassificationType.fromJson(
          json['classificationType'] as Map<String, dynamic>),
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final classificationType = this.classificationType;
    final prefix = this.prefix;
    return {
      'bucketName': bucketName,
      'classificationType': classificationType,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// (Discontinued) The S3 resources whose classification types you want to
/// update. This data type is used as a request parameter in the
/// <code>UpdateS3Resources</code> action.
class S3ResourceClassificationUpdate {
  /// (Discontinued) The name of the S3 bucket whose classification types you want
  /// to update.
  final String bucketName;

  /// (Discontinued) The classification type that you want to update for the
  /// resource associated with Amazon Macie Classic.
  final ClassificationTypeUpdate classificationTypeUpdate;

  /// (Discontinued) The prefix of the S3 bucket whose classification types you
  /// want to update.
  final String? prefix;

  S3ResourceClassificationUpdate({
    required this.bucketName,
    required this.classificationTypeUpdate,
    this.prefix,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final classificationTypeUpdate = this.classificationTypeUpdate;
    final prefix = this.prefix;
    return {
      'bucketName': bucketName,
      'classificationTypeUpdate': classificationTypeUpdate,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

class UpdateS3ResourcesResult {
  /// (Discontinued) The S3 resources whose classification types can't be updated.
  /// An error code and an error message are provided for each failed item.
  final List<FailedS3Resource>? failedS3Resources;

  UpdateS3ResourcesResult({
    this.failedS3Resources,
  });

  factory UpdateS3ResourcesResult.fromJson(Map<String, dynamic> json) {
    return UpdateS3ResourcesResult(
      failedS3Resources: (json['failedS3Resources'] as List?)
          ?.whereNotNull()
          .map((e) => FailedS3Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedS3Resources = this.failedS3Resources;
    return {
      if (failedS3Resources != null) 'failedS3Resources': failedS3Resources,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
};
