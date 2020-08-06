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

part 'macie-2017-12-19.g.dart';

/// Amazon Macie is a security service that uses machine learning to
/// automatically discover, classify, and protect sensitive data in AWS. Macie
/// recognizes sensitive data such as personally identifiable information (PII)
/// or intellectual property, and provides you with dashboards and alerts that
/// give visibility into how this data is being accessed or moved. For more
/// information, see the <a
/// href="https://docs.aws.amazon.com/macie/latest/userguide/what-is-macie.html">Macie
/// User Guide</a>.
class Macie {
  final _s.JsonProtocol _protocol;
  Macie({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'macie',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates a specified AWS account with Amazon Macie as a member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  ///
  /// Parameter [memberAccountId] :
  /// The ID of the AWS account that you want to associate with Amazon Macie as
  /// a member account.
  Future<void> associateMemberAccount({
    @_s.required String memberAccountId,
  }) async {
    ArgumentError.checkNotNull(memberAccountId, 'memberAccountId');
    _s.validateStringPattern(
      'memberAccountId',
      memberAccountId,
      r'''[0-9]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.AssociateMemberAccount'
    };
    final jsonResponse = await _protocol.send(
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

  /// Associates specified S3 resources with Amazon Macie for monitoring and
  /// data classification. If memberAccountId isn't specified, the action
  /// associates specified S3 resources with Macie for the current master
  /// account. If memberAccountId is specified, the action associates specified
  /// S3 resources with Macie for the specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3Resources] :
  /// The S3 resources that you want to associate with Amazon Macie for
  /// monitoring and data classification.
  ///
  /// Parameter [memberAccountId] :
  /// The ID of the Amazon Macie member account whose resources you want to
  /// associate with Macie.
  Future<AssociateS3ResourcesResult> associateS3Resources({
    @_s.required List<S3ResourceClassification> s3Resources,
    String memberAccountId,
  }) async {
    ArgumentError.checkNotNull(s3Resources, 's3Resources');
    _s.validateStringPattern(
      'memberAccountId',
      memberAccountId,
      r'''[0-9]{12}''',
    );
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
        'memberAccountId': memberAccountId,
      },
    );

    return AssociateS3ResourcesResult.fromJson(jsonResponse.body);
  }

  /// Removes the specified member account from Amazon Macie.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalException].
  ///
  /// Parameter [memberAccountId] :
  /// The ID of the member account that you want to remove from Amazon Macie.
  Future<void> disassociateMemberAccount({
    @_s.required String memberAccountId,
  }) async {
    ArgumentError.checkNotNull(memberAccountId, 'memberAccountId');
    _s.validateStringPattern(
      'memberAccountId',
      memberAccountId,
      r'''[0-9]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MacieService.DisassociateMemberAccount'
    };
    final jsonResponse = await _protocol.send(
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

  /// Removes specified S3 resources from being monitored by Amazon Macie. If
  /// memberAccountId isn't specified, the action removes specified S3 resources
  /// from Macie for the current master account. If memberAccountId is
  /// specified, the action removes specified S3 resources from Macie for the
  /// specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  ///
  /// Parameter [associatedS3Resources] :
  /// The S3 resources (buckets or prefixes) that you want to remove from being
  /// monitored and classified by Amazon Macie.
  ///
  /// Parameter [memberAccountId] :
  /// The ID of the Amazon Macie member account whose resources you want to
  /// remove from being monitored by Amazon Macie.
  Future<DisassociateS3ResourcesResult> disassociateS3Resources({
    @_s.required List<S3Resource> associatedS3Resources,
    String memberAccountId,
  }) async {
    ArgumentError.checkNotNull(associatedS3Resources, 'associatedS3Resources');
    _s.validateStringPattern(
      'memberAccountId',
      memberAccountId,
      r'''[0-9]{12}''',
    );
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
        'memberAccountId': memberAccountId,
      },
    );

    return DisassociateS3ResourcesResult.fromJson(jsonResponse.body);
  }

  /// Lists all Amazon Macie member accounts for the current Amazon Macie master
  /// account.
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
    int maxResults,
    String nextToken,
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
        'maxResults': maxResults,
        'nextToken': nextToken,
      },
    );

