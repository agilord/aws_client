// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Amazon Macie Classic is a security service that uses machine learning to
/// automatically discover, classify, and protect sensitive data in AWS. Macie
/// Classic recognizes sensitive data such as personally identifiable
/// information (PII) or intellectual property, and provides you with dashboards
/// and alerts that give visibility into how this data is being accessed or
/// moved. For more information, see the <a
/// href="https://docs.aws.amazon.com/macie/latest/userguide/what-is-macie.html">Amazon
/// Macie Classic User Guide</a>.
class Macie {
  final _s.JsonProtocol _protocol;
  Macie({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'macie',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates a specified AWS account with Amazon Macie Classic as a member
  /// account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  ///
  /// Parameter [memberAccountId] :
  /// The ID of the AWS account that you want to associate with Amazon Macie
  /// Classic as a member account.
  Future<void> associateMemberAccount({
    required String memberAccountId,
  }) async {
    ArgumentError.checkNotNull(memberAccountId, 'memberAccountId');
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

  /// Associates specified S3 resources with Amazon Macie Classic for monitoring
  /// and data classification. If memberAccountId isn't specified, the action
  /// associates specified S3 resources with Macie Classic for the current Macie
  /// Classic administrator account. If memberAccountId is specified, the action
  /// associates specified S3 resources with Macie Classic for the specified
  /// member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3Resources] :
  /// The S3 resources that you want to associate with Amazon Macie Classic for
  /// monitoring and data classification.
  ///
  /// Parameter [memberAccountId] :
  /// The ID of the Amazon Macie Classic member account whose resources you want
  /// to associate with Macie Classic.
  Future<AssociateS3ResourcesResult> associateS3Resources({
    required List<S3ResourceClassification> s3Resources,
    String? memberAccountId,
  }) async {
    ArgumentError.checkNotNull(s3Resources, 's3Resources');
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

  /// Removes the specified member account from Amazon Macie Classic.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalException].
  ///
  /// Parameter [memberAccountId] :
  /// The ID of the member account that you want to remove from Amazon Macie
  /// Classic.
  Future<void> disassociateMemberAccount({
    required String memberAccountId,
  }) async {
    ArgumentError.checkNotNull(memberAccountId, 'memberAccountId');
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

  /// Removes specified S3 resources from being monitored by Amazon Macie
  /// Classic. If memberAccountId isn't specified, the action removes specified
  /// S3 resources from Macie Classic for the current Macie Classic
  /// administrator account. If memberAccountId is specified, the action removes
  /// specified S3 resources from Macie Classic for the specified member
  /// account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  ///
  /// Parameter [associatedS3Resources] :
  /// The S3 resources (buckets or prefixes) that you want to remove from being
  /// monitored and classified by Amazon Macie Classic.
  ///
  /// Parameter [memberAccountId] :
  /// The ID of the Amazon Macie Classic member account whose resources you want
  /// to remove from being monitored by Macie Classic.
  Future<DisassociateS3ResourcesResult> disassociateS3Resources({
    required List<S3Resource> associatedS3Resources,
    String? memberAccountId,
  }) async {
    ArgumentError.checkNotNull(associatedS3Resources, 'associatedS3Resources');
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

  /// Lists all Amazon Macie Classic member accounts for the current Macie
  /// Classic administrator account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [maxResults] :
  /// Use this parameter to indicate the maximum number of items that you want
  /// in the response. The default value is 250.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the ListMemberAccounts action.
  /// Subsequent calls to the action fill nextToken in the request with the
  /// value of nextToken from the previous response to continue listing data.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      500,
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

  /// Lists all the S3 resources associated with Amazon Macie Classic. If
  /// memberAccountId isn't specified, the action lists the S3 resources
  /// associated with Macie Classic for the current Macie Classic administrator
  /// account. If memberAccountId is specified, the action lists the S3
  /// resources associated with Macie Classic for the specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  ///
  /// Parameter [maxResults] :
  /// Use this parameter to indicate the maximum number of items that you want
  /// in the response. The default value is 250.
  ///
  /// Parameter [memberAccountId] :
  /// The Amazon Macie Classic member account ID whose associated S3 resources
  /// you want to list.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results. Set its value to null on your
  /// first call to the ListS3Resources action. Subsequent calls to the action
  /// fill nextToken in the request with the value of nextToken from the
  /// previous response to continue listing data.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      500,
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

  /// Updates the classification types for the specified S3 resources. If
  /// memberAccountId isn't specified, the action updates the classification
  /// types of the S3 resources associated with Amazon Macie Classic for the
  /// current Macie Classic administrator account. If memberAccountId is
  /// specified, the action updates the classification types of the S3 resources
  /// associated with Macie Classic for the specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3ResourcesUpdate] :
  /// The S3 resources whose classification types you want to update.
  ///
  /// Parameter [memberAccountId] :
  /// The AWS ID of the Amazon Macie Classic member account whose S3 resources'
  /// classification types you want to update.
  Future<UpdateS3ResourcesResult> updateS3Resources({
    required List<S3ResourceClassificationUpdate> s3ResourcesUpdate,
    String? memberAccountId,
  }) async {
    ArgumentError.checkNotNull(s3ResourcesUpdate, 's3ResourcesUpdate');
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
  /// S3 resources that couldn't be associated with Amazon Macie Classic. An error
  /// code and an error message are provided for each failed item.
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

/// The classification type that Amazon Macie Classic applies to the associated
/// S3 resources.
class ClassificationType {
  /// A continuous classification of the objects that are added to a specified S3
  /// bucket. Amazon Macie Classic begins performing continuous classification
  /// after a bucket is successfully associated with Macie Classic.
  final S3ContinuousClassificationType continuous;

  /// A one-time classification of all of the existing objects in a specified S3
  /// bucket.
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

/// The classification type that Amazon Macie Classic applies to the associated
/// S3 resources. At least one of the classification types (oneTime or
/// continuous) must be specified.
class ClassificationTypeUpdate {
  /// A continuous classification of the objects that are added to a specified S3
  /// bucket. Amazon Macie Classic begins performing continuous classification
  /// after a bucket is successfully associated with Macie Classic.
  final S3ContinuousClassificationType? continuous;

  /// A one-time classification of all of the existing objects in a specified S3
  /// bucket.
  final S3OneTimeClassificationType? oneTime;

  ClassificationTypeUpdate({
    this.continuous,
    this.oneTime,
  });

  factory ClassificationTypeUpdate.fromJson(Map<String, dynamic> json) {
    return ClassificationTypeUpdate(
      continuous:
          (json['continuous'] as String?)?.toS3ContinuousClassificationType(),
      oneTime: (json['oneTime'] as String?)?.toS3OneTimeClassificationType(),
    );
  }

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
  /// S3 resources that couldn't be removed from being monitored and classified by
  /// Amazon Macie Classic. An error code and an error message are provided for
  /// each failed item.
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

/// Includes details about the failed S3 resources.
class FailedS3Resource {
  /// The status code of a failed item.
  final String? errorCode;

  /// The error message of a failed item.
  final String? errorMessage;

  /// The failed S3 resources.
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
  /// A list of the Amazon Macie Classic member accounts returned by the action.
  /// The current Macie Classic administrator account is also included in this
  /// list.
  final List<MemberAccount>? memberAccounts;

  /// When a response is generated, if there is more data to be listed, this
  /// parameter is present in the response and contains the value to use for the
  /// nextToken parameter in a subsequent pagination request. If there is no more
  /// data to be listed, this parameter is set to null.
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
  /// When a response is generated, if there is more data to be listed, this
  /// parameter is present in the response and contains the value to use for the
  /// nextToken parameter in a subsequent pagination request. If there is no more
  /// data to be listed, this parameter is set to null.
  final String? nextToken;

  /// A list of the associated S3 resources returned by the action.
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

/// Contains information about the Amazon Macie Classic member account.
class MemberAccount {
  /// The AWS account ID of the Amazon Macie Classic member account.
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

extension on S3ContinuousClassificationType {
  String toValue() {
    switch (this) {
      case S3ContinuousClassificationType.full:
        return 'FULL';
    }
  }
}

extension on String {
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

extension on S3OneTimeClassificationType {
  String toValue() {
    switch (this) {
      case S3OneTimeClassificationType.full:
        return 'FULL';
      case S3OneTimeClassificationType.none:
        return 'NONE';
    }
  }
}

extension on String {
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

/// Contains information about the S3 resource. This data type is used as a
/// request parameter in the DisassociateS3Resources action and can be used as a
/// response parameter in the AssociateS3Resources and UpdateS3Resources
/// actions.
class S3Resource {
  /// The name of the S3 bucket.
  final String bucketName;

  /// The prefix of the S3 bucket.
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

/// The S3 resources that you want to associate with Amazon Macie Classic for
/// monitoring and data classification. This data type is used as a request
/// parameter in the AssociateS3Resources action and a response parameter in the
/// ListS3Resources action.
class S3ResourceClassification {
  /// The name of the S3 bucket that you want to associate with Amazon Macie
  /// Classic.
  final String bucketName;

  /// The classification type that you want to specify for the resource associated
  /// with Amazon Macie Classic.
  final ClassificationType classificationType;

  /// The prefix of the S3 bucket that you want to associate with Amazon Macie
  /// Classic.
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

/// The S3 resources whose classification types you want to update. This data
/// type is used as a request parameter in the UpdateS3Resources action.
class S3ResourceClassificationUpdate {
  /// The name of the S3 bucket whose classification types you want to update.
  final String bucketName;

  /// The classification type that you want to update for the resource associated
  /// with Amazon Macie Classic.
  final ClassificationTypeUpdate classificationTypeUpdate;

  /// The prefix of the S3 bucket whose classification types you want to update.
  final String? prefix;

  S3ResourceClassificationUpdate({
    required this.bucketName,
    required this.classificationTypeUpdate,
    this.prefix,
  });

  factory S3ResourceClassificationUpdate.fromJson(Map<String, dynamic> json) {
    return S3ResourceClassificationUpdate(
      bucketName: json['bucketName'] as String,
      classificationTypeUpdate: ClassificationTypeUpdate.fromJson(
          json['classificationTypeUpdate'] as Map<String, dynamic>),
      prefix: json['prefix'] as String?,
    );
  }

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
  /// The S3 resources whose classification types can't be updated. An error code
  /// and an error message are provided for each failed item.
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
