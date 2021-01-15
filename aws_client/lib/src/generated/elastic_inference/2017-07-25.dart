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

/// Elastic Inference public APIs.
class ElasticInference {
  final _s.RestJsonProtocol _protocol;
  ElasticInference({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.elastic-inference',
            signingName: 'elastic-inference',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Describes the locations in which a given accelerator type or set of types
  /// is present in a given region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [locationType] :
  /// The location type that you want to describe accelerator type offerings
  /// for. It can assume the following values: region: will return the
  /// accelerator type offering at the regional level. availability-zone: will
  /// return the accelerator type offering at the availability zone level.
  /// availability-zone-id: will return the accelerator type offering at the
  /// availability zone level returning the availability zone id.
  ///
  /// Parameter [acceleratorTypes] :
  /// The list of accelerator types to describe.
  Future<DescribeAcceleratorOfferingsResponse> describeAcceleratorOfferings({
    @_s.required LocationType locationType,
    List<String> acceleratorTypes,
  }) async {
    ArgumentError.checkNotNull(locationType, 'locationType');
    final $payload = <String, dynamic>{
      'locationType': locationType?.toValue() ?? '',
      if (acceleratorTypes != null) 'acceleratorTypes': acceleratorTypes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-accelerator-offerings',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAcceleratorOfferingsResponse.fromJson(response);
  }

  /// Describes the accelerator types available in a given region, as well as
  /// their characteristics, such as memory and throughput.
  ///
  /// May throw [InternalServerException].
  Future<DescribeAcceleratorTypesResponse> describeAcceleratorTypes() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/describe-accelerator-types',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAcceleratorTypesResponse.fromJson(response);
  }

  /// Describes information over a provided set of accelerators belonging to an
  /// account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [acceleratorIds] :
  /// The IDs of the accelerators to describe.
  ///
  /// Parameter [filters] :
  /// One or more filters. Filter names and values are case-sensitive. Valid
  /// filter names are: accelerator-types: can provide a list of accelerator
  /// type names to filter for. instance-id: can provide a list of EC2 instance
  /// ids to filter for.
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return in the command's output. If the total
  /// number of items available is more than the value specified, a NextToken is
  /// provided in the command's output. To resume pagination, provide the
  /// NextToken value in the starting-token argument of a subsequent command. Do
  /// not use the NextToken response element directly outside of the AWS CLI.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  Future<DescribeAcceleratorsResponse> describeAccelerators({
    List<String> acceleratorIds,
    List<Filter> filters,
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
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+/]+={0,2}$''',
    );
    final $payload = <String, dynamic>{
      if (acceleratorIds != null) 'acceleratorIds': acceleratorIds,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-accelerators',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAcceleratorsResponse.fromJson(response);
  }

  /// Returns all tags of an Elastic Inference Accelerator.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Elastic Inference Accelerator to list the tags for.
  Future<ListTagsForResourceResult> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws\S*:elastic-inference:\S+:\d{12}:elastic-inference-accelerator/eia-[0-9a-f]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResult.fromJson(response);
  }

  /// Adds the specified tags to an Elastic Inference Accelerator.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Elastic Inference Accelerator to tag.
  ///
  /// Parameter [tags] :
  /// The tags to add to the Elastic Inference Accelerator.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws\S*:elastic-inference:\S+:\d{12}:elastic-inference-accelerator/eia-[0-9a-f]+$''',
      isRequired: true,
    );
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
    return TagResourceResult.fromJson(response);
  }

  /// Removes the specified tags from an Elastic Inference Accelerator.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Elastic Inference Accelerator to untag.
  ///
  /// Parameter [tagKeys] :
  /// The list of tags to remove from the Elastic Inference Accelerator.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws\S*:elastic-inference:\S+:\d{12}:elastic-inference-accelerator/eia-[0-9a-f]+$''',
      isRequired: true,
    );
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
    return UntagResourceResult.fromJson(response);
  }
}

/// The details of an Elastic Inference Accelerator type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceleratorType {
  /// The name of the Elastic Inference Accelerator type.
  @_s.JsonKey(name: 'acceleratorTypeName')
  final String acceleratorTypeName;

  /// The memory information of the Elastic Inference Accelerator type.
  @_s.JsonKey(name: 'memoryInfo')
  final MemoryInfo memoryInfo;

  /// The throughput information of the Elastic Inference Accelerator type.
  @_s.JsonKey(name: 'throughputInfo')
  final List<KeyValuePair> throughputInfo;

  AcceleratorType({
    this.acceleratorTypeName,
    this.memoryInfo,
    this.throughputInfo,
  });
  factory AcceleratorType.fromJson(Map<String, dynamic> json) =>
      _$AcceleratorTypeFromJson(json);
}