    return ListMemberAccountsResult.fromJson(jsonResponse.body);
  }

  /// Lists all the S3 resources associated with Amazon Macie. If
  /// memberAccountId isn't specified, the action lists the S3 resources
  /// associated with Amazon Macie for the current master account. If
  /// memberAccountId is specified, the action lists the S3 resources associated
  /// with Amazon Macie for the specified member account.
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
  /// The Amazon Macie member account ID whose associated S3 resources you want
  /// to list.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results. Set its value to null on your
  /// first call to the ListS3Resources action. Subsequent calls to the action
  /// fill nextToken in the request with the value of nextToken from the
  /// previous response to continue listing data.
  Future<ListS3ResourcesResult> listS3Resources({
    int maxResults,
    String memberAccountId,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    _s.validateStringPattern(
      'memberAccountId',
      memberAccountId,
      r'''[0-9]{12}''',
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
        'maxResults': maxResults,
        'memberAccountId': memberAccountId,
        'nextToken': nextToken,
      },
    );

    return ListS3ResourcesResult.fromJson(jsonResponse.body);
  }

  /// Updates the classification types for the specified S3 resources. If
  /// memberAccountId isn't specified, the action updates the classification
  /// types of the S3 resources associated with Amazon Macie for the current
  /// master account. If memberAccountId is specified, the action updates the
  /// classification types of the S3 resources associated with Amazon Macie for
  /// the specified member account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  ///
  /// Parameter [s3ResourcesUpdate] :
  /// The S3 resources whose classification types you want to update.
  ///
  /// Parameter [memberAccountId] :
  /// The AWS ID of the Amazon Macie member account whose S3 resources'
  /// classification types you want to update.
  Future<UpdateS3ResourcesResult> updateS3Resources({
    @_s.required List<S3ResourceClassificationUpdate> s3ResourcesUpdate,
    String memberAccountId,
  }) async {
    ArgumentError.checkNotNull(s3ResourcesUpdate, 's3ResourcesUpdate');
    _s.validateStringPattern(
      'memberAccountId',
      memberAccountId,
      r'''[0-9]{12}''',
    );
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
        'memberAccountId': memberAccountId,
      },
    );

    return UpdateS3ResourcesResult.fromJson(jsonResponse.body);
  }
}

/// You do not have required permissions to access the requested resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessDeniedException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;
  @_s.JsonKey(name: 'resourceType')
  final String resourceType;

  AccessDeniedException({
    this.message,
    this.resourceType,
  });
  factory AccessDeniedException.fromJson(Map<String, dynamic> json) =>
      _$AccessDeniedExceptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateS3ResourcesResult {
  /// S3 resources that couldn't be associated with Amazon Macie. An error code
  /// and an error message are provided for each failed item.
  @_s.JsonKey(name: 'failedS3Resources')
  final List<FailedS3Resource> failedS3Resources;

  AssociateS3ResourcesResult({
    this.failedS3Resources,
  });
  factory AssociateS3ResourcesResult.fromJson(Map<String, dynamic> json) =>
      _$AssociateS3ResourcesResultFromJson(json);
}

/// The classification type that Amazon Macie applies to the associated S3
/// resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ClassificationType {
  /// A continuous classification of the objects that are added to a specified S3
  /// bucket. Amazon Macie begins performing continuous classification after a
  /// bucket is successfully associated with Amazon Macie.
  @_s.JsonKey(name: 'continuous')
  final S3ContinuousClassificationType continuous;

  /// A one-time classification of all of the existing objects in a specified S3
  /// bucket.
  @_s.JsonKey(name: 'oneTime')
  final S3OneTimeClassificationType oneTime;

  ClassificationType({
    @_s.required this.continuous,
    @_s.required this.oneTime,
  });
  factory ClassificationType.fromJson(Map<String, dynamic> json) =>
      _$ClassificationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationTypeToJson(this);
}

