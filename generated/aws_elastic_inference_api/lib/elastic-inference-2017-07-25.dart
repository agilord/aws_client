// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Elastic Inference public APIs.
///
/// February 15, 2023: Starting April 15, 2023, AWS will not onboard new
/// customers to Amazon Elastic Inference (EI), and will help current customers
/// migrate their workloads to options that offer better price and performance.
/// After April 15, 2023, new customers will not be able to launch instances
/// with Amazon EI accelerators in Amazon SageMaker, Amazon ECS, or Amazon EC2.
/// However, customers who have used Amazon EI at least once during the past
/// 30-day period are considered current customers and will be able to continue
/// using the service.
class ElasticInference {
  final _s.RestJsonProtocol _protocol;
  ElasticInference({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.elastic-inference',
            signingName: 'elastic-inference',
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

  /// Describes the locations in which a given accelerator type or set of types
  /// is present in a given region.
  ///
  /// February 15, 2023: Starting April 15, 2023, AWS will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
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
    required LocationType locationType,
    List<String>? acceleratorTypes,
  }) async {
    final $payload = <String, dynamic>{
      'locationType': locationType.value,
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
  /// February 15, 2023: Starting April 15, 2023, AWS will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
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
  /// February 15, 2023: Starting April 15, 2023, AWS will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
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
    List<String>? acceleratorIds,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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
  /// February 15, 2023: Starting April 15, 2023, AWS will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Elastic Inference Accelerator to list the tags for.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String resourceArn,
  }) async {
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
  /// February 15, 2023: Starting April 15, 2023, AWS will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
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

  /// Removes the specified tags from an Elastic Inference Accelerator.
  ///
  /// February 15, 2023: Starting April 15, 2023, AWS will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
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
}

/// The details of an Elastic Inference Accelerator type.
class AcceleratorType {
  /// The name of the Elastic Inference Accelerator type.
  final String? acceleratorTypeName;

  /// The memory information of the Elastic Inference Accelerator type.
  final MemoryInfo? memoryInfo;

  /// The throughput information of the Elastic Inference Accelerator type.
  final List<KeyValuePair>? throughputInfo;

  AcceleratorType({
    this.acceleratorTypeName,
    this.memoryInfo,
    this.throughputInfo,
  });

