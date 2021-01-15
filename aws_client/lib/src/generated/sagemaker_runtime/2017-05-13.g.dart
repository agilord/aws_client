// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-05-13.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvokeEndpointOutput _$InvokeEndpointOutputFromJson(Map<String, dynamic> json) {
  return InvokeEndpointOutput(
    body: const Uint8ListConverter().fromJson(json['Body'] as String),
    contentType: json['Content-Type'] as String,
    customAttributes: json['X-Amzn-SageMaker-Custom-Attributes'] as String,
    invokedProductionVariant:
        json['x-Amzn-Invoked-Production-Variant'] as String,
  );
}