/// The classification type that Amazon Macie applies to the associated S3
/// resources. At least one of the classification types (oneTime or continuous)
/// must be specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ClassificationTypeUpdate {
  /// A continuous classification of the objects that are added to a specified S3
  /// bucket. Amazon Macie begins performing continuous classification after a
  /// bucket is successfully associated with Amazon Macie.
  @_s.JsonKey(name: 'continuous')
  final S3ContinuousClassificationType continuous;

  /// A one-time classification of all of the existing objects in a specified S3
  /// bucket.
  @_s.JsonKey(name: 'oneTime')
  final S3OneTimeClassificationType oneTime;

  ClassificationTypeUpdate({
    this.continuous,
    this.oneTime,
  });
  Map<String, dynamic> toJson() => _$ClassificationTypeUpdateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateS3ResourcesResult {
  /// S3 resources that couldn't be removed from being monitored and classified by
  /// Amazon Macie. An error code and an error message are provided for each
  /// failed item.
  @_s.JsonKey(name: 'failedS3Resources')
  final List<FailedS3Resource> failedS3Resources;

  DisassociateS3ResourcesResult({
    this.failedS3Resources,
  });
  factory DisassociateS3ResourcesResult.fromJson(Map<String, dynamic> json) =>
      _$DisassociateS3ResourcesResultFromJson(json);
}

/// Includes details about the failed S3 resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedS3Resource {
  /// The status code of a failed item.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The error message of a failed item.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The failed S3 resources.
  @_s.JsonKey(name: 'failedItem')
  final S3Resource failedItem;

  FailedS3Resource({
    this.errorCode,
    this.errorMessage,
    this.failedItem,
  });
  factory FailedS3Resource.fromJson(Map<String, dynamic> json) =>
      _$FailedS3ResourceFromJson(json);
}

/// Internal server error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InternalException implements _s.AwsException {
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;
  @_s.JsonKey(name: 'message')
  final String message;

  InternalException({
    this.errorCode,
    this.message,
  });
  factory InternalException.fromJson(Map<String, dynamic> json) =>
      _$InternalExceptionFromJson(json);
}

/// The request was rejected because an invalid or out-of-range value was
/// supplied for an input parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidInputException implements _s.AwsException {
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;
  @_s.JsonKey(name: 'fieldName')
  final String fieldName;
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidInputException({
    this.errorCode,
    this.fieldName,
    this.message,
  });
  factory InvalidInputException.fromJson(Map<String, dynamic> json) =>
      _$InvalidInputExceptionFromJson(json);
}

/// The request was rejected because it attempted to create resources beyond the
/// current AWS account limits. The error code describes the limit exceeded.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LimitExceededException implements _s.AwsException {
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;
  @_s.JsonKey(name: 'message')
  final String message;
  @_s.JsonKey(name: 'resourceType')
  final String resourceType;

  LimitExceededException({
    this.errorCode,
    this.message,
    this.resourceType,
  });
  factory LimitExceededException.fromJson(Map<String, dynamic> json) =>
      _$LimitExceededExceptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMemberAccountsResult {
  /// A list of the Amazon Macie member accounts returned by the action. The
  /// current master account is also included in this list.
  @_s.JsonKey(name: 'memberAccounts')
  final List<MemberAccount> memberAccounts;

  /// When a response is generated, if there is more data to be listed, this
  /// parameter is present in the response and contains the value to use for the
  /// nextToken parameter in a subsequent pagination request. If there is no more
  /// data to be listed, this parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMemberAccountsResult({
    this.memberAccounts,
    this.nextToken,
  });
  factory ListMemberAccountsResult.fromJson(Map<String, dynamic> json) =>
      _$ListMemberAccountsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListS3ResourcesResult {
  /// When a response is generated, if there is more data to be listed, this
  /// parameter is present in the response and contains the value to use for the
  /// nextToken parameter in a subsequent pagination request. If there is no more
  /// data to be listed, this parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of the associated S3 resources returned by the action.
  @_s.JsonKey(name: 's3Resources')
  final List<S3ResourceClassification> s3Resources;

  ListS3ResourcesResult({
    this.nextToken,
    this.s3Resources,
  });
  factory ListS3ResourcesResult.fromJson(Map<String, dynamic> json) =>
      _$ListS3ResourcesResultFromJson(json);
}