  factory AcceleratorType.fromJson(Map<String, dynamic> json) {
    return AcceleratorType(
      acceleratorTypeName: json['acceleratorTypeName'] as String?,
      memoryInfo: json['memoryInfo'] != null
          ? MemoryInfo.fromJson(json['memoryInfo'] as Map<String, dynamic>)
          : null,
      throughputInfo: (json['throughputInfo'] as List?)
          ?.nonNulls
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The offering for an Elastic Inference Accelerator type.
class AcceleratorTypeOffering {
  /// The name of the Elastic Inference Accelerator type.
  final String? acceleratorType;

  /// The location for the offering. It will return either the region,
  /// availability zone or availability zone id for the offering depending on the
  /// locationType value.
  final String? location;

  /// The location type for the offering. It can assume the following values:
  /// region: defines that the offering is at the regional level.
  /// availability-zone: defines that the offering is at the availability zone
  /// level. availability-zone-id: defines that the offering is at the
  /// availability zone level, defined by the availability zone id.
  final LocationType? locationType;

  AcceleratorTypeOffering({
    this.acceleratorType,
    this.location,
    this.locationType,
  });

  factory AcceleratorTypeOffering.fromJson(Map<String, dynamic> json) {
    return AcceleratorTypeOffering(
      acceleratorType: json['acceleratorType'] as String?,
      location: json['location'] as String?,
      locationType:
          (json['locationType'] as String?)?.let(LocationType.fromString),
    );
  }
}

class DescribeAcceleratorOfferingsResponse {
  /// The list of accelerator type offerings for a specific location.
  final List<AcceleratorTypeOffering>? acceleratorTypeOfferings;

  DescribeAcceleratorOfferingsResponse({
    this.acceleratorTypeOfferings,
  });

  factory DescribeAcceleratorOfferingsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAcceleratorOfferingsResponse(
      acceleratorTypeOfferings: (json['acceleratorTypeOfferings'] as List?)
          ?.nonNulls
          .map((e) =>
              AcceleratorTypeOffering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeAcceleratorTypesResponse {
  /// The available accelerator types.
  final List<AcceleratorType>? acceleratorTypes;

  DescribeAcceleratorTypesResponse({
    this.acceleratorTypes,
  });

  factory DescribeAcceleratorTypesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAcceleratorTypesResponse(
      acceleratorTypes: (json['acceleratorTypes'] as List?)
          ?.nonNulls
          .map((e) => AcceleratorType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeAcceleratorsResponse {
  /// The details of the Elastic Inference Accelerators.
  final List<ElasticInferenceAccelerator>? acceleratorSet;

  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  final String? nextToken;

  DescribeAcceleratorsResponse({
    this.acceleratorSet,
    this.nextToken,
  });

  factory DescribeAcceleratorsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAcceleratorsResponse(
      acceleratorSet: (json['acceleratorSet'] as List?)
          ?.nonNulls
          .map((e) =>
              ElasticInferenceAccelerator.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// The details of an Elastic Inference Accelerator.
class ElasticInferenceAccelerator {
  /// The health of the Elastic Inference Accelerator.
  final ElasticInferenceAcceleratorHealth? acceleratorHealth;

  /// The ID of the Elastic Inference Accelerator.
  final String? acceleratorId;

  /// The type of the Elastic Inference Accelerator.
  final String? acceleratorType;

  /// The ARN of the resource that the Elastic Inference Accelerator is attached
  /// to.
  final String? attachedResource;

  /// The availability zone where the Elastic Inference Accelerator is present.
  final String? availabilityZone;

  ElasticInferenceAccelerator({
    this.acceleratorHealth,
    this.acceleratorId,
    this.acceleratorType,
    this.attachedResource,
    this.availabilityZone,
  });

  factory ElasticInferenceAccelerator.fromJson(Map<String, dynamic> json) {
    return ElasticInferenceAccelerator(
      acceleratorHealth: json['acceleratorHealth'] != null
          ? ElasticInferenceAcceleratorHealth.fromJson(
              json['acceleratorHealth'] as Map<String, dynamic>)
          : null,
      acceleratorId: json['acceleratorId'] as String?,
      acceleratorType: json['acceleratorType'] as String?,
      attachedResource: json['attachedResource'] as String?,
      availabilityZone: json['availabilityZone'] as String?,
    );
  }
}

/// The health details of an Elastic Inference Accelerator.
class ElasticInferenceAcceleratorHealth {
  /// The health status of the Elastic Inference Accelerator.
  final String? status;

  ElasticInferenceAcceleratorHealth({
    this.status,
  });

  factory ElasticInferenceAcceleratorHealth.fromJson(
      Map<String, dynamic> json) {
    return ElasticInferenceAcceleratorHealth(
      status: json['status'] as String?,
    );
  }
}

/// A filter expression for the Elastic Inference Accelerator list.
class Filter {
  /// The filter name for the Elastic Inference Accelerator list. It can assume
  /// the following values: accelerator-type: the type of Elastic Inference
  /// Accelerator to filter for. instance-id: an EC2 instance id to filter for.
  final String? name;

  /// The values for the filter of the Elastic Inference Accelerator list.
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name,
      if (values != null) 'values': values,
    };
  }
}

/// A throughput entry for an Elastic Inference Accelerator type.
class KeyValuePair {
  /// The throughput value of the Elastic Inference Accelerator type. It can
  /// assume the following values: TFLOPS16bit: the throughput expressed in 16bit
  /// TeraFLOPS. TFLOPS32bit: the throughput expressed in 32bit TeraFLOPS.
  final String? key;

  /// The throughput value of the Elastic Inference Accelerator type.
  final int? value;

  KeyValuePair({
    this.key,
    this.value,
  });

  factory KeyValuePair.fromJson(Map<String, dynamic> json) {
    return KeyValuePair(
      key: json['key'] as String?,
      value: json['value'] as int?,
    );
  }
}

class ListTagsForResourceResult {
  /// The tags of the Elastic Inference Accelerator.
  final Map<String, String>? tags;

  ListTagsForResourceResult({
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

enum LocationType {
  region('region'),
  availabilityZone('availability-zone'),
  availabilityZoneId('availability-zone-id'),
  ;

  final String value;

  const LocationType(this.value);

  static LocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LocationType'));
}

/// The memory information of an Elastic Inference Accelerator type.
class MemoryInfo {
  /// The size in mebibytes of the Elastic Inference Accelerator type.
  final int? sizeInMiB;

  MemoryInfo({
    this.sizeInMiB,
  });

  factory MemoryInfo.fromJson(Map<String, dynamic> json) {
    return MemoryInfo(
      sizeInMiB: json['sizeInMiB'] as int?,
    );
  }
}

class TagResourceResult {
  TagResourceResult();

  factory TagResourceResult.fromJson(Map<String, dynamic> _) {
    return TagResourceResult();
  }
}

class UntagResourceResult {
  UntagResourceResult();

  factory UntagResourceResult.fromJson(Map<String, dynamic> _) {
    return UntagResourceResult();
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
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
