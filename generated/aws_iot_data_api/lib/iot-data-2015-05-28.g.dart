// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot-data-2015-05-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConflictException _$ConflictExceptionFromJson(Map<String, dynamic> json) {
  return ConflictException(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$DeleteThingShadowRequestToJson(
        DeleteThingShadowRequest instance) =>
    <String, dynamic>{};

DeleteThingShadowResponse _$DeleteThingShadowResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteThingShadowResponse(
    payload: const Uint8ListConverter().fromJson(json['payload'] as String),
  );
}

GetThingShadowResponse _$GetThingShadowResponseFromJson(
    Map<String, dynamic> json) {
  return GetThingShadowResponse(
    payload: const Uint8ListConverter().fromJson(json['payload'] as String),
  );
}

InternalFailureException _$InternalFailureExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalFailureException(
    message: json['message'] as String,
  );
}

InvalidRequestException _$InvalidRequestExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidRequestException(
    message: json['message'] as String,
  );
}

MethodNotAllowedException _$MethodNotAllowedExceptionFromJson(
    Map<String, dynamic> json) {
  return MethodNotAllowedException(
    message: json['message'] as String,
  );
}

RequestEntityTooLargeException _$RequestEntityTooLargeExceptionFromJson(
    Map<String, dynamic> json) {
  return RequestEntityTooLargeException(
    message: json['message'] as String,
  );
}

ResourceNotFoundException _$ResourceNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return ResourceNotFoundException(
    message: json['message'] as String,
  );
}

ServiceUnavailableException _$ServiceUnavailableExceptionFromJson(
    Map<String, dynamic> json) {
  return ServiceUnavailableException(
    message: json['message'] as String,
  );
}

ThrottlingException _$ThrottlingExceptionFromJson(Map<String, dynamic> json) {
  return ThrottlingException(
    message: json['message'] as String,
  );
}

UnauthorizedException _$UnauthorizedExceptionFromJson(
    Map<String, dynamic> json) {
  return UnauthorizedException(
    message: json['message'] as String,
  );
}

UnsupportedDocumentEncodingException
    _$UnsupportedDocumentEncodingExceptionFromJson(Map<String, dynamic> json) {
  return UnsupportedDocumentEncodingException(
    message: json['message'] as String,
  );
}

UpdateThingShadowResponse _$UpdateThingShadowResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateThingShadowResponse(
    payload: const Uint8ListConverter().fromJson(json['payload'] as String),
  );
}
