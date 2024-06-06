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

/// Amazon S3 on Outposts provides access to S3 on Outposts operations.
class S3Outposts {
  final _s.RestJsonProtocol _protocol;
  S3Outposts({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 's3-outposts',
            signingName: 's3-outposts',
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

  /// Creates an endpoint and associates it with the specified Outpost.
  /// <note>
  /// It can take up to 5 minutes for this action to finish.
  /// </note> <p/>
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_DeleteEndpoint.html">DeleteEndpoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_ListEndpoints.html">ListEndpoints</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [OutpostOfflineException].
  ///
  /// Parameter [outpostId] :
  /// The ID of the Outposts.
  ///
  /// Parameter [securityGroupId] :
  /// The ID of the security group to use with the endpoint.
  ///
  /// Parameter [subnetId] :
  /// The ID of the subnet in the selected VPC. The endpoint subnet must belong
  /// to the Outpost that has Amazon S3 on Outposts provisioned.
  ///
  /// Parameter [accessType] :
  /// The type of access for the network connectivity for the Amazon S3 on
  /// Outposts endpoint. To use the Amazon Web Services VPC, choose
  /// <code>Private</code>. To use the endpoint with an on-premises network,
  /// choose <code>CustomerOwnedIp</code>. If you choose
  /// <code>CustomerOwnedIp</code>, you must also provide the customer-owned IP
  /// address pool (CoIP pool).
  /// <note>
  /// <code>Private</code> is the default access type value.
  /// </note>
  ///
  /// Parameter [customerOwnedIpv4Pool] :
  /// The ID of the customer-owned IPv4 address pool (CoIP pool) for the
  /// endpoint. IP addresses are allocated from this pool for the endpoint.
  Future<CreateEndpointResult> createEndpoint({
    required String outpostId,
    required String securityGroupId,
    required String subnetId,
    EndpointAccessType? accessType,
    String? customerOwnedIpv4Pool,
  }) async {
    final $payload = <String, dynamic>{
      'OutpostId': outpostId,
      'SecurityGroupId': securityGroupId,
      'SubnetId': subnetId,
      if (accessType != null) 'AccessType': accessType.toValue(),
      if (customerOwnedIpv4Pool != null)
        'CustomerOwnedIpv4Pool': customerOwnedIpv4Pool,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/S3Outposts/CreateEndpoint',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEndpointResult.fromJson(response);
  }

  /// Deletes an endpoint.
  /// <note>
  /// It can take up to 5 minutes for this action to finish.
  /// </note> <p/>
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_CreateEndpoint.html">CreateEndpoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_ListEndpoints.html">ListEndpoints</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [OutpostOfflineException].
  ///
  /// Parameter [endpointId] :
  /// The ID of the endpoint.
  ///
  /// Parameter [outpostId] :
  /// The ID of the Outposts.
  Future<void> deleteEndpoint({
    required String endpointId,
    required String outpostId,
  }) async {
    final $query = <String, List<String>>{
      'endpointId': [endpointId],
      'outpostId': [outpostId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/S3Outposts/DeleteEndpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists endpoints associated with the specified Outpost.
  ///
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_CreateEndpoint.html">CreateEndpoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_DeleteEndpoint.html">DeleteEndpoint</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of endpoints that will be returned in the response.
  ///
  /// Parameter [nextToken] :
  /// If a previous response from this operation included a
  /// <code>NextToken</code> value, provide that value here to retrieve the next
  /// page of results.
  Future<ListEndpointsResult> listEndpoints({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/S3Outposts/ListEndpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEndpointsResult.fromJson(response);
  }

  /// Lists the Outposts with S3 on Outposts capacity for your Amazon Web
  /// Services account. Includes S3 on Outposts that you have access to as the
  /// Outposts owner, or as a shared user from Resource Access Manager (RAM).
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Outposts to return. The limit is 100.
  ///
  /// Parameter [nextToken] :
  /// When you can get additional results from the
  /// <code>ListOutpostsWithS3</code> call, a <code>NextToken</code> parameter
  /// is returned in the output. You can then pass in a subsequent command to
  /// the <code>NextToken</code> parameter to continue listing additional
  /// Outposts.
  Future<ListOutpostsWithS3Result> listOutpostsWithS3({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/S3Outposts/ListOutpostsWithS3',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOutpostsWithS3Result.fromJson(response);
  }

  /// Lists all endpoints associated with an Outpost that has been shared by
  /// Amazon Web Services Resource Access Manager (RAM).
  ///
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_CreateEndpoint.html">CreateEndpoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_DeleteEndpoint.html">DeleteEndpoint</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [outpostId] :
  /// The ID of the Amazon Web Services Outpost.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of endpoints that will be returned in the response.
  ///
  /// Parameter [nextToken] :
  /// If a previous response from this operation included a
  /// <code>NextToken</code> value, you can provide that value here to retrieve
  /// the next page of results.
  Future<ListSharedEndpointsResult> listSharedEndpoints({
    required String outpostId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      'outpostId': [outpostId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/S3Outposts/ListSharedEndpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSharedEndpointsResult.fromJson(response);
  }
}

class CreateEndpointResult {
  /// The Amazon Resource Name (ARN) of the endpoint.
  final String? endpointArn;

  CreateEndpointResult({
    this.endpointArn,
  });

  factory CreateEndpointResult.fromJson(Map<String, dynamic> json) {
    return CreateEndpointResult(
      endpointArn: json['EndpointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointArn = this.endpointArn;
    return {
      if (endpointArn != null) 'EndpointArn': endpointArn,
    };
  }
}

/// Amazon S3 on Outposts Access Points simplify managing data access at scale
/// for shared datasets in S3 on Outposts. S3 on Outposts uses endpoints to
/// connect to Outposts buckets so that you can perform actions within your
/// virtual private cloud (VPC). For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/WorkingWithS3Outposts.html">
/// Accessing S3 on Outposts using VPC-only access points</a> in the <i>Amazon
/// Simple Storage Service User Guide</i>.
class Endpoint {
  /// The type of connectivity used to access the Amazon S3 on Outposts endpoint.
  final EndpointAccessType? accessType;

  /// The VPC CIDR committed by this endpoint.
  final String? cidrBlock;

  /// The time the endpoint was created.
  final DateTime? creationTime;

  /// The ID of the customer-owned IPv4 address pool used for the endpoint.
  final String? customerOwnedIpv4Pool;

  /// The Amazon Resource Name (ARN) of the endpoint.
  final String? endpointArn;

  /// The failure reason, if any, for a create or delete endpoint operation.
  final FailedReason? failedReason;

  /// The network interface of the endpoint.
  final List<NetworkInterface>? networkInterfaces;

  /// The ID of the Outposts.
  final String? outpostsId;

  /// The ID of the security group used for the endpoint.
  final String? securityGroupId;

  /// The status of the endpoint.
  final EndpointStatus? status;

  /// The ID of the subnet used for the endpoint.
  final String? subnetId;

  /// The ID of the VPC used for the endpoint.
  final String? vpcId;

  Endpoint({
    this.accessType,
    this.cidrBlock,
    this.creationTime,
    this.customerOwnedIpv4Pool,
    this.endpointArn,
    this.failedReason,
    this.networkInterfaces,
    this.outpostsId,
    this.securityGroupId,
    this.status,
    this.subnetId,
    this.vpcId,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      accessType: (json['AccessType'] as String?)?.toEndpointAccessType(),
      cidrBlock: json['CidrBlock'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      customerOwnedIpv4Pool: json['CustomerOwnedIpv4Pool'] as String?,
      endpointArn: json['EndpointArn'] as String?,
      failedReason: json['FailedReason'] != null
          ? FailedReason.fromJson(json['FailedReason'] as Map<String, dynamic>)
          : null,
      networkInterfaces: (json['NetworkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      outpostsId: json['OutpostsId'] as String?,
      securityGroupId: json['SecurityGroupId'] as String?,
      status: (json['Status'] as String?)?.toEndpointStatus(),
      subnetId: json['SubnetId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessType = this.accessType;
    final cidrBlock = this.cidrBlock;
    final creationTime = this.creationTime;
    final customerOwnedIpv4Pool = this.customerOwnedIpv4Pool;
    final endpointArn = this.endpointArn;
    final failedReason = this.failedReason;
    final networkInterfaces = this.networkInterfaces;
    final outpostsId = this.outpostsId;
    final securityGroupId = this.securityGroupId;
    final status = this.status;
    final subnetId = this.subnetId;
    final vpcId = this.vpcId;
    return {
      if (accessType != null) 'AccessType': accessType.toValue(),
      if (cidrBlock != null) 'CidrBlock': cidrBlock,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (customerOwnedIpv4Pool != null)
        'CustomerOwnedIpv4Pool': customerOwnedIpv4Pool,
      if (endpointArn != null) 'EndpointArn': endpointArn,
      if (failedReason != null) 'FailedReason': failedReason,
      if (networkInterfaces != null) 'NetworkInterfaces': networkInterfaces,
      if (outpostsId != null) 'OutpostsId': outpostsId,
      if (securityGroupId != null) 'SecurityGroupId': securityGroupId,
      if (status != null) 'Status': status.toValue(),
      if (subnetId != null) 'SubnetId': subnetId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum EndpointAccessType {
  private,
  customerOwnedIp,
}

extension EndpointAccessTypeValueExtension on EndpointAccessType {
  String toValue() {
    switch (this) {
      case EndpointAccessType.private:
        return 'Private';
      case EndpointAccessType.customerOwnedIp:
        return 'CustomerOwnedIp';
    }
  }
}

extension EndpointAccessTypeFromString on String {
  EndpointAccessType toEndpointAccessType() {
    switch (this) {
      case 'Private':
        return EndpointAccessType.private;
      case 'CustomerOwnedIp':
        return EndpointAccessType.customerOwnedIp;
    }
    throw Exception('$this is not known in enum EndpointAccessType');
  }
}

enum EndpointStatus {
  pending,
  available,
  deleting,
  createFailed,
  deleteFailed,
}

extension EndpointStatusValueExtension on EndpointStatus {
  String toValue() {
    switch (this) {
      case EndpointStatus.pending:
        return 'Pending';
      case EndpointStatus.available:
        return 'Available';
      case EndpointStatus.deleting:
        return 'Deleting';
      case EndpointStatus.createFailed:
        return 'Create_Failed';
      case EndpointStatus.deleteFailed:
        return 'Delete_Failed';
    }
  }
}

extension EndpointStatusFromString on String {
  EndpointStatus toEndpointStatus() {
    switch (this) {
      case 'Pending':
        return EndpointStatus.pending;
      case 'Available':
        return EndpointStatus.available;
      case 'Deleting':
        return EndpointStatus.deleting;
      case 'Create_Failed':
        return EndpointStatus.createFailed;
      case 'Delete_Failed':
        return EndpointStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum EndpointStatus');
  }
}

/// The failure reason, if any, for a create or delete endpoint operation.
class FailedReason {
  /// The failure code, if any, for a create or delete endpoint operation.
  final String? errorCode;

  /// Additional error details describing the endpoint failure and recommended
  /// action.
  final String? message;

  FailedReason({
    this.errorCode,
    this.message,
  });

  factory FailedReason.fromJson(Map<String, dynamic> json) {
    return FailedReason(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

class ListEndpointsResult {
  /// The list of endpoints associated with the specified Outpost.
  final List<Endpoint>? endpoints;

  /// If the number of endpoints associated with the specified Outpost exceeds
  /// <code>MaxResults</code>, you can include this value in subsequent calls to
  /// this operation to retrieve more results.
  final String? nextToken;

  ListEndpointsResult({
    this.endpoints,
    this.nextToken,
  });

  factory ListEndpointsResult.fromJson(Map<String, dynamic> json) {
    return ListEndpointsResult(
      endpoints: (json['Endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final nextToken = this.nextToken;
    return {
      if (endpoints != null) 'Endpoints': endpoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOutpostsWithS3Result {
  /// Returns a token that you can use to call <code>ListOutpostsWithS3</code>
  /// again and receive additional results, if there are any.
  final String? nextToken;

  /// Returns the list of Outposts that have the following characteristics:
  ///
  /// <ul>
  /// <li>
  /// outposts that have S3 provisioned
  /// </li>
  /// <li>
  /// outposts that are <code>Active</code> (not pending any provisioning nor
  /// decommissioned)
  /// </li>
  /// <li>
  /// outposts to which the the calling Amazon Web Services account has access
  /// </li>
  /// </ul>
  final List<Outpost>? outposts;

  ListOutpostsWithS3Result({
    this.nextToken,
    this.outposts,
  });

  factory ListOutpostsWithS3Result.fromJson(Map<String, dynamic> json) {
    return ListOutpostsWithS3Result(
      nextToken: json['NextToken'] as String?,
      outposts: (json['Outposts'] as List?)
          ?.whereNotNull()
          .map((e) => Outpost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final outposts = this.outposts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (outposts != null) 'Outposts': outposts,
    };
  }
}

class ListSharedEndpointsResult {
  /// The list of endpoints associated with the specified Outpost that have been
  /// shared by Amazon Web Services Resource Access Manager (RAM).
  final List<Endpoint>? endpoints;

  /// If the number of endpoints associated with the specified Outpost exceeds
  /// <code>MaxResults</code>, you can include this value in subsequent calls to
  /// this operation to retrieve more results.
  final String? nextToken;

  ListSharedEndpointsResult({
    this.endpoints,
    this.nextToken,
  });

  factory ListSharedEndpointsResult.fromJson(Map<String, dynamic> json) {
    return ListSharedEndpointsResult(
      endpoints: (json['Endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final nextToken = this.nextToken;
    return {
      if (endpoints != null) 'Endpoints': endpoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The container for the network interface.
class NetworkInterface {
  /// The ID for the network interface.
  final String? networkInterfaceId;

  NetworkInterface({
    this.networkInterfaceId,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      networkInterfaceId: json['NetworkInterfaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaceId = this.networkInterfaceId;
    return {
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
    };
  }
}

/// Contains the details for the Outpost object.
class Outpost {
  /// The Amazon S3 capacity of the outpost in bytes.
  final int? capacityInBytes;

  /// Specifies the unique Amazon Resource Name (ARN) for the outpost.
  final String? outpostArn;

  /// Specifies the unique identifier for the outpost.
  final String? outpostId;

  /// Returns the Amazon Web Services account ID of the outpost owner. Useful for
  /// comparing owned versus shared outposts.
  final String? ownerId;

  /// Specifies the unique S3 on Outposts ARN for use with Resource Access Manager
  /// (RAM).
  final String? s3OutpostArn;

  Outpost({
    this.capacityInBytes,
    this.outpostArn,
    this.outpostId,
    this.ownerId,
    this.s3OutpostArn,
  });

  factory Outpost.fromJson(Map<String, dynamic> json) {
    return Outpost(
      capacityInBytes: json['CapacityInBytes'] as int?,
      outpostArn: json['OutpostArn'] as String?,
      outpostId: json['OutpostId'] as String?,
      ownerId: json['OwnerId'] as String?,
      s3OutpostArn: json['S3OutpostArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityInBytes = this.capacityInBytes;
    final outpostArn = this.outpostArn;
    final outpostId = this.outpostId;
    final ownerId = this.ownerId;
    final s3OutpostArn = this.s3OutpostArn;
    return {
      if (capacityInBytes != null) 'CapacityInBytes': capacityInBytes,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (outpostId != null) 'OutpostId': outpostId,
      if (ownerId != null) 'OwnerId': ownerId,
      if (s3OutpostArn != null) 'S3OutpostArn': s3OutpostArn,
    };
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

class OutpostOfflineException extends _s.GenericAwsException {
  OutpostOfflineException({String? type, String? message})
      : super(type: type, code: 'OutpostOfflineException', message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'OutpostOfflineException': (type, message) =>
      OutpostOfflineException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
