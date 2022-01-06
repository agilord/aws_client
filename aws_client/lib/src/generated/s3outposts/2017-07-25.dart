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

/// Amazon S3 on Outposts provides access to S3 on Outposts operations.
class S3Outposts {
  final _s.RestJsonProtocol _protocol;
  S3Outposts({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Amazon S3 on Outposts Access Points simplify managing data access at scale
  /// for shared datasets in S3 on Outposts. S3 on Outposts uses endpoints to
  /// connect to Outposts buckets so that you can perform actions within your
  /// virtual private cloud (VPC). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/AccessingS3Outposts.html">
  /// Accessing S3 on Outposts using VPC only access points</a>.
  ///
  /// This action creates an endpoint and associates it with the specified
  /// Outposts.
  /// <note>
  /// It can take up to 5 minutes for this action to complete.
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
  ///
  /// Parameter [outpostId] :
  /// The ID of the AWS Outposts.
  ///
  /// Parameter [securityGroupId] :
  /// The ID of the security group to use with the endpoint.
  ///
  /// Parameter [subnetId] :
  /// The ID of the subnet in the selected VPC. The endpoint subnet must belong
  /// to the Outpost that has the Amazon S3 on Outposts provisioned.
  ///
  /// Parameter [accessType] :
  /// The type of access for the on-premise network connectivity for the Outpost
  /// endpoint. To access the endpoint from an on-premises network, you must
  /// specify the access type and provide the customer owned IPv4 pool.
  ///
  /// Parameter [customerOwnedIpv4Pool] :
  /// The ID of the customer-owned IPv4 pool for the endpoint. IP addresses will
  /// be allocated from this pool for the endpoint.
  Future<CreateEndpointResult> createEndpoint({
    required String outpostId,
    required String securityGroupId,
    required String subnetId,
    EndpointAccessType? accessType,
    String? customerOwnedIpv4Pool,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    ArgumentError.checkNotNull(securityGroupId, 'securityGroupId');
    ArgumentError.checkNotNull(subnetId, 'subnetId');
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

  /// Amazon S3 on Outposts Access Points simplify managing data access at scale
  /// for shared datasets in S3 on Outposts. S3 on Outposts uses endpoints to
  /// connect to Outposts buckets so that you can perform actions within your
  /// virtual private cloud (VPC). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/AccessingS3Outposts.html">
  /// Accessing S3 on Outposts using VPC only access points</a>.
  ///
  /// This action deletes an endpoint.
  /// <note>
  /// It can take up to 5 minutes for this action to complete.
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
  ///
  /// Parameter [endpointId] :
  /// The ID of the endpoint.
  ///
  /// Parameter [outpostId] :
  /// The ID of the AWS Outposts.
  Future<void> deleteEndpoint({
    required String endpointId,
    required String outpostId,
  }) async {
    ArgumentError.checkNotNull(endpointId, 'endpointId');
    ArgumentError.checkNotNull(outpostId, 'outpostId');
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

  /// Amazon S3 on Outposts Access Points simplify managing data access at scale
  /// for shared datasets in S3 on Outposts. S3 on Outposts uses endpoints to
  /// connect to Outposts buckets so that you can perform actions within your
  /// virtual private cloud (VPC). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/AccessingS3Outposts.html">
  /// Accessing S3 on Outposts using VPC only access points</a>.
  ///
  /// This action lists endpoints associated with the Outposts.
  /// <p/>
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
  ///
  /// Parameter [maxResults] :
  /// The max number of endpoints that can be returned on the request.
  ///
  /// Parameter [nextToken] :
  /// The next endpoint requested in the list.
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
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/AccessingS3Outposts.html">
/// Accessing S3 on Outposts using VPC only access points</a>.
class Endpoint {
  /// <p/>
  final EndpointAccessType? accessType;

  /// The VPC CIDR committed by this endpoint.
  final String? cidrBlock;

  /// The time the endpoint was created.
  final DateTime? creationTime;

  /// The ID of the customer-owned IPv4 pool used for the endpoint.
  final String? customerOwnedIpv4Pool;

  /// The Amazon Resource Name (ARN) of the endpoint.
  final String? endpointArn;

  /// The network interface of the endpoint.
  final List<NetworkInterface>? networkInterfaces;

  /// The ID of the AWS Outposts.
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

extension on EndpointAccessType {
  String toValue() {
    switch (this) {
      case EndpointAccessType.private:
        return 'Private';
      case EndpointAccessType.customerOwnedIp:
        return 'CustomerOwnedIp';
    }
  }
}

extension on String {
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
}

extension on EndpointStatus {
  String toValue() {
    switch (this) {
      case EndpointStatus.pending:
        return 'Pending';
      case EndpointStatus.available:
        return 'Available';
      case EndpointStatus.deleting:
        return 'Deleting';
    }
  }
}

extension on String {
  EndpointStatus toEndpointStatus() {
    switch (this) {
      case 'Pending':
        return EndpointStatus.pending;
      case 'Available':
        return EndpointStatus.available;
      case 'Deleting':
        return EndpointStatus.deleting;
    }
    throw Exception('$this is not known in enum EndpointStatus');
  }
}

class ListEndpointsResult {
  /// Returns an array of endpoints associated with AWS Outposts.
  final List<Endpoint>? endpoints;

  /// The next endpoint returned in the list.
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