/// The offering for an Elastic Inference Accelerator type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceleratorTypeOffering {
  /// The name of the Elastic Inference Accelerator type.
  @_s.JsonKey(name: 'acceleratorType')
  final String acceleratorType;

  /// The location for the offering. It will return either the region,
  /// availability zone or availability zone id for the offering depending on the
  /// locationType value.
  @_s.JsonKey(name: 'location')
  final String location;

  /// The location type for the offering. It can assume the following values:
  /// region: defines that the offering is at the regional level.
  /// availability-zone: defines that the offering is at the availability zone
  /// level. availability-zone-id: defines that the offering is at the
  /// availability zone level, defined by the availability zone id.
  @_s.JsonKey(name: 'locationType')
  final LocationType locationType;

  AcceleratorTypeOffering({
    this.acceleratorType,
    this.location,
    this.locationType,
  });
  factory AcceleratorTypeOffering.fromJson(Map<String, dynamic> json) =>
      _$AcceleratorTypeOfferingFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAcceleratorOfferingsResponse {
  /// The list of accelerator type offerings for a specific location.
  @_s.JsonKey(name: 'acceleratorTypeOfferings')
  final List<AcceleratorTypeOffering> acceleratorTypeOfferings;

  DescribeAcceleratorOfferingsResponse({
    this.acceleratorTypeOfferings,
  });
  factory DescribeAcceleratorOfferingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAcceleratorOfferingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAcceleratorTypesResponse {
  /// The available accelerator types.
  @_s.JsonKey(name: 'acceleratorTypes')
  final List<AcceleratorType> acceleratorTypes;

  DescribeAcceleratorTypesResponse({
    this.acceleratorTypes,
  });
  factory DescribeAcceleratorTypesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAcceleratorTypesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAcceleratorsResponse {
  /// The details of the Elastic Inference Accelerators.
  @_s.JsonKey(name: 'acceleratorSet')
  final List<ElasticInferenceAccelerator> acceleratorSet;

  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeAcceleratorsResponse({
    this.acceleratorSet,
    this.nextToken,
  });
  factory DescribeAcceleratorsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAcceleratorsResponseFromJson(json);
}

/// The details of an Elastic Inference Accelerator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticInferenceAccelerator {
  /// The health of the Elastic Inference Accelerator.
  @_s.JsonKey(name: 'acceleratorHealth')
  final ElasticInferenceAcceleratorHealth acceleratorHealth;

  /// The ID of the Elastic Inference Accelerator.
  @_s.JsonKey(name: 'acceleratorId')
  final String acceleratorId;

  /// The type of the Elastic Inference Accelerator.
  @_s.JsonKey(name: 'acceleratorType')
  final String acceleratorType;

  /// The ARN of the resource that the Elastic Inference Accelerator is attached
  /// to.
  @_s.JsonKey(name: 'attachedResource')
  final String attachedResource;

  /// The availability zone where the Elastic Inference Accelerator is present.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  ElasticInferenceAccelerator({
    this.acceleratorHealth,
    this.acceleratorId,
    this.acceleratorType,
    this.attachedResource,
    this.availabilityZone,
  });
  factory ElasticInferenceAccelerator.fromJson(Map<String, dynamic> json) =>
      _$ElasticInferenceAcceleratorFromJson(json);
}

/// The health details of an Elastic Inference Accelerator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticInferenceAcceleratorHealth {
  /// The health status of the Elastic Inference Accelerator.
  @_s.JsonKey(name: 'status')
  final String status;

  ElasticInferenceAcceleratorHealth({
    this.status,
  });
  factory ElasticInferenceAcceleratorHealth.fromJson(
          Map<String, dynamic> json) =>
      _$ElasticInferenceAcceleratorHealthFromJson(json);
}

/// A filter expression for the Elastic Inference Accelerator list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The filter name for the Elastic Inference Accelerator list. It can assume
  /// the following values: accelerator-type: the type of Elastic Inference
  /// Accelerator to filter for. instance-id: an EC2 instance id to filter for.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The values for the filter of the Elastic Inference Accelerator list.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

/// A throughput entry for an Elastic Inference Accelerator type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KeyValuePair {
  /// The throughput value of the Elastic Inference Accelerator type. It can
  /// assume the following values: TFLOPS16bit: the throughput expressed in 16bit
  /// TeraFLOPS. TFLOPS32bit: the throughput expressed in 32bit TeraFLOPS.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The throughput value of the Elastic Inference Accelerator type.
  @_s.JsonKey(name: 'value')
  final int value;

  KeyValuePair({
    this.key,
    this.value,
  });
  factory KeyValuePair.fromJson(Map<String, dynamic> json) =>
      _$KeyValuePairFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResult {
  /// The tags of the Elastic Inference Accelerator.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResult({
    this.tags,
  });
  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResultFromJson(json);
}

enum LocationType {
  @_s.JsonValue('region')
  region,
  @_s.JsonValue('availability-zone')
  availabilityZone,
  @_s.JsonValue('availability-zone-id')
  availabilityZoneId,
}

extension on LocationType {
  String toValue() {
    switch (this) {
      case LocationType.region:
        return 'region';
      case LocationType.availabilityZone:
        return 'availability-zone';
      case LocationType.availabilityZoneId:
        return 'availability-zone-id';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The memory information of an Elastic Inference Accelerator type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MemoryInfo {
  /// The size in mebibytes of the Elastic Inference Accelerator type.
  @_s.JsonKey(name: 'sizeInMiB')
  final int sizeInMiB;

  MemoryInfo({
    this.sizeInMiB,
  });
  factory MemoryInfo.fromJson(Map<String, dynamic> json) =>
      _$MemoryInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResult {
  TagResourceResult();
  factory TagResourceResult.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResult {
  UntagResourceResult();
  factory UntagResourceResult.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResultFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
