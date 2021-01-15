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

part '2017-07-25.g.dart';

/// Amazon S3 on Outposts provides access to S3 on Outposts operations.
class S3Outposts {
  final _s.RestJsonProtocol _protocol;
  S3Outposts({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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

  /// S3 on Outposts access points simplify managing data access at scale for
  /// shared datasets in Amazon S3 on Outposts. S3 on Outposts uses endpoints to
  /// connect to Outposts buckets so that you can perform actions within your
  /// virtual private cloud (VPC).
  ///
  /// This action creates an endpoint and associates it with the specified
  /// Outpost.
  /// <p/>
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
  /// The ID of the AWS Outpost.
  ///
  /// Parameter [securityGroupId] :
  /// The ID of the security group to use with the endpoint.
  ///
  /// Parameter [subnetId] :
  /// The ID of the subnet in the selected VPC.
  Future<CreateEndpointResult> createEndpoint({
    @_s.required String outpostId,
    @_s.required String securityGroupId,
    @_s.required String subnetId,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'outpostId',
      outpostId,
      r'''^(op-[a-f0-9]{17}|\d{12}|ec2)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(securityGroupId, 'securityGroupId');
    _s.validateStringLength(
      'securityGroupId',
      securityGroupId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityGroupId',
      securityGroupId,
      r'''^sg-([0-9a-f]{8}|[0-9a-f]{17})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(subnetId, 'subnetId');
    _s.validateStringLength(
      'subnetId',
      subnetId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'subnetId',
      subnetId,
      r'''^subnet-([0-9a-f]{8}|[0-9a-f]{17})$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'OutpostId': outpostId,
      'SecurityGroupId': securityGroupId,
      'SubnetId': subnetId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/S3Outposts/CreateEndpoint',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEndpointResult.fromJson(response);
  }

  /// S3 on Outposts access points simplify managing data access at scale for
  /// shared datasets in Amazon S3 on Outposts. S3 on Outposts uses endpoints to
  /// connect to Outposts buckets so that you can perform actions within your
  /// virtual private cloud (VPC).
  ///
  /// This action deletes an endpoint.
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
  /// The ID of the end point.
  ///
  /// Parameter [outpostId] :
  /// The ID of the AWS Outpost.
  Future<void> deleteEndpoint({
    @_s.required String endpointId,
    @_s.required String outpostId,
  }) async {
    ArgumentError.checkNotNull(endpointId, 'endpointId');
    _s.validateStringLength(
      'endpointId',
      endpointId,
      5,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'endpointId',
      endpointId,
      r'''^[a-zA-Z0-9]{19}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'outpostId',
      outpostId,
      r'''^(op-[a-f0-9]{17}|\d{12}|ec2)$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (endpointId != null) 'endpointId': [endpointId],
      if (outpostId != null) 'outpostId': [outpostId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/S3Outposts/DeleteEndpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// S3 on Outposts access points simplify managing data access at scale for
  /// shared datasets in Amazon S3 on Outposts. S3 on Outposts uses endpoints to
  /// connect to Outposts buckets so that you can perform actions within your
  /// virtual private cloud (VPC).
  ///
  /// This action lists endpoints associated with the Outpost.
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9\+\:\/\=\?\#-_]+$''',
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEndpointResult {
  /// The Amazon Resource Name (ARN) of the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  CreateEndpointResult({
    this.endpointArn,
  });
  factory CreateEndpointResult.fromJson(Map<String, dynamic> json) =>
      _$CreateEndpointResultFromJson(json);
}

/// S3 on Outposts access points simplify managing data access at scale for
/// shared datasets in Amazon S3 on Outposts. S3 on Outposts uses endpoints to
/// connect to Outposts buckets so that you can perform actions within your
/// virtual private cloud (VPC).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Endpoint {
  /// The VPC CIDR committed by this endpoint.
  @_s.JsonKey(name: 'CidrBlock')
  final String cidrBlock;

  /// The time the endpoint was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  /// The network interface of the endpoint.
  @_s.JsonKey(name: 'NetworkInterfaces')
  final List<NetworkInterface> networkInterfaces;

  /// The ID of the AWS Outpost.
  @_s.JsonKey(name: 'OutpostsId')
  final String outpostsId;

  /// The status of the endpoint.
  @_s.JsonKey(name: 'Status')
  final EndpointStatus status;

  Endpoint({
    this.cidrBlock,
    this.creationTime,
    this.endpointArn,
    this.networkInterfaces,
    this.outpostsId,
    this.status,
  });
  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}

enum EndpointStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEndpointsResult {
  /// Returns an array of endpoints associated with AWS Outpost.
  @_s.JsonKey(name: 'Endpoints')
  final List<Endpoint> endpoints;

  /// The next endpoint returned in the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEndpointsResult({
    this.endpoints,
    this.nextToken,
  });
  factory ListEndpointsResult.fromJson(Map<String, dynamic> json) =>
      _$ListEndpointsResultFromJson(json);
}

/// The container for the network interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkInterface {
  /// The ID for the network interface.
  @_s.JsonKey(name: 'NetworkInterfaceId')
  final String networkInterfaceId;

  NetworkInterface({
    this.networkInterfaceId,
  });
  factory NetworkInterface.fromJson(Map<String, dynamic> json) =>
      _$NetworkInterfaceFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