/// Contains information about the Amazon Macie member account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MemberAccount {
  /// The AWS account ID of the Amazon Macie member account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  MemberAccount({
    this.accountId,
  });
  factory MemberAccount.fromJson(Map<String, dynamic> json) =>
      _$MemberAccountFromJson(json);
}

enum S3ContinuousClassificationType {
  @_s.JsonValue('FULL')
  full,
}

enum S3OneTimeClassificationType {
  @_s.JsonValue('FULL')
  full,
  @_s.JsonValue('NONE')
  none,
}

/// Contains information about the S3 resource. This data type is used as a
/// request parameter in the DisassociateS3Resources action and can be used as a
/// response parameter in the AssociateS3Resources and UpdateS3Resources
/// actions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Resource {
  /// The name of the S3 bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The prefix of the S3 bucket.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  S3Resource({
    @_s.required this.bucketName,
    this.prefix,
  });
  factory S3Resource.fromJson(Map<String, dynamic> json) =>
      _$S3ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$S3ResourceToJson(this);
}

/// The S3 resources that you want to associate with Amazon Macie for monitoring
/// and data classification. This data type is used as a request parameter in
/// the AssociateS3Resources action and a response parameter in the
/// ListS3Resources action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3ResourceClassification {
  /// The name of the S3 bucket that you want to associate with Amazon Macie.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The classification type that you want to specify for the resource associated
  /// with Amazon Macie.
  @_s.JsonKey(name: 'classificationType')
  final ClassificationType classificationType;

  /// The prefix of the S3 bucket that you want to associate with Amazon Macie.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  S3ResourceClassification({
    @_s.required this.bucketName,
    @_s.required this.classificationType,
    this.prefix,
  });
  factory S3ResourceClassification.fromJson(Map<String, dynamic> json) =>
      _$S3ResourceClassificationFromJson(json);

  Map<String, dynamic> toJson() => _$S3ResourceClassificationToJson(this);
}

/// The S3 resources whose classification types you want to update. This data
/// type is used as a request parameter in the UpdateS3Resources action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3ResourceClassificationUpdate {
  /// The name of the S3 bucket whose classification types you want to update.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The classification type that you want to update for the resource associated
  /// with Amazon Macie.
  @_s.JsonKey(name: 'classificationTypeUpdate')
  final ClassificationTypeUpdate classificationTypeUpdate;

  /// The prefix of the S3 bucket whose classification types you want to update.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  S3ResourceClassificationUpdate({
    @_s.required this.bucketName,
    @_s.required this.classificationTypeUpdate,
    this.prefix,
  });
  Map<String, dynamic> toJson() => _$S3ResourceClassificationUpdateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateS3ResourcesResult {
  /// The S3 resources whose classification types can't be updated. An error code
  /// and an error message are provided for each failed item.
  @_s.JsonKey(name: 'failedS3Resources')
  final List<FailedS3Resource> failedS3Resources;

  UpdateS3ResourcesResult({
    this.failedS3Resources,
  });
  factory UpdateS3ResourcesResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateS3ResourcesResultFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(message: message),
  'InternalException': (type, message) => InternalException(message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(message: message),
};
